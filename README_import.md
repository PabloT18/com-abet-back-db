# Documentación del Script de Importación - import.py

## Descripción General

El archivo `import.py` es un script de Python diseñado para importar y procesar datos desde archivos Excel hacia una base de datos PostgreSQL llamada `ups_abet_elec`. Este script maneja la inserción de datos académicos incluyendo asignaturas, docentes, estudiantes, grupos y sus respectivas inscripciones.

## Dependencias y Librerías

```python
import sqlalchemy as sa
import pandas as pd
import psycopg2
import data_elec.data_elec as dataSO
```

- **sqlalchemy**: ORM para manejo de bases de datos (aunque no se usa activamente en el código)
- **pandas**: Para manipulación y análisis de datos desde archivos Excel/CSV
- **psycopg2**: Adaptador de PostgreSQL para Python
- **data_elec.data_elec**: Módulo personalizado que contiene datos de Student Outcomes y criterios

## Configuración de Conexión a Base de Datos

```python
connection = psycopg2.connect(
    user="pablodb",
    password="1809", 
    host="127.0.0.1",
    port="5432",
    database="ups_abet_elec"
)
```

### Parámetros de Conexión:
- **Usuario**: `pablodb`
- **Contraseña**: `1809`
- **Host**: `127.0.0.1` (localhost)
- **Puerto**: `5432` (puerto estándar de PostgreSQL)
- **Base de datos**: `ups_abet_elec`

## Carga de Datos desde Archivo

```python
df = pd.read_excel('data_elec/listado_gra_emp_materias_Sep2023.xlsx')
```

El script carga datos desde un archivo Excel que contiene información de estudiantes graduados, empleados y materias. Hay otras opciones comentadas para diferentes tipos de archivos.

## Funciones de Importación

### 1. `asignaturas(datos, connection)`

**Propósito**: Importa las asignaturas únicas desde el DataFrame a la tabla `asignaturas`.

**Funcionamiento**:
- Elimina duplicados basándose en `COD_ASIGNATURA`
- Puede limpiar la tabla existente (código comentado)
- Inserta cada asignatura con su código, descripción (español e inglés) y nivel

**Campos insertados**:
- `asi_codigo`: Código de la asignatura
- `asi_descripcion`: Descripción en español
- `asi_descripcion_en`: Descripción en inglés (mismo valor que español)
- `asi_nivel`: Nivel académico

**Manejo de errores**: Captura excepciones de PostgreSQL y las imprime.

### 2. `docentes(datos, connection)`

**Propósito**: Importa información de docentes únicos a la tabla `docentes`.

**Funcionamiento**:
- Elimina duplicados basándose en `CEDULA_DOCENTE`
- Normaliza cédulas agregando '0' al inicio si tienen 9 dígitos
- Inserta información de cada docente

**Campos insertados**:
- `doc_cedula`: Cédula del docente (normalizada)
- `doc_nombre`: Nombre completo
- `doc_correo`: Correo electrónico
- `doc_user_type`: Tipo de usuario (siempre 'U')

### 3. `estudintes(datos, connection)`

**Propósito**: Importa información de estudiantes únicos a la tabla `estudiantes`.

**Funcionamiento**:
- Elimina duplicados basándose en `COD_ESTUDIANTE`
- Normaliza cédulas (agrega '0' si tienen 9 dígitos)
- Usa `ON CONFLICT DO NOTHING` para evitar duplicados en la base de datos

**Campos insertados**:
- `est_codigo`: Código del estudiante
- `est_cedula`: Cédula (normalizada)
- `est_nombre`: Nombre completo
- `est_correo`: Correo electrónico
- `est_genero`: Género del estudiante

### 4. `grupos(datos, connection)`

**Propósito**: Crea grupos de clases basados en período, asignatura, grupo y docente.

**Funcionamiento**:
- Elimina duplicados basándose en múltiples campos
- Recupera información de docentes y asignaturas existentes
- Establece relaciones mediante IDs foráneas

**Proceso de inserción**:
1. Obtiene todos los docentes y asignaturas de la base de datos
2. Para cada grupo único, busca el ID del docente y asignatura correspondientes
3. Inserta el grupo con las referencias correctas

**Campos insertados**:
- `grp_nombre`: Nombre del grupo
- `grp_periodo`: Período académico
- `grp_habilitado`: Estado (siempre True)
- `grp_asi_id`: ID de la asignatura (FK)
- `grp_doc_id`: ID del docente (FK)

### 5. `inscripcion_grupos(datos, connection)`

**Propósito**: Registra las inscripciones de estudiantes en grupos específicos.

**Funcionamiento**:
- Para cada fila de datos, encuentra el grupo correspondiente
- Realiza validaciones complejas para asegurar la correcta asociación
- Establece la relación estudiante-grupo

**Proceso de validación**:
1. Busca la asignatura por código
2. Busca el grupo que coincida en nombre y asignatura
3. Valida que el docente del grupo coincida con el de los datos
4. Inserta la inscripción con todas las validaciones pasadas

**Campos insertados**:
- `ins_habilitado`: Estado (siempre True)
- `ins_periodo`: Período académico
- `ins_matricula_num`: Número de matrícula
- `est_codigo`: Código del estudiante
- `grp_id`: ID del grupo (FK)

## Funciones de Datos Académicos (Student Outcomes)

### 6. `studen_outcomes(connection)`

**Propósito**: Importa los Student Outcomes desde el módulo `dataSO`.

**Funcionamiento**:
- Itera sobre `dataSO.soData`
- Inserta cada Student Outcome con descripción en español e inglés

### 7. `criterios_so(connection)`

**Propósito**: Importa los criterios asociados a cada Student Outcome.

**Funcionamiento**:
- Itera sobre `dataSO.criteriosData`
- Establece relación con Student Outcomes mediante FK

### 8. `niveles_cri(connection)`

**Propósito**: Define niveles de evaluación para cada criterio.

**Funcionamiento**:
- Crea 4 niveles por criterio: "Inicial", "En Desarrollo", "Ideal", "Avanzado"
- Asigna cada nivel a su criterio correspondiente

### 9. `crit_asignatura(connection)`

**Propósito**: Establece relaciones entre criterios y asignaturas.

**Funcionamiento**:
- Usa diferentes datasets según el contexto (asignaturas, graduados, empresas)
- Actualmente configurado para `criteriosAsignaturasEMPRESAS`

## Función de Limpieza

### 10. `deleteData(connection)`

**Propósito**: Limpia completamente todas las tablas de la base de datos.

**Funcionamiento**:
- Elimina datos en orden correcto respetando las foreign keys
- Orden de eliminación:
  1. rubrica_so
  2. inscripciones_grupo
  3. grupos
  4. criterios_asignaturas
  5. niveles_cri
  6. criterios_so
  7. student_outcomes
  8. asignaturas
  9. docentes
  10. estudiantes

## Ejecución del Script

En la parte final del script, solo se ejecuta:

```python
crit_asignatura(connection=connection)
connection.close()
```

Las demás funciones están comentadas, indicando que el script está configurado para ejecutar solo la importación de criterios-asignaturas.

## Características Importantes

### Manejo de Errores
- Todas las funciones incluyen manejo de excepciones con `try-catch`
- Se imprimen los errores de PostgreSQL para debugging

### Normalización de Datos
- Las cédulas de 9 dígitos se normalizan agregando '0' al inicio
- Se eliminan duplicados antes de insertar

### Integridad Referencial
- Las funciones respetan las foreign keys
- Se buscan IDs existentes antes de crear relaciones

### Control de Duplicados
- Uso de `ON CONFLICT DO NOTHING` en estudiantes
- Eliminación de duplicados en DataFrames antes de inserción

## Uso Recomendado

1. **Configurar la conexión** con los parámetros correctos
2. **Verificar que el archivo Excel existe** en la ruta especificada
3. **Ejecutar las funciones en orden** si se hace importación completa:
   - `deleteData()` (si se quiere limpiar)
   - `asignaturas()`
   - `docentes()`
   - `estudintes()`
   - `grupos()`
   - `inscripcion_grupos()`
   - Student Outcomes y criterios según necesidad
4. **Cerrar la conexión** al finalizar

## Consideraciones de Seguridad

⚠️ **Advertencias**:
- Las credenciales están hardcodeadas en el código
- No hay validación de entrada de datos
- Las consultas SQL podrían ser vulnerables si se modifican para aceptar entrada del usuario
- Se recomienda usar variables de entorno para credenciales

## Dependencias del Sistema

- PostgreSQL instalado y ejecutándose
- Base de datos `ups_abet_elec` creada
- Tablas correspondientes creadas con el esquema correcto
- Archivo Excel en la ruta especificada
- Módulo `data_elec.data_elec` disponible