# Sistema de Importación ABET - Estructura Modular

## 📁 Estructura de Archivos

```
importacion/
├── main.py                      # 🚀 Archivo principal - ejecuta el programa
├── config_db.py                 # 🔌 Configuración de base de datos
├── funciones_importacion.py     # 📋 Todas las funciones de importación
├── menu.py                      # 🖥️  Sistema de menú interactivo
└── README.md                    # 📚 Esta documentación
```

## 🚀 Cómo usar

### Opción 1: Ejecutar el programa principal
```bash
cd importacion/
python main.py
```

### Opción 2: Ejecutar directamente (si tienes problemas con imports)
```bash
python -m importacion.main
```

## 📋 Descripción de Archivos

### 🚀 `main.py`
**Propósito**: Punto de entrada principal del programa
**Contenido**:
- Configuración de rutas y archivos
- Inicialización del sistema
- Manejo de errores principales
- Loop principal del programa

**Características**:
- ✅ Manejo robusto de errores
- ✅ Configuración centralizada de archivos
- ✅ Limpieza automática de recursos

### 🔌 `config_db.py`
**Propósito**: Manejo de conexiones y configuración de base de datos
**Funciones principales**:
- `crear_conexion()`: Establece conexión con PostgreSQL
- `cargar_datos_excel()`: Carga archivos Excel/CSV
- `cerrar_conexion()`: Cierra conexión de forma segura

**Ventajas**:
- ✅ Configuración centralizada
- ✅ Manejo seguro de conexiones
- ✅ Validación de archivos

### 📋 `funciones_importacion.py`
**Propósito**: Todas las funciones de importación de datos
**Funciones incluidas**:
- `asignaturas()` - Importa asignaturas únicas
- `docentes()` - Importa información de profesores
- `estudintes()` - Importa datos de estudiantes
- `grupos()` - Crea grupos de clases
- `inscripcion_grupos()` - Registra inscripciones
- `studen_outcomes()` - Importa Student Outcomes
- `criterios_so()` - Importa criterios
- `niveles_cri()` - Define niveles de evaluación
- `crit_asignatura()` - Relaciona criterios con asignaturas
- `deleteData()` - Limpia la base de datos

**Mejoras implementadas**:
- ✅ Contadores de progreso visual
- ✅ Manejo mejorado de errores
- ✅ Mensajes informativos detallados
- ✅ Validaciones robustas

### 🖥️ `menu.py`
**Propósito**: Sistema de menú interactivo y lógica de ejecución
**Funciones principales**:
- `mostrar_menu()` - Muestra opciones disponibles
- `ejecutar_opcion()` - Ejecuta la opción seleccionada
- `mostrar_estadisticas()` - Muestra información de los datos
- `ejecutar_importacion_completa()` - Proceso completo
- `ejecutar_importacion_sin_limpiar()` - Sin borrar datos
- `ejecutar_solo_student_outcomes()` - Solo criterios académicos
- `ejecutar_solo_datos_academicos()` - Solo datos básicos

**Características del menú**:
- ✅ Interface intuitiva con emojis
- ✅ Opciones individuales (1-10)
- ✅ Opciones combinadas (11-14)
- ✅ Progreso paso a paso
- ✅ Estadísticas de datos

## 🎯 Opciones del Menú

### Opciones Individuales
| Opción | Descripción | Función |
|--------|-------------|---------|
| 1 | Limpiar base de datos | `deleteData()` |
| 2 | Importar Asignaturas | `asignaturas()` |
| 3 | Importar Docentes | `docentes()` |
| 4 | Importar Estudiantes | `estudintes()` |
| 5 | Importar Grupos | `grupos()` |
| 6 | Importar Inscripciones | `inscripcion_grupos()` |
| 7 | Student Outcomes | `studen_outcomes()` |
| 8 | Criterios SO | `criterios_so()` |
| 9 | Niveles de Criterios | `niveles_cri()` |
| 10 | Criterios-Asignaturas | `crit_asignatura()` |

### Opciones Combinadas
| Opción | Descripción | Pasos Incluidos |
|--------|-------------|-----------------|
| 11 | Importación COMPLETA | 1→10 (Con limpieza) |
| 12 | Importación SIN LIMPIAR | 2→10 (Sin limpieza) |
| 13 | Solo Student Outcomes | 7→10 |
| 14 | Solo Datos Académicos | 2→6 |

## ⚙️ Configuración

### Cambiar archivo de datos
Edita `main.py` y modifica la variable `ARCHIVO_EXCEL`:

```python
# Archivo actual
ARCHIVO_EXCEL = '../data_elec/listado_gra_emp_materias_Sep2023.xlsx'

# Otras opciones disponibles
# ARCHIVO_EXCEL = '../data_elec/listado_estudiantes_materias.xlsx'
# ARCHIVO_EXCEL = '../listado_estudiantes_materias.csv'
# ARCHIVO_EXCEL = '../Listado_graduados_correos.csv'
# ARCHIVO_EXCEL = '../Listado_empresas_correos.csv'
```

### Cambiar configuración de base de datos
Edita `config_db.py` y modifica el diccionario `DB_CONFIG`:

```python
DB_CONFIG = {
    "user": "tu_usuario",
    "password": "tu_contraseña",
    "host": "127.0.0.1",
    "port": "5432",
    "database": "tu_base_de_datos"
}
```

## ✨ Ventajas de la Nueva Estructura

### 🔧 **Mantenibilidad**
- Código organizado por responsabilidades
- Fácil localizar y modificar funciones
- Separación clara de configuración y lógica

### 🚀 **Facilidad de uso**
- Un solo comando para ejecutar: `python main.py`
- No más comentar/descomentar código
- Menú intuitivo con opciones claras

### 🛡️ **Robustez**
- Manejo centralizado de errores
- Validaciones mejoradas
- Limpieza automática de recursos

### 📊 **Monitoreo**
- Contadores de progreso visuales
- Estadísticas de datos al inicio
- Mensajes informativos detallados

### 🔄 **Flexibilidad**
- Múltiples opciones de importación
- Fácil cambio de archivos fuente
- Configuración centralizada

## 🚨 Requisitos

- Python 3.6+
- pandas
- psycopg2
- PostgreSQL corriendo
- Base de datos `ups_abet_elec` creada
- Módulo `data_elec.data_elec` disponible

## 🆘 Solución de Problemas

### Error de importación de módulos
```bash
# Si tienes problemas con imports, ejecuta desde el directorio padre:
cd /Users/pablo/Documents/dev/UPS/ICC/ABET/back/01_ABET_DB/
python -m importacion.main
```

### Error de conexión a base de datos
- Verifica que PostgreSQL esté corriendo
- Confirma credenciales en `config_db.py`
- Asegúrate de que la base de datos existe

### Error al cargar archivo Excel
- Verifica que el archivo existe en la ruta especificada
- Confirma que el archivo no esté abierto en Excel
- Revisa los permisos de lectura del archivo

## 📞 Uso Típico

1. **Primera vez (importación completa)**:
   - Ejecutar `python main.py`
   - Seleccionar opción `11` (Importación COMPLETA)

2. **Actualizar solo datos académicos**:
   - Seleccionar opción `14` (Solo Datos Académicos)

3. **Actualizar solo Student Outcomes**:
   - Seleccionar opción `13` (Solo Student Outcomes)

4. **Importación específica**:
   - Usar opciones individuales `1-10` según necesidad