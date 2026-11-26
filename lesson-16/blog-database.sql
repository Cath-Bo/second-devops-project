--
-- PostgreSQL database dump
--

\restrict cyc2h4MqX4AoI2sadXiPss5mi1tjBuPSmP56p8Yd9bCxe9UoUh1fkTciKnBysTo

-- Dumped from database version 17.12 (Debian 17.12-0+deb13u1)
-- Dumped by pg_dump version 17.12 (Debian 17.12-0+deb13u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: article_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_tags (
    article_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.article_tags OWNER TO postgres;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles (
    id bigint NOT NULL,
    user_id bigint,
    category_id bigint,
    title text NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    article_id bigint,
    user_id bigint,
    body text NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: article_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_tags (article_id, tag_id) FROM stdin;
1	1
1	2
1	3
2	2
2	4
3	1
3	5
4	3
5	6
6	7
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, user_id, category_id, title, body) FROM stdin;
1	1	9	The Best Drama Movies	A review of the best drama movies.
2	2	10	Best Comedy Movies	A collection of popular comedy movies.
3	3	11	Action Movies of All Time	A look at the greatest action movies.
4	4	12	Best Thriller Movies	A review of exciting thriller movies.
5	5	13	Classic Horror Movies	A collection of classic horror movies.
6	6	14	Science Fiction Masterpieces	A review of science fiction films.
7	7	15	The World of Fantasy Movies	A look at fantasy cinema.
8	8	16	Best Animated Movies	A collection of animated movie reviews.
9	1	9	Movie Review	A review of a movie.
10	1	9	Movie Review	A review of a movie.
11	1	9	Movie Review	A review of a movie.
12	1	9	Movie Review	A review of a movie.
13	1	9	Movie Review	A review of a movie.
14	1	9	Movie Review	A review of a movie.
15	1	9	Movie Review	A review of a movie.
16	1	9	Movie Review	A review of a movie.
17	1	9	Movie Review	A review of a movie.
18	1	9	Movie Review	A review of a movie.
19	1	9	Movie Review	A review of a movie.
20	1	9	Movie Review	A review of a movie.
21	1	9	Movie Review	A review of a movie.
22	1	9	Movie Review	A review of a movie.
23	1	9	Movie Review	A review of a movie.
24	1	9	Movie Review	A review of a movie.
25	1	9	Movie Review	A review of a movie.
26	1	9	Movie Review	A review of a movie.
27	1	9	Movie Review	A review of a movie.
28	1	9	Movie Review	A review of a movie.
29	1	9	Movie Review	A review of a movie.
30	1	9	Movie Review	A review of a movie.
31	1	9	Movie Review	A review of a movie.
32	1	9	Movie Review	A review of a movie.
33	1	9	Movie Review	A review of a movie.
34	1	9	Movie Review	A review of a movie.
35	1	9	Movie Review	A review of a movie.
36	1	9	Movie Review	A review of a movie.
37	1	9	Movie Review	A review of a movie.
38	1	9	Movie Review	A review of a movie.
39	1	9	Movie Review	A review of a movie.
40	1	9	Movie Review	A review of a movie.
41	1	9	Movie Review	A review of a movie.
42	1	9	Movie Review	A review of a movie.
43	1	9	Movie Review	A review of a movie.
44	1	9	Movie Review	A review of a movie.
45	1	9	Movie Review	A review of a movie.
46	1	9	Movie Review	A review of a movie.
47	1	9	Movie Review	A review of a movie.
48	1	9	Movie Review	A review of a movie.
49	1	9	Movie Review	A review of a movie.
50	1	9	Movie Review	A review of a movie.
51	1	9	Movie Review	A review of a movie.
52	1	9	Movie Review	A review of a movie.
53	1	9	Movie Review	A review of a movie.
54	1	9	Movie Review	A review of a movie.
55	1	9	Movie Review	A review of a movie.
56	1	9	Movie Review	A review of a movie.
57	1	9	Movie Review	A review of a movie.
58	1	9	Movie Review	A review of a movie.
59	1	9	Movie Review	A review of a movie.
60	1	9	Movie Review	A review of a movie.
61	1	9	Movie Review	A review of a movie.
62	1	9	Movie Review	A review of a movie.
63	1	9	Movie Review	A review of a movie.
64	1	9	Movie Review	A review of a movie.
65	1	9	Movie Review	A review of a movie.
66	1	9	Movie Review	A review of a movie.
67	1	9	Movie Review	A review of a movie.
68	1	9	Movie Review	A review of a movie.
69	1	9	Movie Review	A review of a movie.
70	1	9	Movie Review	A review of a movie.
71	1	9	Movie Review	A review of a movie.
72	1	9	Movie Review	A review of a movie.
73	1	9	Movie Review	A review of a movie.
74	1	9	Movie Review	A review of a movie.
75	1	9	Movie Review	A review of a movie.
76	1	9	Movie Review	A review of a movie.
77	1	9	Movie Review	A review of a movie.
78	1	9	Movie Review	A review of a movie.
79	1	9	Movie Review	A review of a movie.
80	1	9	Movie Review	A review of a movie.
81	1	9	Movie Review	A review of a movie.
82	1	9	Movie Review	A review of a movie.
83	1	9	Movie Review	A review of a movie.
84	1	9	Movie Review	A review of a movie.
85	1	9	Movie Review	A review of a movie.
86	1	9	Movie Review	A review of a movie.
87	1	9	Movie Review	A review of a movie.
88	1	9	Movie Review	A review of a movie.
89	1	9	Movie Review	A review of a movie.
90	1	9	Movie Review	A review of a movie.
91	1	9	Movie Review	A review of a movie.
92	1	9	Movie Review	A review of a movie.
93	1	9	Movie Review	A review of a movie.
94	1	9	Movie Review	A review of a movie.
95	1	9	Movie Review	A review of a movie.
96	1	9	Movie Review	A review of a movie.
97	1	9	Movie Review	A review of a movie.
98	1	9	Movie Review	A review of a movie.
99	1	9	Movie Review	A review of a movie.
100	1	9	Movie Review	A review of a movie.
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
9	Drama
10	Comedy
11	Action
12	Thriller
13	Horror
14	Science Fiction
15	Fantasy
16	Animation
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, article_id, user_id, body) FROM stdin;
1	1	1	This is a great movie!
2	1	1	This is a great movie!
3	1	1	This is a great movie!
4	1	1	This is a great movie!
5	1	1	This is a great movie!
6	1	1	This is a great movie!
7	1	1	This is a great movie!
8	1	1	This is a great movie!
9	1	1	This is a great movie!
10	1	1	This is a great movie!
11	1	1	This is a great movie!
12	1	1	This is a great movie!
13	1	1	This is a great movie!
14	1	1	This is a great movie!
15	1	1	This is a great movie!
16	1	1	This is a great movie!
17	1	1	This is a great movie!
18	1	1	This is a great movie!
19	1	1	This is a great movie!
20	1	1	This is a great movie!
21	1	1	This is a great movie!
22	1	1	This is a great movie!
23	1	1	This is a great movie!
24	1	1	This is a great movie!
25	1	1	This is a great movie!
26	1	1	This is a great movie!
27	1	1	This is a great movie!
28	1	1	This is a great movie!
29	1	1	This is a great movie!
30	1	1	This is a great movie!
31	1	1	This is a great movie!
32	1	1	This is a great movie!
33	1	1	This is a great movie!
34	1	1	This is a great movie!
35	1	1	This is a great movie!
36	1	1	This is a great movie!
37	1	1	This is a great movie!
38	1	1	This is a great movie!
39	1	1	This is a great movie!
40	1	1	This is a great movie!
41	1	1	This is a great movie!
42	1	1	This is a great movie!
43	1	1	This is a great movie!
44	1	1	This is a great movie!
45	1	1	This is a great movie!
46	1	1	This is a great movie!
47	1	1	This is a great movie!
48	1	1	This is a great movie!
49	1	1	This is a great movie!
50	1	1	This is a great movie!
51	1	1	This is a great movie!
52	1	1	This is a great movie!
53	1	1	This is a great movie!
54	1	1	This is a great movie!
55	1	1	This is a great movie!
56	1	1	This is a great movie!
57	1	1	This is a great movie!
58	1	1	This is a great movie!
59	1	1	This is a great movie!
60	1	1	This is a great movie!
61	1	1	This is a great movie!
62	1	1	This is a great movie!
63	1	1	This is a great movie!
64	1	1	This is a great movie!
65	1	1	This is a great movie!
66	1	1	This is a great movie!
67	1	1	This is a great movie!
68	1	1	This is a great movie!
69	1	1	This is a great movie!
70	1	1	This is a great movie!
71	1	1	This is a great movie!
72	1	1	This is a great movie!
73	1	1	This is a great movie!
74	1	1	This is a great movie!
75	1	1	This is a great movie!
76	1	1	This is a great movie!
77	1	1	This is a great movie!
78	1	1	This is a great movie!
79	1	1	This is a great movie!
80	1	1	This is a great movie!
81	1	1	This is a great movie!
82	1	1	This is a great movie!
83	1	1	This is a great movie!
84	1	1	This is a great movie!
85	1	1	This is a great movie!
86	1	1	This is a great movie!
87	1	1	This is a great movie!
88	1	1	This is a great movie!
89	1	1	This is a great movie!
90	1	1	This is a great movie!
91	1	1	This is a great movie!
92	1	1	This is a great movie!
93	1	1	This is a great movie!
94	1	1	This is a great movie!
95	1	1	This is a great movie!
96	1	1	This is a great movie!
97	1	1	This is a great movie!
98	1	1	This is a great movie!
99	1	1	This is a great movie!
100	1	1	This is a great movie!
101	1	1	This is a great movie!
102	1	1	This is a great movie!
103	1	1	This is a great movie!
104	1	1	This is a great movie!
105	1	1	This is a great movie!
106	1	1	This is a great movie!
107	1	1	This is a great movie!
108	1	1	This is a great movie!
109	1	1	This is a great movie!
110	1	1	This is a great movie!
111	1	1	This is a great movie!
112	1	1	This is a great movie!
113	1	1	This is a great movie!
114	1	1	This is a great movie!
115	1	1	This is a great movie!
116	1	1	This is a great movie!
117	1	1	This is a great movie!
118	1	1	This is a great movie!
119	1	1	This is a great movie!
120	1	1	This is a great movie!
121	1	1	This is a great movie!
122	1	1	This is a great movie!
123	1	1	This is a great movie!
124	1	1	This is a great movie!
125	1	1	This is a great movie!
126	1	1	This is a great movie!
127	1	1	This is a great movie!
128	1	1	This is a great movie!
129	1	1	This is a great movie!
130	1	1	This is a great movie!
131	1	1	This is a great movie!
132	1	1	This is a great movie!
133	1	1	This is a great movie!
134	1	1	This is a great movie!
135	1	1	This is a great movie!
136	1	1	This is a great movie!
137	1	1	This is a great movie!
138	1	1	This is a great movie!
139	1	1	This is a great movie!
140	1	1	This is a great movie!
141	1	1	This is a great movie!
142	1	1	This is a great movie!
143	1	1	This is a great movie!
144	1	1	This is a great movie!
145	1	1	This is a great movie!
146	1	1	This is a great movie!
147	1	1	This is a great movie!
148	1	1	This is a great movie!
149	1	1	This is a great movie!
150	1	1	This is a great movie!
151	1	1	This is a great movie!
152	1	1	This is a great movie!
153	1	1	This is a great movie!
154	1	1	This is a great movie!
155	1	1	This is a great movie!
156	1	1	This is a great movie!
157	1	1	This is a great movie!
158	1	1	This is a great movie!
159	1	1	This is a great movie!
160	1	1	This is a great movie!
161	1	1	This is a great movie!
162	1	1	This is a great movie!
163	1	1	This is a great movie!
164	1	1	This is a great movie!
165	1	1	This is a great movie!
166	1	1	This is a great movie!
167	1	1	This is a great movie!
168	1	1	This is a great movie!
169	1	1	This is a great movie!
170	1	1	This is a great movie!
171	1	1	This is a great movie!
172	1	1	This is a great movie!
173	1	1	This is a great movie!
174	1	1	This is a great movie!
175	1	1	This is a great movie!
176	1	1	This is a great movie!
177	1	1	This is a great movie!
178	1	1	This is a great movie!
179	1	1	This is a great movie!
180	1	1	This is a great movie!
181	1	1	This is a great movie!
182	1	1	This is a great movie!
183	1	1	This is a great movie!
184	1	1	This is a great movie!
185	1	1	This is a great movie!
186	1	1	This is a great movie!
187	1	1	This is a great movie!
188	1	1	This is a great movie!
189	1	1	This is a great movie!
190	1	1	This is a great movie!
191	1	1	This is a great movie!
192	1	1	This is a great movie!
193	1	1	This is a great movie!
194	1	1	This is a great movie!
195	1	1	This is a great movie!
196	1	1	This is a great movie!
197	1	1	This is a great movie!
198	1	1	This is a great movie!
199	1	1	This is a great movie!
200	1	1	This is a great movie!
201	1	1	This is a great movie!
202	1	1	This is a great movie!
203	1	1	This is a great movie!
204	1	1	This is a great movie!
205	1	1	This is a great movie!
206	1	1	This is a great movie!
207	1	1	This is a great movie!
208	1	1	This is a great movie!
209	1	1	This is a great movie!
210	1	1	This is a great movie!
211	1	1	This is a great movie!
212	1	1	This is a great movie!
213	1	1	This is a great movie!
214	1	1	This is a great movie!
215	1	1	This is a great movie!
216	1	1	This is a great movie!
217	1	1	This is a great movie!
218	1	1	This is a great movie!
219	1	1	This is a great movie!
220	1	1	This is a great movie!
221	1	1	This is a great movie!
222	1	1	This is a great movie!
223	1	1	This is a great movie!
224	1	1	This is a great movie!
225	1	1	This is a great movie!
226	1	1	This is a great movie!
227	1	1	This is a great movie!
228	1	1	This is a great movie!
229	1	1	This is a great movie!
230	1	1	This is a great movie!
231	1	1	This is a great movie!
232	1	1	This is a great movie!
233	1	1	This is a great movie!
234	1	1	This is a great movie!
235	1	1	This is a great movie!
236	1	1	This is a great movie!
237	1	1	This is a great movie!
238	1	1	This is a great movie!
239	1	1	This is a great movie!
240	1	1	This is a great movie!
241	1	1	This is a great movie!
242	1	1	This is a great movie!
243	1	1	This is a great movie!
244	1	1	This is a great movie!
245	1	1	This is a great movie!
246	1	1	This is a great movie!
247	1	1	This is a great movie!
248	1	1	This is a great movie!
249	1	1	This is a great movie!
250	1	1	This is a great movie!
251	1	1	This is a great movie!
252	1	1	This is a great movie!
253	1	1	This is a great movie!
254	1	1	This is a great movie!
255	1	1	This is a great movie!
256	1	1	This is a great movie!
257	1	1	This is a great movie!
258	1	1	This is a great movie!
259	1	1	This is a great movie!
260	1	1	This is a great movie!
261	1	1	This is a great movie!
262	1	1	This is a great movie!
263	1	1	This is a great movie!
264	1	1	This is a great movie!
265	1	1	This is a great movie!
266	1	1	This is a great movie!
267	1	1	This is a great movie!
268	1	1	This is a great movie!
269	1	1	This is a great movie!
270	1	1	This is a great movie!
271	1	1	This is a great movie!
272	1	1	This is a great movie!
273	1	1	This is a great movie!
274	1	1	This is a great movie!
275	1	1	This is a great movie!
276	1	1	This is a great movie!
277	1	1	This is a great movie!
278	1	1	This is a great movie!
279	1	1	This is a great movie!
280	1	1	This is a great movie!
281	1	1	This is a great movie!
282	1	1	This is a great movie!
283	1	1	This is a great movie!
284	1	1	This is a great movie!
285	1	1	This is a great movie!
286	1	1	This is a great movie!
287	1	1	This is a great movie!
288	1	1	This is a great movie!
289	1	1	This is a great movie!
290	1	1	This is a great movie!
291	1	1	This is a great movie!
292	1	1	This is a great movie!
293	1	1	This is a great movie!
294	1	1	This is a great movie!
295	1	1	This is a great movie!
296	1	1	This is a great movie!
297	1	1	This is a great movie!
298	1	1	This is a great movie!
299	1	1	This is a great movie!
300	1	1	This is a great movie!
301	1	1	This is a great movie!
302	1	1	This is a great movie!
303	1	1	This is a great movie!
304	1	1	This is a great movie!
305	1	1	This is a great movie!
306	1	1	This is a great movie!
307	1	1	This is a great movie!
308	1	1	This is a great movie!
309	1	1	This is a great movie!
310	1	1	This is a great movie!
311	1	1	This is a great movie!
312	1	1	This is a great movie!
313	1	1	This is a great movie!
314	1	1	This is a great movie!
315	1	1	This is a great movie!
316	1	1	This is a great movie!
317	1	1	This is a great movie!
318	1	1	This is a great movie!
319	1	1	This is a great movie!
320	1	1	This is a great movie!
321	1	1	This is a great movie!
322	1	1	This is a great movie!
323	1	1	This is a great movie!
324	1	1	This is a great movie!
325	1	1	This is a great movie!
326	1	1	This is a great movie!
327	1	1	This is a great movie!
328	1	1	This is a great movie!
329	1	1	This is a great movie!
330	1	1	This is a great movie!
331	1	1	This is a great movie!
332	1	1	This is a great movie!
333	1	1	This is a great movie!
334	1	1	This is a great movie!
335	1	1	This is a great movie!
336	1	1	This is a great movie!
337	1	1	This is a great movie!
338	1	1	This is a great movie!
339	1	1	This is a great movie!
340	1	1	This is a great movie!
341	1	1	This is a great movie!
342	1	1	This is a great movie!
343	1	1	This is a great movie!
344	1	1	This is a great movie!
345	1	1	This is a great movie!
346	1	1	This is a great movie!
347	1	1	This is a great movie!
348	1	1	This is a great movie!
349	1	1	This is a great movie!
350	1	1	This is a great movie!
351	1	1	This is a great movie!
352	1	1	This is a great movie!
353	1	1	This is a great movie!
354	1	1	This is a great movie!
355	1	1	This is a great movie!
356	1	1	This is a great movie!
357	1	1	This is a great movie!
358	1	1	This is a great movie!
359	1	1	This is a great movie!
360	1	1	This is a great movie!
361	1	1	This is a great movie!
362	1	1	This is a great movie!
363	1	1	This is a great movie!
364	1	1	This is a great movie!
365	1	1	This is a great movie!
366	1	1	This is a great movie!
367	1	1	This is a great movie!
368	1	1	This is a great movie!
369	1	1	This is a great movie!
370	1	1	This is a great movie!
371	1	1	This is a great movie!
372	1	1	This is a great movie!
373	1	1	This is a great movie!
374	1	1	This is a great movie!
375	1	1	This is a great movie!
376	1	1	This is a great movie!
377	1	1	This is a great movie!
378	1	1	This is a great movie!
379	1	1	This is a great movie!
380	1	1	This is a great movie!
381	1	1	This is a great movie!
382	1	1	This is a great movie!
383	1	1	This is a great movie!
384	1	1	This is a great movie!
385	1	1	This is a great movie!
386	1	1	This is a great movie!
387	1	1	This is a great movie!
388	1	1	This is a great movie!
389	1	1	This is a great movie!
390	1	1	This is a great movie!
391	1	1	This is a great movie!
392	1	1	This is a great movie!
393	1	1	This is a great movie!
394	1	1	This is a great movie!
395	1	1	This is a great movie!
396	1	1	This is a great movie!
397	1	1	This is a great movie!
398	1	1	This is a great movie!
399	1	1	This is a great movie!
400	1	1	This is a great movie!
401	1	1	This is a great movie!
402	1	1	This is a great movie!
403	1	1	This is a great movie!
404	1	1	This is a great movie!
405	1	1	This is a great movie!
406	1	1	This is a great movie!
407	1	1	This is a great movie!
408	1	1	This is a great movie!
409	1	1	This is a great movie!
410	1	1	This is a great movie!
411	1	1	This is a great movie!
412	1	1	This is a great movie!
413	1	1	This is a great movie!
414	1	1	This is a great movie!
415	1	1	This is a great movie!
416	1	1	This is a great movie!
417	1	1	This is a great movie!
418	1	1	This is a great movie!
419	1	1	This is a great movie!
420	1	1	This is a great movie!
421	1	1	This is a great movie!
422	1	1	This is a great movie!
423	1	1	This is a great movie!
424	1	1	This is a great movie!
425	1	1	This is a great movie!
426	1	1	This is a great movie!
427	1	1	This is a great movie!
428	1	1	This is a great movie!
429	1	1	This is a great movie!
430	1	1	This is a great movie!
431	1	1	This is a great movie!
432	1	1	This is a great movie!
433	1	1	This is a great movie!
434	1	1	This is a great movie!
435	1	1	This is a great movie!
436	1	1	This is a great movie!
437	1	1	This is a great movie!
438	1	1	This is a great movie!
439	1	1	This is a great movie!
440	1	1	This is a great movie!
441	1	1	This is a great movie!
442	1	1	This is a great movie!
443	1	1	This is a great movie!
444	1	1	This is a great movie!
445	1	1	This is a great movie!
446	1	1	This is a great movie!
447	1	1	This is a great movie!
448	1	1	This is a great movie!
449	1	1	This is a great movie!
450	1	1	This is a great movie!
451	1	1	This is a great movie!
452	1	1	This is a great movie!
453	1	1	This is a great movie!
454	1	1	This is a great movie!
455	1	1	This is a great movie!
456	1	1	This is a great movie!
457	1	1	This is a great movie!
458	1	1	This is a great movie!
459	1	1	This is a great movie!
460	1	1	This is a great movie!
461	1	1	This is a great movie!
462	1	1	This is a great movie!
463	1	1	This is a great movie!
464	1	1	This is a great movie!
465	1	1	This is a great movie!
466	1	1	This is a great movie!
467	1	1	This is a great movie!
468	1	1	This is a great movie!
469	1	1	This is a great movie!
470	1	1	This is a great movie!
471	1	1	This is a great movie!
472	1	1	This is a great movie!
473	1	1	This is a great movie!
474	1	1	This is a great movie!
475	1	1	This is a great movie!
476	1	1	This is a great movie!
477	1	1	This is a great movie!
478	1	1	This is a great movie!
479	1	1	This is a great movie!
480	1	1	This is a great movie!
481	1	1	This is a great movie!
482	1	1	This is a great movie!
483	1	1	This is a great movie!
484	1	1	This is a great movie!
485	1	1	This is a great movie!
486	1	1	This is a great movie!
487	1	1	This is a great movie!
488	1	1	This is a great movie!
489	1	1	This is a great movie!
490	1	1	This is a great movie!
491	1	1	This is a great movie!
492	1	1	This is a great movie!
493	1	1	This is a great movie!
494	1	1	This is a great movie!
495	1	1	This is a great movie!
496	1	1	This is a great movie!
497	1	1	This is a great movie!
498	1	1	This is a great movie!
499	1	1	This is a great movie!
500	1	1	This is a great movie!
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name) FROM stdin;
1	Oscar
2	Classic
3	Director
4	Soundtrack
5	Adaptation
6	Independent
7	Sequel
8	Cinematography
9	Cult
10	Award-winning
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email) FROM stdin;
1	anna	anna@example.com
2	peter	peter@example.com
3	maria	maria@example.com
4	john	john@example.com
5	kate	kate@example.com
6	alex	alex@example.com
7	sarah	sarah@example.com
8	mark	mark@example.com
9	olivia	olivia@example.com
10	david	david@example.com
11	emma	emma@example.com
12	james	james@example.com
13	lucy	lucy@example.com
14	robert	robert@example.com
15	sophia	sophia@example.com
16	michael	michael@example.com
17	laura	laura@example.com
18	daniel	daniel@example.com
19	elena	elena@example.com
20	thomas	thomas@example.com
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 100, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 16, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 500, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 20, true);


--
-- Name: article_tags article_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_pkey PRIMARY KEY (article_id, tag_id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: tags tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_name_key UNIQUE (name);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: article_tags article_tags_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.articles(id);


--
-- Name: article_tags article_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: articles articles_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: articles articles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments comments_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.articles(id);


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict cyc2h4MqX4AoI2sadXiPss5mi1tjBuPSmP56p8Yd9bCxe9UoUh1fkTciKnBysTo

