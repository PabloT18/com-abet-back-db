import sqlalchemy as sa

import pandas as pd
import psycopg2
# from config import config
# import data as dataSO
# data deende del archivo
import data_elec.data_elec as dataSO

# engine = sa.create_engine('postgresql://pablodb:1809@localhost:5432/ups_abet')
connection = psycopg2.connect(user="pablodb",
                              password="1809",
                              host="127.0.0.1",
                              port="5432",
                              database="ups_abet_elec")


df = pd.read_excel('data_elec/listado_estudiantes_materias.xlsx')
# df = pd.read_csv('listado_estudiantes_materias.csv', delimiter=';', dtype=str)
# LEctura del archivo de graduados
# df = pd.read_csv('Listado_graduados_correos.csv', delimiter=';', dtype=str)

# LEctura del archivo de Empresas
# df = pd.read_csv('Listado_empresas_correos.csv', delimiter=';', dtype=str)


print(df.shape)
# print(df.head(2))


def asignaturas(datos, connection):

    asignaturas = datos.drop_duplicates(['COD_ASIGNATURA'], keep='first')
    print(asignaturas.iterrows())
    print(asignaturas.shape)

    sqldelete = 'DELETE FROM public.asignaturas;'
    sqlAlterSeqnce = 'ALTER SEQUENCE asignaturas_asi_id_seq RESTART WITH 1;'

    sql = """INSERT INTO asignaturas
                 (asi_codigo, asi_descripcion, asi_descripcion_en, asi_nivel)
                 VALUES
                 (%s,%s,%s,%s)"""
    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)
        contadorasig = 0
        for index, row in asignaturas.iterrows():
            contadorasig = contadorasig+1
            cod = row['COD_ASIGNATURA']
            des = row['ASIGNATURA']
            des2 = des

            nivel = row['NIVEL']

            cur.execute(
                sql, (cod, des, des2,  nivel))

            conn.commit()

            print(contadorasig)
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    # finally:
    #     if conn is not None:
    #         conn.close()


def docentes(datos, connection):

    docentesDF = datos.drop_duplicates(['CEDULA_DOCENTE'], keep='first')

    # sqldelete = 'DELETE FROM public.docentes;'
    # sqlAlterSeqnce = 'ALTER SEQUENCE docentes_doc_id_seq RESTART WITH 1;'
    sql = """INSERT INTO docentes
                 ( doc_cedula, doc_nombre, doc_correo, doc_user_type)
	            VALUES ( %s, %s, %s, %s )"""
    try:

        conn = connection
        cur = conn.cursor()
        # cur.execute(sqldelete)
        # cur.execute(sqlAlterSeqnce)
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

    # estudaintesDF = datos.drop_duplicates(['CODIGO_ESTUDIANTE'], keep='first')
    estudaintesDF = datos.drop_duplicates(['COD_ESTUDIANTE'], keep='first')

    # sqldelete = 'DELETE FROM public.estudiantes;'
    # sqlAlterSeqnce = 'ALTER SEQUENCE estudiantes_est_id_seq RESTART WITH 1;'
    sql = """INSERT INTO estudiantes
                 ( est_codigo, est_cedula, est_nombre, est_correo, est_genero)
	            VALUES ( %s, %s, %s, %s, %s )"""
    try:

        conn = connection
        cur = conn.cursor()
        # cur.execute(sqldelete)
        # cur.execute(sqlAlterSeqnce)
        contadorasig = 0

        for index, row in estudaintesDF.iterrows():
            contadorasig = contadorasig + 1
            cod = row['COD_ESTUDIANTE']

            ced = str(row['CEDULA_ESTUDIANTE'])

            if(len(ced) == 9):
                ced = '0'+ced

            name = row['ESTUDIANTE']
            mail = row['CORREO_ESTUDIANTE']
            genero = row['GENERO_ESTUDIANTE']

            cur.execute(
                sql, (cod, ced, name, mail, genero))

            conn.commit()

        cur.close()
        print(contadorasig)
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    # finally:
    #     if conn is not None:
    #         conn.close()


def grupos(datos, connection):

    grupodf = datos.drop_duplicates(
        ['COD_PERIODO', 'COD_ASIGNATURA', 'GRUPO', 'CORREO_DOCENTE'], keep='first')
    print(grupodf.shape)

    sqldelete = 'DELETE FROM public.grupos;'
    sqlAlterSeqnce = 'ALTER SEQUENCE grupos_grp_id_seq RESTART WITH 1;'

    sql = """INSERT INTO grupos
                 ( grp_nombre, grp_periodo, grp_habilitado, grp_asi_id, grp_doc_id)
                VALUES ( %s, %s,%s, %s, %s )"""

    sqlDoce = "SELECT * FROM docentes "
    sqlAsig = "SELECT * FROM asignaturas "

    try:

        conn = connection
        cur = conn.cursor()
        contadorasig = 0

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
            contadorasig = contadorasig + 1

            name = row['GRUPO']
            habilitado = True
            perido = row['COD_PERIODO']

            docId = 0
            asiId = 0

            for rowD in docentes:
                cedulaQuery = rowD[1]
                grupoDAto = str(row['CEDULA_DOCENTE'])
                if(len(grupoDAto) == 9):
                    grupoDAto = '0'+grupoDAto
                if(cedulaQuery == grupoDAto):
                    docId = rowD[0]
                    break

            for rowA in asignaturas:
                if(rowA[3] == row['COD_ASIGNATURA']):
                    asiId = rowA[0]
                    break
            cur.execute(
                sql, (name, perido, habilitado,  asiId, docId))

            conn.commit()
        print(contadorasig)

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    # finally:
    # if conn is not None:
    #     conn.close()


def inscripcion_grupos(datos, connection):

    grupodf = datos.drop_duplicates(
        ['COD_PERIODO', 'COD_ASIGNATURA', 'GRUPO'], keep='first')
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
            codigoEstudiante = row['COD_ESTUDIANTE']

            grupoId = 0

            asiId = 0
            for rowA in asignaturas:
                # if(rowA[2] == row['COD_ASIGNATURA']):
                # Cambia a 3 porque se adiciono nombre de la asignatura en EN
                if(rowA[3] == row['COD_ASIGNATURA']):
                    asiId = rowA[0]
                    break

            for rowB in grupos:
                # validacionGrupoName = rowB[1] == row['GRUPO']
                # Cambia a 2 porque se adiciono perido de cada grupo
                validacionGrupoName = rowB[2] == row['GRUPO']

                # validacioncodigoAsi = rowB[3] == asiId
                # Cambia a 4 porque se adiciono perido de cada grupo
                validacioncodigoAsi = rowB[4] == asiId

                if(validacionGrupoName & validacioncodigoAsi):
                    for rowD in docentes:
                        cedulaFromDaos = str(row['CEDULA_DOCENTE'])
                        if(len(cedulaFromDaos) == 9):
                            cedulaFromDaos = '0'+cedulaFromDaos

                        validacionDoce = rowD[1] == cedulaFromDaos
                        # validacionGRUDoc = rowB[4] == rowD[0]
                        # Cambia a 5 porque se adiciono perido de cada grupo

                        validacionGRUDoc = rowB[5] == rowD[0]

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
                 (sto_codigo, sto_descripcion, sto_descripcion_en)
                 VALUES
                 (%s,%s,%s)"""

    print(dataSO.soData)
    try:

        conn = connection
        cur = conn.cursor()
        cur.execute(sqldelete)
        cur.execute(sqlAlterSeqnce)
        for so in dataSO.soData:
            cod = so['cod']
            des = so['des']
            desEn = so['des-en']

            cur.execute(
                sql, (cod, des, desEn))

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

        # FOR para asignaturas
        # for cra in dataSO.criteriosAsignaturas:
        # FOR para graduados
        # for cra in dataSO.criteriosAsignaturasGraduados:
        # FOR para asignatura Empresas
        # for cra in dataSO.criteriosAsignaturasEMPRESAS:

        # FOR para asignatura Electrica
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

# asignaturas(df, connection)
# docentes(df, connection)
# estudintes(df, connection=connection)
# grupos(df, connection=connection)
# inscripcion_grupos(df, connection=connection)

# studen_outcomes(connection)
# criterios_so(connection=connection)
# niveles_cri(connection=connection)
crit_asignatura(connection=connection)

connection.close()
