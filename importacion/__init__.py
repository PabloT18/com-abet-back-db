"""
Paquete de importación de datos ABET
Sistema modular para importar datos académicos a PostgreSQL
"""

__version__ = "1.0.0"
__author__ = "Sistema ABET"
__description__ = "Sistema modular de importación de datos ABET"

# Importaciones principales
from .config_db import crear_conexion, cargar_datos_excel, cerrar_conexion
from .funciones_importacion import (
    inscripcion_grupos,
    studen_outcomes, criterios_so, niveles_cri, crit_asignatura, deleteData
)
from .imports_funs.imp_asignaturas import (
    asignaturas, obtener_estadisticas_asignaturas, validar_asignaturas_archivo, 
    limpiar_asignaturas
)
from .imports_funs.imp_docentes import (
    docentes, obtener_estadisticas_docentes, validar_docentes_archivo, limpiar_docentes
)
from .imports_funs.imp_estudiantes import (
    estudintes, obtener_estadisticas_estudiantes, validar_estudiantes_archivo, limpiar_estudiantes
)
from .imports_funs.imp_grupos import (
    grupos, obtener_estadisticas_grupos, validar_grupos_archivo, limpiar_grupos
)
from .menu import mostrar_menu, ejecutar_opcion, mostrar_estadisticas

__all__ = [
    'crear_conexion', 'cargar_datos_excel', 'cerrar_conexion',
    'asignaturas', 'obtener_estadisticas_asignaturas', 'validar_asignaturas_archivo', 'limpiar_asignaturas',
    'docentes', 'obtener_estadisticas_docentes', 'validar_docentes_archivo', 'limpiar_docentes',
    'estudintes', 'obtener_estadisticas_estudiantes', 'validar_estudiantes_archivo', 'limpiar_estudiantes',
    'grupos', 'obtener_estadisticas_grupos', 'validar_grupos_archivo', 'limpiar_grupos',
    'inscripcion_grupos',
    'studen_outcomes', 'criterios_so', 'niveles_cri', 'crit_asignatura', 'deleteData',
    'mostrar_menu', 'ejecutar_opcion', 'mostrar_estadisticas'
]