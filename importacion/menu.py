"""
Menú interactivo para la importación de datos ABET
"""
from funciones_importacion import (
    inscripcion_grupos,
    studen_outcomes, criterios_so, niveles_cri, crit_asignatura, deleteData
)
from imports_funs.imp_asignaturas import import_asignaturas, obtener_estadisticas_asignaturas, validar_asignaturas_archivo
from imports_funs.imp_docentes import (
    import_docentes, obtener_estadisticas_docentes, validar_docentes_archivo, limpiar_docentes
)
from imports_funs.imp_estudiantes import (
    import_estudiantes, obtener_estadisticas_estudiantes, validar_estudiantes_archivo, limpiar_estudiantes
)
from imports_funs.imp_grupos import (
    import_grupos, obtener_estadisticas_grupos, validar_grupos_archivo, limpiar_grupos
)




def mostrar_menu():
    """
    Muestra el menú principal de opciones
    """
    print("\n" + "="*60)
    print("           MENÚ DE IMPORTACIÓN DE DATOS ABET")
    print("="*60)
    print("1.  Limpiar toda la base de datos")
    print("2.  Importar Asignaturas (con análisis previo)")
    print("3.  Importar Docentes (con análisis previo)")
    print("4.  Importar Estudiantes (con análisis previo)")
    print("5.  Importar Grupos (con análisis previo)")
    print("6.  Importar Inscripciones de Grupos")
    print("7.  Importar Student Outcomes")
    print("8.  Importar Criterios SO")
    print("9.  Importar Niveles de Criterios")
    print("10. Importar Criterios-Asignaturas")
    print("-"*60)
    print("11. Importación COMPLETA (pasos 1-10)")
    print("12. Importación SIN LIMPIAR (pasos 2-10)")
    print("13. Solo Student Outcomes (pasos 7-10)")
    print("14. Solo datos académicos (pasos 2-6)")
    print("15. Solo limpiar tabla docentes")
    print("16. Solo limpiar tabla estudiantes")
    print("17. Solo limpiar tabla grupos")
    print("-"*60)
    print("📊 HERRAMIENTAS ESPECIALES:")
    print("18. Ver estadísticas de asignaturas")
    print("19. Validar archivo para asignaturas")
    print("20. Ver estadísticas de docentes")
    print("21. Validar archivo para docentes")
    print("22. Ver estadísticas de estudiantes")
    print("23. Validar archivo para estudiantes")
    print("24. Ver estadísticas de grupos")
    print("25. Validar archivo para grupos")
    print("-"*60)
    print("0.  Salir")
    print("="*60)


def seleccionar_modo_importacion(tipo_entidad):
    """
    Función genérica que permite al usuario seleccionar el modo de importación
    
    Args:
        tipo_entidad: string con el nombre de la entidad (ej: "asignaturas", "docentes", "estudiantes")
    
    Returns:
        string: modo seleccionado ("agregar", "actualizar", "reemplazar")
    """
    # Emojis por tipo de entidad
    emojis = {
        "asignaturas": "📚",
        "docentes": "👨‍🏫", 
        "estudiantes": "🎓",
        "grupos": "👥"
    }
    
    emoji = emojis.get(tipo_entidad, "📋")
    
    print(f"{emoji} Importando {tipo_entidad}...")
    print(f"\n¿Cómo quieres importar {tipo_entidad}?")
    print("a) Solo agregar nuevos (ignora duplicados) - RECOMENDADO")
    print("b) Agregar nuevos y actualizar existentes")  
    print(f"c) Reemplazar todos los {tipo_entidad}")
    sub_opcion = input("Selecciona (a/b/c): ").strip().lower()
    
    if sub_opcion == 'a':
        return 'agregar'
    elif sub_opcion == 'b':
        return 'actualizar'
    elif sub_opcion == 'c':
        return 'reemplazar'
    else:
        print("❌ Opción no válida, usando modo por defecto (agregar)")
        return 'agregar'


def ejecutar_importacion_completa(df, connection):
    """
    Ejecuta la importación completa paso a paso
    """
    print("🚀 Ejecutando importación COMPLETA...")
    pasos = [
        ("Limpiando base de datos", lambda: deleteData(connection)),
        ("Importando asignaturas", lambda: import_asignaturas(df, connection, modo='reemplazar')),
        ("Importando docentes", lambda: import_docentes(df, connection, modo='reemplazar')),
        ("Importando estudiantes", lambda: import_estudiantes(df, connection, modo='reemplazar')),
        ("Importando grupos", lambda: import_grupos(df, connection, modo='reemplazar')),
        ("Importando inscripciones", lambda: inscripcion_grupos(df, connection)),
        ("Importando Student Outcomes", lambda: studen_outcomes(connection)),
        ("Importando Criterios SO", lambda: criterios_so(connection)),
        ("Importando Niveles de Criterios", lambda: niveles_cri(connection)),
        ("Importando Criterios-Asignaturas", lambda: crit_asignatura(connection))
    ]
    
    for i, (descripcion, funcion) in enumerate(pasos, 1):
        print(f"Paso {i}/10: {descripcion}...")
        try:
            funcion()
        except Exception as e:
            print(f"❌ Error en paso {i}: {e}")
            return False
    
    print("🎉 ¡Importación COMPLETA finalizada exitosamente!")
    return True


def ejecutar_importacion_sin_limpiar(df, connection):
    """
    Ejecuta la importación sin limpiar la base de datos
    """
    print("🚀 Ejecutando importación SIN LIMPIAR...")
    pasos = [
        ("Importando asignaturas", lambda: import_asignaturas(df, connection, modo='agregar')),
        ("Importando docentes", lambda: import_docentes(df, connection, modo='agregar')),
        ("Importando estudiantes", lambda: import_estudiantes(df, connection, modo='agregar')),
        ("Importando grupos", lambda: import_grupos(df, connection, modo='agregar')),
        ("Importando inscripciones", lambda: inscripcion_grupos(df, connection)),
        ("Importando Student Outcomes", lambda: studen_outcomes(connection)),
        ("Importando Criterios SO", lambda: criterios_so(connection)),
        ("Importando Niveles de Criterios", lambda: niveles_cri(connection)),
        ("Importando Criterios-Asignaturas", lambda: crit_asignatura(connection))
    ]
    
    for i, (descripcion, funcion) in enumerate(pasos, 1):
        print(f"Paso {i}/9: {descripcion}...")
        try:
            funcion()
        except Exception as e:
            print(f"❌ Error en paso {i}: {e}")
            return False
    
    print("🎉 ¡Importación SIN LIMPIAR finalizada exitosamente!")
    return True


def ejecutar_solo_student_outcomes(connection):
    """
    Ejecuta solo la importación de Student Outcomes y criterios
    """
    print("🎯 Ejecutando importación de Student Outcomes...")
    pasos = [
        ("Importando Student Outcomes", lambda: studen_outcomes(connection)),
        ("Importando Criterios SO", lambda: criterios_so(connection)),
        ("Importando Niveles de Criterios", lambda: niveles_cri(connection)),
        ("Importando Criterios-Asignaturas", lambda: crit_asignatura(connection))
    ]
    
    for i, (descripcion, funcion) in enumerate(pasos, 1):
        print(f"Paso {i}/4: {descripcion}...")
        try:
            funcion()
        except Exception as e:
            print(f"❌ Error en paso {i}: {e}")
            return False
    
    print("🎉 ¡Student Outcomes importados exitosamente!")
    return True


def ejecutar_solo_datos_academicos(df, connection):
    """
    Ejecuta solo la importación de datos académicos básicos
    """
    print("🏫 Ejecutando importación de datos académicos...")
    pasos = [
        ("Importando asignaturas", lambda: import_asignaturas(df, connection, modo='agregar')),
        ("Importando docentes", lambda: import_docentes(df, connection, modo='agregar')),
        ("Importando estudiantes", lambda: import_estudiantes(df, connection, modo='agregar')),
        ("Importando grupos", lambda: import_grupos(df, connection, modo='agregar')),
        ("Importando inscripciones", lambda: inscripcion_grupos(df, connection))
    ]
    
    for i, (descripcion, funcion) in enumerate(pasos, 1):
        print(f"Paso {i}/5: {descripcion}...")
        try:
            funcion()
        except Exception as e:
            print(f"❌ Error en paso {i}: {e}")
            return False
    
    print("🎉 ¡Datos académicos importados exitosamente!")
    return True


def ejecutar_opcion(opcion, df, connection):
    """
    Ejecuta la opción seleccionada del menú
    """
    # Función auxiliar para ejecutar importaciones con selección de modo
    def ejecutar_con_seleccion_modo(tipo_entidad, funcion_importacion):
        modo = seleccionar_modo_importacion(tipo_entidad)
        funcion_importacion(df, connection, modo=modo)
    
    funciones_individuales = {
        "1": ("🗑️  Limpiando base de datos", lambda: deleteData(connection)),
        "2": ("📚 Importando asignaturas", lambda: ejecutar_con_seleccion_modo("asignaturas", import_asignaturas)),
        "3": ("👨‍🏫 Importando docentes", lambda: ejecutar_con_seleccion_modo("docentes", import_docentes)),
        "4": ("🎓 Importando estudiantes", lambda: ejecutar_con_seleccion_modo("estudiantes", import_estudiantes)),
        "5": ("👥 Importando grupos", lambda: ejecutar_con_seleccion_modo("grupos", import_grupos)),
        "6": ("📝 Importando inscripciones de grupos", lambda: inscripcion_grupos(df, connection)),
        "7": ("🎯 Importando Student Outcomes", lambda: studen_outcomes(connection)),
        "8": ("📋 Importando Criterios SO", lambda: criterios_so(connection)),
        "9": ("📊 Importando Niveles de Criterios", lambda: niveles_cri(connection)),
        "10": ("🔗 Importando Criterios-Asignaturas", lambda: crit_asignatura(connection))
    }
    
    try:
        if opcion in funciones_individuales:
            descripcion, funcion = funciones_individuales[opcion]
            print(descripcion + "...")
            funcion()
            
        elif opcion == "11":
            ejecutar_importacion_completa(df, connection)
            
        elif opcion == "12":
            ejecutar_importacion_sin_limpiar(df, connection)
            
        elif opcion == "13":
            ejecutar_solo_student_outcomes(connection)
            
        elif opcion == "14":
            ejecutar_solo_datos_academicos(df, connection)
            
        elif opcion == "15":
            print("🗑️ Limpiando tabla de docentes...")
            limpiar_docentes(connection)
            
        elif opcion == "16":
            print("🗑️ Limpiando tabla de estudiantes...")
            limpiar_estudiantes(connection)
            
        elif opcion == "17":
            print("�️ Limpiando tabla de grupos...")
            limpiar_grupos(connection)
            
        elif opcion == "18":
            print("�📊 Obteniendo estadísticas de asignaturas...")
            obtener_estadisticas_asignaturas(connection)
            
        elif opcion == "19":
            print("🔍 Validando archivo para importación de asignaturas...")
            validar_asignaturas_archivo(df)
            
        elif opcion == "20":
            print("📊 Obteniendo estadísticas de docentes...")
            obtener_estadisticas_docentes(connection)
            
        elif opcion == "21":
            print("🔍 Validando archivo para importación de docentes...")
            validar_docentes_archivo(df)
            
        elif opcion == "22":
            print("📊 Obteniendo estadísticas de estudiantes...")
            obtener_estadisticas_estudiantes(connection)
            
        elif opcion == "23":
            print("🔍 Validando archivo para importación de estudiantes...")
            validar_estudiantes_archivo(df)
            
        elif opcion == "24":
            print("📊 Obteniendo estadísticas de grupos...")
            obtener_estadisticas_grupos(connection)
            
        elif opcion == "25":
            print("🔍 Validando archivo para importación de grupos...")
            validar_grupos_archivo(df)
            
        else:
            print("❌ Opción no válida. Por favor, selecciona una opción del 0 al 25.")
            return False
            
    except Exception as e:
        print(f"❌ Error al ejecutar la opción {opcion}: {str(e)}")
        return False
    
    return True


def mostrar_estadisticas(df):
    """
    Muestra estadísticas básicas de los datos cargados
    """
    print("\n" + "="*50)
    print("           ESTADÍSTICAS DE DATOS")
    print("="*50)
    
    try:
        # Estadísticas básicas
        print(f"📊 Total de registros: {df.shape[0]:,}")
        print(f"📋 Total de columnas: {df.shape[1]}")
        
        # Conteos únicos si las columnas existen
        if 'COD_ASIGNATURA' in df.columns:
            print(f"📚 Asignaturas únicas: {df['COD_ASIGNATURA'].nunique()}")
        
        if 'CEDULA_DOCENTE' in df.columns:
            print(f"👨‍🏫 Docentes únicos: {df['CEDULA_DOCENTE'].nunique()}")
        
        if 'COD_ESTUDIANTE' in df.columns:
            print(f"🎓 Estudiantes únicos: {df['COD_ESTUDIANTE'].nunique()}")
        
        if 'GRUPO' in df.columns:
            grupos_unicos = df.drop_duplicates(['COD_PERIODO', 'COD_ASIGNATURA', 'GRUPO', 'CEDULA_DOCENTE'])
            print(f"👥 Grupos únicos: {len(grupos_unicos)}")
            
        if 'COD_PERIODO' in df.columns:
            periodos = df['COD_PERIODO'].unique()
            print(f"📅 Períodos: {', '.join(map(str, sorted(periodos)))}")
            
    except Exception as e:
        print(f"❌ Error al mostrar estadísticas: {e}")
    
    print("="*50)