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

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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




COPY( SELECT *
FROM public.rubrica_so rub,
 criterios_so cri, 
 public.student_outcomes sto,
 niveles_cri niv,
 grupos grp,
 asignaturas asi
where rub.cri_id = cri.cri_id
 and rub.rub_niv = niv.nvl_id
 and cri.sto_id = sto.sto_id
 and ) TO '/home/usrlala/Documents/LALA2023/ABET/com-abet-back-db/export_tablue1.csv' WITH CSV HEADER;





COPY( SELECT rub.*, cri.cri_id, cri.cri_descripcion, sto.sto_codigo, sto.sto_descripcion, niv.nvl_descripcion, niv.nvl_tipo as Nivel, grp.*, asi.* FROM public.rubrica_so rub, criterios_so cri, public.student_outcomes sto, niveles_cri niv, grupos grp, asignaturas asi where rub.cri_id = cri.cri_id and rub.rub_niv = niv.nvl_id and cri.sto_id = sto.sto_id and grp.grp_id = rub.grp_id and grp.grp_asi_id = asi.asi_id ) TO '/home/usrlala/Documents/LALA2023/ABET/com-abet-back-db/export_tablue1.csv' WITH CSV HEADER;


SELECT rub.*,
 cri.cri_id,
 cri.cri_descripcion,
 sto.sto_codigo,
 sto.sto_descripcion,
 niv.nvl_descripcion,
 niv.nvl_tipo as Nivel,
 grp.*,
 asi.* 
 FROM public.rubrica_so rub,
     criterios_so cri,
     public.student_outcomes sto,
     niveles_cri niv,
     grupos grp,
     asignaturas asi 
    where rub.cri_id = cri.cri_id 
    and rub.rub_niv = niv.nvl_id 
    and cri.sto_id = sto.sto_id 
    and grp.grp_id = rub.grp_id 
    and grp.grp_asi_id = asi.asi_id


COPY( SELECT  ASI.ASI_CODIGO AS ASIGNATURA_CODIGO, ASI.ASI_NIVEL AS ASIGNATURA_NIVEL, ASI.ASI_DESCRIPCION AS ASIGNATURA_NOMBRE, GRP.grp_nombre, EST.EST_CODIGO, EST.EST_NOMBRE, EST.EST_CORREO, EST.EST_GENERO, DOC.DOC_ID, DOC.DOC_NOMBRE, DOC.DOC_CORREO, STO.STO_CODIGO, STO.STO_DESCRIPCION, CRI.CRI_ID, CRI.CRI_DESCRIPCION, NIV.NVL_DESCRIPCION CALIFICACION_DES, NIV.NVL_TIPO AS CALIFICACION FROM PUBLIC.RUBRICA_SO RUB, CRITERIOS_SO CRI, PUBLIC.STUDENT_OUTCOMES STO, NIVELES_CRI NIV, GRUPOS GRP, ASIGNATURAS ASI, ESTUDIANTES EST, DOCENTES DOC WHERE RUB.CRI_ID = CRI.CRI_ID AND RUB.RUB_NIV = NIV.NVL_ID AND RUB.EST_ID = EST.EST_ID AND RUB.DOC_ID = DOC.DOC_ID AND CRI.STO_ID = STO.STO_ID AND GRP.GRP_ID = RUB.GRP_ID AND GRP.GRP_ASI_ID = ASI.ASI_ID ) TO '/home/usrlala/Documents/LALA2023/ABET/com-abet-back-db/export_elec/export_elec_001.csv' WITH CSV HEADER;

SELECT 
	ASI.ASI_CODIGO AS ASIGNATURA_CODIGO,
	ASI.ASI_NIVEL AS ASIGNATURA_NIVEL,
	ASI.ASI_DESCRIPCION AS ASIGNATURA_NOMBRE,
	GRP.grp_nombre,
	EST.EST_CODIGO,
	EST.EST_NOMBRE,
	EST.EST_CORREO,
	EST.EST_GENERO,
	DOC.DOC_ID,
	DOC.DOC_NOMBRE,
	DOC.DOC_CORREO,
	STO.STO_CODIGO,
	STO.STO_DESCRIPCION,
	CRI.CRI_ID,
	CRI.CRI_DESCRIPCION,
	NIV.NVL_DESCRIPCION CALIFICACION_DES,
	NIV.NVL_TIPO AS CALIFICACION
FROM PUBLIC.RUBRICA_SO RUB,
	CRITERIOS_SO CRI,
	PUBLIC.STUDENT_OUTCOMES STO,
	NIVELES_CRI NIV,
	GRUPOS GRP,
	ASIGNATURAS ASI,
	ESTUDIANTES EST,
	DOCENTES DOC
WHERE RUB.CRI_ID = CRI.CRI_ID
	AND RUB.RUB_NIV = NIV.NVL_ID
	AND RUB.EST_ID = EST.EST_ID
	AND RUB.DOC_ID = DOC.DOC_ID
	AND CRI.STO_ID = STO.STO_ID
	AND GRP.GRP_ID = RUB.GRP_ID

--- insertar nuevo criterio a una materia
INSERT INTO criterios_asignaturas (asi_codigo, cri_id) values ('E-CT-ICO-147', 5);

--- CONTAR LAS RUBRICAS DE GRADUADOS
SELECT count(*) FROM rubrica_so rub, grupos grp, asignaturas asi WHERE rub.grp_id = grp.grp_id and  grp.grp_asi_id = asi.asi_id and asi.asi_id = 55;


--- NOBRES DE ESSTUDAINTES GRADUACODS QUE REALIIZARON RUBRICAS
select grp.grp_nombre from rubrica_so rub, grupos grp where rub.grp_id  = grp.grp_id and grp.grp_asi_id = 55 group by grp.grp_nombre;


--- Conteo de rubricas de estudaintes ralizacad
                                                           ^SELECT count(*) FROM rubrica_so rub, grupos grp, asignaturas asi WHERE rub.grp_id = grp.grp_id and  grp.grp_asi_id = asi.asi_id and asi.asi_id != 55 and asi.asi_id != 56 and asi.asi_id != 33 and asi.asi_id != 34 and asi.asi_id != 40 and asi.asi_id != 43;


-- NOBRES DE ESSTUDAINTES GRADUACODS QUE REALIIZARON RUBRICAS
select grp.grp_nombre from rubrica_so rub, grupos grp where rub.grp_id  = grp.grp_id and grp.grp_asi_id = 55 group by grp.grp_nombre;


--- Conteo de rubricas de estudaintes ralizacad
SELECT count(*) FROM rubrica_so rub, grupos grp, asignaturas asi WHERE rub.grp_id = grp.grp_id and  grp.grp_asi_id = asi.asi_id and asi.id_asi = 33 and asi.asi_id = 34 and asi.asi_id = 40 and asi.asi_id = 43;


--- estudaines de practica elavuados 

Select count(res.est_id) from (SELECT est.est_id FROM rubrica_so rub, estudiantes est,grupos grp,  asignaturas asi WHERE rub.est_id = est.est_id and rub.grp_id = grp.grp_id and  grp.grp_asi_id = asi.asi_id and asi.asi_id in (33, 34,40,43)  group by est.est_id) as res;


