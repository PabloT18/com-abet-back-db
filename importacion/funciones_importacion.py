"""
Funciones de importación de datos para el sistema ABET
"""
import psycopg2
import sys
import os

# Agregar el directorio padre al path para importar data_elec
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import data_elec.data_elec as dataSO




def inscripcion_grupos(datos, connection):
    """
    Registra las inscripciones de estudiantes en grupos específicos
    """
    print(f"📝 Procesando {datos.shape[0]} inscripciones...")

    sql = """INSERT INTO inscripciones_grupo
                 (ins_habilitado, ins_periodo, ins_matricula_num, est_codigo, grp_id)
	            VALUES (%s, %s, %s, %s, %s)"""

    sqlgrupos = "SELECT * FROM grupos"
    sqlAsig = "SELECT * FROM asignaturas"
    sqlDoce = "SELECT * FROM docentes"

    try:
        conn = connection
        cur = conn.cursor()

        # Cargar datos de referencia
        cur.execute(sqlgrupos)
        grupos = cur.fetchall()
        cur.execute(sqlAsig)
        asignaturas = cur.fetchall()
        cur.execute(sqlDoce)
        docentes = cur.fetchall()

        contador = 0
        for index, row in datos.iterrows():
            contador += 1
            habilitado = True
            periodo = row['COD_PERIODO']
            matriculaNum = row['NUMERO_MATRICULA']
            codigoEstudiante = row['COD_ESTUDIANTE']
            grupoId = 0

            # Buscar ID de asignatura
            asiId = 0
            for rowA in asignaturas:
                if rowA[2] == row['COD_ASIGNATURA']:
                    asiId = rowA[0]
                    break

            # Buscar grupo correspondiente
            for rowB in grupos:
                validacionGrupoName = rowB[1] == row['GRUPO']
                validacioncodigoAsi = rowB[3] == asiId

                if validacionGrupoName & validacioncodigoAsi:
                    for rowD in docentes:
                        cedulaFromDaos = str(row['CEDULA_DOCENTE'])
                        if len(cedulaFromDaos) == 9:
                            cedulaFromDaos = '0' + cedulaFromDaos

                        validacionDoce = rowD[1] == cedulaFromDaos
                        validacionGRUDoc = rowB[4] == rowD[0]

                        if validacionDoce & validacionGRUDoc:
                            grupoId = rowB[0]
                            break

            cur.execute(sql, (habilitado, periodo, matriculaNum, codigoEstudiante, grupoId))
            conn.commit()
            
            if contador % 100 == 0:
                print(f"   Procesadas: {contador}/{datos.shape[0]}")

        cur.close()
        print(f"✅ {contador} inscripciones procesadas exitosamente")
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error en inscripciones: {error}")


def studen_outcomes(connection):
    """
    Importa los Student Outcomes desde el módulo dataSO
    """
    print("🎯 Importando Student Outcomes...")

    sql = """INSERT INTO student_outcomes
                 (sto_codigo, sto_descripcion, sto_descripcion_en)
                 VALUES (%s,%s,%s)"""

    try:
        conn = connection
        cur = conn.cursor()
        contador = 0
        
        for so in dataSO.soData:
            contador += 1
            cod = so['cod']
            des = so['des']
            desEn = so['des-en']

            cur.execute(sql, (cod, des, desEn))
            conn.commit()

        cur.close()
        print(f"✅ {contador} Student Outcomes importados exitosamente")
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error en Student Outcomes: {error}")


def criterios_so(connection):
    """
    Importa los criterios asociados a cada Student Outcome
    """
    print("📋 Importando Criterios SO...")

    sql = """INSERT INTO criterios_so
                 (cri_descripcion,sto_id)
                 VALUES (%s,%s)"""

    try:
        conn = connection
        cur = conn.cursor()
        contador = 0
        
        for cri in dataSO.criteriosData:
            contador += 1
            des = cri['des']
            codFK = cri['so_id']

            cur.execute(sql, (des, codFK))
            conn.commit()

        cur.close()
        print(f"✅ {contador} Criterios SO importados exitosamente")
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error en Criterios SO: {error}")


def niveles_cri(connection):
    """
    Define niveles de evaluación para cada criterio
    """
    print("📊 Importando Niveles de Criterios...")

    sql = """INSERT INTO niveles_cri
                 (nvl_descripcion, nvl_tipo, cri_id)
                 VALUES (%s,%s,%s)"""

    try:
        conn = connection
        cur = conn.cursor()
        indexNvl = 0
        indexCri = 1
        contador = 0
        nivelesTipos = ["Inicial", "En Desarrollo", "Ideal", "Avanzado"]
        
        for nivel in dataSO.nivelesCri:
            contador += 1
            des = nivel['desNivel']
            tipo = nivelesTipos[indexNvl]
            criterio = indexCri

            cur.execute(sql, (des, tipo, criterio))
            conn.commit()
            
            indexNvl += 1
            if indexNvl == 4:
                indexNvl = 0
                indexCri += 1

        cur.close()
        print(f"✅ {contador} Niveles de Criterios importados exitosamente")
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error en Niveles de Criterios: {error}")


def crit_asignatura(connection):
    """
    Establece relaciones entre criterios y asignaturas
    """
    print("🔗 Importando Criterios-Asignaturas...")

    sql = """INSERT INTO criterios_asignaturas
                 (asi_codigo,cri_id)
                 VALUES (%s,%s)"""

    try:
        conn = connection
        cur = conn.cursor()
        contador = 0

        ## Usar criteriosAsignaturas65 como está configurado actualmente
        ## para otras carreras, cambiar a criteriosAsignaturasEMPRESAS o otros de dataSO
        for cra in dataSO.criteriosAsignaturas65:
            contador += 1
            asi_id = cra['asi_id']
            cri_id = cra['cri_id']

            cur.execute(sql, (asi_id, cri_id))
            conn.commit()

        cur.close()
        print(f"✅ {contador} Criterios-Asignaturas importados exitosamente")
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error en Criterios-Asignaturas: {error}")


def deleteData(connection):
    """
    Limpia completamente todas las tablas de la base de datos
    """
    print("🗑️  Iniciando limpieza de la base de datos...")

    tablas_queries = [
        ('rubrica_so', 'DELETE FROM public.rubrica_so;'),
        ('inscripciones_grupo', 'DELETE FROM public.inscripciones_grupo;'),
        ('grupos', 'DELETE FROM public.grupos;'),
        ('criterios_asignaturas', 'DELETE FROM public.criterios_asignaturas;'),
        ('niveles_cri', 'DELETE FROM public.niveles_cri;'),
        ('criterios_so', 'DELETE FROM public.criterios_so;'),
        ('student_outcomes', 'DELETE FROM public.student_outcomes;'),
        ('asignaturas', 'DELETE FROM public.asignaturas;'),
        ('docentes', 'DELETE FROM public.docentes;'),
        ('estudiantes', 'DELETE FROM public.estudiantes;')
    ]

    try:
        conn = connection
        cur = conn.cursor()

        for tabla, query in tablas_queries:
            print(f"   🧹 Limpiando tabla: {tabla}")
            cur.execute(query)

        conn.commit()
        cur.close()
        print("✅ Base de datos limpiada exitosamente")
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"❌ Error al limpiar la base de datos: {error}")