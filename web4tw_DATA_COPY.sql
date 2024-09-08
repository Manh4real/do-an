
--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
1	Just In
2	Best Seller
3	Classic
4	Best for Sports
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colors (color_id, color_name, color_code) FROM stdin;
1	black	000000
2	blue	3f83f8
3	red	e02424
4	yellow	faca15
5	white	ffffff
6	grey	808080
7	pink	e74694
8	dark blue	233876
\.



--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (favorite_id, product_id, user_id, color_id, size, size_id) FROM stdin;
10	9	4	1	M    	20
11	9	4	1	S    	19
15	7	4	1	M    	20
16	8	4	1	L    	21
23	8	1	1	M    	20
29	30	1	1	7    	7
32	6	2	1	9.5  	12
33	76	2	1	11   	15
34	7	2	1	M    	20
37	26	31	5	2XL  	23
38	26	31	5	S    	19
39	2	31	4	M    	20
40	76	31	5	9    	11
41	29	31	1	XL   	22
42	29	31	1	XL   	22
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (image_id, url, product_id, product_color_id) FROM stdin;
257	13b79f26-9041-411b-ba72-62378705f49e	76	5
258	3d0b4bc3-38b1-4c8c-8b4a-e2e8c1d8e49a	76	5
259	5cfeff4e-a805-4db3-a497-d466e01ffa84	76	5
260	240c57c7-63b8-42b9-beb7-11553a6cb7e2	76	5
261	1867ae2f-cbfc-445f-bd50-116a15e7ff89	76	5
270	b20051c0-8091-4147-9508-32c1e3a16b4b	79	1
46	adidas-yoga-studio-7-8-leggings-ef8ef56f-dcd3-454b-a3b6-6b97274bffc3.jpg	8	1
47	adidas-yoga-studio-7-8-leggings-2-799b79f0-04f1-463b-9b90-eb1e25935283.jpg	8	1
48	adidas-yoga-studio-7-8-leggings-3-29974499-e99c-457e-a1f0-8a39b8555c04.jpg	8	1
49	adidas-yoga-studio-7-8-leggings-4-7ff52c39-4c80-4ca8-aab2-e535f0e9186d.jpg	8	1
50	adidas-yoga-studio-7-8-leggings-5-e72a38bc-7c9b-4ef4-a044-636577b55dd0.jpg	8	1
51	adidas-yoga-studio-7-8-leggings-6-a29f84e4-5dd7-4d95-b6ee-8b0aa252700e.jpg	8	1
52	adidas-yoga-studio-7-8-leggings-7-870feabf-3e0d-4f88-940b-c05b82b59049.jpg	8	1
53	adidas-yoga-studio-7-8-leggings-8-5aa44100-213a-4468-9de1-498eed140585.jpg	8	1
54	techfit-period-proof-7-8-leggings-1-3251e249-df22-432e-a010-58fe602ee14b.jpg	9	1
55	techfit-period-proof-7-8-leggings-2-a31ba502-4c69-4313-9c4d-63bf940c7a3e.jpg	9	1
56	techfit-period-proof-7-8-leggings-3-6f1ebcbb-cd15-46c2-8575-acf6a3090de5.jpg	9	1
57	techfit-period-proof-7-8-leggings-4-51049cdc-7140-457e-bf4f-dc423135f33f.jpg	9	1
58	techfit-period-proof-7-8-leggings-5-357a39d1-6f7f-414e-8b99-b0107a61f967.jpg	9	1
59	techfit-period-proof-7-8-leggings-6-6a4943a5-7d7b-477b-8dc3-1403c78352a0.jpg	9	1
60	techfit-period-proof-7-8-leggings-7-577337c2-6981-42b2-b961-fbbf5de4ff9e.jpg	9	1
61	techfit-period-proof-7-8-leggings-8-7cd9c592-a0a8-46ef-be6b-d03a22ce6139.jpg	9	1
79	adicolor-neuclassics-shorts2-b33f91de-a9ba-4e2e-9dc9-121027f84976.jpg	7	1
80	adicolor-neuclassics-shorts3-e4cd8ed8-1d4d-494d-9e0a-564003de8fdd.jpg	7	1
81	adicolor-neuclassics-shorts4-81f7d76d-8507-49cf-9bba-3ea152cae667.jpg	7	1
71	adicross-golf-shorts2-497d8d94-ec39-4122-ab0e-8fe1bbb5b1fd.jpg	2	4
72	adicross-golf-shorts5-da746f63-153c-4ed4-84db-2e7338e4f10d.jpg	2	4
73	adicross-golf-shorts6-744e4c73-02a9-4185-9c7e-d7a89f3e6be3.jpg	2	4
74	adicross-golf-shorts7-0dc3e793-48bc-42e4-8cac-5e79006540fb.jpg	2	4
75	adicross-golf-shorts11-54fab5fa-ff4c-497f-885e-fe0191d71ee5.jpg	2	5
76	adicross-golf-shorts13-cb12f434-ec1e-4039-b1d6-77764de8cbd8.jpg	2	5
77	adicross-golf-shorts-3ba4b652-b147-41c7-8e40-f5aeab2036db.jpg	2	5
78	adicross-golf-shorts8-b285f836-0fbe-4e30-a9fa-ee583ed6ecfa.jpg	2	5
82	adicolor-neuclassics-shorts5-6febc695-714f-48b6-9b4b-11c91180cef9.jpg	7	1
83	adicolor-neuclassics-shorts-5b860cbc-7025-44c5-8886-103bcd53f4c1.jpg	7	1
94	heat.rdy-polo-shirt2-323be46c-1a20-46a8-87f2-7d40e8c42f9b.jpg	5	5
95	heat.rdy-polo-shirt3-4d747d21-b884-43e1-ae7f-8a3d21190c6d.jpg	5	5
96	heat.rdy-polo-shirt4-3569dca3-7533-4387-8d62-8615ce1bb1fd.jpg	5	5
97	heat.rdy-polo-shirt5-3cdd9da6-18d7-4716-8c97-98e9a898d483.jpg	5	5
98	heat.rdy-polo-shirt-7024376a-ef6d-4a55-88fe-1977ece5cf0c.jpg	5	5
99	adilette-aqua-slides27-a24d2705-4f14-4f50-80b7-c8e6ff56fd39.jpg	6	8
100	adilette-aqua-slides28-85f5b667-78cc-42c3-b7c6-ffd0159f3859.jpg	6	8
101	adilette-aqua-slides29-5f7f1a30-5b99-47fe-8403-f2271d097a6e.jpg	6	2
102	adilette-aqua-slides4-ad81c681-04a5-4b04-9c5a-0b1cf833bf1c.jpg	6	8
103	adilette-aqua-slides10-65c64abe-b15b-4fc3-8310-dddee3526d5d.jpg	6	1
104	adilette-aqua-slides11-6fcbaa02-86f7-45d7-bb30-bd05c77f009c.jpg	6	1
105	adilette-aqua-slides12-c124d1b4-b0ee-4a82-bfbd-dcc7f303dab8.jpg	6	2
106	adilette-aqua-slides14-56e638b1-512e-4fa3-bc72-02271a30363b.jpg	6	8
107	adilette-aqua-slides16-db1a05d6-1767-4248-88a9-c848257186ad.jpg	6	8
108	adilette-aqua-slides17-7511e9a4-dcdb-438a-96a7-d69768eba63f.jpg	6	2
109	adilette-aqua-slides18-55c730d9-50eb-4c5f-bbc5-4f70e4c76a88.jpg	6	2
110	adilette-aqua-slides20-28af3ffa-74ce-4c46-9539-f554c5a2c4fa.jpg	6	1
111	adilette-aqua-slides21-66d62b04-6a06-4989-bbe7-90540e6ca912.jpg	6	1
112	adilette-aqua-slides23-f02b44a1-04f3-47d2-9c4c-164c02253c19.jpg	6	1
113	adilette-aqua-slides26-9a4e4c48-c796-4ebb-80ab-39e10111888a.jpg	6	2
262	49d2e020-ec6b-4f49-9f2e-b05ca29fa047	76	1
263	0d06adcf-067a-494c-bf21-edd146c6489b	76	1
136	b11029a0-de0c-450f-8d6f-1983ebbc70d4	26	5
137	8a0bc768-6545-4564-ba6a-6a46789852bb	26	5
138	8366641a-d67c-4231-9234-0b00bfbd20f1	26	5
139	662b78e9-a419-4de5-a2e5-76653c70e9a3	26	5
140	f9dd8a8e-08d2-4fed-ac31-6b56ab2b9666	26	5
154	2d018501-8a38-4de4-9ebb-f44b420d6196	29	1
155	3c609131-c492-466c-ac2a-d0b567982ab5	29	1
156	bba579ac-987b-4565-a76b-531030feddb9	29	1
157	21567782-556b-4d83-b7b9-2050c8fc1ab4	29	1
158	657cd0b6-d1d1-42ea-92cf-e59ee6d41539	29	1
159	e06114d5-073e-404b-812a-b235bf01949f	30	4
160	31c5569b-ad3e-4828-9314-0768339377d4	30	4
161	a9554651-42b0-47a9-8a53-7966480bc5a8	30	4
163	f5e048f8-438f-4dc3-9608-1e9f5ed68617	30	4
164	581e163f-40b1-42f7-bfb8-ec731e1fdfe8	30	4
165	7e559f01-00d2-4508-918e-b59f328a2e13	30	1
166	17932df2-675b-430b-9c15-109c321e2a59	30	1
167	200d56f1-a48b-46d5-8d12-4002d6cb0245	30	1
168	e03224d8-4559-4246-9b00-ba48dc89a07d	30	4
169	2634a53c-da05-480c-ac0c-3f09e0e954ba	30	1
170	d0adbb8f-a0ae-4bd0-a43a-1deb1aa2711c	30	1
264	7fa95f12-0a05-4008-b08c-6d3ac0a506a7	77	1
265	0f5492bf-90fb-44cd-82a1-4365c79d3799	77	1
266	4ff84c85-418b-4812-8850-41ac7e345fc0	77	1
267	04534627-3f4c-442d-a8b2-605ea1345100	77	1
268	2cce6041-d9e8-4fca-b1b2-96a8daa21936	77	1
\.


--
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manufacturers (manufacturer_id, manufacturer_name, brand_name) FROM stdin;
1	Nike Co.                                          	Nike                
2	Adidas Co.                                        	Adidas              
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_item_id, order_id, product_id, color_id, quantity, total_price, size, size_id) FROM stdin;
82	84	76	1	1	2000000	12   	17
84	86	29	1	1	120000	XL   	22
85	87	26	5	2	200000	XS   	18
86	87	6	2	3	900000	10.5 	14
87	88	2	4	5	500000	M    	20
88	88	76	1	2	4000000	12   	17
89	89	76	1	1	2000000	12   	17
90	89	7	1	1	200000	M    	20
91	90	7	1	1	200000	M    	20
92	91	76	5	1	2000000	9.5  	12
18	22	2	4	10	1000000	S    	19
93	92	29	1	10	1200000	XL   	22
94	92	76	5	1	2000000	9.5  	12
4	9	29	1	1	150000	M    	20
95	93	8	1	1	1000000	S    	19
96	94	77	1	5	8000000	10.5 	14
8	10	29	1	1	150000	M    	20
99	96	76	5	1	2000000	12   	17
10	12	30	1	1	120000	10   	13
100	96	79	1	1	1000000	9.5  	12
7	10	6	1	4	1200000	8    	9
3	9	6	1	4	1200000	8    	9
9	11	8	1	1	1000000	M    	20
5	10	8	1	4	4000000	M    	20
1	9	8	1	4	4000000	M    	20
101	97	8	1	1	1000000	S    	19
30	32	6	1	1	300000	9.5  	12
31	33	6	1	1	300000	9.5  	12
32	34	30	1	1	120000	8    	9
33	35	29	1	1	150000	S    	19
34	36	29	1	1	150000	S    	19
79	81	7	1	1	200000	S    	19
102	98	6	2	1	300000	10.5 	14
\.


--
-- Data for Name: order_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_statuses (order_status_id, order_status_name) FROM stdin;
2	ready
4	delivering
6	done
3	canceled
1	processing
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, user_id, address, phone, receiver, email, est_arrived_date, created_at, total_price, status, order_status_id, payment, payment_status_id, payment_method_id) FROM stdin;
9	1	ngo 3 duong Truong Dinh, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+840333314968	Manh Nguyen	nguyenmanh@gmail.com	2023-04-13 00:00:00+07	2023-04-10 00:00:00+07	870000	prepared	3		2	2
11	1	ngo 3 duong Truong Dinh, Ph╞░ß╗¥ng H├áng Buß╗ôm, Quß║¡n Ho├án Kiß║┐m, Th├ánh phß╗æ H├á Nß╗Öi	+840333314968	Manh Nguyen	nguyenmanh@gmail.com	2023-04-14 00:00:00+07	2023-04-11 00:00:00+07	120000	prepared	6		1	2
96	2	fuck you talm bout, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+840123456789	thang nguyen	nguyenthang@gmail.com	2023-08-22 19:23:21.958+07	2023-08-19 19:23:21.958+07	3030000	prepared	3		1	2
22	1	ng├╡ 3 ─æ╞░ß╗¥ng Tr╞░╞íng ─Éß╗ïnh, TDP Cß║ú, Ph╞░ß╗¥ng Ho├áng V─ân Thß╗Ñ, Th├ánh phß╗æ Bß║»c Giang, Tß╗ënh Bß║»c Giang	+840333314968	Vi Phung	viphung@gmail.com	2023-04-19 00:00:00+07	2023-04-16 00:00:00+07	1008000	prepared	6		1	2
23	1	ngo 3 duong Truong Dinh, TDP Ca, Ph╞░ß╗¥ng Tß╗⌐ Li├¬n, Quß║¡n T├óy Hß╗ô, Th├ánh phß╗æ H├á Nß╗Öi	+840123456789	Vi Phung	phungvi@gmail.com	2023-04-23 18:50:56.523+07	2023-04-20 00:00:00+07	200006	prepared	6		1	2
10	1	ngach 132/49, Nguyen Xa, Ph╞░ß╗¥ng Minh Khai, Quß║¡n Bß║»c Tß╗½ Li├¬m, Th├ánh phß╗æ H├á Nß╗Öi	+840333314968	Manh Nguyen	nguyenmanh30102001@gmail.com	2023-04-13 00:00:00+07	2023-04-10 00:00:00+07	870000	prepared	6		1	2
12	2	ngo 3 duong Truong Dinh, TDP Ca, Ph╞░ß╗¥ng Hß╗Öi Hß╗úp, Th├ánh phß╗æ V─⌐nh Y├¬n, Tß╗ënh V─⌐nh Ph├║c	+840333314968	Thang Nguyen	nguyenthang@gmail.com	2023-04-30 00:00:00+07	2023-04-14 00:00:00+07	128000	prepared	6		1	2
33	2	test, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	t├⌐t test	test@g.co	2023-05-09 07:09:54.318+07	2023-05-06 07:09:54.318+07	330000	prepared	6		1	2
34	2	test, test, test, test	+84123456789	test test	test@g.co	2023-05-09 10:30:52.405+07	2023-05-06 10:30:52.405+07	150000	prepared	6		1	2
35	2	test, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	test test	test@g.co	2023-05-10 00:43:16.036+07	2023-05-07 00:43:16.036+07	180000	prepared	3		2	2
36	2	test, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	test test	tes@g.co	2023-05-10 00:47:13.089+07	2023-05-07 00:47:13.089+07	180000	prepared	6		1	2
32	2	test, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	test test	test@g.co	2023-05-08 15:50:20.462+07	2023-05-05 15:50:20.462+07	330000	prepared	6		1	2
31	2	ngo 3 duong truong dinh, Ph╞░ß╗¥ng H├áng Buß╗ôm, Quß║¡n Ho├án Kiß║┐m, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	test test	test@g.co	2023-05-06 15:17:08.483+07	2023-05-03 15:17:08.483+07	229998	prepared	3		2	2
84	2	test, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	thang nguyen	test@g.co	2023-05-20 00:18:28.425+07	2023-05-17 00:18:28.425+07	2030000	prepared	3		2	1
89	2	ngo 3 duong truong dinh, Ph╞░ß╗¥ng L├╜ Th├íi Tß╗ò, Quß║¡n Ho├án Kiß║┐m, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	manh nguyen	manh@gmail.com	2023-05-21 10:51:59.851+07	2023-05-18 10:51:59.851+07	2230000	prepared	1		1	2
86	2	test, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	test test	test@g.co	2023-05-20 22:43:21.591+07	2023-05-17 22:43:21.591+07	150000	prepared	2		1	2
93	2	ngo 3 duong truong dinh, Ph╞░ß╗¥ng H├áng M├ú, Quß║¡n Ho├án Kiß║┐m, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	manh nguyen	manh@gmail.com	2023-05-23 16:18:09.445+07	2023-05-20 16:18:09.445+07	1030000	prepared	2		1	2
81	2	test, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	test TEST	test@g.co	2023-05-19 00:05:10.211+07	2023-05-16 00:05:10.211+07	230000	prepared	3		1	2
98	31	s, Ph╞░ß╗¥ng Hiß╗çp Th├ánh, Th├ánh phß╗æ Thß╗º Dß║ºu Mß╗Öt, Tß╗ënh B├¼nh D╞░╞íng	+84234234234	s s	a@s.cd	2024-08-28 11:32:18.279+07	2024-08-25 11:32:18.279+07	330000	prepared	3		1	2
88	2	ngo 3 duong truong dinh, Ph╞░ß╗¥ng Ch╞░╞íng D╞░╞íng, Quß║¡n Ho├án Kiß║┐m, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	manh nguyen	manh@gmail.com	2023-05-21 07:52:26.478+07	2023-05-18 07:52:26.478+07	4530000	prepared	4		1	2
87	2	ngo 3 duong truong dinh, Ph╞░ß╗¥ng Y├¬n Phß╗Ñ, Quß║¡n T├óy Hß╗ô, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	thang nguyen	thang@gmail.com	2023-05-20 23:02:28.539+07	2023-05-17 23:02:28.539+07	1130000	prepared	2		1	2
90	2	ngo 3 duong truong dinh, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	manh nguyen	manh@gmail.com	2023-05-21 10:54:26.127+07	2023-05-18 10:54:26.127+07	230000	prepared	3		1	2
92	2	ngo 3 duong truong dinh, Ph╞░ß╗¥ng ─Éß╗ông Xu├ón, Quß║¡n Ho├án Kiß║┐m, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	manh nguyen	manh@gmail.com	2023-05-22 08:22:36.027+07	2023-05-19 08:22:36.027+07	3230000	prepared	3		1	2
91	2	ngo 3 duong truong dinh, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	manh nguyen	manh@gmail.com	2023-05-21 13:28:27.031+07	2023-05-18 13:28:27.031+07	2030000	prepared	2		1	1
94	2	ngo 3 duong truong dinh, Ph╞░ß╗¥ng Ph├║c X├í, Quß║¡n Ba ─É├¼nh, Th├ánh phß╗æ H├á Nß╗Öi	+84123456789	manh nguyen	manh@gmail.com	2023-05-24 09:50:37.152+07	2023-05-21 09:50:37.152+07	8030000	prepared	2		1	1
97	30	asdf, X├ú Cß╗¡u Cao, Huyß╗çn V─ân Giang, Tß╗ënh H╞░ng Y├¬n	+36033314968	manh nguyen	nguyenmanh@gmail.com	2023-11-01 18:46:20.279+07	2023-10-29 18:46:20.279+07	1030000	prepared	3		1	2
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_methods (payment_method_id, payment_method_name) FROM stdin;
2	Credit card
1	COD
\.


--
-- Data for Name: payment_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_statuses (payment_status_id, payment_status_name) FROM stdin;
0	initial
1	success
2	failed
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (product_category_id, category_id, product_id) FROM stdin;
1	1	8
4	1	6
8	1	26
2	4	9
3	3	2
5	3	7
6	4	5
7	3	30
9	3	29
\.


--
-- Data for Name: product_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_statuses (product_status_id, product_status_name, product_status_desc) FROM stdin;
1	active	The product is available
2	inactive	The product is not avaible at the moment
3	discontinued	The product is not available anymore
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, category, product_name, type, gender, target, color_num, price, on_sale, old_price, sizes, sales, quantity, created_at, description, manufacturer_id, style_id, type_id, size_type_id, product_status_id) FROM stdin;
2	Golf Shorts	Adicross Golf Shorts	shorts              	male      	Men's Short         	2	100000	t	125000	S,M,L,XL,XXL                                      	103	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	2	2	1
9	Leggings	Techfit Period Proof Leggings	pants               	female    	Female's Sportswear 	1	300000	f	30000	S, M, L, XL                                       	0	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	5	2	1
8	Classic Leggings	Adidas Yoga Studio Leggings	pants               	female    	Female's Sportswear 	1	1000000	f	100000	S, M, L, XL                                       	2	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	5	2	1
6	Slides	Adilette Aqua Slides	slides              	male      	Sportswear          	3	300000	f	30000	7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11                 	14	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	4	1	1
7	Shorts	Adicolor Neuclassics Shorts	shorts              	male      	Men's Shorts        	1	200000	f	200000	S, M, L, XL, XXL                                  	6	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	2	2	1
5	Classic Shirt	adidas x Classic LEGOr Tee	shirt               	unisex    	Unisex's Sportswear 	1	100000	f	100000	XS, S, M, L, XL, 2XL                              	0	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	3	2	1
30	Slides	Adilette Comfort Slides	slides              	unisex    	Unisex's Slides     	2	120000	f	120000	6,7,8,9,10,10.5,11,14,15,13,12                    	4	300	2023-04-08 21:34:56.66795+07	Ensure your feet are supported and protected during your activities. The upper strap is adjustable for easy fit with a velcro fastening to ensure a secure fit. The upper layer is made from soft, breathable fabric with a classic 3-stripes design to boost classic style. The cushioned footbed is perfect for all-day comfort and the outsole is designed for maximum durability for those long days out and about.	2	3	4	1	2
76	Best for Sports	Alphabounce Sustainable Bounce Shoes	shoes               	unisex    	Unisex's Shoes      	1	2000000	f	1999999	11,12                                             	13	106	2023-05-14 08:09:15.809115+07	Introducing Alphabounce Sustainable Bounce Shoes: a fusion of eco-conscious design and high-performance technology. Crafted with recycled materials and advanced cushioning, these shoes offer exceptional comfort and style while minimizing environmental impact. Step towards sustainability without compromising on performance.	2	2	23	1	1
26	Shorts	adidas rifta metro short	shorts              	male      	Men's Shorts        	2	100000	t	150000	XS,S,M,L,XL,2XL                                   	2	100	2023-04-06 23:00:11.41633+07	They are lightweight and comfortable, allowing you to look and feel your best. White shorts can be paired with a variety of tops, whether it be a bright tank top or a classic button down. The bright white will brighten up any outfit, making you stand out in the summer heat. From distressed shorts to high waisted and beyond, there are a number of choices when it comes to white shorts. So why not get ready for summer with a perfect pair of white shorts?	2	2	2	2	1
29	Fit Leggings	Techfit Period Proof Leggings	pants               	female    	Female's Leggings   	1	120000	t	150000	S,M,L,XL                                          	15	200	2023-04-08 21:11:10.933123+07	 Crafted from a lightweight and soft material, they sit close to the skin without feeling restrictive and feature an elasticated waistband. They provide a slenderizing look while being breathable and lightweight, making them perfect for yoga, running and other forms of exercise. The black colour pairs with almost every outfit, so they easily become your go-to item in your wardrobe. No matter where you're headed, you can trust black fit leggings to keep you looking and feeling your best.	2	1	5	2	1
77	Men's Shoes	Duramo 10 Shoes	shoes               	male      	Men's Shoes         	1	1600000	f	1600000	10.5,11,12,11.5                                   	5	75	2023-05-17 23:16:32.001151+07	Versatile athletic footwear designed for comfort and performance. With a breathable mesh upper and supportive overlays, they keep your feet cool and stable. The Cloudfoam midsole offers plush cushioning and energy return, while the durable rubber outsole provides reliable traction. These sleek and stylish shoes are perfect for any activity, from the gym to running errands.	2	2	23	1	1
79		asdf test	swimwear            	female    	asdfasdf            	1	1000000	f	1000000	9.5,5                                             	1	103	2023-08-19 19:17:05.993322+07	fuck you talm about	1	2	20	1	2
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (product_id, user_id, review, rating, created_at, title) FROM stdin;
2	4	This is such a gooooooood product <3	5	2023-03-18 20:33:10.171674+07	
6	1	These slides are fireeeeee≡ƒöÑ≡ƒöÑ≡ƒöÑ	4	2023-03-19 17:14:13.296118+07	Bangin'
9	1	I've been impressed with these leggings! They are made of high quality material that is soft and flexible. The fit is true to size and they are very comfortable. The fabric is stretchy enough to move with you while providing a snug fit that won't slip or sag. I love the colorful styles they offer and they are perfect for any outfit. I'm very pleased with these leggings and would definitely recommend them!	4	2023-04-09 10:39:15.420142+07	Good!
30	2	These slides are sooooo comfortable. It's fit into my feet so nicely. I loved it	5	2023-04-14 22:48:04.961999+07	Awwwesommmme
29	2	sdfasdf	5	2023-05-10 13:14:14.786366+07	
6	2	awesomee	5	2023-05-13 09:23:32.299815+07	good
2	2	good short	5	2023-05-18 07:50:21.897432+07	Awwwesommmme
8	2	good pant	5	2023-05-18 10:09:32.800976+07	Awwwesommmme
76	2	good p	5	2023-05-19 08:21:30.17067+07	awesomeeee
2	30	assdf	5	2023-10-29 18:42:47.927849+07	
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, role_name) FROM stdin;
0	admin
1	user
2	warehouse manager
\.


--
-- Data for Name: size_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.size_types (size_type_id, size_type_name) FROM stdin;
1	shoes/slides
2	clothes
\.


--
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sizes (size_id, size, size_type_id) FROM stdin;
1	4	1
2	4.5	1
3	5	1
4	5.5	1
5	6	1
6	6.5	1
7	7	1
8	7.5	1
9	8	1
10	8.5	1
11	9	1
12	9.5	1
13	10	1
14	10.5	1
15	11	1
16	11.5	1
17	12	1
18	XS	2
19	S	2
20	M	2
21	L	2
22	XL	2
23	2XL	2
24	3XL	2
25	4XL	2
\.


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (stock_id, product_id, color_id, size_id, quantity) FROM stdin;
99	30	1	9	17
41	6	1	12	18
444	77	1	17	15
46	2	4	20	15
433	76	1	17	0
72	7	1	19	17
16	8	1	20	30
17	8	1	21	40
18	8	1	22	50
19	9	1	19	20
20	9	1	20	2
21	9	1	21	20
22	9	1	22	20
25	29	1	21	0
87	26	5	18	18
42	6	1	13	0
73	7	1	20	20
37	6	1	8	20
38	6	1	9	20
39	6	1	10	30
40	6	1	11	40
26	29	1	22	19
442	77	1	14	5
438	76	5	11	3
441	76	5	15	6
23	29	1	19	0
74	7	1	21	20
75	7	1	22	20
76	7	1	23	20
434	76	1	15	0
439	76	5	17	9
24	29	1	20	0
15	8	1	19	19
450	79	1	12	11
43	6	2	14	17
97	30	1	5	20
100	30	4	11	20
101	30	4	13	20
102	30	4	15	20
103	30	4	17	20
49	2	5	23	20
47	2	4	21	20
45	2	4	19	0
48	2	5	22	20
66	5	5	18	20
67	5	5	19	20
68	5	5	20	20
69	5	5	21	20
70	5	5	22	20
71	5	5	23	20
44	6	8	15	20
98	30	1	7	19
88	26	5	19	20
89	26	5	20	20
90	26	5	21	20
91	26	5	22	20
92	26	5	23	20
436	76	5	13	0
443	77	1	15	20
445	77	1	16	25
440	76	5	12	1
451	79	1	3	3
437	76	5	14	5
435	76	5	16	2
\.


--
-- Data for Name: styles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.styles (style_id, style_name) FROM stdin;
1	Gym
2	Sport
3	Classics
4	Street
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (type_id, type_name) FROM stdin;
2	shorts
3	shirt
4	slides
5	pants
15	bras
16	bodysuit
17	hoodie
18	jacket
19	skirt
20	swimwear
21	socks
22	accessory
23	shoes
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
4	1
2	1
3	2
14	0
1	1
30	1
31	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, email, password, first_name, last_name, birthday, country, registration_time, with_email, avatar, role) FROM stdin;
14	admin@gmail.com                                   	$2b$10$FUvTMAMBOJaiG8t8nJCS5e7gjJziDfRcAbBZSQSCJMPpejzJ/ljym	admin     	___       	1998-01-05	VN                  	1680235476866	f	5c47df43-7baf-438c-ba87-2dc071780d32	0
31	manh@gmail.com                                    	$2b$10$sUtUnsrJkKiPaVIVM9Ofh.einrepEHIao8zjW1AHEyYh8KKCksl06	Manh      	Nguyen    	2001-10-30	VN                  	1724559150892	f	e2974bbd-c3d9-4cef-bd76-4c4193837568	1
\.


