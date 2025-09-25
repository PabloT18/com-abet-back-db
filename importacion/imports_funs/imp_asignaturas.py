"""
Módulo especializado para importación de asignaturas
Maneja todas las operaciones relacionadas con la tabla de asignaturas
"""
import psycopg2
import unicodedata
import re



def asignaturas(datos, connection, modo='agregar'):
    """
    Importa las asignaturas únicas desde el DataFrame a la tabla asignaturas
    
    Args:
        datos: DataFrame con los datos
        connection: Conexión a la base de datos
        modo: 'agregar' (default) - solo agrega nuevas
              'actualizar' - agrega nuevas y actualiza existentes
              'reemplazar' - borra todo y vuelve a insertar
    """
    asignaturas_df = datos.drop_duplicates(['COD_ASIGNATURA'], keep='first')
    print(f"📚 Analizando {asignaturas_df.shape[0]} asignaturas únicas (modo: {modo})...")

    try:
        conn = connection
        cur = conn.cursor()
        
        # PASO 1: Analizar qué pasará con cada asignatura
        print("\n🔍 ANÁLISIS PREVIO:")
        print("="*60)
        
        asignaturas_para_insertar = []
        asignaturas_existentes = []
        asignaturas_para_actualizar = []
        
        for index, row in asignaturas_df.iterrows():
            cod = row['COD_ASIGNATURA']
            des = row['ASIGNATURA']
            nivel = row['NIVEL']
            
           
            
            # 1. Búsqueda exacta
            cur.execute("SELECT asi_codigo, asi_descripcion, asi_nivel FROM asignaturas WHERE asi_codigo = %s", (cod,))
            existe = cur.fetchone()  # Cambiar a fetchone() para consistencia
           
            if existe:
                if modo == 'agregar':
                    asignaturas_existentes.append({
                        'codigo': cod,
                        'descripcion': des,
                        'nivel': nivel,
                        'accion': 'YA EXISTE - Se ignora'
                    })
                elif modo == 'actualizar':
                    # Verificar si hay cambios
                    if existe[1] != des or existe[2] != nivel:
                        asignaturas_para_actualizar.append({
                            'codigo': cod,
                            'descripcion_actual': existe[1],
                            'descripcion_nueva': des,
                            'nivel_actual': existe[2], 
                            'nivel_nuevo': nivel,
                            'accion': 'SE ACTUALIZA'
                        })
                    else:
                        asignaturas_existentes.append({
                            'codigo': cod,
                            'descripcion': des,
                            'nivel': nivel,
                            'accion': 'YA EXISTE - Sin cambios'
                        })
                elif modo == 'reemplazar':
                    asignaturas_para_insertar.append({
                        'codigo': cod,
                        'descripcion': des,
                        'nivel': nivel,
                        'accion': 'SE INSERTARÁ (tras limpiar)'
                    })
            else:
                asignaturas_para_insertar.append({
                    'codigo': cod,
                    'descripcion': des,
                    'nivel': nivel,
                    'accion': 'SE INSERTARÁ (nueva)'
                })
        
        # MOSTRAR RESUMEN DEL ANÁLISIS
        mostrar_resumen_asignaturas(asignaturas_para_insertar, asignaturas_existentes, 
                                  asignaturas_para_actualizar, modo)
        
        # PASO 2: Confirmar con el usuario
        if not confirmar_operacion():
            print("❌ Operación cancelada por el usuario")
            cur.close()
            return False
            
        # PASO 3: Ejecutar las operaciones
        return ejecutar_operaciones_asignaturas(cur, conn, asignaturas_para_insertar, 
                                              asignaturas_para_actualizar, modo)
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error en asignaturas: {error}")
        return False


def mostrar_resumen_asignaturas(para_insertar, existentes, para_actualizar, modo):
    """
    Muestra un resumen detallado de qué se hará con cada asignatura
    """
    total = len(para_insertar) + len(existentes) + len(para_actualizar)
    
    if modo == 'reemplazar' and total > 0:
        print("⚠️  MODO REEMPLAZAR: Se eliminará TODA la tabla de asignaturas primero")
        print()
    
    # Asignaturas que se insertarán
    if para_insertar:
        print(f"📈 ASIGNATURAS QUE SE INSERTARÁN ({len(para_insertar)}):")
        for i, asig in enumerate(para_insertar, 1):
            print(f"   {i}. [{asig['codigo']}] {asig['descripcion']} (Nivel: {asig['nivel']}) - {asig['accion']}")
        print()
    
    # Asignaturas que se actualizarán
    if para_actualizar:
        print(f"🔄 ASIGNATURAS QUE SE ACTUALIZARÁN ({len(para_actualizar)}):")
        for i, asig in enumerate(para_actualizar, 1):
            print(f"   {i}. [{asig['codigo']}] - {asig['accion']}")
            if asig['descripcion_actual'] != asig['descripcion_nueva']:
                print(f"      📝 Descripción: '{asig['descripcion_actual']}' → '{asig['descripcion_nueva']}'")
            if asig['nivel_actual'] != asig['nivel_nuevo']:
                print(f"      📊 Nivel: '{asig['nivel_actual']}' → '{asig['nivel_nuevo']}'")
        print()
    
    # Asignaturas que ya existen
    if existentes:
        print(f"✓ ASIGNATURAS QUE YA EXISTEN ({len(existentes)}):")
        for i, asig in enumerate(existentes, 1):
            print(f"   {i}. [{asig['codigo']}] {asig['descripcion']} - {asig['accion']}")
        print()
    
    # Resumen final
    print("="*60)
    print("📊 RESUMEN:")
    print(f"   Total a procesar: {total}")
    print(f"   🆕 Nuevas: {len(para_insertar)}")
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


def ejecutar_operaciones_asignaturas(cur, conn, para_insertar, para_actualizar, modo):
    """
    Ejecuta las operaciones de inserción/actualización tras la confirmación
    """
    print("\n🚀 EJECUTANDO OPERACIONES...")
    
    try:
        # Si es modo reemplazar, limpiar tabla primero
        if modo == 'reemplazar':
            print("   🗑️ Limpiando tabla asignaturas...")
            cur.execute('DELETE FROM public.asignaturas;')
            cur.execute('ALTER SEQUENCE asignaturas_asi_id_seq RESTART WITH 1;')
        
        contador_insertadas = 0
        contador_actualizadas = 0
        
        # Insertar nuevas asignaturas
        if para_insertar:
            sql_insert = """INSERT INTO asignaturas
                           (asi_codigo, asi_descripcion, asi_descripcion_en, asi_nivel)
                           VALUES (%s,%s,%s,%s)"""
            
            for asig in para_insertar:
                cur.execute(sql_insert, (asig['codigo'], asig['descripcion'], 
                                        asig['descripcion'], asig['nivel']))
                contador_insertadas += 1
                
                if contador_insertadas % 10 == 0:
                    print(f"   📝 Insertadas: {contador_insertadas}/{len(para_insertar)}")
        
        # Actualizar asignaturas existentes
        if para_actualizar:
            sql_update = """UPDATE asignaturas 
                           SET asi_descripcion = %s, asi_descripcion_en = %s, asi_nivel = %s 
                           WHERE asi_codigo = %s"""
            
            for asig in para_actualizar:
                cur.execute(sql_update, (asig['descripcion_nueva'], asig['descripcion_nueva'], 
                                        asig['nivel_nuevo'], asig['codigo']))
                contador_actualizadas += 1
                
                if contador_actualizadas % 10 == 0:
                    print(f"   🔄 Actualizadas: {contador_actualizadas}/{len(para_actualizar)}")
        
        # Hacer commit de todas las operaciones
        conn.commit()
        cur.close()
        
        # Mostrar resultado final
        print("\n🎉 OPERACIÓN COMPLETADA EXITOSAMENTE:")
        print(f"   📈 Asignaturas insertadas: {contador_insertadas}")
        print(f"   🔄 Asignaturas actualizadas: {contador_actualizadas}")
        print(f"   ✓ Total procesado: {contador_insertadas + contador_actualizadas}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error durante la ejecución: {e}")
        conn.rollback()  # Revertir cambios en caso de error
        cur.close()
        return False


def limpiar_asignaturas(connection):
    """
    Limpia completamente la tabla de asignaturas
    """
    try:
        conn = connection
        cur = conn.cursor()
        
        print("🔍 Verificando asignaturas existentes...")
        cur.execute("SELECT COUNT(*) FROM asignaturas")
        total = cur.fetchone()[0]
        
        if total == 0:
            print("✅ La tabla de asignaturas ya está vacía")
            cur.close()
            return True
            
        print(f"⚠️  Se encontraron {total} asignaturas en la base de datos")
        print("⚠️  Esta operación eliminará TODAS las asignaturas y puede afectar:")
        print("    - Grupos asociados a estas asignaturas")
        print("    - Inscripciones de estudiantes")
        print("    - Criterios de evaluación")
        
        if not confirmar_operacion():
            print("❌ Operación cancelada por el usuario")
            cur.close()
            return False
            
        print("🗑️  Eliminando todas las asignaturas...")
        cur.execute('DELETE FROM public.asignaturas;')
        cur.execute('ALTER SEQUENCE asignaturas_asi_id_seq RESTART WITH 1;')
        conn.commit()
        cur.close()
        
        print("✅ Tabla de asignaturas limpiada exitosamente")
        return True
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error al limpiar asignaturas: {error}")
        return False


def obtener_estadisticas_asignaturas(connection):
    """
    Obtiene estadísticas de las asignaturas en la base de datos
    """
    try:
        conn = connection
        cur = conn.cursor()
        
        # Total de asignaturas
        cur.execute("SELECT COUNT(*) FROM asignaturas")
        total = cur.fetchone()[0]
        
        # Asignaturas por nivel
        cur.execute("""
            SELECT asi_nivel, COUNT(*) 
            FROM asignaturas 
            GROUP BY asi_nivel 
            ORDER BY asi_nivel
        """)
        por_nivel = cur.fetchall()
        
        # Últimas asignaturas agregadas
        cur.execute("""
            SELECT asi_codigo, asi_descripcion, asi_nivel 
            FROM asignaturas 
            ORDER BY asi_id DESC 
            LIMIT 5
        """)
        ultimas = cur.fetchall()
        
        cur.close()
        
        # Mostrar estadísticas
        print("\n📊 ESTADÍSTICAS DE ASIGNATURAS:")
        print("="*50)
        print(f"📚 Total de asignaturas: {total}")
        
        if por_nivel:
            print("\n📈 Distribución por nivel:")
            for nivel, cantidad in por_nivel:
                print(f"   Nivel {nivel}: {cantidad} asignaturas")
        
        if ultimas and total > 0:
            print(f"\n🕒 Últimas {min(5, total)} asignaturas:")
            for i, (codigo, descripcion, nivel) in enumerate(ultimas, 1):
                print(f"   {i}. [{codigo}] {descripcion} (Nivel: {nivel})")
        
        print("="*50)
        return True
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error al obtener estadísticas: {error}")
        return False


def validar_asignaturas_archivo(datos):
    """
    Valida que el archivo tenga las columnas necesarias para asignaturas
    """
    columnas_requeridas = ['COD_ASIGNATURA', 'ASIGNATURA', 'NIVEL']
    columnas_archivo = datos.columns.tolist()
    
    print("🔍 VALIDANDO ARCHIVO PARA ASIGNATURAS:")
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
            print(f"   - {col}")
        return False
    
    # Verificar datos vacíos
    asignaturas_df = datos.drop_duplicates(['COD_ASIGNATURA'], keep='first')
    total_asignaturas = len(asignaturas_df)
    
    if total_asignaturas == 0:
        print("❌ No se encontraron asignaturas en el archivo")
        return False
    
    # Verificar valores nulos
    nulos_codigo = asignaturas_df['COD_ASIGNATURA'].isnull().sum()
    nulos_descripcion = asignaturas_df['ASIGNATURA'].isnull().sum()
    nulos_nivel = asignaturas_df['NIVEL'].isnull().sum()
    
    print("✅ VALIDACIÓN EXITOSA:")
    print(f"   📚 Asignaturas únicas encontradas: {total_asignaturas}")
    
    if nulos_codigo > 0 or nulos_descripcion > 0 or nulos_nivel > 0:
        print("⚠️  ADVERTENCIAS:")
        if nulos_codigo > 0:
            print(f"   - {nulos_codigo} asignaturas sin código")
        if nulos_descripcion > 0:
            print(f"   - {nulos_descripcion} asignaturas sin descripción")
        if nulos_nivel > 0:
            print(f"   - {nulos_nivel} asignaturas sin nivel")
        print("   Estas filas serán ignoradas durante la importación")
    
    print("="*50)
    return True


# Función de compatibilidad con código existente
def import_asignaturas(datos, connection, modo='agregar'):
    """
    Función de compatibilidad - redirige a la nueva función asignaturas()
    """
    return asignaturas(datos, connection, modo)