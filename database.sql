/// arreglar postgres 
en /etc/postgresql/12/main
// archivo a editar
psql -U pablodb -d ups_abet -W

Cambiar md5 por peer

// reiniciar postgres
sudo systemctl restart postgresql

// entrar a ups_abet
psql -U pablodb -d ups_abet -W



create table asignaturas (asi_id serial primary key,
						  asi_descripcion varchar(250) NOT NULL,
						  asi_descripcion_en varchar(250) NOT NULL,
						  asi_codigo varchar(50) UNIQUE NOT NULL,
						  asi_nivel varchar(50) NOT NULL
						 );


create table docentes (doc_id serial primary key,
						  doc_cedula varchar(50) UNIQUE NOT NULL,
						  doc_nombre varchar(50) NOT NULL,
						  doc_correo varchar(50) NOT NULL,
                          doc_user_type varchar(50) NOT NULL
						 );


create table estudiantes (est_id serial primary key,
						  est_codigo varchar(50) UNIQUE NOT NULL,
						  est_cedula varchar(50) UNIQUE NOT NULL,
						  est_nombre varchar(50) NOT NULL,
						  est_correo varchar(50) NOT NULL,
                          est_genero varchar(50) NOT NULL
						 );


create table grupos (grp_id serial primary key,
						grp_periodo integer not NULL,
						  grp_nombre varchar(50) NOT NULL,
                          grp_habilitado boolean NOT NULL,
						  grp_asi_id integer  NOT NULL,
                          grp_doc_id integer NOT NULL,
                        CONSTRAINT fk_asignatura FOREIGN KEY (grp_asi_id) REFERENCES asignaturas(asi_id),
                        CONSTRAINT fk_docente FOREIGN KEY (grp_doc_id) REFERENCES docentes (doc_id)
					);

create table inscripciones_grupo (ins_id serial primary key,
                          ins_habilitado boolean NOT NULL,
                          ins_periodo integer NOT NULL,
                          ins_matricula_num integer NOT NULL,

						  est_codigo  varchar(50)  NOT NULL,
                          grp_id integer NOT NULL,
                        CONSTRAINT fk_estudiante FOREIGN KEY (est_codigo) REFERENCES estudiantes(est_codigo),
                        CONSTRAINT fk_grupos FOREIGN KEY (grp_id) REFERENCES grupos (grp_id)
					);

create table student_outcomes (sto_id serial primary key,
						  sto_descripcion varchar(255) NOT NULL,
						  sto_descripcion_en varchar(255) NOT NULL,
						  sto_codigo varchar(255) UNIQUE NOT NULL
						  
						 );

create table criterios_so (cri_id serial primary key,
						  cri_descripcion Text NOT NULL,
						  
						  sto_id integer NOT NULL,
                       	 CONSTRAINT fk_sto FOREIGN KEY (sto_id) REFERENCES student_outcomes (sto_id)
						  
						 );


create table niveles_cri (nvl_id serial primary key,
						  nvl_descripcion Text NOT NULL,
						  nvl_tipo  varchar(50)  NOT NULL,
						  cri_id integer NOT NULL,
                       	 CONSTRAINT fk_nvl_cri FOREIGN KEY (cri_id) REFERENCES criterios_so (cri_id)
);


create table criterios_asignaturas (cra_id serial primary key,
						asi_codigo varchar(50) NOT NULL,
						cri_id  integer NOT NULL,
                       	 CONSTRAINT fk_cra_asi FOREIGN KEY (asi_codigo) REFERENCES asignaturas (asi_codigo),
                       	 CONSTRAINT fk_cra_cr FOREIGN KEY (cri_id) REFERENCES criterios_so (cri_id)
						  
						 );


Create table rubrica_so (rub_id serial primary key,
						doc_id integer NOT NULL,
						est_id integer NOT NULL,
						grp_id integer NOT NULL,
						cri_id integer NOT NULL,
						rub_niv integer NOT NULL,
                       	 CONSTRAINT fk_rub_doc FOREIGN KEY (doc_id) REFERENCES docentes (doc_id),
                       	 CONSTRAINT fk_rub_est FOREIGN KEY (est_id) REFERENCES estudiantes (est_id),
                       	 CONSTRAINT fk_rub_grp FOREIGN KEY (grp_id) REFERENCES grupos (grp_id),
                       	 CONSTRAINT fk_rub_nvl FOREIGN KEY (rub_niv) REFERENCES niveles_cri (nvl_id),
                       	 CONSTRAINT fk_rub_cri FOREIGN KEY (cri_id) REFERENCES criterios_so (cri_id),
						 CONSTRAINT uq_rubrica UNIQUE (doc_id, est_id, grp_id, cri_id)
						);

						insert into rubrica_so 

						 INSERT INTO rubrica_so
                 		(doc_id, est_id, grp_id, cri_id, rub_niv)
                 		VALUES (74,10,146,2,6 );


--- eliminar las tablas 
DROP TABLE IF EXISTS rubrica_so;
DROP TABLE IF EXISTS criterios_asignaturas;
DROP TABLE IF EXISTS niveles_cri;
DROP TABLE IF EXISTS criterios_so;
DROP TABLE IF EXISTS student_outcomes;
DROP TABLE IF EXISTS inscripciones_grupo;
DROP TABLE IF EXISTS grupos;
DROP TABLE IF EXISTS estudiantes;
DROP TABLE IF EXISTS docentes;
DROP TABLE IF EXISTS asignaturas;




-----

SELECT * FROM public.asignaturas;  54 - 55 - 55 - 56
SELECT * FROM public.docentes; 99 - 152 - 152 - 159 
SELECT * FROM public.estudiantes; 253 - 306 - 306 - 313
SELECT * FROM public.grupos; 218 - 271 - 271 - 278
SELECT * FROM public.inscripciones_grupo; 1222 - 1275 -1275 - 1282
SELECT * FROM public.student_outcomes; 6
SELECT * FROM public.criterios_so; 17
SELECT * FROM public.niveles_cri; 68
SELECT * FROM public.criterios_asignaturas; 125 - 142 -142 - 159 - (12/03)160 
SELECT * FROM public.rubrica_so; 1603 - 1790 - 

SELECT count(*) FROM asignaturas;
SELECT count(*) FROM docentes;
SELECT count(*) FROM estudiantes;
SELECT count(*) FROM grupos;
SELECT count(*) FROM inscripciones_grupo;
SELECT count(*) FROM student_outcomes;
SELECT count(*) FROM criterios_so;
SELECT count(*) FROM niveles_cri;
SELECT count(*) FROM criterios_asignaturas;
SELECT count(*) FROM rubrica_so;
