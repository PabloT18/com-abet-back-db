SELECT grp_id,
       grp_nombre,
       grp_habilitado,
       grp_asi_id,
       grp_doc_id
FROM public.grupos
LIMIT 1000;


ALTER TABLE public.asignaturas 
ADD COLUMN asi_descripcion_en INTEGER;

ALTER TABLE public.asignaturas 
ADD COLUMN asi_descripcion_en TEXT;

-- Eliminar la constraint de unicidad en est_cedula
ALTER TABLE public.estudiantes 
DROP CONSTRAINT estudiantes_est_cedula_key;

-- Agregar la nueva columna grp_periodo
ALTER TABLE public.grupos 
ADD COLUMN grp_periodo INTEGER;

-- Llenar todos los registros existentes con el valor 60
UPDATE public.grupos 
SET grp_periodo = 60;

-- Verificar los cambios
SELECT * 
FROM public.grupos;



SELECT 'asignaturas' AS tabla, COUNT(*) AS total
FROM public.asignaturas
UNION ALL
SELECT 'docentes' AS tabla, COUNT(*) AS total
FROM public.docentes
UNION ALL
SELECT 'estudiantes' AS tabla, COUNT(*) AS total
FROM public.estudiantes
UNION ALL
SELECT 'grupos' AS tabla, COUNT(*) AS total
FROM public.grupos
UNION ALL
SELECT 'inscripciones_grupo' AS tabla, COUNT(*) AS total
FROM public.inscripciones_grupo
-- Agrega más tablas según necesites
ORDER BY tabla;


SELECT 'asignaturas' AS tabla, COUNT(*) AS total FROM public.asignaturas UNION ALL SELECT 'docentes' AS tabla, COUNT(*) AS total FROM public.docentes UNION ALL SELECT 'estudiantes' AS tabla, COUNT(*) AS total FROM public.estudiantes UNION ALL SELECT 'grupos' AS tabla, COUNT(*) AS total FROM public.grupos UNION ALL SELECT 'inscripciones_grupo' AS tabla, COUNT(*) AS total FROM public.inscripciones_grupo ORDER BY tabla;