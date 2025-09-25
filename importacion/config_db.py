"""
Configuración de conexión a la base de datos PostgreSQL
"""
import psycopg2
import pandas as pd

# Configuración de la base de datos
DB_CONFIG = {
    "user": "pablodb",
    "password": "1809",
    "host": "127.0.0.1",
    "port": "5432",
    "database": "ups_abet"
}

def crear_conexion():
    """
    Crea y retorna una conexión a la base de datos PostgreSQL
    """
    try:
        connection = psycopg2.connect(**DB_CONFIG)
        print("🔌 Conexión a la base de datos establecida exitosamente")
        return connection
    except Exception as e:
        print(f"❌ Error al conectar con la base de datos: {e}")
        return None

def cargar_datos_excel(archivo_path):
    """
    Carga datos desde un archivo Excel y retorna un DataFrame
    """
    try:
        df = pd.read_excel(archivo_path)
        print(f"📊 Datos cargados: {df.shape[0]} filas, {df.shape[1]} columnas")
        return df
    except Exception as e:
        print(f"❌ Error al cargar el archivo Excel: {e}")
        return None

def cerrar_conexion(connection):
    """
    Cierra la conexión a la base de datos de forma segura
    """
    if connection:
        connection.close()
        print("🔐 Conexión cerrada exitosamente")