"""
Módulo especializado para importación de grupos
Maneja todas las operaciones relacionadas con la tabla de grupos
"""
import psycopg2
import pandas as pd


def import_grupos(datos, connection, modo='agregar'):
    """
    Función principal para importación de grupos con sistema de preview y confirmación
    
    Args:
        datos (DataFrame): Datos del Excel cargado
        connection: Conexión a la base de datos PostgreSQL
        modo (str): Modo de importación ('agregar', 'actualizar', 'reemplazar')
    """
    try:
        print(f"\n{'='*60}")
        print(f"👥 IMPORTACIÓN DE GRUPOS - Modo: {modo.upper()}")
        print(f"{'='*60}")

        # 1. Validar archivo de entrada
        if not validar_grupos_archivo(datos):
            return False

        # 2. Procesar y preparar datos
        grupos_preparados = procesar_datos_grupos(datos, connection)
        if grupos_preparados.empty:
            print("❌ No se pudieron procesar los datos de grupos")
            return False

        # 3. Mostrar resumen y preview
        mostrar_resumen_grupos(grupos_preparados, connection, modo)
        
        # 4. Solicitar confirmación
        if not confirmar_operacion():
            print("❌ Operación cancelada por el usuario")
            return False

        # 5. Ejecutar operación según el modo
        return ejecutar_operaciones_grupos(grupos_preparados, connection, modo)

    except Exception as e:
        print(f"❌ Error en importación de grupos: {e}")
        return False


def procesar_datos_grupos(datos, connection):
    """
    Procesa y prepara los datos de grupos para importación
    """
    print("🔄 Procesando datos de grupos...")
    
    # Eliminar duplicados basados en las columnas clave
    grupos_unicos = datos.drop_duplicates(['COD_PERIODO', 'COD_ASIGNATURA', 'GRUPO', 'CEDULA_DOCENTE'], keep='first')
    
    # Cargar datos de referencia para validación
    docentes_db, asignaturas_db = cargar_datos_referencia(connection)
    
    grupos_preparados = []
    errores = []
    
    for index, row in grupos_unicos.iterrows():
        try:
            # Preparar datos del grupo
            grupo_data = {
                'nombre': row['GRUPO'],
                'periodo': row['COD_PERIODO'],
                'habilitado': True,
                'cod_asignatura': row['COD_ASIGNATURA'],
                'cedula_docente': str(row['CEDULA_DOCENTE']).zfill(10),  # Normalizar cédula
                'asignatura_id': None,
                'docente_id': None
            }
            
            # Buscar ID de asignatura
            asignatura_encontrada = False
            for asi in asignaturas_db:
                if asi[2] == row['COD_ASIGNATURA']:  # cod_asignatura
                    grupo_data['asignatura_id'] = asi[0]  # id
                    asignatura_encontrada = True
                    break
            
            if not asignatura_encontrada:
                errores.append(f"Asignatura no encontrada: {row['COD_ASIGNATURA']}")
                continue
            
            # Buscar ID de docente
            docente_encontrado = False
            for doc in docentes_db:
                if doc[1] == grupo_data['cedula_docente']:  # cedula
                    grupo_data['docente_id'] = doc[0]  # id
                    docente_encontrado = True
                    break
            
            if not docente_encontrado:
                errores.append(f"Docente no encontrado: {grupo_data['cedula_docente']}")
                continue
                
            grupos_preparados.append(grupo_data)
            
        except Exception as e:
            errores.append(f"Error procesando fila {index}: {e}")
    
    # Mostrar errores si los hay
    if errores:
        print(f"\n⚠️  Se encontraron {len(errores)} errores:")
        for error in errores[:5]:  # Mostrar solo los primeros 5
            print(f"   • {error}")
        if len(errores) > 5:
            print(f"   • ... y {len(errores) - 5} errores más")
    
    grupos_df = pd.DataFrame(grupos_preparados)
    print(f"✅ {len(grupos_preparados)} grupos procesados correctamente")
    
    return grupos_df


def cargar_datos_referencia(connection):
    """
    Carga docentes y asignaturas de la base de datos para validación
    """
    try:
        cur = connection.cursor()
        
        # Cargar docentes
        cur.execute("SELECT * FROM docentes")
        docentes = cur.fetchall()
        
        # Cargar asignaturas
        cur.execute("SELECT * FROM asignaturas")
        asignaturas = cur.fetchall()
        
        cur.close()
        return docentes, asignaturas
        
    except Exception as e:
        print(f"❌ Error cargando datos de referencia: {e}")
        return [], []


def mostrar_resumen_grupos(grupos_df, connection, modo):
    """
    Muestra resumen y preview de los datos de grupos a procesar
    """
    print(f"\n📊 RESUMEN DE GRUPOS - Modo: {modo.upper()}")
    print("="*50)
    
    if grupos_df.empty:
        print("❌ No hay datos válidos para procesar")
        return
        
    # Estadísticas generales
    print(f"📈 Total de grupos a procesar: {len(grupos_df)}")
    print(f"📅 Períodos únicos: {grupos_df['periodo'].nunique()}")
    print(f"📚 Asignaturas únicas: {grupos_df['cod_asignatura'].nunique()}")
    print(f"👨‍🏫 Docentes únicos: {grupos_df['cedula_docente'].nunique()}")
    
    # Mostrar distribución por período
    print("\n📅 Distribución por período:")
    periodos = grupos_df['periodo'].value_counts().sort_index()
    for periodo, count in periodos.items():
        print(f"   • {periodo}: {count} grupos")
    
    # Preview de algunos grupos
    print(f"\n👀 PREVIEW - Primeros 5 grupos:")
    print("-" * 80)
    for i, (_, grupo) in enumerate(grupos_df.head().iterrows()):
        print(f"{i+1}. Grupo: {grupo['nombre']} | Período: {grupo['periodo']}")
        print(f"   Asignatura: {grupo['cod_asignatura']} | Docente: {grupo['cedula_docente']}")
        print()
    
    if len(grupos_df) > 5:
        print(f"   ... y {len(grupos_df) - 5} grupos más")
    
    # Estadísticas actuales de la base de datos
    estadisticas_actuales = obtener_estadisticas_grupos(connection)
    if estadisticas_actuales:
        print(f"\n📊 ESTADO ACTUAL EN BD:")
        print(f"   • Grupos existentes: {estadisticas_actuales.get('total', 0)}")
        print(f"   • Períodos en BD: {estadisticas_actuales.get('periodos', 0)}")
    
    print("\n" + "="*50)


def confirmar_operacion():
    """
    Solicita confirmación al usuario antes de proceder
    """
    print("\n🤔 ¿Deseas continuar con esta operación?")
    respuesta = input("👉 Escribe 'si' para continuar o cualquier otra cosa para cancelar: ").strip().lower()
    return respuesta in ['si', 'sí', 's', 'yes', 'y']


def ejecutar_operaciones_grupos(grupos_df, connection, modo):
    """
    Ejecuta las operaciones de importación según el modo seleccionado
    """
    try:
        cur = connection.cursor()
        
        if modo == 'reemplazar':
            print("🗑️ Limpiando tabla de grupos...")
            cur.execute("DELETE FROM grupos")
            connection.commit()
            print("✅ Tabla limpiada")
        
        contador_insertados = 0
        contador_actualizados = 0
        errores = []
        
        sql_insert = """
        INSERT INTO grupos (grp_nombre, grp_periodo, grp_habilitado, grp_asi_id, grp_doc_id)
        VALUES (%s, %s, %s, %s, %s)
        """
        
        sql_update = """
        UPDATE grupos 
        SET grp_nombre = %s, grp_habilitado = %s, grp_asi_id = %s, grp_doc_id = %s
        WHERE grp_periodo = %s AND grp_nombre = %s AND grp_asi_id = %s
        """
        
        sql_check = """
        SELECT * FROM grupos 
        WHERE grp_periodo = %s AND grp_nombre = %s AND grp_asi_id = %s
        """
        
        total = len(grupos_df)
        
        for index, grupo in grupos_df.iterrows():
            try:
                if modo == 'actualizar':
                    # Verificar si existe
                    cur.execute(sql_check, (grupo['periodo'], grupo['nombre'], grupo['asignatura_id']))
                    existe = cur.fetchone()
                    
                    if existe:
                        # Actualizar
                        cur.execute(sql_update, (
                            grupo['nombre'], grupo['habilitado'], 
                            grupo['asignatura_id'], grupo['docente_id'],
                            grupo['periodo'], grupo['nombre'], grupo['asignatura_id']
                        ))
                        contador_actualizados += 1
                    else:
                        # Insertar nuevo
                        cur.execute(sql_insert, (
                            grupo['nombre'], grupo['periodo'], grupo['habilitado'],
                            grupo['asignatura_id'], grupo['docente_id']
                        ))
                        contador_insertados += 1
                        
                elif modo in ['agregar', 'reemplazar']:
                    # Solo insertar
                    if modo == 'agregar':
                        # Verificar que no exista
                        cur.execute(sql_check, (grupo['periodo'], grupo['nombre'], grupo['asignatura_id']))
                        if cur.fetchone():
                            continue  # Skip si ya existe
                    
                    cur.execute(sql_insert, (
                        grupo['nombre'], grupo['periodo'], grupo['habilitado'],
                        grupo['asignatura_id'], grupo['docente_id']
                    ))
                    contador_insertados += 1
                
                # Progress indicator
                if (index + 1) % 10 == 0:
                    print(f"   Procesados: {index + 1}/{total}")
                
            except Exception as e:
                errores.append(f"Error en grupo {grupo['nombre']}: {e}")
                continue
        
        connection.commit()
        cur.close()
        
        # Reporte final
        print(f"\n🎉 IMPORTACIÓN COMPLETADA:")
        print(f"   ✅ Grupos insertados: {contador_insertados}")
        if contador_actualizados > 0:
            print(f"   🔄 Grupos actualizados: {contador_actualizados}")
        if errores:
            print(f"   ❌ Errores: {len(errores)}")
            for error in errores[:3]:
                print(f"      • {error}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error ejecutando operaciones: {e}")
        return False


def obtener_estadisticas_grupos(connection):
    """
    Obtiene estadísticas actuales de grupos en la base de datos
    """
    try:
        cur = connection.cursor()
        
        # Total de grupos
        cur.execute("SELECT COUNT(*) FROM grupos")
        total = cur.fetchone()[0]
        
        # Períodos únicos
        cur.execute("SELECT COUNT(DISTINCT grp_periodo) FROM grupos")
        periodos = cur.fetchone()[0]
        
        # Grupos por período
        cur.execute("""
        SELECT grp_periodo, COUNT(*) as cantidad 
        FROM grupos 
        GROUP BY grp_periodo 
        ORDER BY grp_periodo
        """)
        grupos_por_periodo = cur.fetchall()
        
        cur.close()
        
        estadisticas = {
            'total': total,
            'periodos': periodos,
            'por_periodo': grupos_por_periodo
        }
        
        print(f"\n📊 ESTADÍSTICAS ACTUALES DE GRUPOS:")
        print(f"   • Total: {total}")
        print(f"   • Períodos únicos: {periodos}")
        
        if grupos_por_periodo:
            print("   • Por período:")
            for periodo, cantidad in grupos_por_periodo:
                print(f"     - {periodo}: {cantidad} grupos")
        
        return estadisticas
        
    except Exception as e:
        print(f"❌ Error obteniendo estadísticas: {e}")
        return {}


def validar_grupos_archivo(datos):
    """
    Valida que el archivo tenga las columnas necesarias para grupos
    """
    columnas_requeridas = ['COD_PERIODO', 'COD_ASIGNATURA', 'GRUPO', 'CEDULA_DOCENTE']
    
    print("🔍 Validando archivo para importación de grupos...")
    
    columnas_faltantes = []
    for col in columnas_requeridas:
        if col not in datos.columns:
            columnas_faltantes.append(col)
    
    if columnas_faltantes:
        print(f"❌ Faltan columnas requeridas: {', '.join(columnas_faltantes)}")
        return False
    
    # Verificar datos no vacíos
    registros_validos = 0
    for col in columnas_requeridas:
        no_vacios = datos[col].notna().sum()
        print(f"   • {col}: {no_vacios} registros válidos")
        registros_validos = min(registros_validos, no_vacios) if registros_validos > 0 else no_vacios
    
    if registros_validos == 0:
        print("❌ No hay registros válidos en el archivo")
        return False
    
    print(f"✅ Archivo válido: {registros_validos} registros para procesar")
    return True


def limpiar_grupos(connection):
    """
    Limpia completamente la tabla de grupos
    """
    try:
        print("🗑️ Iniciando limpieza de tabla grupos...")
        
        cur = connection.cursor()
        
        # Obtener estadísticas antes de limpiar
        cur.execute("SELECT COUNT(*) FROM grupos")
        total_antes = cur.fetchone()[0]
        
        if total_antes == 0:
            print("ℹ️ La tabla grupos ya está vacía")
            cur.close()
            return True
        
        print(f"📊 Grupos actuales en BD: {total_antes}")
        print("\n⚠️ Esta operación eliminará TODOS los grupos de la base de datos")
        
        if confirmar_operacion():
            cur.execute("DELETE FROM grupos")
            connection.commit()
            
            cur.execute("SELECT COUNT(*) FROM grupos")
            total_despues = cur.fetchone()[0]
            
            cur.close()
            print(f"✅ Limpieza completada: {total_antes - total_despues} grupos eliminados")
            return True
        else:
            cur.close()
            print("❌ Operación de limpieza cancelada")
            return False
            
    except Exception as e:
        print(f"❌ Error en limpieza de grupos: {e}")
        return False


