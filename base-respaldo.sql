--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asignaturas; Type: TABLE; Schema: public; Owner: pablodb
--

CREATE TABLE public.asignaturas (
    asi_id integer NOT NULL,
    asi_descripcion character varying(50) NOT NULL,
    asi_codigo character varying(50) NOT NULL,
    asi_nivel character varying(50) NOT NULL
);


ALTER TABLE public.asignaturas OWNER TO pablodb;

--
-- Name: asignaturas_asi_id_seq; Type: SEQUENCE; Schema: public; Owner: pablodb
--

CREATE SEQUENCE public.asignaturas_asi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asignaturas_asi_id_seq OWNER TO pablodb;

--
-- Name: asignaturas_asi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pablodb
--

ALTER SEQUENCE public.asignaturas_asi_id_seq OWNED BY public.asignaturas.asi_id;


--
-- Name: criterios_asignaturas; Type: TABLE; Schema: public; Owner: pablodb
--

CREATE TABLE public.criterios_asignaturas (
    cra_id integer NOT NULL,
    asi_codigo character varying(50) NOT NULL,
    cri_id integer NOT NULL
);


ALTER TABLE public.criterios_asignaturas OWNER TO pablodb;

--
-- Name: criterios_asignaturas_cra_id_seq; Type: SEQUENCE; Schema: public; Owner: pablodb
--

CREATE SEQUENCE public.criterios_asignaturas_cra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criterios_asignaturas_cra_id_seq OWNER TO pablodb;

--
-- Name: criterios_asignaturas_cra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pablodb
--

ALTER SEQUENCE public.criterios_asignaturas_cra_id_seq OWNED BY public.criterios_asignaturas.cra_id;


--
-- Name: criterios_so; Type: TABLE; Schema: public; Owner: pablodb
--

CREATE TABLE public.criterios_so (
    cri_id integer NOT NULL,
    cri_descripcion text NOT NULL,
    sto_id integer NOT NULL
);


ALTER TABLE public.criterios_so OWNER TO pablodb;

--
-- Name: criterios_so_cri_id_seq; Type: SEQUENCE; Schema: public; Owner: pablodb
--

CREATE SEQUENCE public.criterios_so_cri_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criterios_so_cri_id_seq OWNER TO pablodb;

--
-- Name: criterios_so_cri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pablodb
--

ALTER SEQUENCE public.criterios_so_cri_id_seq OWNED BY public.criterios_so.cri_id;


--
-- Name: docentes; Type: TABLE; Schema: public; Owner: pablodb
--

CREATE TABLE public.docentes (
    doc_id integer NOT NULL,
    doc_cedula character varying(50) NOT NULL,
    doc_nombre character varying(50) NOT NULL,
    doc_correo character varying(50) NOT NULL,
    doc_user_type character varying(50) NOT NULL
);


ALTER TABLE public.docentes OWNER TO pablodb;

--
-- Name: docentes_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: pablodb
--

CREATE SEQUENCE public.docentes_doc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.docentes_doc_id_seq OWNER TO pablodb;

--
-- Name: docentes_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pablodb
--

ALTER SEQUENCE public.docentes_doc_id_seq OWNED BY public.docentes.doc_id;


--
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: pablodb
--

CREATE TABLE public.estudiantes (
    est_id integer NOT NULL,
    est_codigo character varying(50) NOT NULL,
    est_cedula character varying(50) NOT NULL,
    est_nombre character varying(50) NOT NULL,
    est_correo character varying(50) NOT NULL,
    est_genero character varying(50) NOT NULL
);


ALTER TABLE public.estudiantes OWNER TO pablodb;

--
-- Name: estudiantes_est_id_seq; Type: SEQUENCE; Schema: public; Owner: pablodb
--

CREATE SEQUENCE public.estudiantes_est_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estudiantes_est_id_seq OWNER TO pablodb;

--
-- Name: estudiantes_est_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pablodb
--

ALTER SEQUENCE public.estudiantes_est_id_seq OWNED BY public.estudiantes.est_id;


--
-- Name: grupos; Type: TABLE; Schema: public; Owner: pablodb
--

CREATE TABLE public.grupos (
    grp_id integer NOT NULL,
    grp_nombre character varying(50) NOT NULL,
    grp_habilitado boolean NOT NULL,
    grp_asi_id integer NOT NULL,
    grp_doc_id integer NOT NULL,
    grp_periodo integer NOT NULL,
);


ALTER TABLE public.grupos OWNER TO pablodb;

--
-- Name: grupos_grp_id_seq; Type: SEQUENCE; Schema: public; Owner: pablodb
--

CREATE SEQUENCE public.grupos_grp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupos_grp_id_seq OWNER TO pablodb;

--
-- Name: grupos_grp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pablodb
--

ALTER SEQUENCE public.grupos_grp_id_seq OWNED BY public.grupos.grp_id;


--
-- Name: inscripciones_grupo; Type: TABLE; Schema: public; Owner: pablodb
--

CREATE TABLE public.inscripciones_grupo (
    ins_id integer NOT NULL,
    ins_habilitado boolean NOT NULL,
    ins_periodo integer NOT NULL,
    ins_matricula_num integer NOT NULL,
    est_codigo character varying(50) NOT NULL,
    grp_id integer NOT NULL
);


ALTER TABLE public.inscripciones_grupo OWNER TO pablodb;

--
-- Name: inscripciones_grupo_ins_id_seq; Type: SEQUENCE; Schema: public; Owner: pablodb
--

CREATE SEQUENCE public.inscripciones_grupo_ins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inscripciones_grupo_ins_id_seq OWNER TO pablodb;

--
-- Name: inscripciones_grupo_ins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pablodb
--

ALTER SEQUENCE public.inscripciones_grupo_ins_id_seq OWNED BY public.inscripciones_grupo.ins_id;


--
-- Name: niveles_cri; Type: TABLE; Schema: public; Owner: pablodb
--

CREATE TABLE public.niveles_cri (
    nvl_id integer NOT NULL,
    nvl_descripcion text NOT NULL,
    nvl_tipo character varying(50) NOT NULL,
    cri_id integer NOT NULL
);


ALTER TABLE public.niveles_cri OWNER TO pablodb;

--
-- Name: niveles_cri_nvl_id_seq; Type: SEQUENCE; Schema: public; Owner: pablodb
--

CREATE SEQUENCE public.niveles_cri_nvl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.niveles_cri_nvl_id_seq OWNER TO pablodb;

--
-- Name: niveles_cri_nvl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pablodb
--

ALTER SEQUENCE public.niveles_cri_nvl_id_seq OWNED BY public.niveles_cri.nvl_id;


--
-- Name: rubrica_so; Type: TABLE; Schema: public; Owner: pablodb
--

CREATE TABLE public.rubrica_so (
    rub_id integer NOT NULL,
    doc_id integer NOT NULL,
    est_id integer NOT NULL,
    grp_id integer NOT NULL,
    cri_id integer NOT NULL,
    rub_niv integer NOT NULL
);


ALTER TABLE public.rubrica_so OWNER TO pablodb;

--
-- Name: rubrica_so_rub_id_seq; Type: SEQUENCE; Schema: public; Owner: pablodb
--

CREATE SEQUENCE public.rubrica_so_rub_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rubrica_so_rub_id_seq OWNER TO pablodb;

--
-- Name: rubrica_so_rub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pablodb
--

ALTER SEQUENCE public.rubrica_so_rub_id_seq OWNED BY public.rubrica_so.rub_id;


--
-- Name: student_outcomes; Type: TABLE; Schema: public; Owner: pablodb
--

CREATE TABLE public.student_outcomes (
    sto_id integer NOT NULL,
    sto_descripcion character varying(255) NOT NULL,
    sto_descripcion_en character varying(255) NOT NULL,
    sto_codigo character varying(255) NOT NULL
);


ALTER TABLE public.student_outcomes OWNER TO pablodb;

--
-- Name: student_outcomes_sto_id_seq; Type: SEQUENCE; Schema: public; Owner: pablodb
--

CREATE SEQUENCE public.student_outcomes_sto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_outcomes_sto_id_seq OWNER TO pablodb;

--
-- Name: student_outcomes_sto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pablodb
--

ALTER SEQUENCE public.student_outcomes_sto_id_seq OWNED BY public.student_outcomes.sto_id;


--
-- Name: asignaturas asi_id; Type: DEFAULT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.asignaturas ALTER COLUMN asi_id SET DEFAULT nextval('public.asignaturas_asi_id_seq'::regclass);


--
-- Name: criterios_asignaturas cra_id; Type: DEFAULT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.criterios_asignaturas ALTER COLUMN cra_id SET DEFAULT nextval('public.criterios_asignaturas_cra_id_seq'::regclass);


--
-- Name: criterios_so cri_id; Type: DEFAULT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.criterios_so ALTER COLUMN cri_id SET DEFAULT nextval('public.criterios_so_cri_id_seq'::regclass);


--
-- Name: docentes doc_id; Type: DEFAULT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.docentes ALTER COLUMN doc_id SET DEFAULT nextval('public.docentes_doc_id_seq'::regclass);


--
-- Name: estudiantes est_id; Type: DEFAULT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN est_id SET DEFAULT nextval('public.estudiantes_est_id_seq'::regclass);


--
-- Name: grupos grp_id; Type: DEFAULT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.grupos ALTER COLUMN grp_id SET DEFAULT nextval('public.grupos_grp_id_seq'::regclass);


--
-- Name: inscripciones_grupo ins_id; Type: DEFAULT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.inscripciones_grupo ALTER COLUMN ins_id SET DEFAULT nextval('public.inscripciones_grupo_ins_id_seq'::regclass);


--
-- Name: niveles_cri nvl_id; Type: DEFAULT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.niveles_cri ALTER COLUMN nvl_id SET DEFAULT nextval('public.niveles_cri_nvl_id_seq'::regclass);


--
-- Name: rubrica_so rub_id; Type: DEFAULT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.rubrica_so ALTER COLUMN rub_id SET DEFAULT nextval('public.rubrica_so_rub_id_seq'::regclass);


--
-- Name: student_outcomes sto_id; Type: DEFAULT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.student_outcomes ALTER COLUMN sto_id SET DEFAULT nextval('public.student_outcomes_sto_id_seq'::regclass);


--
-- Data for Name: asignaturas; Type: TABLE DATA; Schema: public; Owner: pablodb
--

COPY public.asignaturas (asi_id, asi_descripcion, asi_codigo, asi_nivel) FROM stdin;
1	COMUNICACIÓN ORAL Y ESCRITA	G-HU-ICO-101	1
2	ÁLGEBRA LINEAL	C-CE-ICO-101	1
3	ANTROPOLOGÍA FILOSÓFICO-TEOLÓGICA	G-RF-ICO-101	1
4	CÁLCULO DIFERENCIAL	C-CE-ICO-102	1
5	PROGRAMACIÓN	C-CT-ICO-101	1
6	ELECTROTECNIA	C-CT-ICO-103	1
7	ÉTICA	G-RF-ICO-102	1
8	PROGRAMACIÓN APLICADA	E-CT-ICO-144	1
9	ELECTRÓNICA	C-CT-ICO-104	1
10	ESTRUCTURA DE DATOS	E-CT-ICO-143	1
11	PROGRAMACIÓN ORIENTADA A OBJETOS	C-CT-ICO-102	1
12	ECUACIONES DIFERENCIALES	C-CE-ICO-105	1
13	CÁLCULO INTEGRAL	C-CE-ICO-103	1
14	FUNDAMENTOS DE SISTEMAS OPERATIVOS	E-CT-ICO-145	2
15	VIDA Y TRASCENDENCIA	G-RF-ICO-103	2
16	ARQUITECTURA DEL COMPUTADOR	E-CT-ICO-146	2
17	PROGRAMACIÓN Y PLATAFORMAS WEB	E-CT-ICO-158	2
18	SISTEMAS EMBEBIDOS	E-CT-ICO-150	2
19	PROBABILIDAD Y ESTADÍSTICA	C-CE-ICO-104	2
20	PENSAMIENTO CRÍTICO	G-HU-ICO-102	2
21	PENSAMIENTO SOCIAL DE LA IGLESIA	G-RF-ICO-104	3
22	MÉTODOS NUMÉRICOS	C-CE-ICO-106	3
23	REDES DE COMPUTADORAS I	C-CT-ICO-105	3
24	ANÁLISIS Y DISEÑO DE SISTEMAS	E-CT-ICO-151	3
25	ANÁLISIS MULTIVARIADO Y MODELOS ESTOCÁSTICOS	E-CE-ICO-101	3
26	INTELIGENCIA ARTIFICIAL	C-CT-ICO-107	3
27	FUNDAMENTOS DE BASE DE DATOS	E-CT-ICO-148	3
28	ADMINISTRACIÓN DE SISTEMAS OPERATIVOS	E-CT-ICO-147	3
29	REDES DE COMPUTADORAS II	C-CT-ICO-106	3
30	GESTIÓN DE BASE DE DATOS	E-CT-ICO-149	4
31	GESTIÓN EMPRESARIAL	C-CA-ICO-101	4
32	SISTEMAS DISTRIBUIDOS	E-CT-ICO-160	5
33	PRÁCTICAS DE SERVICIO COMUNITARIO	E-CT-ICO-159	5
34	PRÁCTICAS PRE PROFESIONALES	E-CT-ICO-165	6
35	APRENDIZAJE AUTOMÁTICO	E-CT-ICO-152	6
36	VISIÓN POR COMPUTADOR	E-CT-ICO-153	6
37	PROYECTOS	G-CA-ICO-001	7
38	METODOLOGÍA DE LA INVESTIGACIÓN CIENTÍFICA	E-HU-ICO-001	7
39	PLATAFORMAS WEB	E-CT-ICO-022	7
40	PRÁCTICAS PRE PROFESIONALES: VINCULACIÓN	E-CT-ICO-031	7
41	VISIÓN POR COMPUTADOR	E-CT-ICO-030	7
42	INGENIERÍA DE SOFTWARE	E-CT-ICO-154	7
43	PRÁCTICAS PRE PROFESIONALES: PASANTÍAS	E-CT-ICO-033	7
44	ESCRITURA ACADÉMICA	G-HU-ICO-004	8
45	PLATAFORMAS MÓVILES	E-CT-ICO-029	8
46	COMPUTACIÓN PARALELA	E-CT-ICO-026	8
47	AUDITORÍA INFORMÁTICA	E-CT-ICO-032	8
48	CRIPTOGRAFÍA	E-CT-ICO-038	8
49	CALIDAD DE SOFTWARE	E-CT-ICO-037	8
50	SISTEMAS DISTRIBUIDOS	E-CT-ICO-036	8
51	SEGURIDAD DE LA INFORMACIÓN	E-CT-ICO-039	9
52	INTELIGENCIA DE NEGOCIOS	E-CT-ICO-040	9
53	SIMULACIÓN	E-CT-ICO-041	9
54	TRABAJO DE TITULACIÓN	E-CT-ICO-042	9
\.


--
-- Data for Name: criterios_asignaturas; Type: TABLE DATA; Schema: public; Owner: pablodb
--

COPY public.criterios_asignaturas (cra_id, asi_codigo, cri_id) FROM stdin;
1	C-CE-ICO-101	1
2	C-CE-ICO-102	1
3	C-CE-ICO-103	1
4	C-CE-ICO-104	1
5	C-CE-ICO-105	1
6	C-CE-ICO-106	1
7	E-CE-ICO-101	1
8	C-CT-ICO-101	2
9	C-CT-ICO-102	2
10	E-CT-ICO-144	2
11	E-CT-ICO-154	2
12	E-CT-ICO-158	2
13	G-CA-ICO-001	2
14	E-CT-ICO-148	2
15	C-CT-ICO-107	3
16	E-CT-ICO-143	3
17	E-CT-ICO-146	3
18	E-CT-ICO-149	3
19	E-CT-ICO-150	3
20	E-CT-ICO-152	3
21	E-CT-ICO-030	3
22	E-CT-ICO-153	3
23	E-CT-ICO-040	3
24	E-CT-ICO-026	3
25	E-CT-ICO-160	3
26	E-CT-ICO-036	3
27	E-CT-ICO-042	3
28	C-CT-ICO-105	4
29	E-CT-ICO-144	4
30	E-CT-ICO-146	4
31	E-CT-ICO-150	4
32	E-CT-ICO-158	4
33	C-CT-ICO-106	5
34	E-CT-ICO-144	5
35	E-CT-ICO-158	5
36	E-CT-ICO-146	6
37	E-CT-ICO-150	6
38	E-CT-ICO-154	6
39	E-CT-ICO-158	6
40	E-CT-ICO-042	7
41	G-HU-ICO-101	7
42	E-CT-ICO-152	7
43	E-CT-ICO-030	7
44	E-CT-ICO-153	7
45	E-CT-ICO-042	8
46	G-HU-ICO-101	8
47	E-CT-ICO-152	8
48	E-CT-ICO-030	8
49	E-CT-ICO-153	8
50	C-CT-ICO-107	9
51	E-CT-ICO-151	9
52	E-CT-ICO-152	9
53	E-CT-ICO-030	9
54	E-CT-ICO-153	9
55	E-CT-ICO-154	9
56	E-CT-ICO-031	9
57	E-CT-ICO-033	9
58	E-CT-ICO-159	9
59	E-CT-ICO-165	9
60	G-CA-ICO-001	9
61	E-CT-ICO-042	9
62	C-CT-ICO-107	10
63	E-CT-ICO-151	10
64	E-CT-ICO-152	10
65	E-CT-ICO-030	10
66	E-CT-ICO-153	10
67	E-CT-ICO-154	10
68	E-CT-ICO-031	10
69	E-CT-ICO-033	10
70	E-CT-ICO-159	10
71	E-CT-ICO-165	10
72	G-CA-ICO-001	10
73	E-CT-ICO-042	10
74	E-CT-ICO-154	11
75	E-CT-ICO-031	11
76	E-CT-ICO-033	11
77	E-CT-ICO-031	11
78	E-CT-ICO-159	11
79	E-CT-ICO-165	11
80	E-CT-ICO-154	12
81	E-CT-ICO-031	12
82	E-CT-ICO-033	12
83	E-CT-ICO-031	12
84	E-CT-ICO-159	12
85	E-CT-ICO-165	12
86	E-CT-ICO-154	13
87	E-CT-ICO-031	13
88	E-CT-ICO-033	13
89	E-CT-ICO-031	13
90	E-CT-ICO-159	13
91	E-CT-ICO-165	13
92	E-CT-ICO-154	14
93	E-CT-ICO-031	14
94	E-CT-ICO-033	14
95	E-CT-ICO-031	14
96	E-CT-ICO-159	14
97	E-CT-ICO-165	14
98	E-CT-ICO-154	15
99	E-CT-ICO-031	15
100	E-CT-ICO-033	15
101	E-CT-ICO-031	15
102	E-CT-ICO-159	15
103	E-CT-ICO-165	15
104	E-CE-ICO-101	16
105	E-CT-ICO-148	16
106	E-CT-ICO-040	16
107	E-CT-ICO-026	16
108	E-CT-ICO-160	16
109	E-CT-ICO-036	16
110	E-CT-ICO-042	16
111	C-CT-ICO-107	16
112	E-CT-ICO-152	16
113	E-CT-ICO-030	16
114	E-CT-ICO-153	16
115	E-CE-ICO-101	17
116	E-CT-ICO-148	17
117	E-CT-ICO-040	17
118	E-CT-ICO-026	17
119	E-CT-ICO-160	17
120	E-CT-ICO-036	17
121	E-CT-ICO-042	17
122	C-CT-ICO-107	17
123	E-CT-ICO-152	17
124	E-CT-ICO-030	17
125	E-CT-ICO-153	17
\.


--
-- Data for Name: criterios_so; Type: TABLE DATA; Schema: public; Owner: pablodb
--

COPY public.criterios_so (cri_id, cri_descripcion, sto_id) FROM stdin;
1	Analiza las especificaciones de un problema dado entendiendo los parámetros y datos iniciales mediante la aplicación de las ciencias exactas e identifica los procesos adecuados para brindar una solución.	1
2	Identifica los requerimientos de los actores y los componentes para brindar una solución computacional a un problema dado.	1
3	Analiza las especificaciones de un problema dado e identifica técnicas, métodos, estructuras de datos, arquitecturas o infraestructura informática para brindar una solución computacional.	1
4	Diseña los componentes de una solución basada en cómputo, identifica a los diferentes actores y su conjunto de requerimientos.	2
5	Implementa una solución basada en cómputo para un problema dado, utilizando el diseño de componentes establecidos según los requerimientos de los actores.	2
6	Evalúa una solución basada en cómputo para un problema dado, de acuerdo a los requerimientos de los actores y el diseño propuesto.	2
7	Comunica ideas de manera escrita y ordenada argumentándolas con base científica y técnica en un contexto profesional.	3
8	Comunica ideas de manera oral, fortaleciéndolas con lenguaje no verbal y facilitando la captación de su discurso.	3
9	Brinda una solución computacional a un problema profesional, identificando dilemas éticos con sus actores y consecuencias.	4
10	Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos, asume la responsabilidad de su actividad profesional con respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.	4
11	IMPACTO E INFLUENCIA\n Intención de persuadir, convencer, influenciar o impresionar a otros para obtener su apoyo; o el deseo de tener un impacto o efecto específico en los demás.	5
12	TRABAJO EN EQUIPO Y COOPERACIÓN\nImplica una intención genérica por trabajo cooperativo con otros, de trabajar juntos y desarrollar colaboración, como opuesto a trabajar separadamente o competitivamente.	5
13	FORMACIÓN DE RELACIONES Y CONTACTO\nTrabajo para realizar o mantener relaciones amistosas, amables, o redes de contactos con gente que es o puede ser útil algún día para el logro de las metas laborales. 	5
14	DESARROLLO DE LOS DEMÁS \nVersión de Impacto e Influencia, en la que la intención es enseñar o fomentar el desarrollo de alguna o de algunas personas. Implica la capacidad para emprender acciones eficaces para mejorar el talento y las capacidades de los demás.	5
15	LIDERAZGO DE EQUIPO\nIntención de tomar el rol de líder de un equipo u otro grupo.	5
16	Aplica teoría de ciencias de la computación y fundamentos de desarrollo de software para identificar y diseñar una solución apropiada para un problema dado. 	6
17	Implementa la solución acorde al diseño usando teoría de las ciencias de computación y fundamentos de desarrollo de software.	6
\.


--
-- Data for Name: docentes; Type: TABLE DATA; Schema: public; Owner: pablodb
--

COPY public.docentes (doc_id, doc_cedula, doc_nombre, doc_correo, doc_user_type) FROM stdin;
1	1709263410	CASTELLANOS FONSECA JAIME AURELIO	jcastellanos@ups.edu.ec	U
2	0301716916	MARTINEZ BUSTAMANTE MARGARITA DEL ROCIO	mmartinezb@ups.edu.ec	U
3	1400378798	ZUNA SERRANO KLEBER AUGUSTO	kzuna@ups.edu.ec	U
4	1205860974	GONZALEZ ALVAREZ NATALIA XIMENA	ngonzalez@ups.edu.ec	U
5	0102701067	MENDIETA MATUTE MARITZA ISABEL	mmendieta@ups.edu.ec	U
6	0104234612	ÑAUTA ÑAUTA ADRIAN EUGENIO	anauta@ups.edu.ec	U
7	0101803039	ORDOÑEZ JARA MARCO VINICIO	vordonez@ups.edu.ec	U
8	0104616461	QUISI PERALTA DIEGO FERNANDO	dquisi@ups.edu.ec	U
9	0103567863	ORDOÑEZ SEGARRA ANDRES ESTEBAN	aordonezs@ups.edu.ec	U
10	0602938284	GARZON VERA BLAS ORLANDO	bgarzon@ups.edu.ec	U
11	1712890514	BENALCAZAR ZAMBRANO GRACE CATALINA	gbenalcazar@ups.edu.ec	U
12	0104198684	ORTIZ GONZALEZ JUAN PAUL	jortizg@ups.edu.ec	U
13	0103593984	SAMANIEGO SAGBAY VICENTE RIGOBERTO	vsamaniego@ups.edu.ec	U
14	0102374287	ORDOÑEZ IDROVO CARLOS ARNULFO	cordonez@ups.edu.ec	U
15	0103292231	TORAL SARMIENTO ADRIANA DE LA NUBE	atoral@ups.edu.ec	U
16	0907691539	SILVA RUALES MEDARDO ANGEL	msilva@ups.edu.ec	U
17	1708328362	ORTIZ TIRADO PABLO XAVIER	portiz@ups.edu.ec	U
18	0502959224	VILLALVA SALGUERO TANIA FRANCISCA	tvillalva@ups.edu.ec	U
19	0102853595	PAEZ CHALCO ITALO DAMIAN	dpaez@ups.edu.ec	U
20	1710493519	GALVAN JARAMILLO JOSE LUIS	jgalvan@ups.edu.ec	U
21	1713782546	CRUZ JARAMILLO PAOLA VERONICA	pcruz@ups.edu.ec	U
22	0102496486	AVILA CAMPOVERDE FREDDY LUIS	favila@ups.edu.ec	U
23	1719832360	PROAÑO CEPEDA DIEGO RICARDO	dproanoc@ups.edu.ec	U
24	0501373831	RIVERA MORENO PABLO ANIBAL	privera@ups.edu.ec	U
25	1712214616	INGAVELEZ GUERRA PAOLA CRISTINA	pcingavelez@ups.edu.ec	U
26	0102485356	SANMARTIN GARCIA BRIGIDA XIMENA	bsanmartin@ups.edu.ec	U
27	1103387203	ROMERO ROMERO JHISON ENRIQUE	jromeror@ups.edu.ec	U
28	1717885675	RUIZ VASQUEZ MONICA	mruiz@ups.edu.ec	U
29	0301320842	MUÑOZ MAINATO MANUEL ENRIQUE	mmunozm@ups.edu.ec	U
30	0104278098	MORQUECHO YUNGA MARIA DEL PILAR	mmorquechoy@ups.edu.ec	U
31	1714353388	MORENO ANDRADE RICARDO ENRIQUE	rmorenoa@ups.edu.ec	U
32	1713392064	ROSAS FLOREZ PATRICIO IVAN	prosas@ups.edu.ec	U
33	0103328027	ARMIJOS CORDERO XAVIER LEONARDO	xarmijos@ups.edu.ec	U
34	0103953188	RIERA PORTOVIEJO VERONICA MARIBEL	vriera@ups.edu.ec	U
35	0102777257	BRAVO QUEZADA OMAR GUSTAVO	obravo@ups.edu.ec	U
36	0103188181	LOPEZ VILLAVICENCIO FREDDY BOLIVAR	flopez@ups.edu.ec	U
37	0702639063	SAGBAY SACAQUIRIN JORGE GIOVANNI	gsagbay@ups.edu.ec	U
38	1707624555	ACOSTA MUNOZ MANOLO	macosta@ups.edu.ec	U
39	1709183261	CARBONELL YONFA ELOISA TERESITA	ecarbonell@ups.edu.ec	U
40	1103455802	SOTO SARANGO ANGEL FERNANDO	asoto@ups.edu.ec	U
41	0102755782	BELTRAN NARVAEZ MIRIAM GIOCONDA	gbeltrann@ups.edu.ec	U
42	0105287726	PLAZA CORDERO ANDREA MARICELA	aplaza@ups.edu.ec	U
43	0104821210	VALLADOLID QUITOISACA JUAN DIEGO	jvalladolid@ups.edu.ec	U
44	1715076061	MOYA RECALDE DANIELA BELEN	dmoya@ups.edu.ec	U
45	0103401956	SANCHEZ SANCHEZ CARLOS FELIPE	csanchez@ups.edu.ec	U
46	1706970561	LEGUIZAMO BOHORQUEZ MARIA ANAIS	mleguizamo@ups.edu.ec	U
47	0301494795	BARRETO CALLE CRISTIAN FERNANDO	cbarreto@ups.edu.ec	U
48	0104431374	URGILES CONTRERAS DIEGO RENE	durgiles@ups.edu.ec	U
49	0103667754	ORTIZ OCHOA MAURICIO SERGIO	mortizo@ups.edu.ec	U
50	0301534582	GUAMAN BUESTAN ADRIANA DEL PILAR	aguaman@ups.edu.ec	U
51	0917728560	MEJIA SUAREZ CARLOS FRANCISCO	cmejia@ups.edu.ec	U
52	0102649241	MOSQUERA CEDILLO XAVIER EFRAIN	xmosquera@ups.edu.ec	U
53	0102972627	TACURI CAPELO BERTHA KATERINE	btacuri@ups.edu.ec	U
54	1711954915	SANCHEZ MONTALVAN SORAYA ELIZABETH	ssanchez@ups.edu.ec	U
55	0102374436	ZUMBA RIVERA RENE FRANCISCO	rzumba@ups.edu.ec	U
56	0104166491	INGA ORTEGA JUAN PAUL	jinga@ups.edu.ec	U
57	0104028303	CABRERA MENDIETA DIEGO ROMAN	dcabrera@ups.edu.ec	U
58	0103659934	PORTILLA FLORES ROBINSON FERNANDO	rportilla@ups.edu.ec	U
59	1711647592	JUMBO GONZALEZ WILLIAM ITALO	wjumbo@ups.edu.ec	U
60	1600251506	GARCIA ITURRALDE ROBERT GERMAN	rgarcia@ups.edu.ec	U
61	1707628796	CARRILLO SALVADOR RONALD GILBERTO	rcarrillo@ups.edu.ec	U
62	0102408978	FLORES VAZQUEZ MARCELO ESTEBAN	mfloresv@ups.edu.ec	U
63	1900268168	CHACON TROYA DIEGO PAUL	dchacon@ups.edu.ec	U
64	0502085335	RUBIO RUBIO WASHINGTON RAMIRO	wrubio@ups.edu.ec	U
65	0103709911	TIMBI SISALIMA CRISTIAN FERNANDO	ctimbi@ups.edu.ec	U
66	1717985830	AUCATOMA GUAMAN LENIN WLADIMIR	laucatoma@ups.edu.ec	U
67	0502785660	LEMA ACOSTA YOLANDA ELIZABETH	ylema@ups.edu.ec	U
68	0701666422	DIAZ SALAZAR HOLGER RODRIGO	hdiaz@ups.edu.ec	U
69	0102537180	SALAMEA PALACIOS CHRISTIAN RAUL	csalamea@ups.edu.ec	U
70	0102120920	QUINTUÑA PADILLA WILSON PATRICIO	wquintuna@ups.edu.ec	U
71	1102007075	CABRERA JIMENEZ FULVIO ELIVAR	fcabreraj@ups.edu.ec	U
72	1714032719	PRIETO VELEZ PATSY MALENA	pprieto@ups.edu.ec	U
73	0104621388	HURTADO ORTIZ REMIGIO ISMAEL	rhurtadoo@ups.edu.ec	U
74	0104207238	YEPEZ ALULEMA JENNIFER ANDREA	jyepez@ups.edu.ec	U
75	0103650891	GARCIA VELEZ ROBERTO AGUSTIN	rgarciav@ups.edu.ec	U
76	0103543658	JARA SALTOS JUAN DIEGO	jjaras@ups.edu.ec	U
77	0151535515	VAZQUEZ SILVA EFREN	evazquez@ups.edu.ec	U
78	0301185229	SACOTO CABRERA ERWIN JAIRO	esacoto@ups.edu.ec	U
79	0102777893	QUINDE FALCONI DIEGO MARCELO	dquinde@ups.edu.ec	U
80	1709402455	FREIRE TIPANGUANO WILLIAM HERIBERTO	wfreiret@ups.edu.ec	U
81	1801620897	LOPEZ NAVARRETE JOSE PATRICIO	jlopezn@ups.edu.ec	U
82	0103771648	BOJORQUE CHASI RODOLFO XAVIER	rbojorque@ups.edu.ec	U
83	1706858451	TERAN PUENTE PABLO RODRIGO	pteran@ups.edu.ec	U
84	1714663760	CUMBAL SIMBA JOSE RENATO	jcumbal@ups.edu.ec	U
85	1712293859	MARCILLO LOPEZ ENITH JAQUELINE	emarcillo@ups.edu.ec	U
86	1705675625	NAVAS RUILOVA GUSTAVO ERNESTO	gnavas@ups.edu.ec	U
87	1718971524	MOYA LOAIZA DIANA PATRICIA	dmoyal@ups.edu.ec	U
88	0300991817	ROBLES BYKBAEV VLADIMIR ESPARTACO	vrobles@ups.edu.ec	U
89	0102151750	RIVERA CALLE FREDY MARCELO	frivera@ups.edu.ec	U
90	1707611271	BLANCO CRUZ LENIN ULLIANOFF	lblanco@ups.edu.ec	U
91	0102135480	VEGA LUNA ANA JULIA	avega@ups.edu.ec	U
92	1713382016	HURTADO LARREA FRANKLIN EDMUNDO	fhurtado@ups.edu.ec	U
93	1717775694	VARGAS JACOME SILVANA LIZETTE	svargas@ups.edu.ec	U
94	0101616670	ALTAMIRANO SANCHEZ JORGE IVAN	jaltamirano@ups.edu.ec	U
95	0103652186	LEON PAREDES GABRIEL ALEJANDRO	gleon@ups.edu.ec	U
96	0102645884	BERMEO MOYANO JUAN PABLO	jbermeo@ups.edu.ec	U
97	0102287190	PARRA GONZALEZ GERMAN ERNESTO	gparra@ups.edu.ec	U
98	0102516457	BARRAGAN ESCANDON EDGAR ANTONIO	ebarragan@ups.edu.ec	U
99	0102137593	URGILES ORTIZ PATRICIO FERNANDO	furgiles@ups.edu.ec	U
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: pablodb
--

COPY public.estudiantes (est_id, est_codigo, est_cedula, est_nombre, est_correo, est_genero) FROM stdin;
1	222638	0105717797	ABAD CASTRO JOSÉ FRANCISCO	jabadc3@est.ups.edu.ec	MASCULINO
2	224717	0105906747	ALVARADO ORTEGA JOHAN ARIEL	jalvaradoo2@est.ups.edu.ec	MASCULINO
3	227435	0302916564	ALVAREZ MIZHIRUMBAY MARCO VINICIO	malvarezm6@est.ups.edu.ec	MASCULINO
4	219896	0107161911	ALVAREZ PICÓN JUAN FERNANDO	jalvarezp6@est.ups.edu.ec	MASCULINO
5	227286	1401262512	AREVALO CARDENAS ABRAHAM MOISES	aarevaloc@est.ups.edu.ec	MASCULINO
6	226969	0150347037	ARPI VANEGAS PAULETTE LILIANA	parpiv@est.ups.edu.ec	FEMENINO
7	56651	0106560204	ASTUDILLO OYERVIDE SANTIAGO MANUEL	sastudilloo@est.ups.edu.ec	MASCULINO
8	225551	0107530735	AVECILLAS MARTINEZ JOSHUE ISRAEL	javecillasm1@est.ups.edu.ec	MASCULINO
9	205878	0302709696	AVILA AVILA JULIO ANDRES	javilaa4@est.ups.edu.ec	MASCULINO
10	228581	0106103658	AVILA CORDERO ERICK LEANDRO	eavilac1@est.ups.edu.ec	MASCULINO
11	224331	0150386555	BARBECHO CAJAMARCA NAYELI GABRIELA	nbarbechoc@est.ups.edu.ec	FEMENINO
12	228980	0106909898	BARRERA CAMACHO FERNANDO DIEGO	fbarrerac@est.ups.edu.ec	MASCULINO
13	224317	0106509961	BARZALLO BUENAÑO MATEO JOSUE	mbarzallob@est.ups.edu.ec	MASCULINO
14	224333	0302507884	CAJAMARCA MOROCHO KEVIN MANUEL	kcajamarcam@est.ups.edu.ec	MASCULINO
15	228079	0106396377	CALDERON ARMIJOS KATHERINE MICHELLE	kcalderona1@est.ups.edu.ec	FEMENINO
16	226912	0107645095	CAPELO CORNEJO CHRISTIAN MATEO	ccapeloc2@est.ups.edu.ec	MASCULINO
17	222893	0106927700	CASTRO MOGROVEJO CAMILO SEBASTIAN	ccastrom6@est.ups.edu.ec	MASCULINO
18	229466	0151690245	CHUQUIPOMA VALLEJOS ALEXANDER RODOLFO	achuquipoma@est.ups.edu.ec	MASCULINO
19	221585	0107207904	CORDOVA RODAS MATEO SEBASTIAN	mcordovar3@est.ups.edu.ec	MASCULINO
20	216614	0150177806	CORONEL CACERES KEVIN ARIEL	kcoronelc@est.ups.edu.ec	MASCULINO
21	227859	0106928385	CORONEL CAMPOVERDE LUIS FERNANDO	lcoronelc2@est.ups.edu.ec	MASCULINO
22	228004	0941354599	CUESTA CUZME PAÚL FABIAN	pcuestac@est.ups.edu.ec	MASCULINO
23	222397	0107621989	CUEVA MONROY JORGE SEBASTIAN	jcuevam3@est.ups.edu.ec	MASCULINO
24	228639	0106194483	CUJI CALDAS JUSTIN WILLIAM	jcujic1@est.ups.edu.ec	MASCULINO
25	224199	0107120032	DELGADO COBOS CHRISTIAN FERNANDO	cdelgadoc2@est.ups.edu.ec	MASCULINO
26	223790	0105630552	DIAZ CAMPOVERDE EDISSON MARCELO	ediazc7@est.ups.edu.ec	MASCULINO
27	225584	0106702319	ERRAEZ QUEZADA ALEX RONALD	aerraezq@est.ups.edu.ec	MASCULINO
28	199003	0106485956	ESPINOZA CAPÓN JONNATHAN JAVIER	jespinozac8@est.ups.edu.ec	MASCULINO
29	220688	1950181733	FAJARDO VAZQUEZ ROBERT LEONEL	rfajardov1@est.ups.edu.ec	MASCULINO
30	217067	0705555266	FEBRESCORDERO NOBLECILLA JOAQUÍN ERASMO	jfebrescordero@est.ups.edu.ec	MASCULINO
31	228616	0302684600	FERNANDEZ SALDAÑA AROON ISAAC	afernandezs2@est.ups.edu.ec	MASCULINO
32	225027	1754306247	FRANCO NAULAGUARI JOHN MICHAEL	jfrancon@est.ups.edu.ec	MASCULINO
33	230123	0302409156	GARCIA GARCIA RICHARD STEVEN	rgarciag1@est.ups.edu.ec	MASCULINO
34	225353	0107254682	GARNICA IÑIGUEZ KEVIN SAUL	kgarnicai@est.ups.edu.ec	MASCULINO
35	222882	0350238192	GARZON GARZON GABRIEL MATEO	ggarzong@est.ups.edu.ec	MASCULINO
36	228340	0106498249	GOMEZ MOSCOSO ALEXIS SEBASTIAN	agomezm12@est.ups.edu.ec	MASCULINO
37	222757	0751017245	GRANDA NOBLECILLA MARLON ELIAS	mgrandan@est.ups.edu.ec	MASCULINO
38	225579	1401296346	HEREDIA CASTRO JOEY ALEJANDRO	jherediac2@est.ups.edu.ec	MASCULINO
39	215098	0107428476	LATA ZAMBRANO  MICHAEL ISRAEL 	mlataz@est.ups.edu.ec	MASCULINO
40	203151	0107040693	LIMA VELE BRYAM ALEJANDRO	blimav@est.ups.edu.ec	MASCULINO
41	219596	0106804487	LITUMA ENRRIQUEZ CARLOS MAURICIO	clitumae@est.ups.edu.ec	MASCULINO
42	228105	0107953663	LOPEZ MACHUCA KEVIN NICOLAS	klopezm7@est.ups.edu.ec	MASCULINO
43	228156	0150538668	LUCERO LOJA ANGEL PATRICIO	alucerol1@est.ups.edu.ec	MASCULINO
44	222885	0151171196	LUCERO REYES JUSTIN MATEO	jluceror@est.ups.edu.ec	MASCULINO
45	226948	0106579873	MAITA LÓPEZ JUAN DAVID	jmaital@est.ups.edu.ec	MASCULINO
46	228692	0106869779	MENDIETA ORTEGA PABLO MATEO	mmendietao1@est.ups.edu.ec	MASCULINO
47	223452	0107062085	MENDOZA BRAVO FABIAN ANDRES	fmendozab@est.ups.edu.ec	MASCULINO
48	229235	0107500290	MENDOZA GAVILANES GEORGE JOSUE	gmendozag@est.ups.edu.ec	MASCULINO
49	227292	0105572713	MERCHAN PINDUISACA ANDRES ALEJANDRO	amerchanp3@est.ups.edu.ec	MASCULINO
50	229449	0106784374	MOGROVEJO BERREZUETA CARLOS JAVIER	cmogrovejob1@est.ups.edu.ec	MASCULINO
51	228890	0106450745	MONTAÑO GUAYARA ERICK GRAYEB	emontanog@est.ups.edu.ec	MASCULINO
52	224206	0302259890	MORENO TENEMASA JOHN ISMAEL	jmorenot1@est.ups.edu.ec	MASCULINO
53	228262	0106017056	MUY ANGAMARCA EDISON MICHAEL	emuya@est.ups.edu.ec	MASCULINO
54	69061	0104825864	MUY LANDI KLEBER OSWALDO	kmuy@est.ups.edu.ec	MASCULINO
55	228426	0107548984	NARVAEZ UCHO JOSEPH PAUL	jnarvaezu@est.ups.edu.ec	MASCULINO
56	229147	0303149603	NASPUD VIVAR PAUL SEBASTIAN	pnaspudv@est.ups.edu.ec	MASCULINO
57	224491	0107549040	NIEVES TACURI DANIEL FABRICIO	dnievest@est.ups.edu.ec	MASCULINO
58	229138	0150643708	ORELLANA FLORES MATEO SEBASTIAN	morellana1@est.ups.edu.ec	MASCULINO
59	227025	0107958902	ORTIZ TAMAYO JOSUÉ DAMIÁN	jortizt5@est.ups.edu.ec	MASCULINO
60	225527	0106939622	OTAVALO PULLA JUAN ISMAEL	jotavalop@est.ups.edu.ec	MASCULINO
61	224875	0302791082	PACHECO CAMPOVERDE KEVIN JOSÉ	kpachecoc4@est.ups.edu.ec	MASCULINO
62	223256	0106981731	PEÑA PIURI SOFIA ALEJANDRA	spenap1@est.ups.edu.ec	FEMENINO
63	224387	0107018095	PERALTA PERALTA DIEGO FELIPE	dperaltap2@est.ups.edu.ec	MASCULINO
64	161891	0105446157	PINTADO PAUTA BRYAN DANILO	bpintadop@est.ups.edu.ec	MASCULINO
65	224503	0107842296	PIÑA GARZON ANTHONY DAMIAN	apinag1@est.ups.edu.ec	MASCULINO
66	230021	0107195166	PORTILLO BERREZUETA ERICK JOHAN	eportillo@est.ups.edu.ec	MASCULINO
67	223449	0106139223	QUITO LEON KAREN STEPHANY	kquitol@est.ups.edu.ec	FEMENINO
68	214009	0105334791	QUIZHPI GUERRERO MARIO STEVEN	mquizhpig1@est.ups.edu.ec	MASCULINO
69	227487	0302765771	RAMIREZ SAETEROS JENNYFER CAMILA	jramirezs11@est.ups.edu.ec	FEMENINO
70	226534	0105579445	RAMON MOROCHO CINTHYA CATALINA	cramonm1@est.ups.edu.ec	FEMENINO
71	228166	0106928880	RAMON PINTADO BRYAN FERNANDO	bramonp1@est.ups.edu.ec	MASCULINO
72	228383	0107202236	RIVAS SANTUR DANIEL ALEXANDER	drivass@est.ups.edu.ec	MASCULINO
73	224615	0107527228	RODRÍGUEZ CORDERO JUAN ALEJANDRO	jrodriguezc28@est.ups.edu.ec	MASCULINO
74	226605	0151123460	ROSILLO VEGA ANTHONY ISRAEL	arosillov@est.ups.edu.ec	MASCULINO
75	223800	0151252749	SAGBAICELA PAUTA JENNIFER CAMILA	jsagbaicelap@est.ups.edu.ec	FEMENINO
76	217114	0150137305	SALINAS OTAVALO ERICK ANDRES	esalinaso@est.ups.edu.ec	MASCULINO
77	134213	0706615499	SARANGO MONCAYO LUIS AARON	lsarangom@est.ups.edu.ec	MASCULINO
78	229960	0150689735	SARMIENTO LLIVISACA CARLOS ISMAEL	csarmientol@est.ups.edu.ec	MASCULINO
79	230347	0105638027	SEGARRA ORTIZ JOHNNY DAVID	jsegarrao1@est.ups.edu.ec	MASCULINO
80	226525	0106664741	SOLORZANO MORA JOSE MATEO	jsolorzanom7@est.ups.edu.ec	MASCULINO
81	227407	0107579005	SUMBA ILLISACA KLEVER MESIAS	ksumbai@est.ups.edu.ec	MASCULINO
82	222883	0106024516	SUQUILANDA QUILLI SAMANTHA MICAELA	ssuquilanda@est.ups.edu.ec	FEMENINO
83	225689	0107394637	TACURI REINOSO JHONATAN FABRICIO	jtacurir1@est.ups.edu.ec	MASCULINO
84	225486	0302898267	TACURI TACURI CRISTOPHER BENJAMIN	ctacurit1@est.ups.edu.ec	MASCULINO
85	229416	0107974024	TENECOTA QUILLI JOSSELINE MARLENE	jtenecotaq@est.ups.edu.ec	FEMENINO
86	223402	0750625717	VALAREZO VILLALTA JEAN PIERRE	jvalarezov@est.ups.edu.ec	MASCULINO
87	227843	0150545556	VARGAS CEDILLO DAVID ISMEL	dvargasc2@est.ups.edu.ec	MASCULINO
88	225630	0107210817	VASQUEZ BARRERA ALAN JOSUE	avasquezb4@est.ups.edu.ec	MASCULINO
89	222501	0106070121	VILLA HERNANDEZ ELIAN DAVID 	evillah@est.ups.edu.ec	MASCULINO
90	225569	0106411937	VILLA QUISHPI ERIKA CRISTINA	evillaq1@est.ups.edu.ec	FEMENINO
91	226900	0107586562	WELLESLEY MARTINEZ JOSEPH	jwellesley@est.ups.edu.ec	MASCULINO
92	226866	0107019721	YUQUI GUAMAN RICHARD SEBASTIAN	ryuqui@est.ups.edu.ec	MASCULINO
93	228831	0105887988	ZAVALA EGÜEZ JOAQUIN NICOLAS	jzavalae@est.ups.edu.ec	MASCULINO
94	183496	0705640969	ABAD FREIRE ANDY FABRICIO	aabadf@est.ups.edu.ec	MASCULINO
95	206212	0105274955	ALVARADO SUCONOTA  JUAN PABLO 	jalvarados8@est.ups.edu.ec	MASCULINO
96	213481	0150517241	ARCE MALDONADO EDUARDO PAUL	earcem1@est.ups.edu.ec	MASCULINO
97	216585	0150389120	BACUILIMA PIÑA ALEJANDRO SEBASTIÁN	abacuilimap@est.ups.edu.ec	MASCULINO
98	218970	0706684271	BENAVIDES ERIQUE ANTHONY ALEXANDER	abenavidese@est.ups.edu.ec	MASCULINO
99	213488	0350026837	CAJAMARCA CARANGUI MARCO ANTONIO	mcajamarcac2@est.ups.edu.ec	MASCULINO
100	201232	0107951170	CAMPOVERDE CARPIO OSCAR ADRIAN	ocampoverdec1@est.ups.edu.ec	MASCULINO
101	188554	0105206221	CEDILLO MEJIA DIEGO FERNANDO	dcedillom@est.ups.edu.ec	MASCULINO
102	208677	0107196156	CHUCHO VELESACA LUIS GUSTAVO	lchucho@est.ups.edu.ec	MASCULINO
103	180153	0107301665	CHUQUI GUAMAN  MARTHA MARICELA	mchuquig1@est.ups.edu.ec	FEMENINO
104	217207	0106785678	CORDOVA CARRIÓN ESTEBAN ALEXANDER	ecordovac3@est.ups.edu.ec	MASCULINO
105	163218	0107282642	CORNEJO PICON JUAN MARCELO	jcornejop@est.ups.edu.ec	MASCULINO
106	209576	0750170573	CORONEL MONTALVAN  JONNATHAN ALEXANDER	jcoronelm1@est.ups.edu.ec	MASCULINO
107	215815	0105894471	FERNANDEZ LATA JUAN CARLOS	jlataf@est.ups.edu.ec	MASCULINO
108	217260	0106130693	GALLEGO DELEG TATIANA GABRIELA	tgallego@est.ups.edu.ec	FEMENINO
109	218816	1401070857	GRANDA LÓPEZ HENRY AUGUSTO	hgrandal@est.ups.edu.ec	MASCULINO
110	219261	0705999365	LLIVICHUSHCA CORDOVA JOSÉ ANDRÉS	jllivichushca@est.ups.edu.ec	MASCULINO
111	219240	1729635019	MARQUEZ CHAVEZ JORGE ESTEBAN	jmarquezc2@est.ups.edu.ec	MASCULINO
112	221453	1725618886	MARQUEZ JIMENEZ PABLO ANDRES	pmarquezj@est.ups.edu.ec	MASCULINO
113	190864	0106176936	MEJIA MEJIA DANNY FRANCISCO	dmejiam1@est.ups.edu.ec	MASCULINO
114	208722	0106513153	MEJIA MOROCHO BRYAM ANDRÉS	bmejiam@est.ups.edu.ec	MASCULINO
115	215761	0350227724	MOYANO IDROVO MIGUEL EDUARDO	mmoyanoi@est.ups.edu.ec	MASCULINO
116	221375	0150267631	PERALTA NAVARRO BRYAM JESUS	bperaltan@est.ups.edu.ec	MASCULINO
117	207946	0150921369	QUEZADA VILLA JUAN ANDRES	jquezadav5@est.ups.edu.ec	MASCULINO
118	220387	0705761237	ROMERO ARMIJOS JORDY JASMANY	jromeroa5@est.ups.edu.ec	MASCULINO
119	220489	0706623873	ROMERO TORRES ROBERTO ALEJANRO	rromerot1@est.ups.edu.ec	MASCULINO
120	220990	0750192635	VEGA ORTIZ LEANDRO FRANCISCO	lvegao@est.ups.edu.ec	MASCULINO
121	176560	0150634905	VIÑANZACA SUMBA JAIME ANDRES	jvinanzacas@est.ups.edu.ec	MASCULINO
122	221440	0706656188	ZHIGUE GRANDA ERICK FERNANDO	ezhigue@est.ups.edu.ec	MASCULINO
123	217380	0350150959	ZUMBA ENRIQUEZ JENNIFER ALEXANDRA	jzumbae@est.ups.edu.ec	FEMENINO
124	217240	0106671662	ALVARADO ORELLANA DAVID FERNANDO	dalvaradoo2@est.ups.edu.ec	MASCULINO
125	66027	0302829957	AMENDAÑO QUIZHPI EDISON PATRICIO	eamendanoq@est.ups.edu.ec	MASCULINO
126	215698	0106966393	AVILA GUARANGO BRYAN ISMAEL	bavilag@est.ups.edu.ec	MASCULINO
127	217267	0107956088	BRAVO QUEZADA PABLO ANDRES	pbravoq@est.ups.edu.ec	MASCULINO
128	216639	0106824667	CARRION PORTILLA DIEGO ANDRES	dcarrionp@est.ups.edu.ec	MASCULINO
129	217091	0106121221	CHABLA MUÑOZ ANDRES PAUL	achabla@est.ups.edu.ec	MASCULINO
130	217843	0107193708	COLLAGUAZO MALLA DANIEL ALFREDO	dcollaguazom1@est.ups.edu.ec	MASCULINO
131	188325	0106333966	CONTRERAS ZHAGUI ERIKA NATALIA 	econtrerasz@est.ups.edu.ec	FEMENINO
132	208050	0106674526	CORAISACA LOJANO JUAN CARLOS	jcoraisaca1@est.ups.edu.ec	MASCULINO
133	217004	0151118122	CORDOVA SOTOMAYOR EZEQUIEL	ecordovas1@est.ups.edu.ec	MASCULINO
134	217161	0150943777	GUAPISACA AREVALO FRANKLIN ANDRES	fguapisaca@est.ups.edu.ec	MASCULINO
135	191025	0106306061	JAPA ENCALADA KEVIN VLADIMIR	kjapa@est.ups.edu.ec	MASCULINO
136	213648	0302321013	LITUMA TERAN JORGE CRISTOBAL	jlitumat@est.ups.edu.ec	MASCULINO
137	213791	0107323180	LOJA ALVARRASIN DIEGO ARMANDO	dlojaa1@est.ups.edu.ec	MASCULINO
138	216573	0106276686	MOROCHO REMACHE KEVIN ANDRES	kmorochor1@est.ups.edu.ec	MASCULINO
139	216329	0107486292	MOYA OCHOA ANTHONY JOEL	amoyao1@est.ups.edu.ec	MASCULINO
140	217271	0303128672	PAÑORA URUCHIMA JEISON FABIAN	jpanora@est.ups.edu.ec	MASCULINO
141	212862	1105919169	PARDO CAMBIZACA SAMUEL ALEJANDRO	spardoc@est.ups.edu.ec	MASCULINO
142	216270	0151166725	PAUTE CHALCO EDWIN PAUL	epautec@est.ups.edu.ec	MASCULINO
143	190022	0104805015	PINTADO CHUQUIMARCA EDISSON FERNANDO	epintadoc1@est.ups.edu.ec	MASCULINO
144	216097	0150233930	REDROVAN CHIQUI ROBINSON ABEL	rredrovanc@est.ups.edu.ec	MASCULINO
145	198780	1150704672	SALAZAR CARRION JAIRO ALEXANDER	jsalazarc10@est.ups.edu.ec	MASCULINO
146	161300	1106002213	SANCHEZ RODRIGUEZ JOSE FERNANDO	jsanchezr6@est.ups.edu.ec	MASCULINO
147	217452	0106764830	SIGUA CALLE PAÚL MATEO	psigua@est.ups.edu.ec	MASCULINO
148	212854	0106458862	TACURI DELGADO HENRY SANTIAGO	htacurid@est.ups.edu.ec	MASCULINO
149	220643	0105922587	TAPIA VASQUEZ JUAN DIEGO	jtapiav4@est.ups.edu.ec	MASCULINO
150	217963	0106425069	TIGRE BARRETO WILMER PATRICIO	wtigreb@est.ups.edu.ec	MASCULINO
151	217960	0302447347	UZHCA CAJAMARCA JUAN DAVID	juzhcac@est.ups.edu.ec	MASCULINO
152	219159	0150326320	VILLALTA HEREDIA JOSE MIGUEL	jvillaltah@est.ups.edu.ec	MASCULINO
153	213271	1752773521	YANZA CACERES DANIEL BRIAN	dyanza1@est.ups.edu.ec	MASCULINO
154	198576	0302448642	ANDRADE ALULEMA JUAN SEBASTIAN	jandradea9@est.ups.edu.ec	MASCULINO
155	214262	0107061053	ASTUDILLO CALLE PAUL ANDRES	pastudilloc1@est.ups.edu.ec	MASCULINO
156	141874	0107083511	AYAVACA GUARANGO NOE LEANDRO	nayavaca@est.ups.edu.ec	MASCULINO
157	144027	0104791447	CHICAIZA GUAMAN BRYAN SANTIAGO	bchicaizag@est.ups.edu.ec	MASCULINO
158	166095	1717273401	DELGADO IBUJES  DOMENIKA SOFIA	ddelgadoi@est.ups.edu.ec	FEMENINO
159	198540	0150706216	GUACHUN GUAMAN BRYAM FERNANDO	bguachung@est.ups.edu.ec	MASCULINO
160	198954	0106029085	GUAMÁN TORRES SEBASTIÁN FRANCISCO	sguamant2@est.ups.edu.ec	MASCULINO
161	189894	0106717671	LOJANO GUZMAN TANIA LILIBETH	tlojano@est.ups.edu.ec	FEMENINO
162	177082	0105908230	LOPEZ ARIZAGA ADRIAN BERNARDO	alopeza9@est.ups.edu.ec	MASCULINO
163	203978	1400730618	MASHINGASHI UNKUCH KAAR JOSEPH	kmashingashi@est.ups.edu.ec	MASCULINO
164	190368	0105947097	MOLINA ARPI KEVIN ISMAEL	kmolinaa@est.ups.edu.ec	MASCULINO
165	193406	1450170350	NANKAMAI TSUINK IRAR CRISTIAN	inankamai@est.ups.edu.ec	MASCULINO
166	206314	0106721962	ORELLANA ORDOÑEZ PEDRO XAVIER	porellanao@est.ups.edu.ec	MASCULINO
167	198445	0106585342	PADILLA VIÑANZACA BLANCA LISSETH	bpadillav2@est.ups.edu.ec	FEMENINO
168	198946	3050131980	PALTIN GUZMAN KELLY DENISE	kpaltin@est.ups.edu.ec	FEMENINO
169	204755	0107438921	PARRAGA RIERA  KARLA MICHELLE	kparragar@est.ups.edu.ec	FEMENINO
170	198600	0105322291	PERALTA RUBIO DANNY SEBASTIAN	dperaltar2@est.ups.edu.ec	MASCULINO
171	183319	0106593387	PESANTEZ CORONEL MARCO SEBASTIAN	mpesantezc3@est.ups.edu.ec	MASCULINO
172	201940	0150973543	PULLA SÁNCHEZ ANTHONY DAMIÁN	apullas1@est.ups.edu.ec	MASCULINO
173	202691	0106418916	QUIZHPI FAJARDO JUAN FRANCISCO	jquizhpif1@est.ups.edu.ec	MASCULINO
174	205511	0302324652	SAYAGO GARCIA JORGE LUIS	jsayagog@est.ups.edu.ec	MASCULINO
175	187421	0104760517	TOLEDO TORRES MARTIN SEBASTIAN 	mtoledot1@est.ups.edu.ec	MASCULINO
176	205919	0302142641	VERDUGO SIGUENCIA ERICK ISMAEL	everdugos@est.ups.edu.ec	MASCULINO
177	198580	0107300469	ALBA NARVÁEZ LUIS ANDRÉS	lalba@est.ups.edu.ec	MASCULINO
178	195378	0150105039	AZUERO AMBROSI PAULINA ELIZABETH	pazuero@est.ups.edu.ec	FEMENINO
179	206329	0106467251	BUESTAN VILLA CHRISTIAN MAURICIO	cbuestanv@est.ups.edu.ec	MASCULINO
180	198077	1105227464	CRESPO SARANGO LEONARDO ANDRES	lcrespos@est.ups.edu.ec	MASCULINO
181	51229	0105793780	CURILLO CASTILLO JIMMY SEBASTIAN	jcurilloc@est.ups.edu.ec	MASCULINO
182	160299	0106113632	DUTAN SANCHEZ DAVID GUSTAVO 	ddutans@est.ups.edu.ec	MASCULINO
183	174848	0105995948	PORTOVIEJO PEREZ CHRISTIAN PAUL	cportoviejo@est.ups.edu.ec	MASCULINO
184	152167	0706740610	RAMIREZ CAJAMARCA JOSE ANDRE	jramirezc9@est.ups.edu.ec	MASCULINO
185	206091	0302885306	SAICO GUARTAN CARLOS FERNANDO	csaico@est.ups.edu.ec	MASCULINO
186	194855	0150392744	SALDAÑA TORRES JUAN PABLO	jsaldanat1@est.ups.edu.ec	MASCULINO
187	195474	0106182488	SANMARTIN QUITUISACA JOHN ANDRES	jsanmartinq1@est.ups.edu.ec	MASCULINO
188	206289	0150095974	TORRES CORDERO SANTIAGO MATEO	storresc3@est.ups.edu.ec	MASCULINO
189	191437	0150874915	ALVAREZ VALDEZ MICHAEL ANDRES	malvarezv1@est.ups.edu.ec	MASCULINO
190	189422	0150683746	CABRERA ARIAS JORGE SANTIAGO	jcabreraa7@est.ups.edu.ec	MASCULINO
191	166038	0107551012	CONDOR PADILLA CARLOS SEBASTIAN	ccondorp@est.ups.edu.ec	MASCULINO
192	187024	0105940282	CORDOVA CALLE JUAN JOSE	jcordovac8@est.ups.edu.ec	MASCULINO
193	177489	0107480840	JAPON CHAVEZ CHRISTIAN ABEL	cjaponc@est.ups.edu.ec	MASCULINO
194	196155	0150628949	LLIVICOTA LEON JOHN SANTIAGO	jllivicotal@est.ups.edu.ec	MASCULINO
195	153058	0107233207	MERCHAN CHICAIZA WILMER PATRICIO	wmerchanc1@est.ups.edu.ec	MASCULINO
196	172988	0150037661	NOVILLO QUINDE ESTEBAN GUSTAVO	enovilloq@est.ups.edu.ec	MASCULINO
197	189203	0105829246	ORTEGA SEGARRA NELSON PAUL	nortegas1@est.ups.edu.ec	MASCULINO
198	186611	0105524581	PACHECO ARIZAGA MARCOS JAVIER	mpachecoa2@est.ups.edu.ec	MASCULINO
199	190999	0105468060	PACHECO QUITO CARLOS MARCELO	cpachecoq@est.ups.edu.ec	MASCULINO
200	176579	0104991419	ANDRADE PEREZ RONALD PAUL	randradep1@est.ups.edu.ec	MASCULINO
201	189069	0105944110	AVILA FAICAN ROMEL ANGEL	ravilaf1@est.ups.edu.ec	MASCULINO
202	189205	0150550200	CABRERA BERMEO EDITH ANAHI	ecabrerab1@est.ups.edu.ec	FEMENINO
203	161936	0106137680	CALLE TIRADO  SEGUNDO ROLANDO	scallet@est.ups.edu.ec	MASCULINO
204	190128	0150019453	DUTAN SANCHEZ DENYS ADRIAN 	ddutans1@est.ups.edu.ec	MASCULINO
205	187560	0107304966	FAREZ VILLA  JOHN XAVIER	jfarezv@est.ups.edu.ec	MASCULINO
206	155118	0105295786	GUAMANI CORDERO  EDISSON GERARDO	eguamanic@est.ups.edu.ec	MASCULINO
207	51543	0106420763	IDROVO BERREZUETA PAUL SEBASTIAN	pidrovob@est.ups.edu.ec	MASCULINO
208	187158	0106836976	JARA GAVILANES ADOLFO SEBASTIAN	ajarag2@est.ups.edu.ec	MASCULINO
209	177653	0150364081	LOPEZ GOMEZ ESTEBAN DANIEL	elopezg5@est.ups.edu.ec	MASCULINO
210	152722	0104935606	MATUTE ARGUDO  JANNETH EUFEMIA	jmatutea1@est.ups.edu.ec	FEMENINO
211	153626	0302915277	MOROCHO YUQUILEMA  JONNATHAN ISRAEL 	jmorochoy2@est.ups.edu.ec	MASCULINO
212	188439	0107543027	PARRA ZAMBRANO BRYAM EDUARDO	bparraz@est.ups.edu.ec	MASCULINO
213	191719	0106040173	UYAGUARI RAMON SEBASTIAN ROBERTO	suyaguarir@est.ups.edu.ec	MASCULINO
214	191398	0302610076	VAZQUEZ CALLE ARIEL RENATO	avazquezc2@est.ups.edu.ec	MASCULINO
215	176016	0106256027	ANGAMARCA ZHICAY EDWIN ADRIAN	eangamarcaz@est.ups.edu.ec	MASCULINO
216	169841	0106073331	AYORA OCHOA EDUARDO ANTONIO	aayorao@est.ups.edu.ec	MASCULINO
217	151334	0302882725	BONI  LEMA  JUAN ALBERTO	jbonil@est.ups.edu.ec	MASCULINO
218	163017	0107593873	BRAVO VALDIVIEZO CARMEN ALEXANDRA	cbravov1@est.ups.edu.ec	FEMENINO
219	175629	0106487846	CABRERA BERMEO LUIS ADRIAN	lcabrerab@est.ups.edu.ec	MASCULINO
220	162379	0105824460	CAMPOVERDE CABRERA WALTER VINICIO	wcampoverdec1@est.ups.edu.ec	MASCULINO
221	182613	0105723605	LEMA JARAMILLO TONNY ROGER	tlemaj1@est.ups.edu.ec	MASCULINO
222	160796	0106993835	LEON TENESACA DARWIN FERNANDO	dleont@est.ups.edu.ec	MASCULINO
223	177352	0105589360	LOJA AVILA ELVIS MARTIN	elojaa@est.ups.edu.ec	MASCULINO
224	175950	0106336548	MAISINCHO PANJON JOHNNY MARTIN	jmaisinchop@est.ups.edu.ec	MASCULINO
225	175372	1721227179	PINARGO OÑA DANIEL FERNANDO	dpinargo@est.ups.edu.ec	MASCULINO
226	55975	0301681748	QUINDE DELGADO JOSE GUILLERMO	jquinded@est.ups.edu.ec	MASCULINO
227	177762	0106268337	SALINAS JARA EDISSON ADRIAN	esalinasj@est.ups.edu.ec	MASCULINO
228	26591	1400789721	SAMANIEGO CALLE MIGUEL ANGEL	msamaniegoc1@est.ups.edu.ec	MASCULINO
229	54311	0107128100	SANCHEZ GUZMAN IVAN ROLANDO	isanchezg1@est.ups.edu.ec	MASCULINO
230	170138	0106620255	TAPIA VIDAL  JOSE LUIS	jtapiav2@est.ups.edu.ec	MASCULINO
231	147987	0106309297	ASTUDILLO PUGO BRAULIO CESAR	bastudillop1@est.ups.edu.ec	MASCULINO
232	178651	0106044894	BARZALLO ESPINOZA  KEVIN XAVIER	kbarzalloe@est.ups.edu.ec	MASCULINO
233	177498	0106481914	BEDOYA ORTEGA  MANUEL SEBASTIAN 	mbedoyao@est.ups.edu.ec	MASCULINO
234	176764	0105891709	CARDENAS ARICHABALA TRACY ROCIO	tcardenasa@est.ups.edu.ec	FEMENINO
235	152370	0302306915	CHABLA PALAGUACHI WILLIAN EDUARDO 	wchabla@est.ups.edu.ec	MASCULINO
236	161645	0107317083	CHAVEZ CHAMORRO EDUARDO ISAAC	echavezc2@est.ups.edu.ec	MASCULINO
237	134070	0104964895	CHIQUI CORAIZACA JOHN HENRY	jchiquic@est.ups.edu.ec	MASCULINO
238	151370	0105585525	CORNEJO BRAVO LUIS DAVID	lcornejob@est.ups.edu.ec	MASCULINO
239	151045	0106662158	GUAMAN FAJARDO HENRY ISRAEL	hguamanf@est.ups.edu.ec	MASCULINO
240	176135	0106024490	GUZHÑAY LEMA PAUL ESTEBAN	pguzhnay@est.ups.edu.ec	MASCULINO
241	152681	0107080616	MENDEZ TENECORA BRYAN ANDRES 	bmendezt@est.ups.edu.ec	MASCULINO
242	149580	0954428827	MENDIETA MOLINA WILLAN STEVEN	wmendietam@est.ups.edu.ec	MASCULINO
243	179349	0105776389	NEIRA MALDONADO PEDRO JOSUE	pneiram1@est.ups.edu.ec	MASCULINO
244	152602	0350005310	PAGUAY PALAGUACHI LUIS  DAVID	lpaguayp1@est.ups.edu.ec	MASCULINO
245	152515	0105165542	PIZARRO ROMERO JORGE VINICIO	jpizarror@est.ups.edu.ec	MASCULINO
246	164285	0105599823	REINOSO VILLA JOSEPH NICOLAS 	jreinosov@est.ups.edu.ec	MASCULINO
247	166200	0302306543	VASQUEZ SALDAÑA BYRON SIMON	bvasquezs@est.ups.edu.ec	MASCULINO
248	178217	1401063217	YUNGA YUNGA DANNY GUSTAVO	dyungay@est.ups.edu.ec	MASCULINO
249	128397	0105296313	DURAZNO DOMINGUEZ TITO MARCELO	tdurazno@est.ups.edu.ec	MASCULINO
250	151712	0105401822	DURAZNO ZAPATANGA WILMER JOHN	wduraznoz@est.ups.edu.ec	MASCULINO
251	167241	0107377020	GODOY TENESACA BYRON ALEJANDRO	bgodoyt@est.ups.edu.ec	MASCULINO
252	152823	3050459621	ORELLANA CARPIO MARK DANIEL	morellanac5@est.ups.edu.ec	MASCULINO
253	163389	0104700844	VINTIMILLA CAÑIZARES DOMENICA FERNANDA	dvintimillac1@est.ups.edu.ec	FEMENINO
\.


--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: pablodb
--

COPY public.grupos (grp_id, grp_nombre, grp_habilitado, grp_asi_id, grp_doc_id) FROM stdin;
1	GRUPO - 15	t	1	1
2	GRUPO - 9	t	2	2
3	GRUPO - 16	t	3	3
4	GRUPO - 9	t	4	4
5	GRUPO - 2	t	5	5
6	GRUPO - 8	t	4	6
7	GRUPO - 37	t	1	1
8	GRUPO - 10	t	5	5
9	GRUPO - 28	t	3	7
10	GRUPO - 29	t	1	1
11	GRUPO - 4	t	3	7
12	GRUPO - 1	t	5	8
13	GRUPO - 12	t	3	7
14	GRUPO - 8	t	2	9
15	GRUPO - 28	t	1	10
16	GRUPO - 18	t	1	1
17	GRUPO - 8	t	1	11
18	GRUPO - 2	t	6	12
19	GRUPO - 14	t	3	13
20	GRUPO - 25	t	1	14
21	GRUPO - 9	t	1	1
22	GRUPO - 53	t	1	15
23	GRUPO - 4	t	1	15
24	GRUPO - 15	t	3	16
25	GRUPO - 34	t	1	17
26	GRUPO - 48	t	1	18
27	GRUPO - 13	t	3	19
28	GRUPO - 49	t	1	20
29	GRUPO - 2	t	1	21
30	GRUPO - 4	t	5	22
31	GRUPO - 50	t	1	23
32	GRUPO - 45	t	7	24
33	GRUPO - 9	t	5	25
34	GRUPO - 35	t	1	26
35	GRUPO - 16	t	4	27
36	GRUPO - 17	t	1	28
37	GRUPO - 32	t	3	29
38	GRUPO - 12	t	5	30
39	GRUPO - 16	t	1	14
40	GRUPO - 51	t	1	31
41	GRUPO - 1	t	1	15
42	GRUPO - 14	t	1	32
43	GRUPO - 16	t	2	33
44	GRUPO - 37	t	3	34
45	GRUPO - 17	t	2	35
46	GRUPO - 27	t	3	36
47	GRUPO - 1	t	6	37
48	GRUPO - 40	t	7	38
49	GRUPO - 47	t	1	11
50	GRUPO - 3	t	5	22
51	GRUPO - 19	t	2	37
52	GRUPO - 42	t	1	39
53	GRUPO - 20	t	4	40
54	GRUPO - 7	t	1	41
55	GRUPO - 45	t	1	39
56	GRUPO - 3	t	4	4
57	GRUPO - 10	t	3	36
58	GRUPO - 32	t	1	21
59	GRUPO - 1	t	8	42
60	GRUPO - 4	t	9	43
61	GRUPO - 43	t	1	39
62	GRUPO - 52	t	1	31
63	GRUPO - 41	t	1	39
64	GRUPO - 11	t	1	21
65	GRUPO - 19	t	4	33
66	GRUPO - 3	t	1	21
67	GRUPO - 24	t	1	44
68	GRUPO - 2	t	7	38
69	GRUPO - 19	t	1	14
70	GRUPO - 10	t	4	27
71	GRUPO - 6	t	2	45
72	GRUPO - 12	t	1	32
73	GRUPO - 39	t	1	44
74	GRUPO - 38	t	1	21
75	GRUPO - 33	t	3	46
76	GRUPO - 3	t	7	47
77	GRUPO - 36	t	1	44
78	GRUPO - 15	t	4	48
79	GRUPO - 15	t	2	30
80	GRUPO - 30	t	7	3
81	GRUPO - 30	t	1	21
82	GRUPO - 35	t	3	7
83	GRUPO - 24	t	3	3
84	GRUPO - 1	t	10	42
85	GRUPO - 2	t	11	49
86	GRUPO - 29	t	7	38
87	GRUPO - 2	t	12	40
88	GRUPO - 2	t	2	50
89	GRUPO - 41	t	3	36
90	GRUPO - 27	t	1	28
91	GRUPO - 11	t	3	36
92	GRUPO - 5	t	4	2
93	GRUPO - 6	t	4	40
94	GRUPO - 7	t	7	51
95	GRUPO - 6	t	13	52
96	GRUPO - 22	t	3	34
97	GRUPO - 1	t	14	53
98	GRUPO - 1	t	13	52
99	GRUPO - 16	t	15	54
100	GRUPO - 11	t	9	55
101	GRUPO - 7	t	13	56
102	GRUPO - 1	t	11	57
103	GRUPO - 2	t	13	58
104	GRUPO - 31	t	7	59
105	GRUPO - 28	t	7	38
106	GRUPO - 3	t	13	48
107	GRUPO - 12	t	15	60
108	GRUPO - 39	t	15	61
109	GRUPO - 38	t	7	24
110	GRUPO - 43	t	15	51
111	GRUPO - 5	t	13	27
112	GRUPO - 1	t	16	62
113	GRUPO - 9	t	12	33
114	GRUPO - 26	t	7	24
115	GRUPO - 3	t	12	63
116	GRUPO - 8	t	15	61
117	GRUPO - 3	t	6	12
118	GRUPO - 34	t	15	64
119	GRUPO - 15	t	7	3
120	GRUPO - 41	t	7	38
121	GRUPO - 6	t	12	40
122	GRUPO - 4	t	12	33
123	GRUPO - 1	t	17	65
124	GRUPO - 2	t	9	55
125	GRUPO - 1	t	18	62
126	GRUPO - 5	t	19	66
127	GRUPO - 2	t	20	67
128	GRUPO - 33	t	7	46
129	GRUPO - 25	t	7	24
130	GRUPO - 44	t	7	59
131	GRUPO - 21	t	15	47
132	GRUPO - 38	t	15	68
133	GRUPO - 14	t	21	13
134	GRUPO - 5	t	22	69
135	GRUPO - 2	t	23	37
136	GRUPO - 19	t	15	51
137	GRUPO - 1	t	9	70
138	GRUPO - 28	t	21	71
139	GRUPO - 1	t	24	72
140	GRUPO - 1	t	25	73
141	GRUPO - 1	t	26	73
142	GRUPO - 3	t	15	47
143	GRUPO - 28	t	15	54
144	GRUPO - 17	t	15	54
145	GRUPO - 20	t	15	51
146	GRUPO - 1	t	27	74
147	GRUPO - 24	t	21	71
148	GRUPO - 1	t	28	53
149	GRUPO - 1	t	23	75
150	GRUPO - 7	t	21	13
151	GRUPO - 27	t	15	36
152	GRUPO - 3	t	21	13
153	GRUPO - 23	t	15	64
154	GRUPO - 24	t	15	46
155	GRUPO - 2	t	29	76
156	GRUPO - 6	t	19	77
157	GRUPO - 29	t	20	67
158	GRUPO - 41	t	15	59
159	GRUPO - 35	t	15	54
160	GRUPO - 8	t	12	58
161	GRUPO - 1	t	29	78
162	GRUPO - 2	t	24	79
163	GRUPO - 2	t	19	77
164	GRUPO - 22	t	20	80
165	GRUPO - 2	t	22	75
166	GRUPO - 29	t	21	64
167	GRUPO - 21	t	21	81
168	GRUPO - 1	t	30	82
169	GRUPO - 25	t	20	83
170	GRUPO - 3	t	19	84
171	GRUPO - 4	t	19	77
172	GRUPO - 23	t	20	80
173	GRUPO - 27	t	21	51
174	GRUPO - 27	t	20	83
175	GRUPO - 26	t	20	83
176	GRUPO - 11	t	31	85
177	GRUPO - 22	t	21	16
178	GRUPO - 1	t	22	75
179	GRUPO - 20	t	20	80
180	GRUPO - 1	t	32	65
181	GRUPO - 1	t	33	75
182	GRUPO - 8	t	20	67
183	GRUPO - 1	t	19	86
184	GRUPO - 16	t	20	80
185	GRUPO - 10	t	31	87
186	GRUPO - 1	t	34	75
187	GRUPO - 1	t	35	73
188	GRUPO - 1	t	36	88
189	GRUPO - 9	t	31	85
190	GRUPO - 6	t	31	89
191	GRUPO - 5	t	37	90
192	GRUPO - 1	t	38	82
193	GRUPO - 1	t	39	65
194	GRUPO - 1	t	40	75
195	GRUPO - 1	t	41	88
196	GRUPO - 1	t	42	49
197	GRUPO - 4	t	31	91
198	GRUPO - 7	t	31	92
199	GRUPO - 5	t	31	93
200	GRUPO - 1	t	43	75
201	GRUPO - 12	t	44	94
202	GRUPO - 1	t	45	95
203	GRUPO - 4	t	37	90
204	GRUPO - 1	t	46	95
205	GRUPO - 1	t	47	78
206	GRUPO - 1	t	48	96
207	GRUPO - 1	t	49	97
208	GRUPO - 1	t	50	65
209	GRUPO - 7	t	44	98
210	GRUPO - 8	t	44	57
211	GRUPO - 2	t	37	90
212	GRUPO - 1	t	51	74
213	GRUPO - 1	t	52	82
214	GRUPO - 9	t	44	99
215	GRUPO - 1	t	53	8
216	GRUPO - 1	t	54	65
217	GRUPO - 1	t	54	73
218	GRUPO - 1	t	54	35
\.


--
-- Data for Name: inscripciones_grupo; Type: TABLE DATA; Schema: public; Owner: pablodb
--

COPY public.inscripciones_grupo (ins_id, ins_habilitado, ins_periodo, ins_matricula_num, est_codigo, grp_id) FROM stdin;
1	t	61	1	222638	1
3	t	61	1	222638	3
4	t	61	1	222638	4
5	t	61	1	222638	5
6	t	61	1	224717	6
7	t	61	1	224717	7
8	t	61	1	224717	8
9	t	61	1	224717	2
10	t	61	1	224717	9
11	t	61	1	227435	6
12	t	61	1	227435	10
13	t	61	1	227435	8
14	t	61	1	227435	11
15	t	61	1	227435	2
16	t	61	1	219896	12
17	t	61	1	219896	13
18	t	61	1	219896	6
20	t	61	1	219896	15
21	t	61	1	227286	12
22	t	61	1	227286	6
23	t	61	1	227286	16
25	t	61	1	227286	13
26	t	61	1	226969	12
27	t	61	1	226969	13
28	t	61	1	226969	14
29	t	61	1	226969	17
30	t	61	1	226969	6
31	t	61	1	56651	12
32	t	61	1	56651	14
34	t	61	1	225551	9
35	t	61	1	225551	7
38	t	61	1	205878	18
39	t	61	1	228581	2
40	t	61	1	228581	4
41	t	61	1	228581	12
42	t	61	1	228581	19
43	t	61	1	228581	20
44	t	61	1	224331	5
45	t	61	1	224331	21
46	t	61	1	224331	19
47	t	61	1	224331	4
48	t	61	1	224331	14
49	t	61	1	228980	9
50	t	61	1	228980	2
51	t	61	1	228980	4
52	t	61	1	228980	8
53	t	61	1	228980	22
54	t	61	1	224317	2
55	t	61	1	224317	23
56	t	61	1	224317	4
57	t	61	1	224317	24
58	t	61	1	224317	5
59	t	61	1	224333	13
60	t	61	1	224333	25
63	t	61	1	224333	14
65	t	61	1	228079	3
68	t	61	1	228079	26
71	t	61	1	226912	27
73	t	61	1	226912	28
75	t	61	1	222893	1
77	t	61	1	222893	13
78	t	61	1	222893	4
79	t	61	1	229466	27
80	t	61	1	229466	5
81	t	61	1	229466	2
82	t	61	1	229466	29
83	t	61	1	229466	4
84	t	61	2	221585	30
86	t	61	2	221585	31
87	t	61	1	221585	32
88	t	61	1	221585	18
89	t	61	2	216614	1
90	t	61	2	216614	33
91	t	61	1	227859	13
94	t	61	1	227859	4
95	t	61	1	227859	34
96	t	61	1	228004	35
97	t	61	1	228004	36
98	t	61	1	228004	37
99	t	61	1	228004	14
100	t	61	1	228004	38
101	t	61	1	222397	2
102	t	61	1	222397	4
103	t	61	1	222397	39
104	t	61	1	222397	37
105	t	61	1	222397	5
106	t	61	1	228639	5
107	t	61	1	228639	6
108	t	61	1	228639	37
109	t	61	1	228639	40
110	t	61	1	228639	14
111	t	61	1	224199	13
112	t	61	1	224199	41
113	t	61	1	224199	12
114	t	61	1	224199	14
115	t	61	1	224199	6
116	t	61	1	223790	14
118	t	61	1	223790	10
119	t	61	1	223790	13
120	t	61	1	223790	6
123	t	61	1	225584	42
124	t	61	1	225584	14
125	t	61	1	225584	13
126	t	61	1	199003	43
127	t	61	2	199003	44
129	t	61	2	220688	30
130	t	61	2	220688	31
131	t	61	2	220688	45
132	t	61	2	217067	46
133	t	61	1	217067	47
135	t	61	1	217067	48
136	t	61	1	228616	27
33	f	61	1	225551	2
2	t	61	1	222638	2
74	f	61	1	222893	2
24	t	61	1	227286	14
64	f	61	1	228079	2
67	f	61	1	228079	4
70	f	61	1	226912	2
92	f	61	1	227859	2
69	f	61	1	226912	4
76	f	61	1	222893	5
93	f	61	1	227859	5
37	f	61	1	225551	4
128	f	61	2	220688	4
85	f	61	1	221585	4
61	f	61	1	224333	6
36	f	61	1	225551	8
62	f	61	1	224333	12
66	f	61	1	228079	12
72	f	61	1	226912	12
121	f	61	1	225584	12
117	t	61	1	223790	12
137	t	61	1	228616	5
138	t	61	1	228616	49
139	t	61	1	228616	2
140	t	61	1	228616	4
141	t	61	1	225027	4
142	t	61	1	225027	24
143	t	61	1	225027	2
144	t	61	1	225027	5
145	t	61	1	225027	41
146	t	61	1	230123	3
147	t	61	1	230123	50
148	t	61	1	230123	51
149	t	61	1	230123	52
150	t	61	1	230123	53
152	t	61	1	225353	54
153	t	61	1	225353	5
154	t	61	1	225353	24
155	t	61	1	225353	4
158	t	61	1	222882	24
159	t	61	1	222882	16
161	t	61	1	228340	5
162	t	61	1	228340	55
163	t	61	1	228340	13
164	t	61	1	228340	14
165	t	61	1	228340	6
166	t	61	1	222757	38
167	t	61	1	222757	56
168	t	61	1	222757	16
169	t	61	1	222757	14
170	t	61	1	222757	57
172	t	61	1	225579	14
173	t	61	1	225579	58
174	t	61	1	225579	6
175	t	61	1	225579	13
176	t	61	1	215098	59
177	t	61	1	215098	60
181	t	61	1	203151	3
182	t	61	1	203151	61
183	t	61	2	219596	4
184	t	61	2	219596	31
185	t	61	2	219596	30
186	t	61	1	228105	2
187	t	61	1	228105	5
188	t	61	1	228105	19
189	t	61	1	228105	4
190	t	61	1	228105	62
191	t	61	1	228156	12
192	t	61	1	228156	63
193	t	61	1	228156	6
194	t	61	1	228156	14
195	t	61	1	228156	24
196	t	61	1	222885	4
197	t	61	1	222885	14
198	t	61	1	222885	5
199	t	61	1	222885	27
200	t	61	1	222885	64
201	t	61	1	226948	33
202	t	61	1	226948	54
203	t	61	1	226948	2
204	t	61	1	226948	65
205	t	61	1	226948	27
206	t	61	1	228692	62
207	t	61	1	228692	2
208	t	61	1	228692	4
209	t	61	1	228692	5
210	t	61	1	228692	27
211	t	61	1	223452	5
212	t	61	1	223452	2
213	t	61	1	223452	3
214	t	61	1	223452	66
215	t	61	1	223452	4
216	t	61	1	229235	12
217	t	61	1	229235	13
218	t	61	1	229235	14
219	t	61	1	229235	6
220	t	61	1	229235	54
221	t	61	1	227292	5
222	t	61	1	227292	4
223	t	61	1	227292	27
224	t	61	1	227292	67
225	t	61	1	227292	2
226	t	61	1	229449	12
227	t	61	1	229449	6
228	t	61	1	229449	27
229	t	61	1	229449	14
230	t	61	1	229449	39
231	t	61	1	228890	28
233	t	61	1	228890	2
234	t	61	1	228890	4
235	t	61	1	228890	27
236	t	61	1	224206	31
237	t	61	1	224206	4
239	t	61	1	224206	27
241	t	61	1	228262	6
242	t	61	1	228262	14
243	t	61	1	228262	27
244	t	61	1	228262	12
245	t	61	1	228262	31
246	t	61	1	69061	68
247	t	61	1	228426	13
248	t	61	1	228426	40
250	t	61	1	228426	6
251	t	61	1	228426	14
252	t	61	1	229147	27
253	t	61	1	229147	5
254	t	61	1	229147	4
255	t	61	1	229147	2
256	t	61	1	229147	69
257	t	61	1	224491	14
258	t	61	1	224491	12
259	t	61	1	224491	66
260	t	61	1	224491	6
261	t	61	1	224491	13
262	t	61	1	229138	5
263	t	61	1	229138	19
264	t	61	1	229138	70
265	t	61	1	229138	7
266	t	61	1	229138	71
270	t	61	1	227025	13
271	t	61	1	227025	72
272	t	61	1	225527	11
179	f	61	1	203151	2
238	f	61	1	224206	2
157	f	61	1	222882	14
269	f	61	1	227025	14
178	f	61	1	203151	5
160	f	61	1	222882	4
232	f	61	1	228890	5
180	f	61	1	203151	4
240	f	61	1	224206	5
267	f	61	1	227025	6
249	f	61	1	228426	12
268	f	61	1	227025	12
171	f	61	1	225579	12
273	t	61	1	225527	73
274	t	61	1	225527	8
275	t	61	1	225527	14
276	t	61	1	225527	6
277	t	61	1	224875	16
278	t	61	1	224875	12
279	t	61	1	224875	6
280	t	61	1	224875	14
281	t	61	1	224875	13
282	t	61	1	223256	74
283	t	61	1	223256	5
284	t	61	1	223256	2
285	t	61	1	223256	27
287	t	61	1	224387	33
288	t	61	1	224387	2
289	t	61	1	224387	56
290	t	61	1	224387	75
291	t	61	1	224387	10
292	t	61	2	161891	33
293	t	61	1	161891	46
294	t	61	1	161891	47
295	t	61	1	161891	76
296	t	61	2	161891	72
297	t	61	1	224503	63
298	t	61	1	224503	4
299	t	61	1	224503	27
300	t	61	1	224503	2
301	t	61	1	224503	5
302	t	61	1	230021	77
303	t	61	1	230021	78
304	t	61	1	230021	5
305	t	61	1	230021	79
306	t	61	1	230021	13
307	t	61	1	223449	27
308	t	61	1	223449	2
309	t	61	1	223449	5
310	t	61	1	223449	52
311	t	61	1	223449	4
312	t	61	1	214009	47
313	t	61	2	214009	38
314	t	61	1	214009	80
315	t	61	1	214009	81
316	t	61	1	227487	2
317	t	61	1	227487	4
318	t	61	1	227487	82
319	t	61	1	227487	12
320	t	61	1	227487	52
321	t	61	1	226534	64
322	t	61	1	226534	2
323	t	61	1	226534	83
324	t	61	1	226534	65
325	t	61	1	226534	12
326	t	61	1	228166	4
327	t	61	1	228166	13
328	t	61	1	228166	5
329	t	61	1	228166	2
330	t	61	1	228166	22
332	t	61	1	228383	27
333	t	61	1	228383	61
336	t	61	1	224615	4
337	t	61	1	224615	3
338	t	61	1	224615	5
339	t	61	1	224615	55
340	t	61	1	224615	2
341	t	61	1	226605	13
343	t	61	1	226605	14
344	t	61	1	226605	6
345	t	61	1	226605	72
348	t	61	1	223800	66
350	t	61	1	223800	13
351	t	61	1	217114	43
352	t	61	1	217114	84
353	t	61	2	217114	67
354	t	61	1	217114	18
355	t	61	1	217114	85
356	t	61	1	217114	86
357	t	61	1	134213	87
358	t	61	1	134213	76
359	t	61	1	134213	18
360	t	61	1	134213	12
361	t	61	1	229960	78
363	t	61	1	229960	25
364	t	61	1	229960	88
365	t	61	1	229960	75
366	t	61	1	230347	89
367	t	61	1	230347	30
368	t	61	1	230347	51
369	t	61	1	230347	53
370	t	61	1	230347	55
371	t	61	1	226525	13
374	t	61	1	226525	90
376	t	61	1	227407	5
377	t	61	1	227407	67
378	t	61	1	227407	27
380	t	61	1	227407	2
381	t	61	1	222883	73
382	t	61	1	222883	5
383	t	61	1	222883	4
384	t	61	1	222883	27
385	t	61	1	222883	2
386	t	61	1	225689	2
387	t	61	1	225689	73
388	t	61	1	225689	4
389	t	61	1	225689	27
390	t	61	1	225689	5
392	t	61	1	225486	74
393	t	61	1	225486	91
396	t	61	1	229416	71
397	t	61	1	229416	19
398	t	61	1	229416	5
399	t	61	1	229416	93
400	t	61	1	229416	64
401	t	61	1	223402	12
403	t	61	1	223402	75
404	t	61	1	223402	20
405	t	61	1	223402	14
407	t	61	1	227843	14
408	t	61	1	227843	27
394	f	61	1	225486	2
402	t	61	1	223402	6
347	f	61	1	223800	14
375	f	61	1	226525	14
334	f	61	1	228383	6
286	t	61	1	223256	4
379	t	61	1	227407	4
349	f	61	1	223800	6
373	f	61	1	226525	6
391	f	61	1	225486	8
395	f	61	1	225486	92
331	f	61	1	228383	12
342	f	61	1	226605	12
346	f	61	1	223800	12
362	f	61	1	229960	12
372	f	61	1	226525	12
409	t	61	1	227843	5
410	t	61	1	227843	55
411	t	61	1	225630	14
412	t	61	1	225630	8
413	t	61	1	225630	92
414	t	61	1	225630	25
415	t	61	1	225630	91
416	t	61	1	222501	23
417	t	61	1	222501	12
418	t	61	1	222501	14
419	t	61	1	222501	13
420	t	61	1	222501	6
421	t	61	1	225569	94
422	t	61	1	225569	18
423	t	61	1	225569	58
424	t	61	1	225569	95
425	t	61	1	225569	96
426	t	61	1	225569	85
427	t	61	1	226900	82
428	t	61	1	226900	78
430	t	61	1	226900	79
431	t	61	1	226900	12
433	t	61	1	226866	6
434	t	61	1	226866	63
435	t	61	1	226866	19
436	t	61	1	226866	14
437	t	61	1	228831	4
438	t	61	1	228831	5
439	t	61	1	228831	27
440	t	61	1	228831	2
441	t	61	1	228831	40
442	t	61	1	183496	59
443	t	61	1	183496	97
444	t	61	1	206212	97
445	t	61	1	213481	97
446	t	61	1	213481	59
447	t	61	1	213481	98
448	t	61	1	213481	99
449	t	61	1	213481	100
451	t	61	1	205878	85
452	t	61	1	205878	101
453	t	61	1	216585	47
454	t	61	1	216585	102
455	t	61	1	216585	84
456	t	61	1	216585	103
457	t	61	1	216585	104
458	t	61	1	218970	102
459	t	61	1	218970	84
460	t	61	1	218970	105
461	t	61	1	218970	47
462	t	61	1	218970	106
463	t	61	1	213488	106
464	t	61	1	213488	59
465	t	61	1	213488	97
466	t	61	1	213488	107
467	t	61	1	213488	60
468	t	61	1	201232	60
469	t	61	1	201232	97
470	t	61	2	201232	103
471	t	61	1	201232	59
472	t	61	1	201232	108
474	t	61	2	188554	109
475	t	61	2	188554	85
476	t	61	2	188554	18
477	t	61	2	188554	110
478	t	61	2	188554	111
479	t	61	1	208677	59
480	t	61	1	208677	112
481	t	61	2	180153	113
482	t	61	2	217207	114
484	t	61	1	217207	59
485	t	61	1	217207	116
486	t	61	1	217207	97
487	t	61	1	217207	100
488	t	61	2	163218	117
490	t	61	2	209576	111
492	t	61	1	215815	111
493	t	61	1	215815	84
494	t	61	1	215815	85
495	t	61	1	215815	18
496	t	61	1	215815	80
497	t	61	1	217260	84
498	t	61	1	217260	85
499	t	61	1	217260	100
500	t	61	1	217260	118
501	t	61	1	217260	98
502	t	61	1	218816	84
503	t	61	1	218816	105
504	t	61	1	218816	106
505	t	61	1	218816	102
506	t	61	1	218816	47
507	t	61	1	219261	47
508	t	61	1	219261	103
509	t	61	1	219261	102
510	t	61	1	219261	84
511	t	61	1	219261	119
512	t	61	1	219240	102
513	t	61	1	219240	120
514	t	61	1	219240	47
515	t	61	1	219240	84
516	t	61	1	219240	106
517	t	61	1	221453	119
518	t	61	1	221453	103
519	t	61	1	221453	84
520	t	61	1	221453	102
521	t	61	1	221453	47
522	t	61	2	190864	121
523	t	61	1	190864	84
524	t	61	1	208722	97
525	t	61	1	208722	59
526	t	61	1	215761	122
527	t	61	2	215761	86
528	t	61	1	215761	100
529	t	61	2	215761	84
530	t	61	1	215761	108
532	t	61	1	69061	124
533	t	61	1	69061	125
534	t	61	1	69061	126
535	t	61	1	69061	127
536	t	61	1	221375	47
537	t	61	1	221375	106
538	t	61	1	221375	119
539	t	61	1	221375	84
540	t	61	1	221375	102
541	t	61	2	207946	128
543	t	61	1	220387	102
544	t	61	1	220387	106
450	f	61	1	205878	84
483	t	61	1	217207	115
473	f	61	1	188554	84
491	f	61	1	209576	59
432	t	61	1	226866	12
542	f	61	1	207946	59
531	f	61	1	69061	123
545	t	61	1	220387	84
546	t	61	1	220387	47
547	t	61	1	220387	129
548	t	61	1	220489	84
549	t	61	1	220489	47
550	t	61	1	220489	120
551	t	61	1	220489	106
552	t	61	1	220489	102
553	t	61	1	220990	84
554	t	61	1	220990	47
555	t	61	1	220990	130
556	t	61	1	220990	103
557	t	61	1	220990	102
558	t	61	2	176560	131
560	t	61	2	176560	124
561	t	61	1	221440	128
562	t	61	1	221440	84
563	t	61	1	221440	101
564	t	61	1	221440	102
565	t	61	1	221440	47
566	t	61	1	217380	97
567	t	61	1	217380	60
568	t	61	2	217380	85
569	t	61	1	217380	132
570	t	61	1	217380	122
571	t	61	1	183496	133
572	t	61	1	183496	134
573	t	61	1	183496	135
574	t	61	1	183496	60
575	t	61	1	217240	97
576	t	61	1	217240	59
577	t	61	1	217240	136
579	t	61	1	217240	137
580	t	61	1	66027	123
581	t	61	1	66027	138
582	t	61	1	66027	139
583	t	61	1	66027	140
584	t	61	1	66027	141
585	t	61	1	66027	142
586	t	61	1	215698	59
587	t	61	1	215698	143
589	t	61	1	215698	97
590	t	61	1	215698	137
591	t	61	1	217267	97
592	t	61	1	217267	144
593	t	61	1	217267	59
594	t	61	1	217267	100
596	t	61	1	216639	122
597	t	61	1	216639	97
598	t	61	1	216639	59
599	t	61	1	216639	100
600	t	61	1	216639	99
601	t	61	1	217091	59
602	t	61	1	217091	97
603	t	61	1	217091	137
604	t	61	1	217091	136
606	t	61	1	217843	59
607	t	61	1	217843	137
609	t	61	1	217843	145
610	t	61	1	217843	97
611	t	61	1	188325	112
612	t	61	1	188325	146
613	t	61	1	208050	59
614	t	61	1	208050	147
615	t	61	1	208050	122
616	t	61	1	208050	135
617	t	61	1	208050	112
618	t	61	1	208050	148
621	t	61	1	217004	136
622	t	61	1	217004	97
623	t	61	1	217004	137
624	t	61	1	217161	97
625	t	61	1	217161	131
626	t	61	1	217161	59
627	t	61	1	217161	137
629	t	61	1	191025	112
630	t	61	1	191025	149
631	t	61	2	191025	150
634	t	61	1	213648	59
635	t	61	1	213648	97
636	t	61	1	213648	144
637	t	61	1	213648	60
638	t	61	1	213791	59
639	t	61	1	213791	122
640	t	61	1	213791	97
641	t	61	1	213791	137
642	t	61	1	216573	151
643	t	61	1	216573	59
644	t	61	1	216573	100
645	t	61	1	216573	97
647	t	61	1	216329	99
649	t	61	1	216329	97
650	t	61	1	216329	100
651	t	61	1	216329	59
653	t	61	1	217271	145
654	t	61	1	217271	97
655	t	61	1	217271	137
656	t	61	1	217271	59
658	t	61	1	212862	59
659	t	61	1	212862	136
660	t	61	1	212862	137
661	t	61	1	212862	97
662	t	61	1	216270	143
663	t	61	1	216270	137
664	t	61	1	216270	97
666	t	61	1	216270	59
667	t	61	1	190022	152
668	t	61	1	190022	112
671	t	61	1	190022	148
672	t	61	1	190022	135
674	t	61	1	216097	59
675	t	61	1	216097	153
676	t	61	1	216097	97
677	t	61	1	216097	137
679	t	61	1	198780	97
680	t	61	1	198780	59
559	f	61	2	176560	102
646	t	61	1	216573	115
605	t	61	1	217091	115
669	t	61	2	190022	115
578	t	61	1	217240	115
620	f	61	1	217004	115
633	f	61	1	213648	115
648	t	61	1	216329	115
652	t	61	1	217271	115
657	t	61	1	212862	115
665	t	61	1	216270	115
595	t	61	1	217267	115
673	t	61	1	216097	115
619	f	61	1	217004	59
678	t	61	1	198780	115
628	t	61	1	217161	115
670	f	61	2	190022	59
681	t	61	1	198780	137
682	t	61	1	198780	154
683	t	61	1	161300	60
684	t	61	1	161300	145
685	t	61	1	161300	59
686	t	61	1	161300	122
687	t	61	1	161300	97
688	t	61	1	217452	59
689	t	61	1	217452	145
690	t	61	1	217452	137
691	t	61	1	217452	97
693	t	61	1	212854	144
695	t	61	1	212854	137
696	t	61	1	212854	59
697	t	61	1	212854	97
698	t	61	1	220643	148
699	t	61	1	220643	59
700	t	61	1	220643	155
701	t	61	1	220643	156
702	t	61	1	220643	112
703	t	61	1	220643	157
704	t	61	1	217963	137
705	t	61	1	217963	97
706	t	61	1	217963	158
707	t	61	1	217963	59
708	t	61	1	217963	122
709	t	61	1	217960	137
710	t	61	1	217960	97
711	t	61	1	217960	122
712	t	61	1	217960	159
713	t	61	1	217960	59
714	t	61	1	219159	137
715	t	61	1	219159	160
716	t	61	1	219159	153
717	t	61	1	219159	97
718	t	61	1	213271	122
719	t	61	1	213271	144
720	t	61	1	213271	97
721	t	61	1	213271	59
722	t	61	1	213271	137
723	t	61	1	198576	161
725	t	61	1	198576	162
726	t	61	1	198576	125
727	t	61	1	198576	163
728	t	61	1	198576	164
729	t	61	1	214262	149
730	t	61	1	214262	148
732	t	61	1	214262	165
733	t	61	1	214262	147
735	t	61	1	141874	125
736	t	61	1	141874	166
738	t	61	1	144027	155
739	t	61	1	144027	125
740	t	61	1	166095	167
741	t	61	2	166095	148
742	t	61	1	166095	168
743	t	61	1	166095	161
744	t	61	1	198540	169
745	t	61	1	198540	155
746	t	61	1	198540	125
748	t	61	2	198540	165
749	t	61	1	198954	170
750	t	61	2	198954	146
751	t	61	1	198954	169
752	t	61	1	198954	125
753	t	61	1	198954	161
754	t	61	1	191025	165
755	t	61	1	189894	161
756	t	61	1	189894	146
757	t	61	1	189894	125
758	t	61	1	189894	171
759	t	61	1	189894	172
760	t	61	1	177082	123
761	t	61	1	177082	162
762	t	61	1	177082	140
763	t	61	1	177082	141
764	t	61	1	177082	173
765	t	61	1	203978	161
766	t	61	2	203978	146
767	t	61	1	203978	156
768	t	61	1	203978	174
769	t	61	1	203978	125
771	t	61	1	190368	164
772	t	61	1	190368	125
773	t	61	1	190368	170
774	t	61	1	190368	161
775	t	61	1	193406	161
776	t	61	1	193406	125
777	t	61	1	193406	170
778	t	61	1	193406	175
780	t	61	1	206314	148
781	t	61	1	206314	147
782	t	61	1	206314	146
783	t	61	1	206314	112
785	t	61	1	206314	165
786	t	61	1	198445	161
787	t	61	1	198445	176
788	t	61	1	198445	125
789	t	61	2	198445	146
790	t	61	1	198445	170
791	t	61	1	198445	162
792	t	61	1	198445	164
793	t	61	1	198946	168
794	t	61	1	198946	123
795	t	61	1	198946	155
796	t	61	2	198946	165
797	t	61	1	198946	172
798	t	61	1	198946	125
799	t	61	1	204755	161
800	t	61	1	204755	164
801	t	61	1	204755	170
802	t	61	1	204755	162
803	t	61	1	204755	125
804	t	61	2	204755	146
805	t	61	1	204755	176
806	t	61	1	198600	161
807	t	61	1	198600	170
808	t	61	1	198600	164
809	t	61	2	198600	146
810	t	61	1	198600	176
811	t	61	1	198600	125
812	t	61	1	198600	162
813	t	61	1	183319	161
814	t	61	1	183319	170
815	t	61	1	183319	147
816	t	61	1	183319	112
694	t	61	1	212854	115
770	t	61	2	190368	146
692	t	61	1	217452	115
784	t	61	1	206314	149
737	f	61	1	141874	123
747	t	61	2	198540	146
734	t	61	1	214262	112
779	t	61	1	193406	146
817	t	61	1	183319	146
818	t	61	1	183319	174
819	t	61	1	201940	161
820	t	61	1	201940	163
821	t	61	1	201940	123
822	t	61	1	201940	125
823	t	61	2	201940	177
824	t	61	1	201940	164
825	t	61	1	201940	168
826	t	61	1	202691	125
827	t	61	1	202691	169
828	t	61	1	202691	165
829	t	61	1	202691	146
832	t	61	1	205511	163
833	t	61	1	205511	125
834	t	61	1	205511	169
835	t	61	1	205511	146
836	t	61	1	187421	178
837	t	61	2	187421	166
838	t	61	1	205919	174
840	t	61	1	205919	170
841	t	61	1	205919	146
842	t	61	1	205919	112
843	t	61	1	198580	163
844	t	61	1	198580	125
845	t	61	1	198580	179
846	t	61	1	198580	161
847	t	61	1	198580	123
848	t	61	1	198580	168
849	t	61	1	195378	139
850	t	61	1	195378	180
851	t	61	2	195378	163
852	t	61	1	195378	141
853	t	61	1	195378	181
854	t	61	1	206329	123
855	t	61	1	206329	161
856	t	61	1	206329	182
857	t	61	1	206329	183
858	t	61	1	206329	125
859	t	61	1	206329	168
860	t	61	1	198077	123
861	t	61	1	198077	183
862	t	61	1	198077	182
863	t	61	1	198077	125
864	t	61	1	198077	168
865	t	61	1	198077	161
866	t	61	1	51229	127
867	t	61	2	51229	141
869	t	61	1	160299	123
870	t	61	1	160299	155
871	t	61	1	160299	141
872	t	61	1	160299	139
873	t	61	1	160299	181
874	t	61	1	160299	140
875	t	61	2	174848	123
876	t	61	2	174848	141
877	t	61	2	174848	139
878	t	61	1	174848	181
881	t	61	1	206091	123
882	t	61	1	206091	184
883	t	61	1	206091	161
884	t	61	1	206091	163
885	t	61	1	206091	125
886	t	61	1	206091	168
887	t	61	1	194855	141
888	t	61	1	194855	162
889	t	61	1	194855	140
890	t	61	2	194855	123
891	t	61	1	195474	180
892	t	61	1	195474	163
893	t	61	1	195474	141
894	t	61	1	195474	139
895	t	61	1	195474	181
896	t	61	1	206289	182
897	t	61	1	206289	161
898	t	61	1	206289	125
899	t	61	1	206289	163
900	t	61	1	206289	123
901	t	61	1	206289	168
902	t	61	1	191437	180
903	t	61	1	191437	181
904	t	61	1	191437	141
906	t	61	1	191437	139
907	t	61	2	189422	139
908	t	61	1	189422	185
909	t	61	1	189422	186
910	t	61	1	189422	187
911	t	61	1	189422	188
912	t	61	1	189422	180
914	t	61	1	166038	186
915	t	61	1	166038	189
916	t	61	2	166038	141
917	t	61	2	187024	139
918	t	61	1	187024	190
919	t	61	2	187024	141
920	t	61	1	187024	181
921	t	61	1	177489	188
922	t	61	1	177489	186
923	t	61	2	177489	162
924	t	61	1	196155	140
925	t	61	1	196155	181
926	t	61	1	196155	180
927	t	61	1	196155	139
928	t	61	1	196155	141
929	t	61	1	153058	181
930	t	61	1	153058	141
931	t	61	1	153058	123
932	t	61	1	153058	140
933	t	61	1	153058	139
934	t	61	1	172988	180
935	t	61	1	172988	141
936	t	61	1	172988	139
937	t	61	1	172988	181
938	t	61	1	172988	140
939	t	61	1	189203	139
940	t	61	1	189203	123
941	t	61	1	189203	141
942	t	61	1	189203	140
943	t	61	1	189203	181
944	t	61	1	186611	123
945	t	61	1	186611	141
946	t	61	1	186611	140
947	t	61	1	186611	139
948	t	61	1	186611	181
949	t	61	1	190999	141
950	t	61	1	190999	181
951	t	61	1	190999	140
952	t	61	1	190999	139
831	t	61	1	205511	149
880	f	61	2	152167	123
913	f	61	1	166038	162
879	f	61	2	152167	162
830	t	61	1	202691	149
868	f	61	2	51229	180
953	t	61	1	190999	123
954	t	61	1	176579	191
955	t	61	1	176579	192
956	t	61	2	176579	193
957	t	61	1	176579	194
959	t	61	1	189069	196
960	t	61	1	189069	186
961	t	61	1	189069	187
962	t	61	1	189069	197
963	t	61	1	189069	188
964	t	61	1	189205	186
965	t	61	1	189205	196
966	t	61	1	189205	198
967	t	61	1	189205	188
969	t	61	2	161936	191
970	t	61	1	190128	199
971	t	61	1	190128	186
972	t	61	1	190128	196
973	t	61	1	190128	187
974	t	61	1	190128	188
975	t	61	1	187560	196
976	t	61	1	187560	188
977	t	61	1	187560	186
978	t	61	1	187560	198
979	t	61	1	187560	187
980	t	61	1	155118	187
981	t	61	1	155118	198
982	t	61	1	155118	186
983	t	61	1	155118	196
984	t	61	1	155118	188
985	t	61	1	51543	186
986	t	61	1	51543	188
987	t	61	1	51543	187
988	t	61	1	51543	197
989	t	61	1	51543	196
990	t	61	1	187158	188
991	t	61	1	187158	187
992	t	61	1	187158	186
993	t	61	1	187158	197
994	t	61	1	187158	196
995	t	61	1	177653	187
996	t	61	1	177653	186
997	t	61	1	177653	196
998	t	61	1	177653	188
999	t	61	1	177653	198
1000	t	61	1	152722	194
1001	t	61	1	153626	200
1002	t	61	1	188439	188
1003	t	61	1	188439	186
1004	t	61	1	188439	196
1005	t	61	1	188439	187
1006	t	61	1	188439	198
1007	t	61	1	191719	186
1008	t	61	1	191719	187
1009	t	61	1	191719	196
1010	t	61	1	191719	188
1011	t	61	1	191719	198
1012	t	61	1	191398	188
1013	t	61	1	191398	186
1014	t	61	1	191398	198
1015	t	61	1	191398	187
1016	t	61	1	191398	196
1017	t	61	1	176016	201
1018	t	61	1	176016	195
1019	t	61	1	176016	202
1020	t	61	1	176016	194
1021	t	61	1	176016	203
1022	t	61	1	176016	204
1023	t	61	1	176016	192
1024	t	61	1	169841	192
1025	t	61	1	169841	202
1026	t	61	1	169841	195
1027	t	61	1	169841	191
1028	t	61	1	169841	204
1029	t	61	1	169841	194
1030	t	61	1	169841	201
1031	t	61	1	151334	205
1032	t	61	1	151334	201
1033	t	61	1	151334	200
1034	t	61	1	151334	206
1035	t	61	1	151334	207
1036	t	61	1	151334	208
1037	t	61	1	163017	206
1038	t	61	1	163017	200
1039	t	61	1	163017	208
1040	t	61	1	163017	209
1041	t	61	1	163017	207
1042	t	61	1	163017	205
1043	t	61	1	175629	202
1044	t	61	1	175629	192
1045	t	61	1	175629	203
1046	t	61	1	175629	194
1047	t	61	1	175629	195
1048	t	61	1	175629	204
1049	t	61	1	162379	207
1050	t	61	1	162379	208
1051	t	61	1	162379	209
1052	t	61	1	162379	200
1053	t	61	1	162379	206
1054	t	61	1	162379	205
1055	t	61	1	182613	195
1056	t	61	1	182613	204
1057	t	61	1	182613	192
1058	t	61	1	182613	202
1059	t	61	1	182613	203
1060	t	61	1	160796	206
1061	t	61	1	160796	207
1062	t	61	1	160796	205
1063	t	61	1	160796	202
1064	t	61	1	160796	200
1065	t	61	1	177352	195
1066	t	61	1	177352	194
1067	t	61	1	177352	192
1068	t	61	1	177352	202
1069	t	61	1	177352	204
1070	t	61	1	177352	201
1071	t	61	1	175950	195
1072	t	61	1	175950	201
1073	t	61	1	175950	204
1074	t	61	1	175950	192
1075	t	61	1	175950	194
1076	t	61	1	175950	202
1077	t	61	1	175372	201
1078	t	61	1	175372	195
1079	t	61	1	175372	194
1080	t	61	1	175372	204
1081	t	61	1	175372	192
1082	t	61	1	175372	202
1083	t	61	1	55975	210
1084	t	61	1	55975	192
1085	t	61	1	55975	204
1086	t	61	1	55975	202
1087	t	61	1	55975	194
1088	t	61	2	55975	195
958	f	61	1	176579	195
1089	t	61	2	177762	211
1090	t	61	1	177762	195
1091	t	61	1	177762	192
1092	t	61	1	177762	194
1093	t	61	1	177762	204
1094	t	61	1	177762	202
1095	t	61	1	177762	201
1096	t	61	1	26591	192
1097	t	61	1	26591	203
1098	t	61	1	26591	202
1099	t	61	1	26591	195
1100	t	61	1	26591	201
1101	t	61	1	26591	194
1102	t	61	1	26591	204
1103	t	61	1	54311	204
1104	t	61	1	54311	191
1105	t	61	1	54311	192
1106	t	61	1	54311	202
1107	t	61	1	54311	195
1108	t	61	1	54311	194
1109	t	61	1	170138	201
1110	t	61	1	170138	192
1111	t	61	1	170138	194
1112	t	61	1	170138	195
1113	t	61	1	170138	204
1114	t	61	1	170138	191
1115	t	61	1	170138	202
1116	t	61	1	147987	212
1118	t	61	1	147987	200
1119	t	61	1	147987	213
1120	t	61	1	178651	207
1121	t	61	1	178651	200
1122	t	61	1	178651	205
1123	t	61	1	178651	214
1124	t	61	1	178651	208
1125	t	61	1	178651	206
1126	t	61	1	177498	206
1127	t	61	1	177498	214
1128	t	61	1	177498	205
1129	t	61	1	177498	208
1130	t	61	1	177498	207
1131	t	61	1	177498	200
1132	t	61	1	176764	207
1133	t	61	1	176764	214
1134	t	61	1	176764	206
1135	t	61	1	176764	200
1136	t	61	1	176764	208
1137	t	61	1	176764	205
1138	t	61	1	152370	213
1139	t	61	1	152370	212
1140	t	61	1	152370	200
1142	t	61	1	161645	215
1143	t	61	1	161645	200
1144	t	61	1	161645	213
1145	t	61	1	134070	213
1146	t	61	1	134070	212
1147	t	61	1	134070	215
1149	t	61	1	151370	213
1150	t	61	1	151370	200
1152	t	61	1	151370	212
1153	t	61	1	151045	217
1154	t	61	1	151045	208
1155	t	61	1	151045	207
1156	t	61	1	151045	206
1157	t	61	1	176135	205
1158	t	61	1	176135	200
1159	t	61	1	176135	206
1160	t	61	1	176135	214
1161	t	61	1	176135	208
1162	t	61	1	176135	207
1163	t	61	1	152681	200
1165	t	61	1	152681	212
1166	t	61	1	152681	213
1167	t	61	1	149580	208
1168	t	61	1	149580	200
1169	t	61	1	149580	206
1170	t	61	1	149580	207
1171	t	61	1	149580	214
1172	t	61	1	149580	205
1173	t	61	1	179349	208
1174	t	61	1	179349	200
1175	t	61	1	179349	207
1176	t	61	1	179349	206
1177	t	61	1	179349	214
1178	t	61	1	179349	205
1179	t	61	1	152602	206
1180	t	61	1	152602	200
1181	t	61	1	152602	214
1182	t	61	1	152602	205
1183	t	61	1	152602	207
1184	t	61	1	152602	208
1185	t	61	1	152515	205
1186	t	61	1	152515	207
1187	t	61	1	152515	200
1188	t	61	1	152515	214
1189	t	61	1	152515	206
1190	t	61	1	152515	208
1191	t	61	1	164285	205
1192	t	61	1	164285	207
1193	t	61	1	164285	214
1194	t	61	1	164285	200
1195	t	61	1	164285	206
1196	t	61	1	164285	208
1197	t	61	1	166200	206
1198	t	61	1	166200	200
1199	t	61	1	166200	207
1200	t	61	1	166200	208
1201	t	61	1	166200	205
1202	t	61	1	178217	214
1203	t	61	1	178217	207
1204	t	61	1	178217	206
1205	t	61	1	178217	200
1206	t	61	1	178217	205
1207	t	61	1	178217	208
1208	t	61	2	128397	217
1209	t	61	1	151712	215
1210	t	61	1	151712	213
1211	t	61	1	151712	218
1212	t	61	1	151712	212
1213	t	61	1	167241	216
1214	t	61	1	167241	212
1215	t	61	1	167241	215
1216	t	61	1	167241	213
1217	t	61	1	152823	215
1218	t	61	2	152823	212
1219	t	61	1	163389	215
1220	t	61	1	163389	216
1221	t	61	1	163389	212
1222	t	61	1	163389	213
632	t	61	1	191025	146
1148	f	61	1	134070	216
1117	f	61	1	147987	208
1151	f	61	1	151370	208
1164	f	61	1	152681	208
19	t	61	1	219896	14
122	f	61	1	225584	6
406	f	61	1	227843	6
489	f	61	2	163218	102
608	t	61	1	217843	115
588	t	61	1	215698	115
156	f	61	1	222882	5
151	f	61	1	225353	14
335	f	61	1	228383	2
134	f	61	1	217067	8
905	t	61	1	191437	140
731	t	61	1	214262	146
839	t	61	1	205919	149
429	t	61	1	226900	69
968	f	61	1	189205	187
724	t	61	2	198576	146
1141	f	61	1	152370	208
\.


--
-- Data for Name: niveles_cri; Type: TABLE DATA; Schema: public; Owner: pablodb
--

COPY public.niveles_cri (nvl_id, nvl_descripcion, nvl_tipo, cri_id) FROM stdin;
1	Entiende los parámetros y datos iniciales; sin embargo, no identifica los procesos y tampoco brinda una solución a un problema dado.	Inicial	1
2	Entiende los parámetros y datos iniciales e identifica los procesos; sin embargo, no brinda una solución a un  problema dado.	En Desarrollo	1
3	Entiende los parámetros, datos iniciales, identifica los procesos y brinda una solución al problema problema dado.	Ideal	1
4	Entiende el conjunto de datos, identifica los procesos, optimiza dichos procesos y brinda una solución a un problema dado.	Avanzado	1
5	Identifica los requerimientos de los actores; sin embargo, no identifica los componentes y tampoco brinda una solución computacional a un problema dado.	Inicial	2
6	Identifica los requerimientos de los actores y los componentes; sin embargo, no brinda una solución computacional a un problema dado.	En Desarrollo	2
7	Identifica los requerimientos de los actores, los componentes convencionales y brinda una solución computacional a un problema dado.	Ideal	2
8	Identifica los requerimientos de los actores, los componentes convencionales, agrega nuevos componentes y brinda una solución computacional a un problema dado.	Avanzado	2
9	Identifica técnicas, métodos, estructuras de datos; sin embargo, no identifica arquitecturas o infraestructuras informáticas y tampoco brinda una solución computacional.	Inicial	3
10	Identifica técnicas, métodos, estructuras de datos, arquitecturas o infraestructuras informáticas; sin embargo, no brinda una solución computacional.	En Desarrollo	3
11	Identifica técnicas, métodos, estructuras de datos; así como también arquitecturas o infraestructuras informáticas y brinda una solución computacional convencional.	Ideal	3
12	Identifica técnicas, métodos, estructuras de datos; así como también arquitecturas o infraestructuras informáticas y brinda una solución computacional innovadora.	Avanzado	3
13	Diseña los componentes de una solución basada en cómputo sin embargo, no identifica a los diferentes actores y tampoco considera su conjunto de requerimientos.	Inicial	4
14	Diseña los componentes de una solución basada en cómputo, identifica a los diferentes actores sin embargo, no considera su conjunto de requerimientos.	En Desarrollo	4
15	Diseña todos los componentes convencionales de una solución basada en cómputo, identifica a los diferentes actores y considera su conjunto de requerimientos.	Ideal	4
16	Diseña todos los componentes convencionales y agrega componentes novedosos para una solución basada en cómputo, identifica a los diferentes actores y considera su conjunto de requerimientos.	Avanzado	4
17	Implementa una solución basada en cómputo para un problema dado sin embargo, no utiliza el diseño de componentes establecidos según los requerimientos de los actores.	Inicial	5
18	Implementa una solución basada en cómputo para un problema dado considerando parte del diseño de componentes establecidos según los requerimientos de los actores.	En Desarrollo	5
19	Implementa una solución convencional basada en cómputo para un problema dado, considerando la totalidad de componentes establecidos en el diseño según los requerimientos de los actores.	Ideal	5
20	Implementa correctamente una solución óptima basada en cómputo para un problema dado, considerando todo el diseño de componentes establecidos según los requerimientos de los actores.	Avanzado	5
21	Evalúa una solución basada en cómputo para un problema dado sin embargo, no considera los requerimientos de los actores ni el diseño propuesto.	Inicial	6
22	Evalúa una solución basada en cómputo para un problema dado, considera los requerimientos de los actores sin el diseño propuesto.	En Desarrollo	6
23	Evalúa una solución convencional basada en cómputo para un problema dado, considera todos los requerimientos de los actores y el diseño propuesto.	Ideal	6
24	Evalúa una solución basada en cómputo para un problema dado, considera todos los requerimientos de los actores y el diseño propuesto y determina si la solución es óptima.	Avanzado	6
25	Comunica ideas de manera escrita y ordenada sin embargo, no las argumenta con base técnica ni científica en un contexto profesional.	Inicial	7
26	Comunica las ideas de manera escrita y ordenada, proporcionando argumentos con base técnica, sin un argumento científico, en un contexto profesional.	En Desarrollo	7
27	Comunica efectivamente todas las ideas, de manera escrita y ordenada, argumentándolas de forma convencional, con base técnica y ciéntifica en un contexto profesional.	Ideal	7
28	Comunica efectivamente todas las ideas, de manera escrita y ordenada, argumentándolas minuciosamente con base científica y técnica en un contexto profesional aplicando estructuras de escritura y/o estándares internacionales.	Avanzado	7
29	Comunica ideas de manera oral sin embargo, no las complementa con lenguaje no verbal ni facilita la captación de su discurso.	Inicial	8
30	Comunica ideas de manera oral y utiliza el lenguaje no verbal sin embargo se dificulta la captación de su discurso.	En Desarrollo	8
31	Comunica efectivamente todas las ideas, de manera oral, fortaleciéndolas con lenguaje no verbal y facilitando la captación de su discurso de una forma convencional.	Ideal	8
32	Comunica efectivamente todas las ideas, de manera oral, fortaleciéndolas con lenguaje no verbal transmitiendo confianza y seguridad para atraer la atención de la audiencia y así captar la comprensión de su discurso.	Avanzado	8
33	Brinda una solución computacional a un problema profesional, identificando dilemas éticos sin embargo, no identifica ni sus actores ni las consecuencias.	Inicial	9
34	Brinda una solución computacional a un problema profesional, identificando dilemas éticos y sus actores sin embargo, no determina las consecuencias.	En Desarrollo	9
35	Brinda una solución computacional a un problema profesional, identificando dilemas éticos, sus actores y consecuencias.	Ideal	9
36	Brinda una solución computacional a un problema profesional, identificando dilemas éticos con sus actores y consecuencias. Además, es capaz de sugerir a los involucrados las soluciones para la toma de decisiones.	Avanzado	9
37	Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos sin embargo, no asume la responsabilidad de su actividad profesional ni demuestra respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.	Inicial	10
38	Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos y asume la responsabilidad de su actividad profesional sin embargo, no demuestra respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.	En Desarrollo	10
39	Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos, asume la responsabilidad de su actividad profesional con respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.	Ideal	10
40	Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos, asume la responsabilidad de su actividad profesional con respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad. Además comparte las buenas prácticas de su labor profesional.	Avanzado	10
41	A1 Declara intención, pero no Realiza Acciones Especificas. Intenta tener un impacto o efecto específico; expresa preocupación por reputación, estatus y apariencias.\nA2 Realiza una Acción Simple para Persuadir. No realiza intentos aparentes para adaptarse al interés o nivel de la audiencia. Usa la persuasión directa en una discusión o presentación (e.g. apela a razones, datos, propósitos mayores; usa ejemplos concretos, ayudas audiovisuales, demostraciones,etc.).	Inicial	11
42	A3 Realiza una Acción con Dos Pasos para Persuadir. No realiza intentos aparentes para adaptarse al interés o nivel de la audiencia. Incluye preparación cuidadosa de datos a ser presentados, o la preparación de dos o más argumentos diferentes en una presentación o discusión.\nA4 Calcula el Impacto de sus Acciones o Palabras. Adapta una presentación o discusión para atraer el interés y nivel de los otros. Anticipa el efecto de una acción u otro detalle en la imagen que la gente se formará del relator.	En Desarrollo	11
43	A5 Calcula una Acción Dramática. Modela la conducta deseada de los demás o realiza una acción dramática bien pensada e inusual para tener un impacto específico.\nA6 Realiza Dos Pasos para Influenciar. Con cada paso adaptado a la audiencia específica o planeado para tener un efecto específico o se anticipa y prepara para la reacción de los demás.	Ideal	11
44	A7 Tres Acciones o Influencia Indirecta. Usa expertos o terceras personas para influenciar; o realiza tres acciones diferentes o realiza discusiones complejas, planeadas. Junta coaliciones políticas, construye apoyo desde bambalinas para sus ideas, deliberadamente proporciona o retiene información para tener efectos específicos, usa habilidades de procesos grupa les para dirigir o conducir a un grupo.\nA8 Estrategias de Influencia Compleja. Usa estrategias de influencia complejas adaptadas a situaciones específicas (e.g. usando cadenas de influencia indirecta obtener que A le muestre a B de manera que B le diga a C tal y tal cosa), estructurando trabajos o situaciones o cambiando laestructura organizacional para fomentar conductas deseadas; usa maniobras políticas complejas para alcanzar una meta o tener un efecto.	Avanzado	11
45	Coopera. Participa deseosamente, apoya las decisiones del equipo, es un "buen jugador del equipo", hace su parte del trabajo.\nComparte Información. Mantiene a la gente informada y al día acerca del proceso del grupo, comparte toda la información útil o relevante.	Inicial	12
46	Expresa Expectativas Positivas. Expresa expectativas positivas de los demás. Se refiere a los miembros del equipo en términos positivos. Muestra respeto por la inteligencia de los demás, apelando a la razón.\nSolicita Información. Valoriza genuinamente la información y experiencia de los otros, está deseoso de aprender de los demás, especialmente de subordinados. Solicita ideas y opiniones para ayudar a formar planes o decisiones específicas. Invita a todos los miembros del grupo a contribuir a un proceso.	En Desarrollo	12
47	Da Autoridad a Otros. Da público crédito a otros cuando han rendido bien. Apoya y autoriza a otros, los hace sentir fuertes o importantes. Forma Equipo. Actúa para promover un clima amigable, buena moral, y cooperación (realiza fiestas y reuniones, crea símbolos de identidad grupal). Protege y promueve la reputación del grupo con extraños.	Ideal	12
48	Resuelve Conflictos. Enfrenta los conflictos y anima o facilita una solución beneficiosa de los conflictos (debe involucrar acción para resolver el conflicto, no esconderlo o evitar el tema).	Avanzado	12
49	Acepta Invitaciones. Acepta invitaciones u otras aperturas amistosas de otros, pero no extiende las invitaciones o sale de su vía para establecer relaciones laborales. \nRealiza Contactos Relacionados con el Trabajo. Mantiene relaciones laborales formales (en gran medida confinadas a materias relacionadas con el trabajo, no necesariamente formales en el tono, estilo o estructura). Incluye charlas inestructuradas acerca de materias relativas al trabajo.	Inicial	13
50	Hace Contactos Ocasionales Informales. Ocasionalmente inicia relaciones informales o casuales en el trabajo, charlas sobre los niños, deportes, noticias, etc.\nConstruye Rapport. Frecuentemente inicia contactos informales o casuales en el trabajo con compañeros o clientes. Hace un esfuerzo consciente para establecer rapport.	En Desarrollo	13
51	Hace Contactos Sociales Ocasionales. Ocasionalmente inicia o persigue relaciones amistosas, con asociados o clientes fuera del trabajo en clubes, restaurantes, etc.	Ideal	13
52	Realiza Contactos Sociales Frecuentes. Frecuentemente inicia o prosigue relaciones amistosas con asociados o clientes fuera del trabajo en clubes, restaurantes, etc. \nHace Contactos Familiares y Hogareños. Ocasionalmente invita a casa a asociados o clientes o va a sus casas. \nHace Amistades Personales Cercanas. Frecuentemente entretiene a asociados o clientes en casa. Establece amistad personal con ellos o utiliza amistades personales para expandir la red del negocio.	Avanzado	13
53	A1 Expresa Expectativas Positivas de los Demás. Hace comentarios positivos relativos a las habilidades o potencialidades de los demás aún en casos "difíciles". Cree que los demás desean y pueden aprender. \nA2 Da Instrucciones Detalladas y/o Demostraciones en Terreno. Dice cómo hacer el trabajo, hace sugerencias útiles específicas.	Inicial	14
54	A3 Da Razones o Apoya a Otros. Da instrucciones o demostraciones con razones o racionales incluidas como estrategias de entrenamiento; o da apoyo práctico o ayuda para hacer más fácil el trabajo (e.g.entrega en forma voluntaria recursos adicionales, herramientas, información, ayuda experta). Hace preguntas, pruebas o usa otros métodos para verificar que los demás han entendido las explicaciones o instrucciones.\nA4 Da Retroalimentación Específica Positiva o Mezclada con Propósitos de Desarrollar.\nA5 Reasegura y Da Aliento. Reasegura a los otros luego de un traspié. Da retroalimentación negativa en términos conductuales más que personales, y expresa expectativas positivas para el desempeño futuro o de sugerencias individualizadas para mejoramiento; o descompone tareas difíciles en partes más pequeñas, o usa otras estrategias.	En Desarrollo	14
55	A6 Hace Entrenamiento o Enseñanza de Largo Plazo. Diseña misiones apropiadas y de ayuda, entrenamiento formal, u otras experiencias con el propósito de fomentar el aprendizaje y desarrollo de la otra persona. Incluye hacer que la persona trabaje por sí misma, respuesta a problemas de manera que ellos realmente adquieran experiencia, en vez de simplemente darles la respuesta. Entrenamiento formal realizado simplemente para cumplir con requerimientos corporativos o gubernamentales no cuenta aquí.\nA7 Crea Nuevo Entrenamiento/Enseñanza. Identifica una necesidad de entrenamiento o desarrollo y diseña o establece nuevos programas o materiales para alcanzarlos; diseña enfoques significativamente nuevos para enseñar materias tradicionales; o arregla experiencias exitosas para que otros desarrollen sus habilidades y confianza.	Ideal	14
56	A8 Delega Completamente. Luego de evaluar las competencias de los subordinados, delega total autoridad y responsabilidad con la posibilidad de realizar una tarea a su manera, incluyendo la oportunidad de hacer y aprender de los errores en un ambiente no crítico.\nA9 Recompensa Buen Desarrollo. Promueve o consigue promociones para subordinados, .especialmente competentes como recompensa o como experiencias de desarrollo; o da a los otros recompensas por buen desempeño. Esta conducta se puntúa alto porque, generalmente, un individuo tiene que haber desarrollado bien a la gente para ser capaz de recompensarlos por haber respondido bien.	Avanzado	14
57	Administra Reuniones.\nConfecciona agendas y objetivos, controla el tiempo, asigna tareas, etc. 	Inicial	15
58	Informa a Personas. Permite saber qué sucede a las personas afectadas por una decisión. Asegura que el grupo tenga la información necesaria. Puede explicar las razones de una decisión.\nUsa la Autoridad con Justicia. Usa el poder y la autoridad formal de una manera justa y equitativa.  Hace un esfuerzo personal para tratar con justicia a todos los miembros del grupo.	En Desarrollo	15
59	Promueve la Efectividad del Equipo. Usa estrategias complejas para promover la moral y productividad del equipo (decisiones de contratos y despidos, asignaciones de tareas, entrenamiento cruzado, etc.)\nCuida al Grupo. Protege al grupo y su reputación respecto a la organización o la comunidad en su conjunto: obtiene el personal deseado, recursos, información para el grupo. Asegura que se alcancen las necesidades prácticas del grupo. Frecuentemente este nivel se encuentra en situaciones militares o industriales, pero también se aplica en la obtención de recursos menos tangibles para profesionales o gerenciales subordinados.	Ideal	15
60	Se Posiciona Así mismo como Líder. Asegura que los otros asuman la misión, metas, agenda, clima, políticas, etc. "Da un buen ejemplo" (es decir, modela la conducta deseada). Asegura que las tareas del grupo se cumplan (es un líder creíble). /nComunica una Visión Obligada. Tiene genuino carisma, comunica una visión obligada, que genera excitación, entusiasmo, y compromiso a la misión del grupo. (ejemplo de este nivel son raros y es probable que se infieran del resultado de actividades, de reportes de otros, y de las observaciones e impresiones del entrevistador más que de citas directas.	Avanzado	15
61	Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software; sin embargo, no soluciona el problema dado.	Inicial	16
62	Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software; sin embargo, soluciona en parte el problema dado.	En Desarrollo	16
63	Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software, alcanzando los resultados esperados según el problema dado.	Ideal	16
64	Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software, alcanzando los resultados previstos con los menores recursos posibles.	Avanzado	16
65	Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; sin embargo no está acorde al diseño propuesto	Inicial	17
66	Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; sin embargo cumple en parte con el diseño propuesto	En Desarrollo	17
67	Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; cumpliendo con todo el diseño propuesto	Ideal	17
68	Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; cumpliendo con todo el diseño propuesto, alcanzando los resultados previstos con los menores recursos posibles.	Avanzado	17
\.


--
-- Data for Name: rubrica_so; Type: TABLE DATA; Schema: public; Owner: pablodb
--

COPY public.rubrica_so (rub_id, doc_id, est_id, grp_id, cri_id, rub_niv) FROM stdin;
34	65	251	216	7	28
18	65	180	123	2	7
45	50	78	88	1	4
63	57	97	102	2	5
64	57	98	102	2	6
66	9	4	14	1	3
67	9	5	14	1	4
68	9	6	14	1	4
69	63	127	115	1	2
70	63	124	115	1	3
71	63	126	115	1	3
72	63	129	115	1	3
73	57	109	102	2	8
74	63	130	115	1	3
75	63	104	115	1	3
77	2	1	2	1	2
78	57	110	102	2	8
79	63	138	115	1	3
80	63	139	115	1	3
81	9	7	14	1	3
82	63	140	115	1	3
83	63	141	115	1	3
84	57	111	102	2	7
85	63	142	115	1	3
86	2	2	2	1	2
87	63	143	115	1	3
88	9	11	14	1	4
90	2	3	2	1	1
91	9	14	14	1	1
89	63	144	115	1	3
94	9	22	14	1	3
97	57	112	102	2	8
98	2	10	2	1	2
99	48	66	78	1	1
100	48	78	78	1	1
101	48	91	78	1	4
148	2	49	2	1	2
95	63	147	115	1	3
96	63	148	115	1	2
105	9	24	14	1	3
106	9	25	14	1	4
107	9	26	14	1	4
108	2	12	2	1	2
109	9	27	14	1	1
93	63	145	115	1	2
111	57	116	102	2	6
112	2	13	2	1	3
114	2	18	2	1	2
115	57	118	102	2	6
116	2	23	2	1	4
113	9	36	14	1	2
118	57	119	102	2	8
76	63	134	115	1	2
120	9	37	14	1	1
121	9	38	14	1	2
122	57	120	102	2	7
123	9	43	14	1	2
124	57	122	102	2	6
125	9	44	14	1	4
126	9	48	14	1	3
127	9	50	14	1	3
129	9	53	14	1	2
130	2	31	2	1	2
131	9	55	14	1	1
132	9	57	14	1	3
133	2	32	2	1	2
134	9	60	14	1	1
135	2	42	2	1	1
136	9	61	14	1	2
137	9	74	14	1	2
138	9	86	14	1	2
139	9	87	14	1	2
141	9	88	14	1	1
142	9	89	14	1	2
143	9	92	14	1	1
144	4	1	4	1	3
145	2	45	2	1	3
146	2	46	2	1	1
147	2	47	2	1	2
150	2	51	2	1	1
151	5	1	5	2	7
152	5	11	5	2	7
153	2	56	2	1	3
154	2	62	2	1	3
155	5	13	5	2	8
156	5	18	5	2	7
157	2	63	2	1	4
158	5	23	5	2	8
159	2	65	2	1	1
160	4	10	4	1	1
161	5	24	5	2	7
162	4	11	4	1	2
163	2	67	2	1	3
164	2	69	2	1	3
165	2	70	2	1	4
166	77	177	163	1	4
167	5	31	5	2	7
168	2	71	2	1	1
47	74	155	146	2	8
49	74	159	146	2	5
46	74	154	146	2	8
50	74	160	146	2	5
51	74	135	146	2	6
52	74	161	146	2	7
53	74	163	146	2	6
54	74	164	146	2	7
55	74	165	146	2	6
56	74	166	146	2	7
57	74	167	146	2	7
58	74	169	146	2	6
59	74	170	146	2	8
60	74	171	146	2	6
62	74	176	146	2	7
4	65	253	216	3	12
35	65	253	216	7	28
37	65	251	216	8	32
38	65	253	216	8	32
40	65	251	216	9	36
41	65	253	216	9	36
44	65	251	216	10	40
43	65	253	216	10	40
6	65	178	180	3	10
7	65	190	180	3	11
5	65	189	180	3	12
9	65	194	180	3	12
10	65	196	180	3	12
11	65	187	180	3	11
28	65	197	123	2	8
32	65	182	123	2	7
30	65	195	123	2	7
3	65	251	216	3	12
27	65	198	123	2	7
26	65	199	123	2	7
25	65	168	123	2	7
24	65	183	123	2	7
23	65	172	123	2	7
21	65	185	123	2	7
20	65	186	123	2	7
12	65	177	123	2	8
19	65	188	123	2	8
17	65	179	123	2	8
13	65	125	123	2	7
170	5	32	5	2	6
172	2	73	2	1	3
175	4	12	4	1	3
176	2	81	2	1	1
177	2	82	2	1	4
178	5	34	5	2	5
179	4	13	4	1	3
180	2	83	2	1	3
181	2	93	2	1	4
183	4	17	4	1	1
169	77	154	163	1	3
171	77	178	163	1	3
186	4	18	4	1	2
187	4	21	4	1	1
173	77	172	163	1	3
189	5	36	5	2	7
190	48	98	106	1	2
191	48	99	106	1	2
192	4	23	4	1	3
193	5	42	5	2	5
194	48	109	106	1	2
195	5	44	5	2	7
196	4	31	4	1	2
197	4	32	4	1	2
198	4	34	4	1	2
199	5	46	5	2	6
200	4	41	4	1	2
201	4	42	4	1	1
202	48	111	106	1	4
203	48	116	106	1	2
204	5	47	5	2	6
205	4	44	4	1	3
174	77	185	163	1	3
207	6	2	6	1	4
208	48	118	106	1	2
209	77	187	163	1	3
211	4	46	4	1	2
212	48	119	106	1	4
303	75	135	149	4	15
215	4	47	4	1	2
216	77	174	163	1	2
218	5	49	5	2	5
220	77	188	163	1	3
221	4	49	4	1	2
222	5	56	5	2	6
223	4	51	4	1	1
224	6	5	6	1	4
225	5	58	5	2	6
226	4	52	4	1	1
227	5	62	5	2	7
228	4	56	4	1	3
229	4	62	4	1	3
219	6	4	6	1	1
210	6	3	6	1	1
233	5	65	5	2	5
234	6	24	6	1	1
235	4	65	4	1	1
236	6	25	6	1	1
237	5	66	5	2	7
238	4	67	4	1	3
239	5	67	5	2	8
230	6	6	6	1	3
241	5	71	5	2	5
242	4	69	4	1	3
243	5	73	5	2	7
244	4	71	4	1	1
245	5	81	5	2	6
246	4	73	4	1	2
247	6	26	6	1	4
249	4	81	4	1	2
250	5	82	5	2	7
251	77	161	171	1	3
252	4	82	4	1	3
253	5	83	5	2	7
254	5	85	5	2	6
255	6	36	6	1	3
256	6	38	6	1	1
258	4	83	4	1	4
259	4	93	4	1	2
260	6	43	6	1	1
257	5	87	5	2	6
262	6	48	6	1	1
263	77	163	156	1	3
264	5	93	5	2	7
265	6	50	6	1	1
266	77	149	156	1	3
267	6	53	6	1	1
268	6	55	6	1	1
269	6	57	6	1	1
270	6	60	6	1	1
271	6	61	6	1	3
272	6	74	6	1	1
273	6	86	6	1	3
274	6	89	6	1	1
275	6	92	6	1	1
276	4	37	56	1	1
277	4	63	56	1	3
279	5	2	8	2	7
280	5	3	8	2	5
281	5	12	8	2	6
282	5	60	8	2	5
283	5	88	8	2	5
284	5	84	8	2	5
285	2	88	92	1	1
288	95	215	204	3	10
290	95	216	204	3	11
291	95	219	204	3	12
292	95	221	204	3	10
293	95	223	204	3	10
294	95	224	204	3	10
295	95	225	204	3	10
297	95	226	204	3	11
299	95	227	204	3	10
300	95	228	204	3	12
319	95	215	204	16	62
302	95	229	204	3	10
304	73	189	140	1	4
305	95	230	204	3	10
306	73	194	140	1	4
307	73	162	140	1	4
357	75	166	149	4	16
309	73	196	140	1	4
310	73	197	140	1	4
311	73	198	140	1	4
312	73	186	140	1	4
313	73	125	140	1	3
314	73	182	140	1	3
322	95	216	204	16	63
323	95	219	204	16	64
325	95	221	204	16	62
326	95	223	204	16	62
329	95	224	204	16	62
330	95	225	204	16	62
331	95	226	204	16	63
332	95	227	204	16	62
333	95	228	204	16	64
334	95	229	204	16	62
335	95	230	204	16	62
48	74	131	146	2	7
343	95	215	204	17	66
345	95	216	204	17	66
324	74	173	146	2	7
61	74	174	146	2	7
359	75	176	149	4	15
320	73	199	140	1	2
316	73	195	140	1	2
363	75	159	165	1	3
364	75	135	165	1	3
367	75	173	165	1	3
358	75	173	149	4	15
360	75	174	149	4	15
368	75	155	165	1	4
365	75	166	165	1	4
366	75	168	165	1	2
370	73	189	140	16	64
371	95	219	204	17	66
372	95	221	204	17	66
373	95	223	204	17	66
374	79	154	162	9	35
375	95	224	204	17	66
376	95	225	204	17	66
378	95	226	204	17	66
379	95	227	204	17	66
380	95	228	204	17	66
381	95	229	204	17	66
382	95	230	204	17	66
377	73	125	140	16	63
384	79	193	162	9	36
385	79	162	162	9	34
386	73	182	140	16	63
387	73	194	140	16	64
388	73	162	140	16	64
389	73	195	140	16	62
390	73	196	140	16	64
392	73	197	140	16	64
393	73	198	140	16	64
394	79	167	162	9	34
395	73	199	140	16	62
396	73	186	140	16	64
397	79	169	162	9	36
398	79	170	162	9	36
399	79	186	162	9	34
401	73	189	140	17	68
402	73	125	140	17	67
403	73	182	140	17	67
404	73	194	140	17	68
405	73	162	140	17	68
406	73	195	140	17	66
407	73	196	140	17	68
408	73	197	140	17	68
409	73	198	140	17	68
410	73	199	140	17	66
411	73	186	140	17	68
412	79	154	162	10	40
413	79	193	162	10	40
414	79	162	162	10	38
391	14	91	69	7	28
400	14	56	69	7	27
417	14	56	69	8	31
418	14	91	69	8	32
419	79	167	162	10	40
420	42	97	84	3	9
421	79	169	162	10	40
422	79	170	162	10	40
423	79	186	162	10	39
518	75	189	181	14	54
424	75	189	181	9	35
427	75	178	181	9	35
428	14	50	39	7	26
429	42	98	84	3	10
430	75	192	181	9	35
431	75	182	181	9	35
432	75	194	181	9	35
434	75	195	181	9	35
433	14	23	39	7	27
436	42	107	84	3	12
437	14	23	39	8	32
438	14	50	39	8	30
439	73	189	141	3	12
441	42	109	84	3	12
442	75	196	181	9	35
443	73	125	141	3	11
444	75	197	181	9	35
445	75	198	181	9	35
446	75	199	181	9	35
448	73	178	141	3	11
447	75	183	181	9	35
450	75	187	181	9	35
451	73	191	141	3	10
452	73	192	141	3	10
453	73	181	141	3	10
454	73	182	141	3	11
455	73	194	141	3	12
456	75	178	181	10	39
457	75	192	181	10	39
458	75	182	181	10	39
459	73	162	141	3	12
460	75	194	181	10	39
461	73	195	141	3	10
462	75	195	181	10	39
463	8	4	12	2	7
464	8	5	12	2	8
465	75	196	181	10	39
466	75	197	181	10	39
467	73	196	141	3	12
468	8	6	12	2	7
469	75	198	181	10	39
470	75	199	181	10	39
471	73	197	141	3	12
472	75	183	181	10	39
473	75	187	181	10	39
474	73	198	141	3	12
475	8	7	12	2	7
476	75	189	181	10	37
477	73	199	141	3	10
478	75	189	181	11	41
479	75	178	181	11	43
480	75	192	181	11	43
481	75	182	181	11	43
482	75	194	181	11	43
483	75	195	181	11	43
484	75	196	181	11	43
485	75	197	181	11	43
486	75	198	181	11	43
487	73	183	141	3	12
488	75	199	181	11	43
489	75	183	181	11	43
490	73	186	141	3	12
491	75	187	181	11	43
493	75	189	181	12	45
494	75	178	181	12	47
495	75	192	181	12	47
496	75	182	181	12	47
497	75	194	181	12	47
498	75	195	181	12	47
499	75	196	181	12	47
500	75	197	181	12	47
501	75	198	181	12	47
502	75	199	181	12	47
503	75	183	181	12	47
504	75	187	181	12	47
505	75	189	181	13	50
506	75	178	181	13	51
492	73	187	141	3	11
508	75	192	181	13	51
509	75	182	181	13	51
510	75	194	181	13	51
511	75	195	181	13	51
512	75	196	181	13	51
513	75	197	181	13	51
514	75	198	181	13	51
515	75	199	181	13	51
516	75	183	181	13	51
517	75	187	181	13	51
519	75	178	181	14	55
520	75	192	181	14	55
521	75	182	181	14	55
522	75	194	181	14	55
523	75	195	181	14	55
524	75	196	181	14	55
525	75	197	181	14	55
526	75	198	181	14	55
527	14	10	20	7	27
528	75	199	181	14	55
529	75	183	181	14	55
530	75	187	181	14	55
531	14	86	20	7	27
532	75	189	181	15	58
440	42	108	84	3	11
533	75	178	181	15	59
534	75	192	181	15	59
535	75	182	181	15	59
537	75	194	181	15	59
538	14	10	20	8	31
539	75	195	181	15	59
536	8	10	12	2	8
541	14	86	20	8	31
542	75	196	181	15	59
543	75	197	181	15	59
544	75	198	181	15	59
545	75	199	181	15	59
546	75	183	181	15	59
547	75	187	181	15	59
548	8	25	12	2	8
549	8	26	12	2	8
298	75	155	149	4	16
552	8	43	12	2	7
554	8	48	12	2	8
556	8	50	12	2	8
557	8	53	12	2	8
560	73	189	141	9	35
561	73	125	141	9	35
562	8	57	12	2	7
563	73	178	141	9	35
565	73	191	141	9	35
566	8	61	12	2	8
567	73	192	141	9	35
568	73	181	141	9	35
569	8	69	12	2	8
570	73	182	141	9	35
571	8	70	12	2	8
572	8	77	12	2	7
573	8	86	12	2	7
574	8	89	12	2	8
575	8	91	12	2	8
369	75	175	178	1	2
577	73	194	141	9	35
579	73	162	141	9	35
580	73	195	141	9	35
578	8	92	12	2	6
582	73	196	141	9	35
583	73	197	141	9	35
584	73	198	141	9	35
585	73	199	141	9	35
586	73	183	141	9	35
587	73	186	141	9	35
588	73	187	141	9	35
589	75	200	194	9	35
590	73	189	141	10	39
591	73	125	141	10	39
592	73	178	141	10	39
593	73	191	141	10	39
594	73	192	141	10	39
595	75	215	194	9	35
596	73	181	141	10	39
597	73	182	141	10	39
598	75	216	194	9	36
599	73	194	141	10	39
600	73	162	141	10	39
601	73	195	141	10	39
602	73	196	141	10	39
603	73	197	141	10	39
604	73	198	141	10	39
605	73	199	141	10	39
606	73	183	141	10	39
607	75	219	194	9	35
608	73	186	141	10	39
609	73	187	141	10	39
610	75	223	194	9	35
612	75	224	194	9	35
613	75	210	194	9	34
614	75	225	194	9	35
615	75	226	194	9	35
616	75	227	194	9	35
617	62	176	112	3	12
618	75	228	194	9	36
619	62	171	112	3	12
620	73	189	141	16	64
621	75	229	194	9	35
622	75	230	194	9	35
623	75	200	194	10	39
624	73	125	141	16	63
625	75	215	194	10	39
626	75	216	194	10	39
627	75	219	194	10	40
628	75	223	194	10	40
629	75	224	194	10	39
630	75	210	194	10	39
631	75	225	194	10	39
632	73	178	141	16	63
633	75	226	194	10	39
634	73	191	141	16	62
635	75	227	194	10	39
636	73	192	141	16	62
637	75	228	194	10	40
638	73	181	141	16	62
639	75	229	194	10	40
640	75	230	194	10	39
641	73	182	141	16	63
643	73	194	141	16	64
644	62	102	112	3	9
645	73	162	141	16	64
646	73	195	141	16	62
647	62	132	112	3	9
648	62	143	112	3	9
649	75	200	194	11	43
650	75	215	194	11	43
651	73	196	141	16	64
652	75	216	194	11	43
654	62	149	112	3	9
655	73	197	141	16	64
656	75	223	194	11	43
657	75	224	194	11	43
658	73	198	141	16	64
659	75	210	194	11	43
660	73	199	141	16	62
653	75	219	194	11	44
662	73	183	141	16	64
663	75	225	194	11	43
664	75	226	194	11	43
665	73	186	141	16	64
666	75	227	194	11	43
668	73	187	141	16	63
669	75	229	194	11	43
670	75	230	194	11	43
667	75	228	194	11	44
672	73	189	141	17	68
673	73	125	141	17	67
674	62	155	112	3	11
675	73	178	141	17	67
676	73	191	141	17	66
677	62	131	112	3	10
678	73	192	141	17	66
679	62	135	112	3	10
680	73	181	141	17	66
681	62	166	112	3	10
682	73	182	141	17	67
683	73	194	141	17	68
684	73	162	141	17	68
685	75	200	194	12	47
686	75	215	194	12	47
687	73	195	141	17	66
688	75	216	194	12	47
689	75	219	194	12	47
690	75	223	194	12	47
691	73	196	141	17	68
692	73	197	141	17	68
693	75	224	194	12	47
694	73	198	141	17	68
695	75	210	194	12	47
696	73	199	141	17	66
697	75	225	194	12	47
698	75	226	194	12	47
699	42	110	84	3	9
700	75	227	194	12	48
702	73	183	141	17	68
703	73	186	141	17	68
704	75	229	194	12	47
701	75	228	194	12	48
707	75	230	194	12	47
708	73	187	141	17	67
709	75	200	194	13	51
710	75	215	194	13	51
711	75	216	194	13	51
712	75	219	194	13	51
713	75	223	194	13	51
714	75	224	194	13	51
715	62	155	112	4	15
716	75	210	194	13	51
846	75	202	186	11	43
718	75	225	194	13	51
719	75	226	194	13	51
720	62	176	112	4	16
705	42	111	84	3	12
722	62	171	112	4	16
723	75	227	194	13	52
724	82	177	168	3	11
726	75	228	194	13	51
727	82	180	168	3	11
728	42	112	84	3	11
729	75	229	194	13	52
725	82	179	168	3	10
731	42	113	84	3	9
732	62	132	112	4	13
733	75	230	194	13	51
734	62	149	112	4	13
737	75	200	194	14	55
738	42	118	84	3	10
739	75	215	194	14	55
740	75	216	194	14	55
741	75	219	194	14	55
742	75	223	194	14	55
743	75	224	194	14	55
744	75	210	194	14	55
745	75	225	194	14	56
746	75	226	194	14	55
747	75	227	194	14	56
749	42	119	84	3	12
750	75	228	194	14	56
752	42	76	84	3	9
753	75	229	194	14	55
754	75	230	194	14	55
755	62	143	112	4	13
751	82	158	168	3	10
757	82	168	168	3	11
758	82	172	168	3	11
759	42	122	84	3	12
760	62	102	112	4	13
761	73	201	187	3	12
762	75	200	194	15	59
763	62	131	112	4	14
764	62	135	112	4	14
765	62	166	112	4	14
766	75	215	194	15	59
767	75	216	194	15	59
768	75	219	194	15	59
769	75	223	194	15	59
770	75	224	194	15	59
771	75	210	194	15	59
772	75	225	194	15	59
773	75	226	194	15	59
775	75	227	194	15	59
776	42	120	84	3	10
777	75	228	194	15	60
778	75	229	194	15	60
779	75	230	194	15	60
774	73	190	187	3	11
781	62	176	112	6	24
783	73	204	187	3	12
784	73	205	187	3	11
785	73	206	187	3	11
786	73	207	187	3	12
787	73	208	187	3	12
788	62	102	112	6	21
789	75	201	186	9	35
790	62	132	112	6	21
791	75	190	186	9	35
792	73	209	187	3	11
793	82	185	168	3	11
794	75	202	186	9	35
795	73	212	187	3	12
796	62	143	112	6	21
797	62	149	112	6	21
798	75	191	186	9	35
799	73	213	187	3	11
800	75	204	186	9	35
801	62	155	112	6	23
802	73	214	187	3	11
803	75	205	186	9	35
804	62	131	112	6	22
805	75	206	186	9	35
806	82	188	168	3	11
807	62	135	112	6	22
808	62	166	112	6	22
809	75	207	186	9	36
782	62	171	112	6	22
811	75	193	186	9	36
812	75	208	186	9	36
813	75	209	186	9	36
814	75	212	186	9	35
815	75	213	186	9	35
816	75	214	186	9	36
818	75	201	186	10	40
819	75	190	186	10	40
820	75	202	186	10	40
821	75	191	186	10	40
822	75	204	186	10	39
824	75	205	186	10	39
825	75	206	186	10	39
826	62	157	125	3	9
827	75	207	186	10	40
828	75	193	186	10	40
829	75	208	186	10	39
830	75	209	186	10	39
832	62	159	125	3	9
831	62	160	125	3	10
834	75	212	186	10	39
835	75	213	186	10	39
836	73	201	187	7	28
838	75	214	186	10	39
839	73	190	187	7	27
841	73	204	187	7	28
842	73	205	187	7	27
843	75	201	186	11	43
844	62	54	125	3	9
845	75	190	186	11	43
847	75	191	186	11	43
848	73	206	187	7	27
849	75	204	186	11	43
850	62	165	125	3	9
851	75	205	186	11	43
852	75	206	186	11	43
853	75	207	186	11	43
854	75	193	186	11	43
855	73	207	187	7	28
856	75	208	186	11	43
857	75	209	186	11	43
858	62	168	125	3	12
859	75	212	186	11	43
860	75	213	186	11	43
861	73	208	187	7	28
862	75	214	186	11	43
863	75	201	186	12	47
864	75	190	186	12	47
865	73	209	187	7	27
866	75	202	186	12	47
867	75	191	186	12	47
736	42	116	84	3	11
823	62	179	125	3	11
817	62	156	125	3	9
868	75	204	186	12	47
869	75	205	186	12	47
870	75	206	186	12	47
871	73	212	187	7	28
872	75	207	186	12	47
735	42	115	84	3	11
874	75	193	186	12	47
876	75	208	186	12	47
877	75	209	186	12	47
878	75	212	186	12	47
879	73	213	187	7	27
880	75	213	186	12	47
881	75	214	186	12	47
882	73	214	187	7	27
883	75	201	186	13	51
884	75	190	186	13	51
885	75	202	186	13	51
886	75	191	186	13	51
887	75	204	186	13	51
888	75	205	186	13	51
889	75	206	186	13	51
890	75	207	186	13	51
891	75	193	186	13	51
892	75	208	186	13	51
893	75	209	186	13	51
894	75	212	186	13	51
895	75	213	186	13	51
896	75	214	186	13	51
897	75	201	186	14	55
898	75	190	186	14	55
899	75	202	186	14	55
900	75	191	186	14	55
901	75	204	186	14	55
902	75	205	186	14	55
903	75	206	186	14	55
904	75	207	186	14	55
905	75	193	186	14	55
906	75	208	186	14	55
907	75	209	186	14	55
908	75	212	186	14	55
909	75	213	186	14	55
910	75	214	186	14	55
911	75	201	186	15	59
912	75	190	186	15	59
913	75	202	186	15	58
914	73	201	187	8	32
915	75	191	186	15	58
916	73	190	187	8	31
917	75	204	186	15	58
918	73	204	187	8	32
919	75	205	186	15	58
920	73	205	187	8	31
921	73	206	187	8	31
922	75	206	186	15	58
923	75	207	186	15	60
924	73	207	187	8	32
925	73	208	187	8	32
926	75	193	186	15	59
927	73	209	187	8	31
928	75	208	186	15	59
929	73	212	187	8	32
930	73	213	187	8	31
931	75	209	186	15	58
933	75	212	186	15	59
934	75	213	186	15	59
936	75	214	186	15	60
937	82	236	213	3	11
938	73	214	187	8	31
939	73	201	187	9	35
940	73	190	187	9	35
941	73	204	187	9	35
942	82	237	213	3	11
943	73	205	187	9	35
944	82	238	213	3	11
945	73	206	187	9	35
946	73	207	187	9	35
947	73	208	187	9	35
948	73	209	187	9	35
954	82	251	213	3	10
950	73	212	187	9	35
951	73	213	187	9	35
952	73	214	187	9	35
953	82	250	213	3	11
957	73	201	187	10	39
958	73	190	187	10	39
959	73	204	187	10	39
960	73	205	187	10	39
961	73	206	187	10	39
962	73	207	187	10	39
963	73	208	187	10	39
964	75	231	200	9	35
965	73	209	187	10	39
966	75	232	200	9	35
967	73	212	187	10	39
968	75	233	200	9	35
969	73	213	187	10	39
970	73	214	187	10	39
971	75	217	200	9	35
972	75	218	200	9	35
973	75	220	200	9	35
974	75	234	200	9	36
975	73	201	187	16	64
976	73	190	187	16	62
977	75	235	200	9	35
978	73	204	187	16	64
979	73	205	187	16	62
980	75	236	200	9	35
981	73	206	187	16	62
982	75	238	200	9	36
983	73	207	187	16	64
984	75	240	200	9	36
985	73	208	187	16	64
986	75	222	200	9	35
987	73	209	187	16	62
988	75	241	200	9	35
989	75	242	200	9	36
990	73	212	187	16	64
991	73	213	187	16	62
992	73	214	187	16	62
993	75	211	200	9	34
994	75	243	200	9	36
995	75	244	200	9	35
996	75	245	200	9	36
997	75	246	200	9	36
998	73	201	187	17	68
999	73	190	187	17	66
1000	75	247	200	9	35
1001	73	204	187	17	68
1002	73	205	187	17	66
1003	75	248	200	9	35
1004	73	206	187	17	66
1005	75	231	200	10	39
1006	73	207	187	17	68
1008	73	208	187	17	68
1009	75	232	200	10	40
1010	73	209	187	17	66
1011	75	233	200	10	40
1013	73	212	187	17	68
1014	73	213	187	17	66
1015	75	217	200	10	39
1016	73	214	187	17	66
1017	75	218	200	10	39
1018	75	220	200	10	39
1019	75	234	200	10	40
1020	75	235	200	10	39
1021	75	236	200	10	39
1022	75	238	200	10	38
1023	75	240	200	10	39
1024	75	222	200	10	39
1025	75	241	200	10	39
1026	75	242	200	10	40
932	82	231	213	3	10
935	82	235	213	3	10
955	82	241	213	3	10
956	82	253	213	3	10
1027	75	211	200	10	39
1028	75	243	200	10	40
1029	75	244	200	10	40
1030	75	245	200	10	40
1031	75	246	200	10	39
1032	75	247	200	10	39
1033	75	248	200	10	39
1034	75	231	200	11	43
1035	75	232	200	11	43
1037	75	217	200	11	43
1038	75	218	200	11	43
1039	75	220	200	11	43
1040	75	234	200	11	43
1041	75	235	200	11	43
1036	75	233	200	11	44
1043	75	236	200	11	43
1044	75	238	200	11	43
1045	75	240	200	11	44
1046	75	222	200	11	43
1047	75	241	200	11	44
1048	75	242	200	11	44
1049	75	211	200	11	43
1050	75	243	200	11	44
1052	75	244	200	11	43
1053	75	245	200	11	44
1054	75	247	200	11	43
1055	62	177	125	3	12
1056	75	246	200	11	43
1057	75	248	200	11	43
1058	75	231	200	12	47
1059	75	232	200	12	47
1060	75	233	200	12	47
1061	75	217	200	12	47
1065	75	218	200	12	46
1066	75	220	200	12	46
1067	73	249	217	3	12
1069	73	239	217	3	12
1068	75	234	200	12	48
1072	75	235	200	12	47
1073	75	236	200	12	47
1074	75	238	200	12	47
1071	62	169	125	3	11
1076	73	249	217	7	28
1077	73	239	217	7	28
1078	75	240	200	12	48
1079	73	249	217	8	32
1081	73	239	217	8	32
1082	75	222	200	12	47
1083	75	241	200	12	48
1084	75	242	200	12	48
1086	73	249	217	9	36
1087	75	211	200	12	47
1088	73	239	217	9	36
1089	75	243	200	12	48
1090	75	244	200	12	47
1091	75	245	200	12	47
1092	75	246	200	12	47
1093	75	247	200	12	47
1094	75	248	200	12	47
1095	73	249	217	10	40
1096	73	239	217	10	40
1097	75	231	200	13	51
1098	75	232	200	13	51
1100	75	233	200	13	51
1101	75	217	200	13	51
1102	75	218	200	13	51
1103	75	220	200	13	51
1104	62	167	125	3	12
1105	75	234	200	13	51
1106	73	249	217	16	64
1107	75	235	200	13	51
1108	73	239	217	16	64
1109	75	236	200	13	51
1110	75	238	200	13	51
1111	75	240	200	13	51
1112	75	222	200	13	51
1113	73	249	217	17	68
1114	73	239	217	17	68
1115	75	241	200	13	50
1117	75	242	200	13	52
1118	75	211	200	13	51
1119	75	243	200	13	52
1120	75	244	200	13	52
1121	75	245	200	13	52
1122	75	246	200	13	51
1123	75	247	200	13	51
1124	75	248	200	13	51
1125	75	231	200	14	55
1126	75	232	200	14	55
1127	75	233	200	14	55
1128	75	217	200	14	55
1129	75	218	200	14	55
1130	75	220	200	14	55
1131	75	234	200	14	55
1132	75	235	200	14	56
1133	75	236	200	14	55
1134	75	238	200	14	55
1135	75	240	200	14	55
1136	75	222	200	14	56
1137	75	241	200	14	54
1138	75	242	200	14	55
1139	75	211	200	14	55
1140	75	243	200	14	55
1141	62	161	125	3	9
1142	75	244	200	14	56
1143	75	245	200	14	55
1144	75	246	200	14	56
1145	75	247	200	14	55
1146	75	248	200	14	55
1147	75	231	200	15	59
1148	75	232	200	15	59
1149	75	233	200	15	59
1150	75	217	200	15	59
1151	75	218	200	15	59
1152	75	220	200	15	59
1153	75	234	200	15	59
1154	75	235	200	15	59
1155	75	236	200	15	59
1156	75	238	200	15	59
1157	75	240	200	15	60
1158	75	222	200	15	59
1159	62	188	125	3	10
1160	62	174	125	3	10
1161	62	185	125	3	10
1162	62	173	125	3	10
1099	62	172	125	3	10
1164	62	170	125	3	10
1165	75	241	200	15	59
1166	75	242	200	15	60
1167	62	164	125	3	10
1168	62	163	125	3	10
1169	75	211	200	15	59
1170	62	180	125	3	10
1171	75	243	200	15	60
1172	62	154	125	3	10
1173	75	244	200	15	59
1175	75	245	200	15	60
1176	42	124	59	2	5
1177	75	246	200	15	59
1178	75	248	200	15	60
1179	62	177	125	4	16
1180	62	156	125	4	13
1181	62	179	125	4	15
1182	62	157	125	4	13
1183	62	161	125	4	13
1184	62	54	125	4	13
1185	62	165	125	4	13
1186	62	167	125	4	16
1187	62	168	125	4	16
1188	62	169	125	4	15
1189	42	96	59	2	5
1190	42	126	59	2	5
1191	62	188	125	4	15
1192	62	185	125	4	15
1193	62	174	125	4	14
1194	62	173	125	4	15
1195	62	172	125	4	14
1196	62	170	125	4	14
1199	62	164	125	4	14
1200	62	163	125	4	14
1204	62	160	125	4	15
1205	62	159	125	4	14
1206	62	180	125	4	14
1207	62	154	125	4	14
1208	62	177	125	6	24
1209	62	156	125	6	21
1210	62	179	125	6	23
1211	82	231	213	16	62
1212	82	235	213	16	62
1213	82	236	213	16	63
1214	82	237	213	16	63
1215	82	238	213	16	63
1216	82	250	213	16	62
1217	82	251	213	16	62
1218	82	241	213	16	62
1219	82	253	213	16	62
1220	62	157	125	6	21
1223	82	236	213	17	67
1224	82	237	213	17	67
1225	82	238	213	17	67
1229	62	159	125	6	22
1231	62	160	125	6	23
1232	62	161	125	6	21
1235	62	163	125	6	22
1238	62	164	125	6	22
1239	62	54	125	6	21
1240	62	165	125	6	21
1241	62	167	125	6	24
1242	62	168	125	6	24
1243	62	169	125	6	23
1221	82	231	213	17	67
1222	82	235	213	17	67
1226	82	250	213	17	67
1227	82	251	213	17	67
1228	82	241	213	17	67
1230	82	253	213	17	67
1250	62	170	125	6	22
1251	62	172	125	6	22
1252	62	173	125	6	22
1253	62	185	125	6	22
1254	62	174	125	6	22
1255	62	188	125	6	23
1256	62	180	125	6	22
1257	62	154	125	6	22
1174	42	94	59	2	6
1259	42	127	59	2	7
1260	42	99	59	2	5
1261	42	100	59	2	6
1262	42	128	59	2	7
1263	42	129	59	2	5
1264	42	102	59	2	5
1265	42	130	59	2	6
1266	42	132	59	2	7
1267	42	104	59	2	5
1268	42	134	59	2	6
1269	42	39	59	2	6
1270	42	136	59	2	5
1271	42	137	59	2	6
1273	42	138	59	2	6
1274	42	139	59	2	6
1272	42	114	59	2	6
1276	42	140	59	2	6
1277	42	141	59	2	5
1278	42	142	59	2	5
1279	42	144	59	2	5
1280	42	145	59	2	5
1281	42	146	59	2	5
1282	42	147	59	2	6
1283	42	148	59	2	6
1284	42	149	59	2	7
1285	42	150	59	2	5
1286	42	151	59	2	5
1287	42	153	59	2	5
1288	42	94	59	4	14
1289	42	124	59	4	13
1290	42	96	59	4	13
1291	42	126	59	4	13
1292	42	127	59	4	15
1293	42	99	59	4	13
1294	42	100	59	4	14
1296	42	128	59	4	15
1299	42	129	59	4	13
1300	42	102	59	4	13
1301	42	130	59	4	14
1302	42	132	59	4	15
1303	42	104	59	4	13
1304	42	134	59	4	14
1305	42	39	59	4	14
1306	42	136	59	4	13
1307	42	137	59	4	14
1308	42	114	59	4	14
1309	42	138	59	4	14
1310	42	139	59	4	14
1311	42	140	59	4	14
1312	42	141	59	4	13
1313	42	142	59	4	13
1314	42	144	59	4	13
1315	42	145	59	4	13
1316	42	146	59	4	13
1317	42	147	59	4	14
1318	42	148	59	4	14
1319	42	149	59	4	15
1320	42	150	59	4	13
1321	42	151	59	4	13
1322	42	153	59	4	13
1323	42	94	59	5	18
1324	42	124	59	5	18
1325	42	96	59	5	18
1326	42	126	59	5	18
1327	42	127	59	5	19
1328	42	99	59	5	18
1329	42	100	59	5	19
1330	42	128	59	5	19
1331	42	129	59	5	17
1333	42	102	59	5	17
1336	42	130	59	5	19
1337	42	132	59	5	19
1338	42	104	59	5	17
1339	42	134	59	5	19
1340	42	39	59	5	19
1341	42	136	59	5	17
1342	42	137	59	5	19
1343	42	114	59	5	19
1344	42	138	59	5	19
1345	42	139	59	5	19
1346	42	140	59	5	19
1347	42	141	59	5	17
1348	42	142	59	5	17
1349	42	144	59	5	17
1350	42	145	59	5	17
1351	42	146	59	5	17
1352	42	147	59	5	19
1353	42	148	59	5	19
1354	42	149	59	5	19
1355	42	150	59	5	17
1356	42	151	59	5	17
1357	42	153	59	5	17
1359	49	9	85	2	6
1358	49	108	85	2	7
1361	49	76	85	2	7
1362	49	90	85	2	8
1363	49	123	85	2	7
1364	49	201	196	2	8
1365	49	202	196	2	6
1366	49	204	196	2	7
1367	49	205	196	2	7
1368	49	206	196	2	7
1369	49	207	196	2	8
1370	49	208	196	2	8
1371	49	209	196	2	7
1372	49	212	196	2	8
1373	49	213	196	2	8
1374	49	214	196	2	8
1378	49	205	196	6	24
1375	49	201	196	6	24
1571	65	189	180	17	67
1572	65	178	180	17	67
1376	49	202	196	6	23
1377	49	204	196	6	23
1384	49	206	196	6	23
1385	49	207	196	6	23
1386	49	208	196	6	23
1387	49	209	196	6	23
1388	49	212	196	6	24
1389	49	213	196	6	24
1390	49	214	196	6	24
1391	49	201	196	9	36
1392	49	202	196	9	36
1393	49	204	196	9	36
1394	49	205	196	9	36
1395	49	206	196	9	35
1397	49	208	196	9	35
1398	49	209	196	9	36
1396	49	207	196	9	36
1400	49	212	196	9	35
1401	49	213	196	9	36
1402	49	214	196	9	36
1405	49	204	196	10	39
1406	49	205	196	10	39
1403	49	201	196	10	40
1404	49	202	196	10	39
1409	49	206	196	10	39
1410	49	207	196	10	40
1411	49	208	196	10	40
1412	49	214	196	10	40
1413	49	213	196	10	40
1414	49	212	196	10	40
1415	49	209	196	10	40
1416	49	201	196	11	44
1417	49	202	196	11	44
1418	49	204	196	11	44
1420	49	206	196	11	44
1422	49	208	196	11	44
1426	49	214	196	11	44
1425	49	213	196	11	43
1424	49	212	196	11	43
1423	49	209	196	11	43
1421	49	207	196	11	43
1419	49	205	196	11	43
1432	49	201	196	12	48
1573	65	190	180	17	67
1435	49	204	196	12	48
1433	49	202	196	12	47
1437	49	205	196	12	48
1439	49	207	196	12	48
1440	49	208	196	12	48
1441	49	209	196	12	48
1442	49	212	196	12	48
1443	49	213	196	12	48
1444	49	214	196	12	48
1438	49	206	196	12	47
1446	49	201	196	13	52
1447	49	202	196	13	52
1450	49	206	196	13	52
1452	49	208	196	13	52
1454	49	212	196	13	52
1455	49	213	196	13	52
1456	49	214	196	13	52
1453	49	209	196	13	51
1574	65	194	180	17	67
1451	49	207	196	13	52
1449	49	205	196	13	50
1448	49	204	196	13	51
1462	49	201	196	14	56
1463	49	202	196	14	56
1464	49	204	196	14	56
1467	49	207	196	14	56
1468	49	208	196	14	56
1470	49	212	196	14	56
1471	49	213	196	14	56
1472	49	214	196	14	56
1469	49	209	196	14	55
1466	49	206	196	14	55
1465	49	205	196	14	55
1476	49	214	196	15	60
1478	49	212	196	15	60
1479	49	209	196	15	60
1481	49	207	196	15	60
1482	49	205	196	15	60
1484	49	204	196	15	60
1485	49	202	196	15	60
1486	49	201	196	15	60
1483	49	206	196	15	58
1480	49	208	196	15	59
1477	49	213	196	15	59
31	65	162	123	2	7
1564	65	189	180	16	64
1565	65	196	180	16	64
1566	65	187	180	16	63
1568	65	194	180	16	64
1569	65	190	180	16	62
1570	65	178	180	16	63
1575	65	196	180	17	67
1576	65	187	180	17	67
1577	65	177	123	4	16
1578	65	179	123	4	15
1579	65	195	123	4	14
1580	65	182	123	4	14
1581	65	198	123	4	16
1582	65	199	123	4	14
1583	65	188	123	4	16
1584	65	186	123	4	15
1585	65	185	123	4	15
1586	65	197	123	4	16
1587	65	125	123	4	16
1588	65	180	123	4	15
1589	65	162	123	4	15
1590	65	168	123	4	15
1591	65	183	123	4	15
1592	65	172	123	4	15
1593	65	177	123	5	20
1594	65	125	123	5	20
1595	65	188	123	5	20
1596	65	198	123	5	20
1597	65	197	123	5	20
1603	65	199	123	5	19
1598	65	179	123	5	20
1604	65	186	123	5	18
1606	65	185	123	5	19
1602	65	182	123	5	18
1609	65	162	123	5	19
1605	65	180	123	5	19
1612	65	168	123	5	19
1613	65	183	123	5	19
1614	65	172	123	5	19
1601	65	195	123	5	18
1618	65	125	123	6	24
1529	88	215	195	3	10
1620	65	180	123	6	23
1622	65	162	123	6	23
1623	65	197	123	6	23
1624	65	195	123	6	22
1621	65	182	123	6	22
1628	65	199	123	6	23
1629	65	168	123	6	23
1630	65	183	123	6	23
1631	65	172	123	6	23
1632	65	185	123	6	23
1633	65	186	123	6	23
1634	65	188	123	6	24
1627	65	198	123	6	24
1617	65	177	123	6	24
1619	65	179	123	6	24
1648	65	251	216	16	64
1649	65	253	216	16	64
1650	65	251	216	17	68
1651	65	253	216	17	68
1655	65	218	208	3	12
1656	65	220	208	3	12
1657	65	234	208	3	12
1658	65	239	208	3	12
1782	88	215	195	17	67
1653	65	233	208	3	11
1654	65	217	208	3	11
1652	65	232	208	3	12
1663	65	244	208	3	12
1664	65	245	208	3	12
1665	65	247	208	3	12
1666	65	240	208	3	12
1667	65	246	208	3	12
1668	65	242	208	3	10
1669	65	248	208	3	10
1670	65	243	208	3	11
1671	65	232	208	16	63
1672	65	233	208	16	63
1673	65	217	208	16	63
1674	65	218	208	16	63
1675	65	220	208	16	63
1676	65	248	208	16	62
1677	65	242	208	16	61
1679	65	234	208	16	63
1680	65	239	208	16	63
1681	65	240	208	16	63
1682	65	243	208	16	63
1683	65	244	208	16	63
1684	65	245	208	16	63
1685	65	246	208	16	63
1686	65	247	208	16	63
1687	65	247	208	17	68
1688	65	246	208	17	68
1689	65	245	208	17	68
1690	65	244	208	17	68
1691	65	243	208	17	67
1692	65	242	208	17	66
1693	65	240	208	17	68
1694	65	234	208	17	68
1695	65	220	208	17	68
1696	65	218	208	17	68
1697	65	217	208	17	68
1698	65	233	208	17	67
1699	65	232	208	17	68
1700	65	239	208	17	67
1701	65	248	208	17	66
1704	88	216	195	3	10
1705	88	219	195	3	11
1706	88	221	195	3	10
1707	88	223	195	3	10
1709	88	225	195	3	9
1708	88	224	195	3	9
1712	88	226	195	3	10
1713	88	227	195	3	10
1714	88	228	195	3	11
1715	88	229	195	3	10
1716	88	230	195	3	11
1717	88	215	195	7	26
1718	88	216	195	7	27
1719	88	219	195	7	27
1720	88	221	195	7	27
1721	88	223	195	7	26
1722	88	224	195	7	26
1723	88	225	195	7	26
1724	88	226	195	7	27
1725	88	227	195	7	25
1727	88	228	195	7	28
1783	88	216	195	17	67
1728	88	229	195	7	26
1731	88	230	195	7	27
1732	88	215	195	8	30
1734	88	216	195	8	31
1735	88	219	195	8	31
1736	88	221	195	8	31
1737	88	223	195	8	30
1738	88	224	195	8	30
1739	88	225	195	8	31
1740	88	226	195	8	31
1741	88	227	195	8	30
1742	88	228	195	8	32
1743	88	229	195	8	30
1744	88	230	195	8	31
1745	88	230	195	9	35
1746	88	229	195	9	33
1747	88	228	195	9	36
1748	88	227	195	9	33
1749	88	226	195	9	35
1750	88	225	195	9	33
1751	88	224	195	9	33
1752	88	223	195	9	33
1754	88	219	195	9	36
1753	88	221	195	9	35
1756	88	216	195	9	35
1757	88	215	195	9	35
1758	88	215	195	10	39
1759	88	216	195	10	39
1760	88	219	195	10	40
1761	88	221	195	10	39
1762	88	223	195	10	37
1763	88	224	195	10	37
1764	88	225	195	10	37
1765	88	226	195	10	39
1766	88	227	195	10	37
1767	88	228	195	10	40
1768	88	229	195	10	38
1769	88	230	195	10	39
1770	88	215	195	16	63
1771	88	216	195	16	63
1772	88	221	195	16	63
1773	88	219	195	16	63
1774	88	223	195	16	62
1775	88	224	195	16	62
1776	88	225	195	16	62
1777	88	226	195	16	63
1778	88	227	195	16	62
1779	88	228	195	16	64
1780	88	229	195	16	62
1781	88	230	195	16	62
1784	88	219	195	17	68
1785	88	221	195	17	67
1786	88	223	195	17	66
1787	88	224	195	17	66
1788	88	225	195	17	66
1789	88	226	195	17	67
1790	88	227	195	17	66
1791	88	228	195	17	68
1792	88	229	195	17	66
1793	88	230	195	17	67
1794	88	201	188	3	11
1795	88	190	188	3	10
1797	88	202	188	3	10
1798	88	204	188	3	11
1799	88	205	188	3	11
1800	88	206	188	3	11
1801	88	207	188	3	11
1802	88	193	188	3	10
1804	88	208	188	3	12
1805	88	209	188	3	11
1806	88	212	188	3	11
1807	88	213	188	3	12
1808	88	214	188	3	11
1809	88	201	188	7	27
1810	88	190	188	7	27
1811	88	202	188	7	27
1812	88	204	188	7	28
1813	88	205	188	7	27
1814	88	206	188	7	27
1815	88	207	188	7	28
1816	88	193	188	7	27
1817	88	208	188	7	28
1818	88	209	188	7	27
1819	88	212	188	7	27
1820	88	213	188	7	27
1821	88	214	188	7	27
1822	88	201	188	8	31
1823	88	190	188	8	31
1824	88	202	188	8	31
1825	88	204	188	8	32
1826	88	205	188	8	31
1829	88	206	188	8	31
1830	88	207	188	8	32
1831	88	193	188	8	31
1832	88	208	188	8	32
1833	88	209	188	8	31
1834	88	212	188	8	32
1836	88	213	188	8	32
1837	88	214	188	8	31
1838	88	201	188	9	36
1840	88	190	188	9	36
1841	88	202	188	9	36
1842	88	204	188	9	36
1844	88	205	188	9	36
1845	88	206	188	9	34
1846	88	207	188	9	36
1847	88	193	188	9	35
1848	88	208	188	9	36
1849	88	212	188	9	36
1850	88	213	188	9	36
1851	88	214	188	9	36
1852	88	209	188	9	35
1853	88	201	188	10	40
1854	88	190	188	10	40
1855	88	202	188	10	40
1856	88	204	188	10	40
1857	88	205	188	10	40
1858	88	206	188	10	38
1859	88	207	188	10	40
1860	88	193	188	10	40
1861	88	208	188	10	40
1862	88	209	188	10	40
1863	88	212	188	10	40
1864	88	213	188	10	40
1865	88	214	188	10	40
1866	88	201	188	16	63
1867	88	190	188	16	63
1868	88	202	188	16	63
1869	88	204	188	16	64
1870	88	205	188	16	64
1872	88	206	188	16	64
1873	88	207	188	16	64
1878	88	193	188	16	63
1879	88	208	188	16	64
1880	88	209	188	16	63
1881	88	212	188	16	64
1882	88	213	188	16	64
1883	88	214	188	16	63
1884	88	201	188	17	68
1885	88	190	188	17	67
1886	88	202	188	17	67
1887	88	204	188	17	68
1888	88	205	188	17	68
1890	88	206	188	17	67
1891	88	207	188	17	68
1892	88	193	188	17	67
1893	88	208	188	17	68
1894	88	209	188	17	67
1895	88	212	188	17	68
1896	88	213	188	17	68
1897	88	214	188	17	68
\.


--
-- Data for Name: student_outcomes; Type: TABLE DATA; Schema: public; Owner: pablodb
--

COPY public.student_outcomes (sto_id, sto_descripcion, sto_codigo) FROM stdin;
1	Analyze a complex computing problem and to apply principles of computing and other relevant disciplines to identify solutions.	SO1
2	Design, implement, and evaluate a computing-based solution to meet a given set of computing requirements in the context of the program’s discipline.	SO2
3	Communicate effectively in a variety of professional contexts.	SO3
4	Recognize professional responsibilities and make informed judgments in computing practice based on legal and ethical principles.	SO4
5	Function effectively as a member or leader of a team engaged in activities appropriate to the program’s discipline.	SO5
6	 Apply computer science theory and software development fundamentals to produce computing-based solutions.	SO6
\.


--
-- Name: asignaturas_asi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pablodb
--

SELECT pg_catalog.setval('public.asignaturas_asi_id_seq', 54, true);


--
-- Name: criterios_asignaturas_cra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pablodb
--

SELECT pg_catalog.setval('public.criterios_asignaturas_cra_id_seq', 125, true);


--
-- Name: criterios_so_cri_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pablodb
--

SELECT pg_catalog.setval('public.criterios_so_cri_id_seq', 17, true);


--
-- Name: docentes_doc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pablodb
--

SELECT pg_catalog.setval('public.docentes_doc_id_seq', 99, true);


--
-- Name: estudiantes_est_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pablodb
--

SELECT pg_catalog.setval('public.estudiantes_est_id_seq', 253, true);


--
-- Name: grupos_grp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pablodb
--

SELECT pg_catalog.setval('public.grupos_grp_id_seq', 218, true);


--
-- Name: inscripciones_grupo_ins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pablodb
--

SELECT pg_catalog.setval('public.inscripciones_grupo_ins_id_seq', 1222, true);


--
-- Name: niveles_cri_nvl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pablodb
--

SELECT pg_catalog.setval('public.niveles_cri_nvl_id_seq', 68, true);


--
-- Name: rubrica_so_rub_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pablodb
--

SELECT pg_catalog.setval('public.rubrica_so_rub_id_seq', 1897, true);


--
-- Name: student_outcomes_sto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pablodb
--

SELECT pg_catalog.setval('public.student_outcomes_sto_id_seq', 6, true);


--
-- Name: asignaturas asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.asignaturas
    ADD CONSTRAINT asignaturas_pkey PRIMARY KEY (asi_id);


--
-- Name: criterios_asignaturas criterios_asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.criterios_asignaturas
    ADD CONSTRAINT criterios_asignaturas_pkey PRIMARY KEY (cra_id);


--
-- Name: criterios_so criterios_so_pkey; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.criterios_so
    ADD CONSTRAINT criterios_so_pkey PRIMARY KEY (cri_id);


--
-- Name: docentes docentes_doc_cedula_key; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.docentes
    ADD CONSTRAINT docentes_doc_cedula_key UNIQUE (doc_cedula);


--
-- Name: docentes docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.docentes
    ADD CONSTRAINT docentes_pkey PRIMARY KEY (doc_id);


--
-- Name: estudiantes estudiantes_est_cedula_key; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_est_cedula_key UNIQUE (est_cedula);


--
-- Name: estudiantes estudiantes_est_codigo_key; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_est_codigo_key UNIQUE (est_codigo);


--
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (est_id);


--
-- Name: grupos grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (grp_id);


--
-- Name: inscripciones_grupo inscripciones_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.inscripciones_grupo
    ADD CONSTRAINT inscripciones_grupo_pkey PRIMARY KEY (ins_id);


--
-- Name: niveles_cri niveles_cri_pkey; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.niveles_cri
    ADD CONSTRAINT niveles_cri_pkey PRIMARY KEY (nvl_id);


--
-- Name: rubrica_so rubrica_so_pkey; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.rubrica_so
    ADD CONSTRAINT rubrica_so_pkey PRIMARY KEY (rub_id);


--
-- Name: student_outcomes student_outcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.student_outcomes
    ADD CONSTRAINT student_outcomes_pkey PRIMARY KEY (sto_id);


--
-- Name: student_outcomes student_outcomes_sto_codigo_key; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.student_outcomes
    ADD CONSTRAINT student_outcomes_sto_codigo_key UNIQUE (sto_codigo);


--
-- Name: rubrica_so uq_rubrica; Type: CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.rubrica_so
    ADD CONSTRAINT uq_rubrica UNIQUE (doc_id, est_id, grp_id, cri_id);


--
-- Name: criterios_asignaturas fk_cra_cr; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.criterios_asignaturas
    ADD CONSTRAINT fk_cra_cr FOREIGN KEY (cri_id) REFERENCES public.criterios_so(cri_id);


--
-- Name: grupos fk_docente; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT fk_docente FOREIGN KEY (grp_doc_id) REFERENCES public.docentes(doc_id);


--
-- Name: inscripciones_grupo fk_estudiante; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.inscripciones_grupo
    ADD CONSTRAINT fk_estudiante FOREIGN KEY (est_codigo) REFERENCES public.estudiantes(est_codigo);


--
-- Name: inscripciones_grupo fk_grupos; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.inscripciones_grupo
    ADD CONSTRAINT fk_grupos FOREIGN KEY (grp_id) REFERENCES public.grupos(grp_id);


--
-- Name: niveles_cri fk_nvl_cri; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.niveles_cri
    ADD CONSTRAINT fk_nvl_cri FOREIGN KEY (cri_id) REFERENCES public.criterios_so(cri_id);


--
-- Name: rubrica_so fk_rub_cri; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.rubrica_so
    ADD CONSTRAINT fk_rub_cri FOREIGN KEY (cri_id) REFERENCES public.criterios_so(cri_id);


--
-- Name: rubrica_so fk_rub_doc; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.rubrica_so
    ADD CONSTRAINT fk_rub_doc FOREIGN KEY (doc_id) REFERENCES public.docentes(doc_id);


--
-- Name: rubrica_so fk_rub_est; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.rubrica_so
    ADD CONSTRAINT fk_rub_est FOREIGN KEY (est_id) REFERENCES public.estudiantes(est_id);


--
-- Name: rubrica_so fk_rub_grp; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.rubrica_so
    ADD CONSTRAINT fk_rub_grp FOREIGN KEY (grp_id) REFERENCES public.grupos(grp_id);


--
-- Name: rubrica_so fk_rub_nvl; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.rubrica_so
    ADD CONSTRAINT fk_rub_nvl FOREIGN KEY (rub_niv) REFERENCES public.niveles_cri(nvl_id);


--
-- Name: criterios_so fk_sto; Type: FK CONSTRAINT; Schema: public; Owner: pablodb
--

ALTER TABLE ONLY public.criterios_so
    ADD CONSTRAINT fk_sto FOREIGN KEY (sto_id) REFERENCES public.student_outcomes(sto_id);


--
-- PostgreSQL database dump complete
--

