"""
Módulo especializado para importación de docentes
Maneja todas las operaciones relacionadas con la tabla de docentes
"""
import psycopg2


def import_docentes(datos, connection, modo='agregar'):
    """
    Importa información de docentes únicos a la tabla docentes
    
    Args:
        datos: DataFrame con los datos
        connection: Conexión a la base de datos
        modo: 'agregar' (default) - solo agrega nuevos
              'actualizar' - agrega nuevos y actualiza existentes
              'reemplazar' - borra todo y vuelve a insertar
    """
    docentes_df = datos.drop_duplicates(['CEDULA_DOCENTE'], keep='first')
    print(f"👨‍🏫 Analizando {docentes_df.shape[0]} docentes únicos (modo: {modo})...")

    try:
        conn = connection
        cur = conn.cursor()
        
        # PASO 1: Analizar qué pasará con cada docente
        print("\n🔍 ANÁLISIS PREVIO:")
        print("="*60)
        
        docentes_para_insertar = []
        docentes_existentes = []
        docentes_para_actualizar = []
        
        for index, row in docentes_df.iterrows():
            ced = str(row['CEDULA_DOCENTE'])
            
            # Normalizar cédula
            if len(ced) == 9:
                ced = '0' + ced
                
            name = row['DOCENTE']
            mail = row['CORREO_DOCENTE'] if 'CORREO_DOCENTE' in row and str(row['CORREO_DOCENTE']) != 'nan' else ''
            user_type = 'U'
            
            # Verificar si el docente ya existe
            cur.execute("SELECT doc_cedula, doc_nombre, doc_correo, doc_user_type FROM docentes WHERE doc_cedula = %s", (ced,))
            existe = cur.fetchone()
            
            if existe:
                if modo == 'agregar':
                    docentes_existentes.append({
                        'cedula': ced,
                        'nombre': name,
                        'correo': mail,
                        'accion': 'YA EXISTE - Se ignora'
                    })
                elif modo == 'actualizar':
                    # Verificar si hay cambios
                    if existe[1] != name or existe[2] != mail or existe[3] != user_type:
                        docentes_para_actualizar.append({
                            'cedula': ced,
                            'nombre_actual': existe[1],
                            'nombre_nuevo': name,
                            'correo_actual': existe[2], 
                            'correo_nuevo': mail,
                            'user_type_actual': existe[3],
                            'user_type_nuevo': user_type,
                            'accion': 'SE ACTUALIZA'
                        })
                    else:
                        docentes_existentes.append({
                            'cedula': ced,
                            'nombre': name,
                            'correo': mail,
                            'accion': 'YA EXISTE - Sin cambios'
                        })
                elif modo == 'reemplazar':
                    docentes_para_insertar.append({
                        'cedula': ced,
                        'nombre': name,
                        'correo': mail,
                        'user_type': user_type,
                        'accion': 'SE INSERTARÁ (tras limpiar)'
                    })
            else:
                docentes_para_insertar.append({
                    'cedula': ced,
                    'nombre': name,
                    'correo': mail,
                    'user_type': user_type,
                    'accion': 'SE INSERTARÁ (nuevo)'
                })
        
        # MOSTRAR RESUMEN DEL ANÁLISIS
        mostrar_resumen_docentes(docentes_para_insertar, docentes_existentes, 
                                docentes_para_actualizar, modo)
        
        # PASO 2: Confirmar con el usuario
        if not confirmar_operacion():
            print("❌ Operación cancelada por el usuario")
            cur.close()
            return False
            
        # PASO 3: Ejecutar las operaciones
        return ejecutar_operaciones_docentes(cur, conn, docentes_para_insertar, 
                                           docentes_para_actualizar, modo)
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error en docentes: {error}")
        return False


def mostrar_resumen_docentes(para_insertar, existentes, para_actualizar, modo):
    """
    Muestra un resumen detallado de qué se hará con cada docente
    """
    total = len(para_insertar) + len(existentes) + len(para_actualizar)
    
    if modo == 'reemplazar' and total > 0:
        print("⚠️  MODO REEMPLAZAR: Se eliminará TODA la tabla de docentes primero")
        print()
    
    # Docentes que se insertarán
    if para_insertar:
        print(f"📈 DOCENTES QUE SE INSERTARÁN ({len(para_insertar)}):")
        for i, doc in enumerate(para_insertar, 1):
            correo_texto = f" ({doc['correo']})" if doc['correo'] else " (sin correo)"
            print(f"   {i}. [{doc['cedula']}] {doc['nombre']}{correo_texto} - {doc['accion']}")
        print()
    
    # Docentes que se actualizarán
    if para_actualizar:
        print(f"🔄 DOCENTES QUE SE ACTUALIZARÁN ({len(para_actualizar)}):")
        for i, doc in enumerate(para_actualizar, 1):
            print(f"   {i}. [{doc['cedula']}] - {doc['accion']}")
            if doc['nombre_actual'] != doc['nombre_nuevo']:
                print(f"      👤 Nombre: '{doc['nombre_actual']}' → '{doc['nombre_nuevo']}'")
            if doc['correo_actual'] != doc['correo_nuevo']:
                print(f"      📧 Correo: '{doc['correo_actual']}' → '{doc['correo_nuevo']}'")
            if doc['user_type_actual'] != doc['user_type_nuevo']:
                print(f"      🔑 Tipo: '{doc['user_type_actual']}' → '{doc['user_type_nuevo']}'")
        print()
    
    # Docentes que ya existen
    if existentes:
        print(f"✓ DOCENTES QUE YA EXISTEN ({len(existentes)}):")
        for i, doc in enumerate(existentes, 1):
            correo_texto = f" ({doc['correo']})" if doc['correo'] else " (sin correo)"
            print(f"   {i}. [{doc['cedula']}] {doc['nombre']}{correo_texto} - {doc['accion']}")
        print()
    
    # Resumen final
    print("="*60)
    print("📊 RESUMEN:")
    print(f"   Total a procesar: {total}")
    print(f"   🆕 Nuevos: {len(para_insertar)}")
    print(f"   🔄 Actualizaciones: {len(para_actualizar)}")
    print(f"   ✓ Ya existen: {len(existentes)}")
    print("="*60)


def confirmar_operacion():
    """
    Pide confirmación al usuario antes de proceder
    """
    while True:
        respuesta = input("\n¿Es correcto? ¿Proceder con la operación? (s/n): ").strip().lower()
        if respuesta in ['s', 'si', 'sí', 'y', 'yes']:
            return True
        elif respuesta in ['n', 'no']:
            return False
        else:
            print("Por favor responde 's' para sí o 'n' para no")


def ejecutar_operaciones_docentes(cur, conn, para_insertar, para_actualizar, modo):
    """
    Ejecuta las operaciones de inserción/actualización tras la confirmación
    """
    print("\n🚀 EJECUTANDO OPERACIONES...")
    
    try:
        # Si es modo reemplazar, limpiar tabla primero
        if modo == 'reemplazar':
            print("   🗑️ Limpiando tabla docentes...")
            cur.execute('DELETE FROM public.docentes;')
            cur.execute('ALTER SEQUENCE docentes_doc_id_seq RESTART WITH 1;')
        
        contador_insertados = 0
        contador_actualizados = 0
        
        # Insertar nuevos docentes
        if para_insertar:
            sql_insert = """INSERT INTO docentes
                           (doc_cedula, doc_nombre, doc_correo, doc_user_type)
                           VALUES (%s,%s,%s,%s)"""
            
            for doc in para_insertar:
                cur.execute(sql_insert, (doc['cedula'], doc['nombre'], 
                                        doc['correo'], doc['user_type']))
                contador_insertados += 1
                
                if contador_insertados % 10 == 0:
                    print(f"   📝 Insertados: {contador_insertados}/{len(para_insertar)}")
        
        # Actualizar docentes existentes
        if para_actualizar:
            sql_update = """UPDATE docentes 
                           SET doc_nombre = %s, doc_correo = %s, doc_user_type = %s 
                           WHERE doc_cedula = %s"""
            
            for doc in para_actualizar:
                cur.execute(sql_update, (doc['nombre_nuevo'], doc['correo_nuevo'], 
                                        doc['user_type_nuevo'], doc['cedula']))
                contador_actualizados += 1
                
                if contador_actualizados % 10 == 0:
                    print(f"   🔄 Actualizados: {contador_actualizados}/{len(para_actualizar)}")
        
        # Hacer commit de todas las operaciones
        conn.commit()
        cur.close()
        
        # Mostrar resultado final
        print("\n🎉 OPERACIÓN COMPLETADA EXITOSAMENTE:")
        print(f"   📈 Docentes insertados: {contador_insertados}")
        print(f"   🔄 Docentes actualizados: {contador_actualizados}")
        print(f"   ✓ Total procesado: {contador_insertados + contador_actualizados}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error durante la ejecución: {e}")
        conn.rollback()  # Revertir cambios en caso de error
        cur.close()
        return False


def limpiar_docentes(connection):
    """
    Limpia completamente la tabla de docentes
    """
    try:
        conn = connection
        cur = conn.cursor()
        
        print("🔍 Verificando docentes existentes...")
        cur.execute("SELECT COUNT(*) FROM docentes")
        total = cur.fetchone()[0]
        
        if total == 0:
            print("✅ La tabla de docentes ya está vacía")
            cur.close()
            return True
            
        print(f"⚠️  Se encontraron {total} docentes en la base de datos")
        print("⚠️  Esta operación eliminará TODOS los docentes y puede afectar:")
        print("    - Grupos asociados a estos docentes")
        print("    - Inscripciones de estudiantes en esos grupos")
        
        if not confirmar_operacion():
            print("❌ Operación cancelada por el usuario")
            cur.close()
            return False
            
        print("🗑️  Eliminando todos los docentes...")
        cur.execute('DELETE FROM public.docentes;')
        cur.execute('ALTER SEQUENCE docentes_doc_id_seq RESTART WITH 1;')
        conn.commit()
        cur.close()
        
        print("✅ Tabla de docentes limpiada exitosamente")
        return True
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error al limpiar docentes: {error}")
        return False


def obtener_estadisticas_docentes(connection):
    """
    Obtiene estadísticas de los docentes en la base de datos
    """
    try:
        conn = connection
        cur = conn.cursor()
        
        # Total de docentes
        cur.execute("SELECT COUNT(*) FROM docentes")
        total = cur.fetchone()[0]
        
        # Docentes con y sin correo
        cur.execute("""
            SELECT 
                COUNT(CASE WHEN doc_correo IS NOT NULL AND doc_correo != '' THEN 1 END) as con_correo,
                COUNT(CASE WHEN doc_correo IS NULL OR doc_correo = '' THEN 1 END) as sin_correo
            FROM docentes
        """)
        correos = cur.fetchone()
        
        # Docentes por tipo de usuario
        cur.execute("""
            SELECT doc_user_type, COUNT(*) 
            FROM docentes 
            GROUP BY doc_user_type 
            ORDER BY doc_user_type
        """)
        por_tipo = cur.fetchall()
        
        # Últimos docentes agregados
        cur.execute("""
            SELECT doc_cedula, doc_nombre, doc_correo 
            FROM docentes 
            ORDER BY doc_id DESC 
            LIMIT 5
        """)
        ultimos = cur.fetchall()
        
        cur.close()
        
        # Mostrar estadísticas
        print("\n📊 ESTADÍSTICAS DE DOCENTES:")
        print("="*50)
        print(f"👨‍🏫 Total de docentes: {total}")
        
        if correos:
            print(f"\n📧 Estado de correos electrónicos:")
            print(f"   ✅ Con correo: {correos[0]} docentes")
            print(f"   ❌ Sin correo: {correos[1]} docentes")
        
        if por_tipo:
            print("\n👤 Distribución por tipo de usuario:")
            for tipo, cantidad in por_tipo:
                print(f"   Tipo {tipo}: {cantidad} docentes")
        
        if ultimos and total > 0:
            print(f"\n🕒 Últimos {min(5, total)} docentes:")
            for i, (cedula, nombre, correo) in enumerate(ultimos, 1):
                correo_texto = f" - {correo}" if correo else " - sin correo"
                print(f"   {i}. [{cedula}] {nombre}{correo_texto}")
        
        print("="*50)
        return True
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error al obtener estadísticas: {error}")
        return False


def validar_docentes_archivo(datos):
    """
    Valida que el archivo tenga las columnas necesarias para docentes
    """
    columnas_requeridas = ['CEDULA_DOCENTE', 'DOCENTE']
    columnas_opcionales = ['CORREO_DOCENTE']
    columnas_archivo = datos.columns.tolist()
    
    print("🔍 VALIDANDO ARCHIVO PARA DOCENTES:")
    print("="*50)
    
    columnas_faltantes = []
    for col in columnas_requeridas:
        if col not in columnas_archivo:
            columnas_faltantes.append(col)
    
    if columnas_faltantes:
        print("❌ COLUMNAS FALTANTES:")
        for col in columnas_faltantes:
            print(f"   - {col}")
        print("\n💡 El archivo debe contener las siguientes columnas:")
        for col in columnas_requeridas:
            print(f"   - {col} (obligatoria)")
        for col in columnas_opcionales:
            print(f"   - {col} (opcional)")
        return False
    
    # Verificar datos vacíos
    docentes_df = datos.drop_duplicates(['CEDULA_DOCENTE'], keep='first')
    total_docentes = len(docentes_df)
    
    if total_docentes == 0:
        print("❌ No se encontraron docentes en el archivo")
        return False
    
    # Verificar valores nulos en campos obligatorios
    nulos_cedula = docentes_df['CEDULA_DOCENTE'].isnull().sum()
    nulos_nombre = docentes_df['DOCENTE'].isnull().sum()
    
    # Verificar correos si existe la columna
    tiene_correos = 'CORREO_DOCENTE' in columnas_archivo
    correos_vacios = 0
    if tiene_correos:
        correos_vacios = docentes_df['CORREO_DOCENTE'].isnull().sum()
    
    print("✅ VALIDACIÓN EXITOSA:")
    print(f"   👨‍🏫 Docentes únicos encontrados: {total_docentes}")
    print(f"   📧 Columna de correos: {'Presente' if tiene_correos else 'No presente'}")
    
    if nulos_cedula > 0 or nulos_nombre > 0 or correos_vacios > 0:
        print("⚠️  ADVERTENCIAS:")
        if nulos_cedula > 0:
            print(f"   - {nulos_cedula} docentes sin cédula")
        if nulos_nombre > 0:
            print(f"   - {nulos_nombre} docentes sin nombre")
        if correos_vacios > 0:
            print(f"   - {correos_vacios} docentes sin correo electrónico")
        print("   Las filas con datos obligatorios faltantes serán ignoradas")
    
    # Verificar formato de cédulas
    cedulas_invalidas = 0
    for cedula in docentes_df['CEDULA_DOCENTE'].dropna():
        cedula_str = str(cedula)
        if not (cedula_str.isdigit() and len(cedula_str) in [9, 10]):
            cedulas_invalidas += 1
    
    if cedulas_invalidas > 0:
        print(f"⚠️  {cedulas_invalidas} cédulas con formato inválido (deben ser 9 o 10 dígitos)")
    
    print("="*50)
    return True

