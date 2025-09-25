#!/usr/bin/env python3
"""
Script principal para la importación de datos ABET
Autor: Sistema ABET
Fecha: Septiembre 2025
"""

import sys
import os

# Obtener el directorio donde está este script
script_dir = os.path.dirname(os.path.abspath(__file__))

# Agregar el directorio del script al path para las importaciones
sys.path.insert(0, script_dir)

# Cambiar al directorio del script para las rutas relativas
os.chdir(script_dir)

# Agregar el directorio actual al path
# sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from config_db import crear_conexion, cargar_datos_excel, cerrar_conexion
from menu import mostrar_menu, ejecutar_opcion, mostrar_estadisticas


# Configuración de archivos
# ARCHIVO_EXCEL = '../data_elec/listado_gra_emp_materias_Sep2023.xlsx'
# 
# Configuración de archivos
ARCHIVO_EXCEL = '../listado_estudiantes_materias_65.xlsx'




def main():
    """
    Función principal del programa
    """
    print("🚀 Iniciando sistema de importación ABET...")
    print("="*60)
    
    # Crear conexión a la base de datos
    connection = crear_conexion()
    if not connection:
        print("❌ No se pudo establecer conexión con la base de datos")
        return
    
    # Verificar la validez de la conexión consultando la tabla asignaturas
    print("🔍 Verificando conexión a la base de datos...")
    try:
        cur = connection.cursor()
        
        # Verificar cuántos registros hay en asignaturas
        cur.execute("SELECT COUNT(*) FROM asignaturas")
        total_asignaturas = cur.fetchone()[0]
        print(f"✅ Conexión válida - Total asignaturas en BD: {total_asignaturas}")
        
        
        # Verificar otras tablas importantes
        print("\n📊 Estado general de la base de datos:")
        tablas_verificar = ['docentes', 'estudiantes', 'grupos']
        for tabla in tablas_verificar:
            try:
                cur.execute(f"SELECT COUNT(*) FROM {tabla}")
                count = cur.fetchone()[0]
                print(f"   📋 {tabla}: {count} registros")
            except Exception as e:
                print(f"   ❌ {tabla}: Error - {e}")
        
        cur.close()
        
    except Exception as e:
        print(f"❌ Error verificando la conexión: {e}")
        cerrar_conexion(connection)
        return
    
    # Cargar datos desde Excel
    print(f"📂 Cargando datos desde: {ARCHIVO_EXCEL}")
    print(f"📂 Ruta absoluta: {os.path.abspath(ARCHIVO_EXCEL)}")
    
    # Verificar si el archivo existe
    if not os.path.exists(ARCHIVO_EXCEL):
        print(f"❌ El archivo no existe: {os.path.abspath(ARCHIVO_EXCEL)}")
        print("\n📋 Buscando archivos Excel disponibles...")
        
        # Buscar en el directorio padre
        parent_dir = os.path.dirname(script_dir)
        print(f"📁 Revisando directorio padre: {parent_dir}")
        
        for item in os.listdir(parent_dir):
            if item.endswith(('.xlsx', '.xls', '.csv')):
                print(f"   📄 {item}")
        
        # Buscar en data_elec si existe
        data_elec_dir = os.path.join(parent_dir, 'data_elec')
        if os.path.exists(data_elec_dir):
            print(f"📁 Revisando data_elec: {data_elec_dir}")
            for item in os.listdir(data_elec_dir):
                if item.endswith(('.xlsx', '.xls', '.csv')):
                    print(f"   📄 data_elec/{item}")
        
        cerrar_conexion(connection)
        return
    df = cargar_datos_excel(ARCHIVO_EXCEL)
    if df is None:
        print("❌ No se pudieron cargar los datos del archivo")
        cerrar_conexion(connection)
        return
    
    # Mostrar estadísticas de los datos
    mostrar_estadisticas(df)
    
    # Loop principal del menú
    try:
        while True:
            mostrar_menu()
            opcion = input("👉 Selecciona una opción (0-25): ").strip()
            
            if opcion == "0":
                print("👋 ¡Hasta luego! Cerrando sistema...")
                break
            
            # Ejecutar la opción seleccionada
            ejecutar_opcion(opcion, df, connection)
            
            if opcion != "0":
                input("\n⏸️  Presiona ENTER para continuar...")
                
    except KeyboardInterrupt:
        print("\n\n⚠️  Programa interrumpido por el usuario")
    except Exception as e:
        print(f"\n❌ Error inesperado: {e}")
    finally:
        # Cerrar conexión de forma segura
        cerrar_conexion(connection)
        print("🔚 Programa finalizado")


if __name__ == "__main__":
    main()