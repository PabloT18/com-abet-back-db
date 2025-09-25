# Módulo de Importación de Asignaturas

## 📚 Descripción

El módulo `imp_asignaturas.py` es un módulo especializado para manejar todas las operaciones relacionadas con la importación y gestión de asignaturas en el sistema ABET.

## 🎯 Características Principales

### ✨ **Análisis Previo con Confirmación**
- 🔍 **Análisis detallado** antes de cualquier operación
- 📊 **Vista previa** de qué se insertará, actualizará o ignorará
- ✅ **Confirmación del usuario** antes de proceder
- 🛡️ **Transacciones seguras** con rollback automático en caso de error

### 🔧 **Tres Modos de Operación**

#### 1. **Modo 'agregar' (Recomendado)**
- ✅ Solo agrega asignaturas nuevas
- 🚫 Ignora las que ya existen (sin errores)
- 🎯 Perfecto para importaciones incrementales

#### 2. **Modo 'actualizar'**
- ✅ Agrega nuevas asignaturas
- 🔄 Actualiza las existentes si hay cambios
- 📝 Muestra exactamente qué cambios se harán

#### 3. **Modo 'reemplazar'**
- 🗑️ Limpia toda la tabla primero
- ➕ Inserta todas las asignaturas del archivo
- ⚠️ **Cuidado**: Puede afectar relaciones existentes

## 📋 Funciones Disponibles

### 🚀 **Función Principal**
```python
asignaturas(datos, connection, modo='agregar')
```

**Ejemplo de uso:**
```python
from imp_asignaturas import asignaturas
import pandas as pd

# Cargar datos
df = pd.read_excel('mi_archivo.xlsx')

# Importar solo nuevas asignaturas (recomendado)
asignaturas(df, connection, modo='agregar')

# Importar y actualizar existentes
asignaturas(df, connection, modo='actualizar')

# Reemplazar todas (cuidado!)
asignaturas(df, connection, modo='reemplazar')
```

### 📊 **Funciones de Análisis**

#### `validar_asignaturas_archivo(datos)`
Valida que el archivo tenga las columnas necesarias:
- ✅ `COD_ASIGNATURA`
- ✅ `ASIGNATURA` 
- ✅ `NIVEL`

#### `obtener_estadisticas_asignaturas(connection)`
Muestra estadísticas completas:
- 📈 Total de asignaturas
- 📊 Distribución por niveles
- 🕒 Últimas asignaturas agregadas

#### `limpiar_asignaturas(connection)`
Limpia la tabla completa con confirmación

## 🎮 **Flujo de Trabajo Típico**

### **1. Análisis Previo Automático**
```
🔍 ANÁLISIS PREVIO:
============================================================
📈 ASIGNATURAS QUE SE INSERTARÁN (2):
   1. [MAT101] Matemáticas I (Nivel: 1) - SE INSERTARÁ (nueva)
   2. [FIS201] Física II (Nivel: 2) - SE INSERTARÁ (nueva)

✓ ASIGNATURAS QUE YA EXISTEN (1):
   1. [MAT100] Matemáticas Básica - YA EXISTE - Se ignora

============================================================
📊 RESUMEN:
   Total a procesar: 3
   🆕 Nuevas: 2
   🔄 Actualizaciones: 0
   ✓ Ya existen: 1
============================================================
```

### **2. Confirmación del Usuario**
```
¿Es correcto? ¿Proceder con la operación? (s/n): s
```

### **3. Ejecución Controlada**
```
🚀 EJECUTANDO OPERACIONES...
   📝 Insertadas: 2/2

🎉 OPERACIÓN COMPLETADA EXITOSAMENTE:
   📈 Asignaturas insertadas: 2
   🔄 Asignaturas actualizadas: 0
   ✓ Total procesado: 2
```

## 🔄 **Ejemplo Comparativo de Modos**

### **Escenario**: Archivo con 3 asignaturas
- `MAT101` - Nueva
- `MAT100` - Ya existe (sin cambios)
- `FIS200` - Ya existe (con cambios en descripción)

#### **Modo 'agregar':**
```
📈 SE INSERTARÁ (1): MAT101
✓ YA EXISTE (2): MAT100, FIS200 - Se ignoran
```

#### **Modo 'actualizar':**
```
📈 SE INSERTARÁ (1): MAT101
🔄 SE ACTUALIZA (1): FIS200
✓ YA EXISTE (1): MAT100 - Sin cambios
```

#### **Modo 'reemplazar':**
```
⚠️ SE ELIMINA TODO PRIMERO
📈 SE INSERTARÁN (3): MAT101, MAT100, FIS200
```

## 🛡️ **Seguridad y Validaciones**

### **Validaciones de Entrada**
- ✅ Verifica columnas requeridas
- ✅ Detecta valores nulos
- ✅ Elimina duplicados automáticamente

### **Seguridad de Transacciones**
- 🔒 Todas las operaciones en una transacción
- 🔄 Rollback automático en caso de error
- ✅ Commit solo tras confirmación del usuario

### **Protección de Datos**
- 🛡️ Confirmación obligatoria para operaciones destructivas
- 📊 Vista previa completa antes de proceder
- ⚠️ Advertencias claras sobre impactos

## 📞 **Casos de Uso Recomendados**

### **🔄 Importación Regular (Incremental)**
```python
# Perfecto para agregar nuevas asignaturas sin afectar existentes
asignaturas(df, connection, modo='agregar')
```

### **📝 Sincronización de Datos**
```python
# Para mantener sincronizada la información de asignaturas
asignaturas(df, connection, modo='actualizar')
```

### **🆕 Carga Inicial Completa**
```python
# Solo para la primera vez o restauración completa
asignaturas(df, connection, modo='reemplazar')
```

## 🚨 **Consideraciones Importantes**

### **⚠️ Modo 'reemplazar'**
- Solo usar en carga inicial o restauración
- Puede afectar tablas relacionadas (grupos, inscripciones)
- Siempre hacer backup antes de usar

### **✅ Modo 'agregar' (Recomendado)**
- Seguro para uso diario
- No afecta datos existentes
- Perfecto para importaciones incrementales

### **🔄 Modo 'actualizar'**
- Útil para sincronización
- Muestra cambios específicos
- Mantiene integridad referencial

## 🎯 **Ventajas del Módulo Separado**

- 🧩 **Modularidad**: Código organizado y mantenible
- 🔧 **Especialización**: Funciones específicas para asignaturas
- 📊 **Análisis**: Herramientas especializadas de validación
- 🛡️ **Seguridad**: Controles específicos para esta entidad
- 🚀 **Extensibilidad**: Fácil agregar nuevas funciones