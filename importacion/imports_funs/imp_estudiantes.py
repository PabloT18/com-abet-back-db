"""
Módulo especializado para importación de estudiantes
Maneja todas las operaciones relacionadas con la tabla de estudiantes
"""
import psycopg2


def import_estudiantes(datos, connection, modo='agregar'):
    """
    Importa información de estudiantes únicos a la tabla estudiantes
    
    Args:
        datos: DataFrame con los datos
        connection: Conexión a la base de datos
        modo: 'agregar' (default) - solo agrega nuevos
              'actualizar' - agrega nuevos y actualiza existentes
              'reemplazar' - borra todo y vuelve a insertar
    """
    estudiantes_df = datos.drop_duplicates(['COD_ESTUDIANTE'], keep='first')
    print(f"🎓 Analizando {estudiantes_df.shape[0]} estudiantes únicos (modo: {modo})...")

    try:
        conn = connection
        cur = conn.cursor()
        
        # PASO 1: Analizar qué pasará con cada estudiante
        print("\n🔍 ANÁLISIS PREVIO:")
        print("="*60)
        
        estudiantes_para_insertar = []
        estudiantes_existentes = []
        estudiantes_para_actualizar = []
        
        for index, row in estudiantes_df.iterrows():
            cod = str(row['COD_ESTUDIANTE'])
            ced = str(row['CEDULA_ESTUDIANTE'])
            
            # Normalizar cédula
            if len(ced) == 9:
                ced = '0' + ced
                
            name = row['ESTUDIANTE']
            mail = row['CORREO_ESTUDIANTE'] if 'CORREO_ESTUDIANTE' in row and str(row['CORREO_ESTUDIANTE']) != 'nan' else ''
            genero = row['GENERO_ESTUDIANTE'] if 'GENERO_ESTUDIANTE' in row and str(row['GENERO_ESTUDIANTE']) != 'nan' else ''
            
            # Verificar si el estudiante ya existe
            cur.execute("SELECT est_codigo, est_cedula, est_nombre, est_correo, est_genero FROM estudiantes WHERE est_codigo = %s", (cod,))
            existe = cur.fetchone()
            
            if existe:
                if modo == 'agregar':
                    estudiantes_existentes.append({
                        'codigo': cod,
                        'cedula': ced,
                        'nombre': name,
                        'correo': mail,
                        'genero': genero,
                        'accion': 'YA EXISTE - Se ignora'
                    })
                elif modo == 'actualizar':
                    # Verificar si hay cambios
                    if (existe[1] != ced or existe[2] != name or 
                        existe[3] != mail or existe[4] != genero):
                        estudiantes_para_actualizar.append({
                            'codigo': cod,
                            'cedula_actual': existe[1],
                            'cedula_nueva': ced,
                            'nombre_actual': existe[2],
                            'nombre_nuevo': name,
                            'correo_actual': existe[3],
                            'correo_nuevo': mail,
                            'genero_actual': existe[4],
                            'genero_nuevo': genero,
                            'accion': 'SE ACTUALIZA'
                        })
                    else:
                        estudiantes_existentes.append({
                            'codigo': cod,
                            'cedula': ced,
                            'nombre': name,
                            'correo': mail,
                            'genero': genero,
                            'accion': 'YA EXISTE - Sin cambios'
                        })
                elif modo == 'reemplazar':
                    estudiantes_para_insertar.append({
                        'codigo': cod,
                        'cedula': ced,
                        'nombre': name,
                        'correo': mail,
                        'genero': genero,
                        'accion': 'SE INSERTARÁ (tras limpiar)'
                    })
            else:
                estudiantes_para_insertar.append({
                    'codigo': cod,
                    'cedula': ced,
                    'nombre': name,
                    'correo': mail,
                    'genero': genero,
                    'accion': 'SE INSERTARÁ (nuevo)'
                })
        
        # MOSTRAR RESUMEN DEL ANÁLISIS
        mostrar_resumen_estudiantes(estudiantes_para_insertar, estudiantes_existentes, 
                                  estudiantes_para_actualizar, modo)
        
        # PASO 2: Confirmar con el usuario
        if not confirmar_operacion():
            print("❌ Operación cancelada por el usuario")
            cur.close()
            return False
            
        # PASO 3: Ejecutar las operaciones
        return ejecutar_operaciones_estudiantes(cur, conn, estudiantes_para_insertar, 
                                              estudiantes_para_actualizar, modo)
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error en estudiantes: {error}")
        return False


def mostrar_resumen_estudiantes(para_insertar, existentes, para_actualizar, modo):
    """
    Muestra un resumen detallado de qué se hará con cada estudiante
    """
    total = len(para_insertar) + len(existentes) + len(para_actualizar)
    
    if modo == 'reemplazar' and total > 0:
        print("⚠️  MODO REEMPLAZAR: Se eliminará TODA la tabla de estudiantes primero")
        print()
    
    # Estudiantes que se insertarán
    if para_insertar:
        print(f"📈 ESTUDIANTES QUE SE INSERTARÁN ({len(para_insertar)}):")
        for i, est in enumerate(para_insertar, 1):
            correo_texto = f" ({est['correo']})" if est['correo'] else " (sin correo)"
            genero_texto = f" [{est['genero']}]" if est['genero'] else " [sin género]"
            print(f"   {i}. [{est['codigo']}] {est['nombre']}{genero_texto}{correo_texto}")
            print(f"      📄 Cédula: {est['cedula']} - {est['accion']}")
        print()
    
    # Estudiantes que se actualizarán
    if para_actualizar:
        print(f"🔄 ESTUDIANTES QUE SE ACTUALIZARÁN ({len(para_actualizar)}):")
        for i, est in enumerate(para_actualizar, 1):
            print(f"   {i}. [{est['codigo']}] - {est['accion']}")
            if est['cedula_actual'] != est['cedula_nueva']:
                print(f"      📄 Cédula: '{est['cedula_actual']}' → '{est['cedula_nueva']}'")
            if est['nombre_actual'] != est['nombre_nuevo']:
                print(f"      👤 Nombre: '{est['nombre_actual']}' → '{est['nombre_nuevo']}'")
            if est['correo_actual'] != est['correo_nuevo']:
                print(f"      📧 Correo: '{est['correo_actual']}' → '{est['correo_nuevo']}'")
            if est['genero_actual'] != est['genero_nuevo']:
                print(f"      ⚥ Género: '{est['genero_actual']}' → '{est['genero_nuevo']}'")
        print()
    
    # Estudiantes que ya existen
    if existentes:
        print(f"✓ ESTUDIANTES QUE YA EXISTEN ({len(existentes)}):")
        for i, est in enumerate(existentes, 1):
            correo_texto = f" ({est['correo']})" if est['correo'] else " (sin correo)"
            genero_texto = f" [{est['genero']}]" if est['genero'] else " [sin género]"
            print(f"   {i}. [{est['codigo']}] {est['nombre']}{genero_texto}{correo_texto}")
            print(f"      📄 Cédula: {est['cedula']} - {est['accion']}")
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


def ejecutar_operaciones_estudiantes(cur, conn, para_insertar, para_actualizar, modo):
    """
    Ejecuta las operaciones de inserción/actualización tras la confirmación
    """
    print("\n🚀 EJECUTANDO OPERACIONES...")
    
    try:
        # Si es modo reemplazar, limpiar tabla primero
        if modo == 'reemplazar':
            print("   🗑️ Limpiando tabla estudiantes...")
            cur.execute('DELETE FROM public.estudiantes;')
            cur.execute('ALTER SEQUENCE estudiantes_est_id_seq RESTART WITH 1;')
        
        contador_insertados = 0
        contador_actualizados = 0
        
        # Insertar nuevos estudiantes
        if para_insertar:
            sql_insert = """INSERT INTO estudiantes
                           (est_codigo, est_cedula, est_nombre, est_correo, est_genero)
                           VALUES (%s,%s,%s,%s,%s)"""
            
            for est in para_insertar:
                cur.execute(sql_insert, (est['codigo'], est['cedula'], est['nombre'], 
                                        est['correo'], est['genero']))
                contador_insertados += 1
                
                if contador_insertados % 50 == 0:
                    print(f"   📝 Insertados: {contador_insertados}/{len(para_insertar)}")
        
        # Actualizar estudiantes existentes
        if para_actualizar:
            sql_update = """UPDATE estudiantes 
                           SET est_cedula = %s, est_nombre = %s, est_correo = %s, est_genero = %s 
                           WHERE est_codigo = %s"""
            
            for est in para_actualizar:
                cur.execute(sql_update, (est['cedula_nueva'], est['nombre_nuevo'], 
                                        est['correo_nuevo'], est['genero_nuevo'], est['codigo']))
                contador_actualizados += 1
                
                if contador_actualizados % 50 == 0:
                    print(f"   🔄 Actualizados: {contador_actualizados}/{len(para_actualizar)}")
        
        # Hacer commit de todas las operaciones
        conn.commit()
        cur.close()
        
        # Mostrar resultado final
        print("\n🎉 OPERACIÓN COMPLETADA EXITOSAMENTE:")
        print(f"   📈 Estudiantes insertados: {contador_insertados}")
        print(f"   🔄 Estudiantes actualizados: {contador_actualizados}")
        print(f"   ✓ Total procesado: {contador_insertados + contador_actualizados}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error durante la ejecución: {e}")
        conn.rollback()  # Revertir cambios en caso de error
        cur.close()
        return False


def limpiar_estudiantes(connection):
    """
    Limpia completamente la tabla de estudiantes
    """
    try:
        conn = connection
        cur = conn.cursor()
        
        print("🔍 Verificando estudiantes existentes...")
        cur.execute("SELECT COUNT(*) FROM estudiantes")
        total = cur.fetchone()[0]
        
        if total == 0:
            print("✅ La tabla de estudiantes ya está vacía")
            cur.close()
            return True
            
        print(f"⚠️  Se encontraron {total} estudiantes en la base de datos")
        print("⚠️  Esta operación eliminará TODOS los estudiantes y puede afectar:")
        print("    - Inscripciones de estos estudiantes en grupos")
        print("    - Datos académicos relacionados")
        
        if not confirmar_operacion():
            print("❌ Operación cancelada por el usuario")
            cur.close()
            return False
            
        print("🗑️  Eliminando todos los estudiantes...")
        cur.execute('DELETE FROM public.estudiantes;')
        cur.execute('ALTER SEQUENCE estudiantes_est_id_seq RESTART WITH 1;')
        conn.commit()
        cur.close()
        
        print("✅ Tabla de estudiantes limpiada exitosamente")
        return True
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error al limpiar estudiantes: {error}")
        return False


def obtener_estadisticas_estudiantes(connection):
    """
    Obtiene estadísticas de los estudiantes en la base de datos
    """
    try:
        conn = connection
        cur = conn.cursor()
        
        # Total de estudiantes
        cur.execute("SELECT COUNT(*) FROM estudiantes")
        total = cur.fetchone()[0]
        
        # Estudiantes con y sin correo
        cur.execute("""
            SELECT 
                COUNT(CASE WHEN est_correo IS NOT NULL AND est_correo != '' THEN 1 END) as con_correo,
                COUNT(CASE WHEN est_correo IS NULL OR est_correo = '' THEN 1 END) as sin_correo
            FROM estudiantes
        """)
        correos = cur.fetchone()
        
        # Estudiantes por género
        cur.execute("""
            SELECT est_genero, COUNT(*) 
            FROM estudiantes 
            WHERE est_genero IS NOT NULL AND est_genero != ''
            GROUP BY est_genero 
            ORDER BY COUNT(*) DESC
        """)
        por_genero = cur.fetchall()
        
        # Rango de códigos de estudiantes
        cur.execute("""
            SELECT MIN(est_codigo) as min_codigo, MAX(est_codigo) as max_codigo
            FROM estudiantes
            WHERE est_codigo IS NOT NULL
        """)
        rango_codigos = cur.fetchone()
        
        # Últimos estudiantes agregados
        cur.execute("""
            SELECT est_codigo, est_cedula, est_nombre, est_correo, est_genero
            FROM estudiantes 
            ORDER BY est_id DESC 
            LIMIT 5
        """)
        ultimos = cur.fetchall()
        
        cur.close()
        
        # Mostrar estadísticas
        print("\n📊 ESTADÍSTICAS DE ESTUDIANTES:")
        print("="*50)
        print(f"🎓 Total de estudiantes: {total:,}")
        
        if rango_codigos and rango_codigos[0] and rango_codigos[1]:
            print(f"📋 Rango de códigos: {rango_codigos[0]} - {rango_codigos[1]}")
        
        if correos:
            print(f"\n📧 Estado de correos electrónicos:")
            print(f"   ✅ Con correo: {correos[0]:,} estudiantes")
            print(f"   ❌ Sin correo: {correos[1]:,} estudiantes")
        
        if por_genero:
            print("\n⚥ Distribución por género:")
            for genero, cantidad in por_genero:
                genero_texto = genero if genero else "Sin especificar"
                print(f"   {genero_texto}: {cantidad:,} estudiantes")
        
        if ultimos and total > 0:
            print(f"\n🕒 Últimos {min(5, total)} estudiantes:")
            for i, (codigo, cedula, nombre, correo, genero) in enumerate(ultimos, 1):
                correo_texto = f" - {correo}" if correo else " - sin correo"
                genero_texto = f" [{genero}]" if genero else " [sin género]"
                print(f"   {i}. [{codigo}] {nombre}{genero_texto}")
                print(f"      📄 {cedula}{correo_texto}")
        
        print("="*50)
        return True
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error al obtener estadísticas: {error}")
        return False


def validar_estudiantes_archivo(datos):
    """
    Valida que el archivo tenga las columnas necesarias para estudiantes
    """
    columnas_requeridas = ['COD_ESTUDIANTE', 'CEDULA_ESTUDIANTE', 'ESTUDIANTE']
    columnas_opcionales = ['CORREO_ESTUDIANTE', 'GENERO_ESTUDIANTE']
    columnas_archivo = datos.columns.tolist()
    
    print("🔍 VALIDANDO ARCHIVO PARA ESTUDIANTES:")
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
    estudiantes_df = datos.drop_duplicates(['COD_ESTUDIANTE'], keep='first')
    total_estudiantes = len(estudiantes_df)
    
    if total_estudiantes == 0:
        print("❌ No se encontraron estudiantes en el archivo")
        return False
    
    # Verificar valores nulos en campos obligatorios
    nulos_codigo = estudiantes_df['COD_ESTUDIANTE'].isnull().sum()
    nulos_cedula = estudiantes_df['CEDULA_ESTUDIANTE'].isnull().sum()
    nulos_nombre = estudiantes_df['ESTUDIANTE'].isnull().sum()
    
    # Verificar campos opcionales si existen las columnas
    tiene_correos = 'CORREO_ESTUDIANTE' in columnas_archivo
    tiene_generos = 'GENERO_ESTUDIANTE' in columnas_archivo
    correos_vacios = 0
    generos_vacios = 0
    
    if tiene_correos:
        correos_vacios = estudiantes_df['CORREO_ESTUDIANTE'].isnull().sum()
    if tiene_generos:
        generos_vacios = estudiantes_df['GENERO_ESTUDIANTE'].isnull().sum()
    
    print("✅ VALIDACIÓN EXITOSA:")
    print(f"   🎓 Estudiantes únicos encontrados: {total_estudiantes:,}")
    print(f"   📧 Columna de correos: {'Presente' if tiene_correos else 'No presente'}")
    print(f"   ⚥ Columna de géneros: {'Presente' if tiene_generos else 'No presente'}")
    
    if (nulos_codigo > 0 or nulos_cedula > 0 or nulos_nombre > 0 or 
        correos_vacios > 0 or generos_vacios > 0):
        print("⚠️  ADVERTENCIAS:")
        if nulos_codigo > 0:
            print(f"   - {nulos_codigo:,} estudiantes sin código")
        if nulos_cedula > 0:
            print(f"   - {nulos_cedula:,} estudiantes sin cédula")
        if nulos_nombre > 0:
            print(f"   - {nulos_nombre:,} estudiantes sin nombre")
        if correos_vacios > 0:
            print(f"   - {correos_vacios:,} estudiantes sin correo electrónico")
        if generos_vacios > 0:
            print(f"   - {generos_vacios:,} estudiantes sin género especificado")
        print("   Las filas con datos obligatorios faltantes serán ignoradas")
    
    # Verificar formato de códigos de estudiantes
    codigos_invalidos = 0
    for codigo in estudiantes_df['COD_ESTUDIANTE'].dropna():
        if not str(codigo).isdigit():
            codigos_invalidos += 1
    
    # Verificar formato de cédulas
    cedulas_invalidas = 0
    for cedula in estudiantes_df['CEDULA_ESTUDIANTE'].dropna():
        cedula_str = str(cedula)
        if not (cedula_str.isdigit() and len(cedula_str) in [9, 10]):
            cedulas_invalidas += 1
    
    if codigos_invalidos > 0:
        print(f"⚠️  {codigos_invalidos:,} códigos de estudiante con formato inválido")
    if cedulas_invalidas > 0:
        print(f"⚠️  {cedulas_invalidas:,} cédulas con formato inválido (deben ser 9 o 10 dígitos)")
    
    # Mostrar distribución por género si existe
    if tiene_generos:
        generos_unicos = estudiantes_df['GENERO_ESTUDIANTE'].value_counts()
        if len(generos_unicos) > 0:
            print(f"\n📊 Distribución por género:")
            for genero, cantidad in generos_unicos.items():
                genero_texto = genero if str(genero) != 'nan' else "Sin especificar"
                print(f"   {genero_texto}: {cantidad:,} estudiantes")
    
    print("="*50)
    return True

