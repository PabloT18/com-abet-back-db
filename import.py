import sqlalchemy as sa

import pandas as pd
import psycopg2
# from config import config
import data as dataSO

# engine = sa.create_engine('postgresql://pablodb:1809@localhost:5432/ups_abet')
connection = psycopg2.connect(user="pablodb",
                              password="1809",
                              host="127.0.0.1",
                              port="5432",
                              database="ups_abet")


# df = pd.read_excel('listado_estudiantes_materias.xlsx')
df = pd.read_csv('listado_estudiantes_materias.csv', delimiter=';', dtype=str)


print(df.shape)
# print(df.head(2))


def asignaturas(datos, connection):

    asignaturas = datos.drop_duplicates(['COD_ASIGNATURA'], keep='first')

    sqldelete = 'DELETE FROM public.asignaturas;'
    sqlAlterSeqnce = 'ALTER SEQUENCE asignaturas_asi_id_seq RESTART WITH 1;'
    sql = """INSERT INTO asignaturas
                 (asi_codigo, asi_descripcion, asi_nivel)
                 VALUES
                 (%s,%s,%s)"""
    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)
        for index, row in asignaturas.iterrows():
            cod = row['COD_ASIGNATURA']
            des = row['ASIGNATURA']
            nivel = row['NIVEL']

            cur.execute(
                sql, (cod, des, nivel))

            conn.commit()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    # finally:
    #     if conn is not None:
    #         conn.close()


def docentes(datos, connection):

    docentesDF = datos.drop_duplicates(['CEDULA_DOCENTE'], keep='first')

    sqldelete = 'DELETE FROM public.docentes;'
    sqlAlterSeqnce = 'ALTER SEQUENCE docentes_doc_id_seq RESTART WITH 1;'
    sql = """INSERT INTO docentes
                 ( doc_cedula, doc_nombre, doc_correo, doc_user_type)
	            VALUES ( %s, %s, %s, %s )"""
    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)
        for index, row in docentesDF.iterrows():
            ced = str(row['CEDULA_DOCENTE'])
            name = row['DOCENTE']
            mail = row['CORREO_DOCENTE']

            if(len(ced) == 9):
                ced = '0'+ced

            cur.execute(
                sql, (ced, name, mail, 'U'))

            conn.commit()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)


def estudintes(datos, connection):

    estudaintesDF = datos.drop_duplicates(['CODIGO_ESTUDIANTE'], keep='first')

    sqldelete = 'DELETE FROM public.estudiantes;'
    sqlAlterSeqnce = 'ALTER SEQUENCE estudiantes_est_id_seq RESTART WITH 1;'
    sql = """INSERT INTO estudiantes
                 ( est_codigo, est_cedula, est_nombre, est_correo, est_genero)
	            VALUES ( %s, %s, %s, %s, %s )"""
    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)
        for index, row in estudaintesDF.iterrows():
            cod = row['CODIGO_ESTUDIANTE']

            ced = row['CEDULA_ESTUDIANTE']
            name = row['ESTUDIANTE']
            mail = row['CORREO_ESTUDIANTE']
            genero = row['GENERO_ESTUDIANTE']

            cur.execute(
                sql, (cod, ced, name, mail, genero))

            conn.commit()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    # finally:
    #     if conn is not None:
    #         conn.close()


def grupos(datos, connection):

    grupodf = datos.drop_duplicates(
        ['COD_ASIGNATURA', 'GRUPO', 'CORREO_DOCENTE'], keep='first')
    print(grupodf.shape)

    sqldelete = 'DELETE FROM public.grupos;'
    sqlAlterSeqnce = 'ALTER SEQUENCE grupos_grp_id_seq RESTART WITH 1;'
    sql = """INSERT INTO grupos
                 ( grp_nombre, grp_habilitado, grp_asi_id, grp_doc_id)
                VALUES ( %s, %s, %s, %s )"""

    sqlDoce = "SELECT * FROM docentes "
    sqlAsig = "SELECT * FROM asignaturas "

    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)

        # docente = cur.execute(sqlDoc, ('0103771648'))
        cur.execute(sqlDoce)
        docentes = cur.fetchall()

        cur.execute(sqlAsig)
        asignaturas = cur.fetchall()
        docId = 0

        # print(docente)
        for index, row in grupodf.iterrows():

            name = row['GRUPO']
            habilitado = True
            docId = 0
            asiId = 0

            for rowD in docentes:
                cedulaQuery = rowD[1]
                grupoDAto = str(row['CEDULA_DOCENTE'])
                if(cedulaQuery == grupoDAto):
                    docId = rowD[0]
                    break

            for rowA in asignaturas:
                if(rowA[2] == row['COD_ASIGNATURA']):
                    asiId = rowA[0]
                    break
            cur.execute(
                sql, (name, habilitado,  asiId, docId))

            conn.commit()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    # finally:
    # if conn is not None:
    #     conn.close()


def inscripcion_grupos(datos, connection):

    # grupodf = datos.drop_duplicates(['COD_ASIGNATURA', 'GRUPO'], keep='first')
    # print(grupos.shape)

    sqldelete = 'DELETE FROM public.inscripciones_grupo;'
    sqlAlterSeqnce = 'ALTER SEQUENCE inscripciones_grupo_ins_id_seq RESTART WITH 1;'
    sql = """INSERT INTO inscripciones_grupo
                 ( ins_habilitado, ins_periodo,
                  ins_matricula_num, est_codigo, grp_id)
	            VALUES ( %s, %s, %s, %s,  %s )"""

    sqlgrupos = "SELECT * FROM grupos "
    sqlAsig = "SELECT * FROM asignaturas "
    sqlDoce = "SELECT * FROM docentes "

    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)

        # docente = cur.execute(sqlDoc, ('0103771648'))
        cur.execute(sqlgrupos)
        grupos = cur.fetchall()

        cur.execute(sqlAsig)
        asignaturas = cur.fetchall()

        cur.execute(sqlDoce)
        docentes = cur.fetchall()

        # print(docente)
        for index, row in datos.iterrows():

            habilitado = True
            periodo = row['COD_PERIODO']
            matriculaNum = row['NUMERO_MATRICULA']
            codigoEstudiante = row['CODIGO_ESTUDIANTE']

            grupoId = 0

            asiId = 0
            for rowA in asignaturas:
                if(rowA[2] == row['COD_ASIGNATURA']):
                    asiId = rowA[0]
                    break

            for rowB in grupos:
                validacionGrupoName = rowB[1] == row['GRUPO']
                validacioncodigoAsi = rowB[3] == asiId

                if(validacionGrupoName & validacioncodigoAsi):
                    for rowD in docentes:
                        validacionDoce = rowD[1] == row['CEDULA_DOCENTE']
                        validacionGRUDoc = rowB[4] == rowD[0]
                        if(validacionDoce & validacionGRUDoc):
                            grupoId = rowB[0]
                            break

            cur.execute(
                sql, (habilitado,  periodo, matriculaNum, codigoEstudiante, grupoId))

            conn.commit()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)


# SO DATA
def studen_outcomes(connection):
    print("studen_outcomes")

    sqldelete = 'DELETE FROM public.student_outcomes;'
    sqlAlterSeqnce = 'ALTER SEQUENCE student_outcomes_sto_id_seq RESTART WITH 1;'
    sql = """INSERT INTO student_outcomes
                 (sto_codigo, sto_descripcion)
                 VALUES
                 (%s,%s)"""

    print(dataSO.soData)
    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)
        for so in dataSO.soData:
            cod = so['cod']
            des = so['des']

            cur.execute(
                sql, (cod, des))

            conn.commit()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)


def criterios_so(connection):
    print("studen_outcomes")

    sqldelete = 'DELETE FROM public.criterios_so;'
    sqlAlterSeqnce = 'ALTER SEQUENCE criterios_so_cri_id_seq RESTART WITH 1;'
    sql = """INSERT INTO criterios_so
                 (cri_descripcion,sto_id )
                 VALUES
                 (%s,%s)"""

    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)
        for cri in dataSO.criteriosData:
            des = cri['des']
            codFK = cri['so_id']

            cur.execute(
                sql, (des, codFK))

            conn.commit()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)


def niveles_cri(connection):
    print("niveles_cri")

    sqldelete = 'DELETE FROM public.niveles_cri;'
    sqlAlterSeqnce = 'ALTER SEQUENCE niveles_cri_nvl_id_seq RESTART WITH 1;'
    sql = """INSERT INTO niveles_cri
                 (nvl_descripcion, nvl_tipo, cri_id)
                 VALUES
                 (%s,%s,%s)"""

    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)
        indexNvl = 0
        indexCri = 1
        nivelesTipos = ["Inicial",	"En Desarrollo",	"Ideal",	"Avanzado"]
        for nivel in dataSO.nivelesCri:
            des = nivel['desNivel']
            tipo = nivelesTipos[indexNvl]
            criterio = indexCri

            cur.execute(
                sql, (des, tipo, criterio))

            conn.commit()
            indexNvl = indexNvl+1
            if(indexNvl == 4):
                indexNvl = 0
                indexCri = indexCri + 1

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)


def crit_asignatura(connection):
    print("crit_asignatura")

    sqldelete = 'DELETE FROM public.criterios_asignaturas;'
    sqlAlterSeqnce = 'ALTER SEQUENCE criterios_asignaturas_cra_id_seq RESTART WITH 1;'
    sql = """INSERT INTO criterios_asignaturas
                 (asi_codigo,cri_id)
                 VALUES
                 (%s,%s)"""

    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)

        for cra in dataSO.criteriosAsignaturas:
            asi_id = cra['asi_id']
            cri_id = cra['cri_id']
            print(cri_id)

            cur.execute(
                sql, (asi_id, cri_id))

            conn.commit()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)


def deleteData(connection):

    # sqldeleteGrupos = 'DELETE FROM public.inscripciones_grupo;'
    # sqlAlterSeqnceGrupos = 'ALTER SEQUENCE grupos_grp_id_seq RESTART WITH 1;'
    sqldeleteAsi = 'DELETE FROM public.asignaturas;'
    sqldeleteCriAsi = 'DELETE FROM public.criterios_asignaturas;'
    sqldeleteCriSto = 'DELETE FROM public.criterios_so;'
    sqldeleteDoc = 'DELETE FROM public.docentes;'
    sqldeleteEst = 'DELETE FROM public.estudiantes;'
    sqldeleteGru = 'DELETE FROM public.grupos;'
    sqldeleteInsGru = 'DELETE FROM public.inscripciones_grupo;'
    sqldeleteNivCri = 'DELETE FROM public.niveles_cri;'
    sqldeleteRub = 'DELETE FROM public.rubrica_so;'
    sqldeleteSto = 'DELETE FROM public.student_outcomes;'

    conn = connection
    cur = conn.cursor()

    cur.execute(sqldeleteRub)
    cur.execute(sqldeleteInsGru)
    cur.execute(sqldeleteGru)
    cur.execute(sqldeleteCriAsi)
    cur.execute(sqldeleteNivCri)
    cur.execute(sqldeleteCriSto)
    cur.execute(sqldeleteSto)
    cur.execute(sqldeleteAsi)
    cur.execute(sqldeleteDoc)
    cur.execute(sqldeleteEst)

    conn.commit()
    # conn.close()


# deleteData(connection)

asignaturas(df, connection)
docentes(df, connection)
estudintes(df, connection=connection)
grupos(df, connection=connection)
inscripcion_grupos(df, connection=connection)

studen_outcomes(connection)
criterios_so(connection=connection)
niveles_cri(connection=connection)
crit_asignatura(connection=connection)

connection.close()
