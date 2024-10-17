--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7 (Ubuntu 15.7-0ubuntu0.23.10.1)
-- Dumped by pg_dump version 15.7 (Ubuntu 15.7-0ubuntu0.23.10.1)

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
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name character varying(255) NOT NULL,
    department_id integer NOT NULL,
    instructor_id integer NOT NULL,
    is_core boolean NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(255) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_department_id_seq OWNER TO postgres;

--
-- Name: departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollments (
    enrollment_id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    enrollment_date date,
    semester character varying(50)
);


ALTER TABLE public.enrollments OWNER TO postgres;

--
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollments_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrollments_enrollment_id_seq OWNER TO postgres;

--
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollments_enrollment_id_seq OWNED BY public.enrollments.enrollment_id;


--
-- Name: instructors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructors (
    instructor_id integer NOT NULL,
    name character varying(255) NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.instructors OWNER TO postgres;

--
-- Name: instructors_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructors_instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructors_instructor_id_seq OWNER TO postgres;

--
-- Name: instructors_instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructors_instructor_id_seq OWNED BY public.instructors.instructor_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    name character varying(255) NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: departments department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);


--
-- Name: enrollments enrollment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments ALTER COLUMN enrollment_id SET DEFAULT nextval('public.enrollments_enrollment_id_seq'::regclass);


--
-- Name: instructors instructor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors ALTER COLUMN instructor_id SET DEFAULT nextval('public.instructors_instructor_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, course_name, department_id, instructor_id, is_core) FROM stdin;
1	Physical Chemistry	5	31	t
2	Power Systems	3	15	t
4	Solid State Physics	8	51	t
5	Mechanics of Materials	2	14	f
6	Analytical Chemistry	5	30	f
7	Labor Economics	11	74	f
8	Principles of Management	12	81	f
9	Development Economics	11	74	t
10	Abstract Algebra	7	47	t
11	Linear Algebra	7	44	f
12	Artificial Intelligence	15	103	t
13	Statistical Physics	8	53	f
14	Cloud Computing	15	100	f
15	Power Electronics	3	21	t
16	Avionics	14	97	t
17	Design of Experiments	2	10	f
18	Machine Design	2	9	f
19	Strategic Management	12	80	f
20	Thermodynamics	8	56	f
21	Human Resource Management	12	82	t
22	Development Economics	11	76	f
23	Artificial Intelligence	15	105	f
24	Data Science	15	101	t
25	Control Systems	14	92	t
26	Avionics	14	98	t
27	Renewable Energy	13	88	f
28	Power Electronics	3	17	t
29	Circuit Theory	3	16	f
30	Environmental Economics	11	72	t
31	Polymer Chemistry	5	32	f
32	Spacecraft Propulsion	14	97	t
33	International Economics	11	72	t
34	Fluid Mechanics	2	8	t
35	Artificial Intelligence	15	103	f
36	Number Theory	7	49	f
37	Entrepreneurship	12	81	t
38	Organizational Behavior	12	82	f
39	Organizational Behavior	12	84	f
40	Physical Chemistry	9	60	t
41	Microbiology	6	37	t
42	Microcontrollers	3	21	t
43	Theoretical Chemistry	9	63	f
44	Building Materials	4	27	t
45	Public Economics	11	77	f
46	Geotechnical Engineering	4	25	f
47	Control Systems	14	95	f
48	Solid State Physics	8	56	t
49	International Economics	11	75	f
50	Public Economics	11	72	t
51	Environmental Microbiology	13	89	t
52	Chromatography	9	60	f
53	Strategic Management	12	83	t
55	Microbiology	6	42	t
56	Microcontrollers	3	20	f
57	Quantum Mechanics	8	53	t
58	Space Systems	14	92	t
59	Macroeconomics	11	76	t
61	Calculus	7	46	f
62	Cloud Computing	15	102	t
63	Water Resources Management	13	90	t
64	Optics	8	53	t
65	Number Theory	7	47	f
66	Environmental Economics	11	75	f
67	Molecular Biology	6	38	f
68	Environmental Microbiology	13	85	f
69	Nanotechnology	9	59	t
71	Polymer Chemistry	5	34	t
72	Comparative Politics	10	65	f
73	Immunology	6	38	f
74	Analytical Chemistry	9	60	t
75	Analog Electronics	3	19	f
76	Financial Accounting	12	78	f
77	Microcontrollers	3	15	f
78	Economic Theory	11	72	t
79	Database Systems	1	5	f
80	Geotechnical Engineering	4	22	t
81	Relativity	8	51	t
82	Introduction to Sociology	10	67	f
83	Data Science	15	101	f
84	Microeconomics	11	75	f
85	Classical Mechanics	8	56	t
86	Electromagnetics	3	19	t
87	Spectroscopy	9	61	f
88	Fluid Mechanics	2	11	t
89	Chemical Kinetics	9	60	t
90	Strategic Management	12	79	f
92	Financial Accounting	12	82	f
93	Comparative Politics	10	68	f
94	Environmental Economics	11	77	f
95	Financial Accounting	12	83	f
96	Number Theory	7	45	t
97	Environmental Chemistry	13	86	f
98	Data Science	15	101	f
99	Inorganic Chemistry	5	31	f
100	Operating Systems	15	105	t
3	Software Engineering	1	2	t
54	Data Structures	1	2	t
60	Database Systems	1	2	t
70	Artificial Intelligence	1	2	t
91	Machine Learning	1	2	t
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name) FROM stdin;
1	Computer Science
2	Mechanical Engineering
3	Electrical Engineering
4	Civil Engineering
5	Chemical Engineering
6	Biotechnology
7	Mathematics
8	Physics
9	Chemistry
10	Humanities and Social Sciences
11	Economics
12	Business Administration
13	Environmental Science
14	Aerospace Engineering
15	Information Technology
\.


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollments (enrollment_id, student_id, course_id, enrollment_date, semester) FROM stdin;
1	243	95	2024-07-21	Spring 2024
2	18	51	2024-06-18	Summer 2024
3	109	80	2024-04-07	Fall 2024
4	195	28	2024-06-22	Spring 2024
5	329	70	2024-01-29	Fall 2024
6	261	46	2023-11-02	Fall 2024
7	213	68	2024-08-11	Summer 2024
8	170	31	2023-10-27	Spring 2024
9	241	54	2024-01-15	Summer 2024
10	55	95	2024-07-15	Summer 2024
11	206	94	2024-03-27	Spring 2024
12	39	3	2024-07-25	Summer 2024
13	422	1	2024-08-03	Spring 2024
14	15	50	2023-12-23	Summer 2024
15	415	13	2024-07-13	Summer 2024
16	489	96	2024-05-07	Summer 2024
17	67	24	2024-09-02	Summer 2024
18	342	74	2024-04-10	Spring 2024
19	277	58	2024-08-20	Fall 2024
20	44	73	2024-08-13	Spring 2024
21	68	89	2024-03-15	Summer 2024
22	243	35	2024-06-03	Spring 2024
23	249	46	2024-07-26	Summer 2024
24	127	44	2024-02-14	Summer 2024
25	369	24	2023-11-17	Fall 2024
26	237	83	2023-12-20	Spring 2024
27	146	75	2023-10-07	Fall 2024
28	199	46	2023-10-09	Fall 2024
29	10	90	2024-05-16	Spring 2024
30	17	22	2024-06-01	Fall 2024
31	41	65	2024-08-13	Summer 2024
32	497	25	2024-03-07	Spring 2024
33	58	42	2023-10-18	Summer 2024
34	27	22	2023-12-02	Fall 2024
35	360	62	2023-12-27	Summer 2024
36	31	19	2023-11-16	Fall 2024
37	426	85	2023-10-20	Fall 2024
38	371	64	2023-12-26	Summer 2024
39	469	24	2024-01-26	Summer 2024
40	311	82	2024-03-01	Fall 2024
41	259	74	2023-10-01	Spring 2024
42	252	6	2024-03-18	Fall 2024
43	156	47	2024-08-20	Spring 2024
44	453	24	2024-06-11	Fall 2024
45	75	33	2024-06-30	Spring 2024
46	163	73	2024-07-13	Spring 2024
47	246	79	2024-03-22	Fall 2024
48	110	89	2024-01-20	Fall 2024
49	382	25	2024-01-12	Fall 2024
50	73	100	2023-11-11	Summer 2024
51	170	46	2024-07-07	Fall 2024
52	92	19	2024-04-12	Summer 2024
53	149	28	2023-11-08	Fall 2024
54	97	59	2024-03-20	Fall 2024
55	139	78	2024-07-31	Spring 2024
56	302	21	2024-05-20	Spring 2024
57	14	5	2024-03-26	Spring 2024
58	308	82	2024-01-19	Spring 2024
59	190	84	2024-01-07	Spring 2024
60	230	8	2023-12-17	Summer 2024
61	87	9	2024-06-30	Spring 2024
62	257	33	2024-08-08	Summer 2024
63	90	45	2024-05-19	Fall 2024
64	337	7	2023-11-24	Fall 2024
65	158	65	2024-08-23	Fall 2024
66	257	79	2024-03-24	Spring 2024
67	375	86	2024-09-03	Fall 2024
68	145	76	2023-12-29	Summer 2024
69	64	52	2024-07-19	Spring 2024
70	76	4	2024-03-03	Summer 2024
71	488	60	2023-12-23	Fall 2024
72	150	62	2024-03-18	Spring 2024
73	399	41	2024-04-10	Summer 2024
74	319	34	2024-05-10	Fall 2024
75	24	23	2023-10-23	Summer 2024
76	473	16	2024-03-09	Summer 2024
77	352	34	2024-02-20	Summer 2024
78	336	70	2023-12-19	Summer 2024
79	167	96	2023-12-23	Summer 2024
80	180	46	2024-07-16	Summer 2024
81	46	84	2024-08-07	Spring 2024
82	152	15	2024-03-25	Spring 2024
83	292	48	2024-09-01	Spring 2024
84	345	58	2024-01-21	Summer 2024
85	472	8	2024-03-16	Fall 2024
86	250	99	2023-11-22	Fall 2024
87	67	97	2024-05-17	Summer 2024
88	407	90	2024-09-09	Summer 2024
89	266	63	2024-04-07	Summer 2024
90	60	25	2024-02-11	Fall 2024
91	97	87	2023-09-17	Fall 2024
92	484	38	2023-12-14	Fall 2024
93	204	100	2023-10-03	Fall 2024
94	46	62	2024-09-14	Fall 2024
95	353	4	2024-01-17	Summer 2024
96	277	13	2023-09-17	Summer 2024
97	263	19	2024-01-08	Spring 2024
98	333	47	2023-11-05	Spring 2024
99	77	42	2024-06-13	Summer 2024
100	385	87	2023-10-12	Fall 2024
101	427	24	2023-09-28	Fall 2024
102	431	61	2024-08-05	Summer 2024
103	36	76	2023-10-31	Summer 2024
104	461	52	2024-06-25	Spring 2024
105	106	9	2024-03-05	Spring 2024
106	97	44	2023-11-16	Fall 2024
107	320	37	2024-08-07	Summer 2024
108	344	41	2024-05-27	Fall 2024
109	467	99	2023-10-24	Summer 2024
110	185	46	2023-11-20	Summer 2024
111	434	46	2023-11-12	Spring 2024
112	57	49	2023-11-08	Fall 2024
113	191	88	2024-05-22	Spring 2024
114	460	1	2024-07-25	Spring 2024
115	419	33	2024-08-07	Summer 2024
116	300	43	2024-03-25	Summer 2024
117	247	69	2023-12-16	Spring 2024
118	446	61	2023-12-25	Summer 2024
119	133	51	2023-12-20	Fall 2024
120	190	84	2024-04-13	Fall 2024
121	392	49	2024-09-05	Fall 2024
122	466	88	2024-03-21	Fall 2024
123	209	6	2024-08-01	Spring 2024
124	218	88	2024-01-18	Spring 2024
125	206	61	2023-12-18	Spring 2024
126	263	58	2024-09-02	Spring 2024
127	27	58	2023-12-13	Spring 2024
128	59	52	2024-06-24	Summer 2024
129	467	15	2024-07-06	Summer 2024
130	37	93	2024-03-24	Spring 2024
131	238	39	2023-10-20	Summer 2024
132	494	21	2023-11-22	Summer 2024
133	400	71	2024-06-01	Fall 2024
134	129	92	2024-01-06	Spring 2024
135	315	32	2024-07-07	Summer 2024
136	366	54	2024-08-26	Spring 2024
137	413	75	2024-03-16	Fall 2024
138	380	54	2024-06-17	Spring 2024
139	188	72	2024-03-30	Fall 2024
140	143	98	2024-05-30	Fall 2024
141	129	16	2024-03-11	Fall 2024
142	234	70	2024-08-15	Fall 2024
143	346	73	2024-04-15	Fall 2024
144	397	96	2024-04-12	Spring 2024
145	358	15	2024-08-23	Fall 2024
146	62	92	2024-06-07	Fall 2024
147	401	28	2024-07-20	Fall 2024
148	418	59	2024-06-12	Summer 2024
149	292	43	2024-05-22	Spring 2024
150	414	78	2024-04-02	Spring 2024
151	127	77	2024-07-30	Spring 2024
152	421	5	2024-05-21	Fall 2024
153	168	83	2024-02-18	Spring 2024
154	305	61	2024-09-02	Fall 2024
155	307	89	2023-11-29	Summer 2024
156	484	93	2024-04-23	Summer 2024
157	148	80	2024-07-21	Spring 2024
158	256	83	2024-04-28	Spring 2024
159	446	66	2024-07-12	Fall 2024
160	8	79	2023-11-15	Fall 2024
161	390	78	2023-11-12	Summer 2024
162	133	71	2024-04-09	Fall 2024
163	167	26	2023-11-21	Fall 2024
164	105	36	2024-01-05	Summer 2024
165	380	75	2024-07-19	Spring 2024
166	344	31	2024-02-16	Fall 2024
167	316	1	2023-12-22	Fall 2024
168	74	88	2024-08-06	Spring 2024
169	325	1	2024-03-14	Fall 2024
170	33	12	2024-07-01	Spring 2024
171	311	80	2024-01-06	Spring 2024
172	325	70	2024-03-18	Fall 2024
173	292	19	2024-08-31	Spring 2024
174	124	3	2024-08-24	Spring 2024
175	221	38	2023-09-30	Summer 2024
176	123	24	2024-07-01	Spring 2024
177	420	53	2024-07-08	Spring 2024
178	10	34	2023-11-04	Summer 2024
179	63	4	2024-06-28	Summer 2024
180	243	9	2023-12-15	Summer 2024
181	213	89	2023-09-20	Spring 2024
182	69	52	2024-08-30	Spring 2024
183	335	93	2024-04-05	Summer 2024
184	475	8	2023-12-12	Summer 2024
185	274	83	2024-01-02	Fall 2024
186	142	69	2024-05-10	Spring 2024
187	37	60	2024-04-26	Fall 2024
188	248	89	2024-04-06	Summer 2024
189	420	68	2024-02-25	Spring 2024
190	442	14	2024-02-18	Spring 2024
191	73	43	2024-09-09	Fall 2024
192	443	64	2024-02-14	Fall 2024
193	148	17	2024-04-02	Spring 2024
194	468	55	2024-09-08	Fall 2024
195	343	36	2024-06-06	Spring 2024
196	317	55	2023-12-06	Spring 2024
197	41	7	2023-12-31	Fall 2024
198	387	83	2023-12-15	Summer 2024
199	451	57	2024-05-04	Fall 2024
200	407	2	2024-01-31	Spring 2024
201	167	14	2023-09-18	Summer 2024
202	92	91	2024-03-23	Spring 2024
203	485	87	2024-02-23	Summer 2024
204	210	42	2024-03-16	Summer 2024
205	427	100	2024-01-08	Fall 2024
206	403	34	2024-02-16	Spring 2024
207	385	18	2024-03-13	Summer 2024
208	109	73	2024-05-04	Summer 2024
209	333	40	2024-06-10	Fall 2024
210	171	62	2024-06-04	Fall 2024
211	251	69	2024-08-27	Spring 2024
212	457	6	2024-04-20	Summer 2024
213	174	33	2023-10-31	Fall 2024
214	331	29	2023-11-14	Summer 2024
215	364	64	2024-08-31	Fall 2024
216	394	24	2024-01-03	Spring 2024
217	2	63	2023-11-09	Spring 2024
218	36	5	2024-07-21	Spring 2024
219	231	15	2024-04-12	Fall 2024
220	277	7	2024-06-16	Summer 2024
221	435	99	2024-05-03	Summer 2024
222	116	7	2024-06-07	Summer 2024
223	154	98	2024-03-30	Fall 2024
224	83	45	2023-11-05	Spring 2024
225	116	56	2023-11-15	Fall 2024
226	283	29	2024-05-09	Spring 2024
227	118	86	2023-10-05	Summer 2024
228	205	41	2024-05-01	Summer 2024
229	450	75	2024-06-07	Fall 2024
230	346	20	2023-11-06	Spring 2024
231	77	56	2024-06-24	Summer 2024
232	10	58	2024-08-20	Summer 2024
233	360	11	2024-05-18	Summer 2024
234	245	67	2024-08-06	Spring 2024
235	309	46	2024-01-17	Spring 2024
236	449	98	2024-01-27	Spring 2024
237	67	10	2024-06-18	Summer 2024
238	110	70	2024-08-07	Summer 2024
239	178	99	2023-12-07	Fall 2024
240	161	7	2023-12-02	Summer 2024
241	429	76	2024-05-25	Spring 2024
242	231	75	2024-01-31	Fall 2024
243	401	8	2024-05-25	Fall 2024
244	141	85	2024-07-27	Spring 2024
245	331	56	2024-08-03	Summer 2024
246	270	58	2024-09-12	Summer 2024
247	459	58	2024-01-21	Summer 2024
248	388	71	2024-05-29	Summer 2024
249	26	84	2023-12-09	Fall 2024
250	56	97	2024-07-20	Spring 2024
251	443	94	2023-11-14	Summer 2024
252	119	93	2023-11-19	Summer 2024
253	204	88	2023-09-18	Summer 2024
254	24	95	2024-03-29	Fall 2024
255	246	38	2024-02-26	Fall 2024
256	103	44	2024-06-13	Spring 2024
257	269	31	2023-10-03	Fall 2024
258	154	5	2023-12-18	Summer 2024
259	289	52	2024-07-18	Spring 2024
260	326	62	2024-08-03	Summer 2024
261	65	2	2024-04-29	Summer 2024
262	357	40	2024-09-13	Summer 2024
263	173	2	2024-02-18	Fall 2024
264	27	84	2024-01-10	Spring 2024
265	91	98	2024-09-07	Summer 2024
266	305	31	2024-03-18	Fall 2024
267	76	1	2023-11-28	Spring 2024
268	63	30	2023-10-09	Fall 2024
269	45	11	2024-05-07	Fall 2024
270	454	75	2024-02-17	Spring 2024
271	100	58	2023-12-05	Fall 2024
272	111	100	2024-02-13	Fall 2024
273	176	46	2024-04-25	Summer 2024
274	90	24	2024-09-03	Summer 2024
275	125	90	2023-11-06	Summer 2024
276	482	28	2024-08-01	Fall 2024
277	373	70	2024-02-20	Fall 2024
278	139	49	2023-10-16	Summer 2024
279	182	58	2024-07-28	Summer 2024
280	400	42	2024-01-04	Spring 2024
281	232	20	2024-04-23	Summer 2024
282	89	79	2024-08-03	Fall 2024
283	93	63	2023-11-02	Fall 2024
284	54	35	2023-09-29	Fall 2024
285	305	56	2024-07-30	Fall 2024
286	441	13	2024-02-08	Summer 2024
287	429	4	2024-02-27	Summer 2024
288	156	27	2023-09-24	Spring 2024
289	445	81	2024-06-12	Spring 2024
290	286	31	2023-09-28	Spring 2024
291	341	47	2024-04-03	Spring 2024
292	43	65	2023-11-16	Spring 2024
293	170	73	2024-03-02	Summer 2024
294	167	91	2023-09-27	Summer 2024
295	358	13	2024-05-16	Summer 2024
296	237	69	2023-10-01	Summer 2024
297	82	70	2023-10-27	Spring 2024
298	456	95	2024-04-14	Summer 2024
299	404	19	2024-01-25	Fall 2024
300	94	95	2024-04-27	Fall 2024
301	339	24	2024-03-13	Spring 2024
302	239	89	2024-06-30	Summer 2024
303	491	63	2023-12-07	Fall 2024
304	106	39	2024-05-14	Fall 2024
305	410	78	2024-05-19	Fall 2024
306	103	48	2024-08-15	Fall 2024
307	373	11	2024-06-27	Fall 2024
308	377	53	2024-02-22	Spring 2024
309	127	97	2024-01-04	Fall 2024
310	184	91	2024-02-22	Summer 2024
311	282	51	2024-04-09	Summer 2024
312	85	82	2024-03-13	Summer 2024
313	120	48	2024-09-07	Summer 2024
314	164	63	2024-04-20	Fall 2024
315	173	50	2024-02-25	Summer 2024
316	499	8	2023-10-12	Spring 2024
317	167	1	2024-01-05	Summer 2024
318	135	71	2024-04-24	Summer 2024
319	277	58	2024-06-05	Fall 2024
320	101	93	2024-08-16	Fall 2024
321	187	60	2023-11-14	Spring 2024
322	442	58	2024-07-16	Fall 2024
323	250	4	2024-08-08	Summer 2024
324	133	86	2024-04-13	Summer 2024
325	111	48	2024-05-30	Summer 2024
326	401	1	2023-10-02	Fall 2024
327	267	30	2024-01-24	Spring 2024
328	283	83	2024-05-26	Summer 2024
329	330	9	2023-11-30	Fall 2024
330	31	27	2024-04-12	Spring 2024
331	369	78	2023-10-14	Spring 2024
332	470	2	2024-01-07	Spring 2024
333	440	98	2024-02-23	Fall 2024
334	498	72	2023-09-27	Fall 2024
335	358	55	2023-11-22	Fall 2024
336	233	45	2024-06-25	Fall 2024
337	61	36	2023-10-03	Spring 2024
338	455	12	2023-11-13	Summer 2024
339	2	53	2024-09-11	Summer 2024
340	56	49	2023-11-14	Fall 2024
341	94	38	2023-10-18	Fall 2024
342	495	22	2023-10-05	Spring 2024
343	363	88	2024-05-26	Summer 2024
344	122	6	2024-07-29	Summer 2024
345	426	9	2024-03-30	Spring 2024
346	108	57	2023-12-08	Fall 2024
347	257	38	2024-06-01	Fall 2024
348	425	76	2023-12-17	Fall 2024
349	170	30	2024-06-12	Summer 2024
350	477	83	2024-04-25	Summer 2024
351	477	54	2023-12-24	Fall 2024
352	406	50	2024-02-03	Summer 2024
353	457	31	2024-09-04	Summer 2024
354	101	5	2024-05-27	Spring 2024
355	286	96	2024-09-11	Summer 2024
356	429	63	2024-06-27	Spring 2024
357	326	4	2024-05-26	Fall 2024
358	396	65	2023-12-17	Fall 2024
359	53	47	2024-01-12	Spring 2024
360	261	10	2024-03-27	Fall 2024
361	239	16	2024-09-02	Summer 2024
362	415	22	2024-08-07	Fall 2024
363	84	59	2024-09-12	Spring 2024
364	186	41	2024-08-12	Spring 2024
365	162	89	2023-10-20	Summer 2024
366	183	57	2024-03-25	Fall 2024
367	7	96	2024-01-23	Summer 2024
368	116	73	2024-06-28	Spring 2024
369	43	40	2023-10-29	Summer 2024
370	483	94	2023-10-22	Fall 2024
371	496	20	2024-04-15	Fall 2024
372	252	15	2023-12-24	Summer 2024
373	471	50	2023-10-09	Summer 2024
374	244	94	2024-03-02	Fall 2024
375	44	74	2023-12-10	Spring 2024
376	253	90	2024-06-17	Fall 2024
377	307	11	2024-06-26	Fall 2024
378	282	36	2023-12-21	Fall 2024
379	470	8	2024-06-07	Spring 2024
380	252	23	2024-05-13	Fall 2024
381	490	83	2024-07-02	Spring 2024
382	421	20	2024-08-03	Summer 2024
383	432	2	2024-02-10	Fall 2024
384	62	99	2023-10-25	Fall 2024
385	113	8	2024-08-10	Fall 2024
386	214	91	2024-03-10	Spring 2024
387	164	77	2024-05-14	Spring 2024
388	55	84	2023-10-30	Spring 2024
389	88	11	2024-07-08	Fall 2024
390	263	84	2024-03-06	Fall 2024
391	191	17	2024-04-30	Fall 2024
392	369	55	2024-03-07	Spring 2024
393	109	42	2023-09-28	Spring 2024
394	339	21	2024-07-16	Fall 2024
395	439	29	2024-04-18	Spring 2024
396	430	55	2023-09-18	Summer 2024
397	267	5	2023-11-28	Spring 2024
398	48	34	2024-04-18	Summer 2024
399	54	38	2023-12-14	Spring 2024
400	281	21	2024-03-23	Summer 2024
401	349	8	2024-01-08	Spring 2024
402	141	77	2023-11-08	Fall 2024
403	303	38	2023-09-28	Fall 2024
404	72	67	2024-05-11	Summer 2024
405	155	76	2024-05-26	Fall 2024
406	266	80	2023-12-11	Spring 2024
407	5	46	2023-12-31	Summer 2024
408	458	68	2024-02-12	Summer 2024
409	373	64	2023-11-22	Spring 2024
410	386	94	2024-03-16	Fall 2024
411	145	95	2023-11-09	Summer 2024
412	385	64	2024-01-16	Fall 2024
413	171	63	2024-05-14	Summer 2024
414	449	70	2024-06-28	Spring 2024
415	373	88	2024-06-16	Spring 2024
416	439	78	2024-03-20	Fall 2024
417	44	100	2024-08-02	Fall 2024
418	101	64	2024-07-11	Fall 2024
419	155	50	2024-08-16	Fall 2024
420	248	65	2024-06-15	Summer 2024
421	402	98	2024-07-06	Summer 2024
422	138	45	2024-01-17	Summer 2024
423	291	56	2024-01-10	Fall 2024
424	52	45	2024-01-31	Fall 2024
425	278	65	2024-04-17	Spring 2024
426	209	11	2023-10-01	Spring 2024
427	296	42	2023-11-11	Summer 2024
428	500	23	2023-11-02	Spring 2024
429	147	24	2024-09-07	Fall 2024
430	36	4	2024-01-21	Fall 2024
431	486	93	2023-11-17	Summer 2024
432	154	96	2023-12-27	Spring 2024
433	292	41	2024-07-28	Spring 2024
434	364	79	2023-12-22	Spring 2024
435	39	41	2024-01-21	Spring 2024
436	213	1	2024-05-02	Summer 2024
437	17	9	2024-05-19	Fall 2024
438	187	43	2024-04-13	Fall 2024
439	198	65	2024-01-09	Fall 2024
440	177	70	2023-11-23	Fall 2024
441	221	13	2023-11-02	Spring 2024
442	333	20	2023-12-06	Spring 2024
443	430	32	2023-11-05	Spring 2024
444	191	62	2024-01-22	Summer 2024
445	238	46	2024-02-03	Spring 2024
446	283	88	2024-09-15	Summer 2024
447	498	64	2024-04-30	Spring 2024
448	74	23	2024-01-12	Spring 2024
449	498	30	2024-05-02	Spring 2024
450	474	56	2024-06-11	Summer 2024
451	53	39	2024-08-26	Fall 2024
452	312	33	2024-05-09	Fall 2024
453	331	95	2024-03-26	Fall 2024
454	465	86	2024-02-17	Summer 2024
455	57	53	2024-08-21	Fall 2024
456	78	15	2024-07-18	Spring 2024
457	132	93	2023-11-26	Fall 2024
458	424	15	2024-07-31	Summer 2024
459	414	56	2024-05-31	Fall 2024
460	442	30	2024-01-02	Spring 2024
461	369	19	2023-10-19	Fall 2024
462	17	13	2024-06-22	Spring 2024
463	172	26	2023-10-16	Fall 2024
464	353	46	2024-01-28	Fall 2024
465	319	53	2023-09-26	Summer 2024
466	21	35	2024-06-08	Spring 2024
467	143	82	2023-11-26	Fall 2024
468	179	97	2023-09-30	Fall 2024
469	33	47	2024-05-12	Fall 2024
470	339	28	2023-09-22	Summer 2024
471	181	68	2024-05-02	Spring 2024
472	425	16	2024-03-05	Fall 2024
473	304	92	2023-10-06	Summer 2024
474	243	23	2024-02-24	Spring 2024
475	150	46	2024-08-19	Fall 2024
476	459	98	2023-12-17	Fall 2024
477	133	55	2023-11-07	Summer 2024
478	62	76	2023-12-17	Fall 2024
479	137	74	2024-05-27	Spring 2024
480	243	23	2023-12-20	Fall 2024
481	68	15	2023-10-27	Fall 2024
482	23	68	2023-10-01	Spring 2024
483	493	26	2024-04-24	Fall 2024
484	4	12	2023-11-18	Fall 2024
485	261	16	2024-07-19	Summer 2024
486	185	85	2023-12-28	Summer 2024
487	353	100	2023-10-19	Fall 2024
488	362	59	2024-06-16	Spring 2024
489	388	57	2024-05-31	Spring 2024
490	64	42	2024-02-23	Fall 2024
491	94	32	2023-10-16	Spring 2024
492	431	88	2024-01-02	Summer 2024
493	126	54	2024-03-19	Summer 2024
494	400	70	2024-07-12	Fall 2024
495	239	66	2024-06-15	Summer 2024
496	401	66	2024-06-23	Summer 2024
497	144	25	2023-11-28	Spring 2024
498	338	73	2024-01-10	Summer 2024
499	129	88	2023-12-04	Fall 2024
500	479	40	2024-04-24	Spring 2024
501	491	5	2024-09-16	Fall 2024
502	492	5	2024-09-16	Fall 2024
503	493	5	2024-09-16	Fall 2024
504	494	5	2024-09-16	Fall 2024
505	495	5	2024-09-16	Fall 2024
506	496	5	2024-09-16	Fall 2024
507	497	5	2024-09-16	Fall 2024
508	498	5	2024-09-16	Fall 2024
509	499	5	2024-09-16	Fall 2024
510	500	5	2024-09-16	Fall 2024
\.


--
-- Data for Name: instructors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructors (instructor_id, name, department_id) FROM stdin;
1	Sean Copeland	1
2	Benjamin Cook	1
3	Heidi Oneill	1
4	Heather Wang	1
5	Denise Davis	1
6	Amanda Hamilton	1
7	Nicholas Grant	1
8	Nicolas Brooks	2
9	Robert Hamilton	2
10	Chad Meyers	2
11	Danielle Gray	2
12	Daniel Evans	2
13	Mary Stephens	2
14	Mary Joyce	2
15	Jason Willis	3
16	Allen Wagner	3
17	Calvin Torres	3
18	Matthew Lee	3
19	Nicole Brooks	3
20	Joshua Wheeler	3
21	Christina Foster	3
22	Joshua Banks	4
23	Amber Ramirez	4
24	Steven Dorsey	4
25	James Daniels	4
26	Jonathan Coleman	4
27	Zachary Morris	4
28	Sherry Mcdonald	4
29	Steven Fuentes	5
30	Deborah Tucker	5
31	Lydia Jenkins	5
32	Michael Ortiz	5
33	Laura Perkins	5
34	Andrew Wilson	5
35	Jon Franklin	5
36	Kayla Perry	6
37	Mary Scott	6
38	Linda Allen	6
39	Peter George	6
40	Dominique Howard	6
41	Joshua White	6
42	Teresa Thompson DDS	6
43	Amanda Lopez	7
44	Gregory Gordon	7
45	Allison Adams	7
46	Phillip Thompson	7
47	Anthony Osborn	7
48	Carrie Klein	7
49	Amy Hubbard	7
50	Hailey Acosta	8
51	Jason Sawyer	8
52	Katrina Suarez	8
53	Felicia West	8
54	John Carroll	8
55	William Owens	8
56	Stephanie Burton	8
57	Eric Robinson	9
58	Amy Pearson	9
59	Susan Wall	9
60	Christina Johnson	9
61	Christina Barnes	9
62	Carla Bautista	9
63	Brooke Ingram	9
64	Ashley Jackson	10
65	April Anderson	10
66	Christy Adams	10
67	Christopher Koch	10
68	Nicole Turner	10
69	Sean Martin	10
70	Travis Simpson	10
71	Ashley Brown	11
72	Robert Griffith	11
73	Whitney Vega	11
74	Dominique Brown	11
75	Jordan Morgan	11
76	Rodney Jones	11
77	Blake Clark	11
78	Ryan Edwards	12
79	Dawn Thomas	12
80	Michele West	12
81	Alejandro Hodge	12
82	Larry Clark Jr.	12
83	John Flores	12
84	Richard Tran	12
85	Andrew Marquez	13
86	Christopher Phillips	13
87	Sierra Banks	13
88	David Price	13
89	John Richard	13
90	Jennifer Vazquez	13
91	Deborah Daniels	13
92	Kevin Wong	14
93	Patrick Rubio	14
94	Kevin Herrera	14
95	Robert Moore	14
96	Mckenzie Steele	14
97	Amy Anderson	14
98	Donna Gray	14
99	Tracy Silva	15
100	Alex Newman	15
101	Bryan Reed	15
102	Sergio Rodriguez	15
103	Jessica Romero	15
104	Amy Berg	15
105	Douglas Martin	15
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, name, department_id) FROM stdin;
1	Mark Silva	10
2	Michelle Hawkins	12
3	Christina Pacheco	2
4	Lauren Hammond	12
5	Janet Waters	11
6	Edwin Morales	9
7	Lisa Long	5
8	Roy Lane	13
9	Donna Kennedy	1
10	Christopher Johnston	10
11	Brian Chase	1
12	Christopher Lowe	6
13	Samantha Simpson	15
14	Robert Holmes	11
15	Alexis Davis	3
16	Holly Gregory	11
17	Margaret Stewart	8
18	Whitney Stephens	11
19	Sarah Harris	9
20	Samantha Herring	1
21	Brent Townsend	3
22	Jerry Garcia	1
23	Debra Smith	15
24	Anna Lee	10
25	Benjamin Rogers	3
26	Noah Robertson	15
27	Christina Wright	9
28	Mary Phelps	5
29	Joshua Pierce	5
30	Suzanne Diaz	14
31	Lisa Pace	5
32	Philip Gibbs	5
33	Amber Frey	1
34	James Harris	3
35	Michael Baxter	11
36	Richard Lewis	5
37	Matthew Page	13
38	Kim Becker	15
39	Mr. Wesley Cline	7
40	Christine Hooper	9
41	Matthew Benitez	2
42	Eric Faulkner	11
43	Nicholas Ramsey	15
44	Benjamin Lewis	8
45	Mary Bruce	5
46	Jonathan Parker	14
47	Joe Hawkins	12
48	Julia Key	2
49	Sydney Moody	15
50	William Armstrong DDS	14
51	Christina Taylor	15
52	Cassandra Dunn	13
53	Nicole White	12
54	Bruce Carroll	4
55	Matthew Sweeney	9
56	Mason Newman	13
57	Sheryl Marquez	10
58	Nicholas Mckay	3
59	Todd Williams	7
60	Robert Hodges	12
61	Sarah Walters	14
62	Marvin Bond	6
63	Jason Salas	12
64	Carol Alvarado	9
65	Michael Sanchez	13
66	Latoya Bradford	14
67	Lisa Wright	14
68	Joyce Jensen	12
69	Jennifer Davis	3
70	Joseph Rivera	7
71	Samuel Meyers	5
72	Nicole Rodriguez	7
73	Scott Vance	1
74	William Ramirez	10
75	Matthew Mendoza	8
76	Alan Pace	5
77	Christine Price	5
78	Joe Stone	15
79	Jasmine Valencia	10
80	Alejandra Huber	1
81	Lindsay Smith	13
82	Jeffery Murphy	9
83	William Sanchez	3
84	Krista Sanders	8
85	Jeffrey Torres	3
86	Michael Shaw	12
87	George Decker	14
88	Anthony Sanders	13
89	Richard Morgan	5
90	Michael Walls	11
91	Christopher Simmons	7
92	Amanda Cruz	1
93	Gregory Casey	11
94	Theodore Young	5
95	Holly Reynolds	13
96	Rodney Morse	9
97	Eric Davis	15
98	Melinda Dixon	1
99	Meagan Bell	6
100	Clifford Garcia	10
101	Cassie Thomas	3
102	Craig Castro	3
103	Jamie Richard	15
104	Jon Henderson	7
105	Michael Fitzgerald	13
106	Jerry Mclaughlin	9
107	Kathleen Nelson	5
108	Mary Downs	7
109	Dana Jones	5
110	Nicholas Walker	1
111	Gary Hall	5
112	Deanna Dominguez	6
113	Teresa Berg	10
114	Dillon Leon	14
115	Allen Torres II	7
116	Cody Eaton	9
117	Mary Anderson	1
118	Alicia Young	9
119	Meghan Pineda	9
120	Daisy Palmer	5
121	Richard Wade	1
122	Kathy Brewer	13
123	Kyle Alvarez	6
124	Dawn Barber	12
125	Calvin Bailey	7
126	Maria Martinez	11
127	Kelly Orr	15
128	Christine White	15
129	Stacy Warner	11
130	Alison Bruce	4
131	Kevin Walsh	7
132	Christy Padilla	4
133	Dawn Jones	15
134	Elizabeth Long	2
135	Renee Barnett	10
136	Beth Gutierrez	10
137	Christopher Garrett	3
138	Desiree Daniels	1
139	Scott Townsend	3
140	Corey Swanson	10
141	James Dennis	10
142	Samantha Bernard	1
143	Lisa Taylor	13
144	Jennifer Davis	13
145	Theresa West	14
146	Jason Boyd	14
147	Travis Church	9
148	Christina Yoder DDS	13
149	Gabrielle Welch	15
150	Kristin Delgado	7
151	Alicia Douglas	3
152	Crystal Kirk	10
153	Caroline Hall	12
154	Barbara Smith	11
155	Sarah Gibson	9
156	Tyler Velez	1
157	Michael Kirk II	1
158	Ronald Wise	6
159	Albert Pham	8
160	Carolyn Wise	5
161	Danielle Perry	11
162	Diana Wiley	10
163	Micheal Golden	6
164	Justin Matthews	2
165	Linda Torres	7
166	Allison Wilcox	8
167	Tammy Washington	11
168	Kristina Cowan	6
169	Aaron Meza	10
170	Janet Robles	7
171	Travis Delacruz	4
172	Donna White	7
173	Heather Contreras	3
174	Sandy Rose	5
175	Frank Miller	4
176	Eric Gray	6
177	Lisa Ruiz	4
178	William Davis	2
179	Rebecca Dalton	9
180	Caitlin Woods	6
181	Christopher Higgins	12
182	John Johnson	11
183	Jack Klein	10
184	John Peters	3
185	Mark Flores	7
186	Christopher Smith	3
187	Jacob Zuniga	13
188	Meagan Cuevas	2
189	Justin Brown	5
190	Maria Smith	14
191	Katrina Rios	9
192	Shelly Glover	9
193	Tara Lynch	11
194	Kimberly Weaver	1
195	John Foley	14
196	David Moore	7
197	Andrew Hamilton	3
198	Sara Logan	8
199	Christina Garner	7
200	Theresa Smith	1
201	Kyle Eaton	15
202	Manuel Holt	4
203	Diane Baker	1
204	Isaac Norman	15
205	Caroline Jarvis	14
206	Frank Jackson	12
207	David Cruz	3
208	Timothy Wilson	3
209	John Taylor	12
210	Scott George	5
211	Mrs. Sarah Mahoney MD	10
212	Amanda Evans	5
213	Vincent Williams	10
214	Melinda Brooks	4
215	Kyle Smith	15
216	Timothy Ashley	8
217	Samantha Anderson	3
218	Julia Massey	1
219	John Hudson	2
220	Isaac Carter	1
221	Gloria Harmon	5
222	Stephanie Dodson	12
223	William Young	15
224	Ashley Huff	15
225	Michelle Morgan	1
226	Mrs. Judith Werner	5
227	Donald Fernandez	13
228	Wanda Johnson	15
229	Adam Lynn	7
230	Christopher Smith	10
231	Donald Vargas	6
232	Joshua Martin	13
233	Kyle Gates	5
234	Steven Rodriguez	13
235	Nicole Powell	12
236	Jacob Rodgers	13
237	Kristen Rodriguez	4
238	Christopher Moran	7
239	John Wilson	7
240	Lauren Ramirez	9
241	Derek Curry	7
242	Kelli Wilcox	14
243	Steven Howard	9
244	Jill Church	12
245	Melissa Norton	13
246	Jack Lucero	9
247	Jesse Haynes	4
248	Tracy Jones	3
249	Vincent Young	7
250	David Wheeler	3
251	Lauren Jones	5
252	Patrick Scott	1
253	John Brown	10
254	Veronica Hurst	14
255	Patricia Gray	8
256	Jennifer Howe	12
257	Alexander Russo	13
258	Kim Moore	9
259	Stephanie Owens	4
260	Tiffany Douglas	9
261	Donna Casey	14
262	Derek Fox	2
263	William Cook	2
264	Linda Robinson	9
265	Scott White	14
266	Richard Clark	15
267	Reginald Johnson	10
268	Bethany Smith	5
269	Margaret Parsons	8
270	Charles Miller	6
271	Anne Klein	7
272	Anna Williams	13
273	Adam Long	4
274	Blake Gonzalez	9
275	Cynthia Mckenzie	2
276	Elizabeth Anderson	2
277	Margaret Thomas	11
278	Ashley Key	2
279	Troy Nguyen	6
280	Anna Cohen	13
281	Donald Thompson	13
282	Nancy Hatfield	10
283	Mary Pearson	13
284	Dustin Rosales	8
285	Rachel Hernandez MD	12
286	Jenna Lopez	15
287	Angel Buckley	15
288	Brian Williams	6
289	Kimberly Stevenson	5
290	Troy Jones	13
291	Edward Vasquez	15
292	Priscilla Lynch	5
293	Denise Munoz	14
294	Catherine Thompson	7
295	Mackenzie Mclaughlin	14
296	Edwin Cummings	14
297	Michelle Randall	4
298	Melissa Jackson	2
299	Michelle Ellis	8
300	James Fernandez	7
301	Shannon Diaz	14
302	Joshua Gordon	1
303	Margaret Newton	7
304	Joseph Vincent	6
305	Kimberly Roberson	5
306	Brittany Evans	12
307	Shawn Jones	3
308	Melissa Middleton	13
309	Cynthia Bennett	15
310	Emily Fields	7
311	Angelica Bender	6
312	Scott Hardy	8
313	Henry Mitchell	14
314	Jose Mcdonald	1
315	Tracy Morrison	7
316	Sarah Obrien	3
317	Wayne Hernandez	7
318	Belinda King	11
319	Andre Mejia	2
320	Jamie Phillips	1
321	Shawn Matthews	15
322	Kimberly Walker	8
323	Holly Murray	2
324	Katherine Gay	1
325	Theresa King	11
326	Mary Torres	10
327	Clayton Walker	7
328	Tiffany Foster	2
329	Jennifer Moore	12
330	Kristin Johnson	4
331	Madeline Smith	3
332	David Wood	14
333	Dylan Martinez	10
334	Taylor Stevens	11
335	Jenna Navarro	14
336	Lynn Banks	3
337	Michael Wallace	4
338	Shirley Nelson	12
339	Heather Allen	12
340	Kathleen Snyder	9
341	Sandra Mercado	15
342	Tonya Foley	12
343	David Stewart	12
344	Robert Prince	4
345	Gabrielle Lee	15
346	Elizabeth Bishop	4
347	Jacob Ramsey	11
348	Lindsay Harper	5
349	Kendra Perez	9
350	Reginald Carter	11
351	Stanley Melton	5
352	Leslie Wallace	5
353	Kayla Norris	9
354	Colton Nelson	14
355	Leroy Oconnor DDS	15
356	Jesse Schmidt	14
357	Brittney Barrett	6
358	Monique Holt	8
359	Robert Carr	2
360	Melissa Wolfe	6
361	Nicholas Dixon	5
362	Dr. Aaron Yang PhD	8
363	Julie Weber	7
364	Christopher Howe	4
365	Glen Brown	4
366	Thomas Mathis	11
367	Pamela Vaughan	9
368	David Evans	11
369	Julie Davis	6
370	Eric White	5
371	Nicholas Cummings	13
372	Ray Knight	2
373	Luis Davis	12
374	Michelle Griffin	5
375	Katherine Snyder	5
376	Bianca Smith	2
377	Ryan Wagner	10
378	David Phillips	3
379	Paula Shields	5
380	Justin Martinez	1
381	Debbie Reid	11
382	Michael Dalton	1
383	Jason Jacobson	1
384	Joseph Bush	10
385	Michelle Bennett	13
386	Cody Smith	7
387	Glen Ferguson	13
388	Melvin Montes	13
389	Heather Davis	14
390	Billy Schroeder	10
391	Lisa Moore	2
392	Daniel Cooper	1
393	David Martinez	13
394	Christopher Monroe	13
395	Edward Garcia	6
396	Jeremy Martin	12
397	Sharon Rhodes	6
398	Matthew Velez	5
399	Anthony Page	9
400	Tammy Hamilton	1
401	Scott Wiggins	4
402	Stephanie Wade	5
403	Lisa Kim	3
404	Hayley King	9
405	Steven Cochran	6
406	Jade Torres	14
407	Julie Long	2
408	Ryan Goodwin	11
409	Jenna Warren MD	2
410	Kenneth Lopez	15
411	James Mills	13
412	Joshua Mayer	9
413	Kara Nichols	12
414	Mrs. Alyssa Simmons	3
415	Krista Ho	14
416	Patricia Quinn	2
417	Kristen Moore	6
418	Samantha Robinson	6
419	Erika Hall	5
420	Michele King	10
421	Stephanie Richmond	11
422	Martha Gardner	2
423	Tamara Williams	14
424	Robert Jimenez	5
425	Sarah Johnson	13
426	Brittany Parker	1
427	Miss Tricia Sanford	3
428	Meagan Meza	12
429	Anthony Miller	5
430	Jason Oconnor	2
431	Jill Elliott	4
432	Jackson Simpson	4
433	Steven Wallace	7
434	Sharon Jimenez	7
435	Jared Stewart	14
436	Tiffany Nguyen	6
437	Stephanie Villa	5
438	Kelsey Cooper	7
439	Aaron Ali	4
440	Eddie Burke	8
441	Sandra Perry	14
442	Noah Evans	5
443	Tracy Smith	1
444	Shari Dean	15
445	Timothy Smith	9
446	Melissa Garcia	7
447	Mrs. Paula Bowman	1
448	Nancy Harris	9
449	Kerry Moyer	5
450	Patricia Davis	9
451	Lisa Smith	15
452	James Thompson	7
453	Randy Kennedy	9
454	Victoria West	10
455	Alexis Wong	10
456	Amanda Guerra	13
457	Timothy Wood	13
458	Robin Flowers	6
459	James Bolton	9
460	Isaiah Warren II	14
461	Emily Berry	3
462	Misty Miller	2
463	Brandon Morris	14
464	Alexandra Le	13
465	Willie Stafford	8
466	Hayden Brown	1
467	Ann Johnson	12
468	Austin Reynolds	7
469	Kimberly Walls	3
470	Lydia Riley	15
471	Martin Lopez	1
472	Mason Espinoza	12
473	Maria Walker	2
474	Jillian Rodriguez	11
475	Juan Smith	8
476	Thomas Delacruz	1
477	Brandon Sullivan	9
478	Luis Garcia	6
479	Aaron Copeland	6
480	Nancy Reid	1
481	Melinda Smith	15
482	Kimberly Reynolds	1
483	Mary Bradford	5
484	Rebecca Mclaughlin	5
485	Steven Hernandez Jr.	8
486	Megan Wong	7
487	Brooke Burke	14
488	Jillian Schultz	15
489	Heather Conway	12
490	Crystal Ward	4
491	Shawn Chavez	6
492	Cassandra Carlson	7
493	Megan Conley	7
494	Christopher Wright	1
495	Kyle Ewing	4
496	Adrienne Roman	15
497	Richard Martinez	1
498	Dylan Chang Jr.	13
499	Jaime Stokes	3
500	Adam Reid	8
501	John Smith	1
502	Emily Johnson	1
503	Michael Brown	1
504	Sarah Davis	1
505	David Wilson	1
506	Laura Martin	1
507	James Lee	1
508	Sophia Walker	1
509	Daniel King	1
510	Olivia Scott	1
\.


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 100, true);


--
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_department_id_seq', 15, true);


--
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollments_enrollment_id_seq', 510, true);


--
-- Name: instructors_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructors_instructor_id_seq', 105, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 510, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id);


--
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (instructor_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: courses courses_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- Name: courses courses_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructors(instructor_id);


--
-- Name: enrollments enrollments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: enrollments enrollments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id);


--
-- Name: instructors instructors_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- Name: students students_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- PostgreSQL database dump complete
--

