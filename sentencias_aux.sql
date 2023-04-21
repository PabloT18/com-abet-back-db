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


SELECT rub.*, cri.cri_id, cri.cri_descripcion, sto.sto_codigo, sto.sto_descripcion, niv.nvl_descripcion, niv.nvl_tipo as Nivel, grp.*, asi.* FROM public.rubrica_so rub, criterios_so cri, public.student_outcomes sto, niveles_cri niv, grupos grp, asignaturas asi where rub.cri_id = cri.cri_id and rub.rub_niv = niv.nvl_id and cri.sto_id = sto.sto_id and grp.grp_id = rub.grp_id and grp.grp_asi_id = asi.asi_id



--- insertar nuevo criterio a una materia
INSERT INTO criterios_asignaturas (asi_codigo, cri_id) values ('E-CT-ICO-147', 5);

--- CONTAR LAS RUBRICAS DE GRADUADOS
SELECT count(*) FROM rubrica_so rub, grupos grp, asignaturas asi WHERE rub.grp_id = grp.grp_id and  grp.grp_asi_id = asi.asi_id and asi.asi_id = 55;


--- NOBRES DE ESSTUDAINTES GRADUACODS QUE REALIIZARON RUBRICAS
select grp.grp_nombre from rubrica_so rub, grupos grp where rub.grp_id  = grp.grp_id and grp.grp_asi_id = 55 group by grp.grp_nombre;






