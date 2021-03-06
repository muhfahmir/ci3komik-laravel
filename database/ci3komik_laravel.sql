toc.dat                                                                                             0000600 0004000 0002000 00000030025 14026067755 0014453 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       #                    y            ci3komik_laravel    11.11    11.11 *    .           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         /           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         0           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         1           1262    16546    ci3komik_laravel    DATABASE     ?   CREATE DATABASE ci3komik_laravel WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
     DROP DATABASE ci3komik_laravel;
             postgres    false         ?            1259    16547    comics    TABLE     ?  CREATE TABLE public.comics (
    id_komik integer NOT NULL,
    judul character varying(256) NOT NULL,
    jenis character varying(256) NOT NULL,
    penulis character varying(256) NOT NULL,
    deskripsi text NOT NULL,
    status integer NOT NULL,
    rilis integer NOT NULL,
    usia_pembaca character varying(256) NOT NULL,
    rating double precision,
    "imageUrl" character varying(256),
    is_active integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.comics;
       public         postgres    false         ?            1259    16553    comics_id_komik_seq    SEQUENCE     ?   CREATE SEQUENCE public.comics_id_komik_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.comics_id_komik_seq;
       public       postgres    false    196         2           0    0    comics_id_komik_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.comics_id_komik_seq OWNED BY public.comics.id_komik;
            public       postgres    false    197         ?            1259    16555    detail_comic    TABLE     ?   CREATE TABLE public.detail_comic (
    id_detail integer NOT NULL,
    id_comic integer NOT NULL,
    id_genre integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
     DROP TABLE public.detail_comic;
       public         postgres    false         ?            1259    16558    detail_comic_id_detail_seq    SEQUENCE     ?   CREATE SEQUENCE public.detail_comic_id_detail_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.detail_comic_id_detail_seq;
       public       postgres    false    198         3           0    0    detail_comic_id_detail_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.detail_comic_id_detail_seq OWNED BY public.detail_comic.id_detail;
            public       postgres    false    199         ?            1259    16560    genre    TABLE     ?   CREATE TABLE public.genre (
    id_genre integer NOT NULL,
    nama_genre character varying(256) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.genre;
       public         postgres    false         ?            1259    16563    genre_id_genre_seq    SEQUENCE     ?   CREATE SEQUENCE public.genre_id_genre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.genre_id_genre_seq;
       public       postgres    false    200         4           0    0    genre_id_genre_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.genre_id_genre_seq OWNED BY public.genre.id_genre;
            public       postgres    false    201         ?            1259    16565    status_comic    TABLE     v   CREATE TABLE public.status_comic (
    id_status integer NOT NULL,
    nama_status character varying(256) NOT NULL
);
     DROP TABLE public.status_comic;
       public         postgres    false         ?            1259    16568    status_comic_id_status_seq    SEQUENCE     ?   CREATE SEQUENCE public.status_comic_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.status_comic_id_status_seq;
       public       postgres    false    202         5           0    0    status_comic_id_status_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.status_comic_id_status_seq OWNED BY public.status_comic.id_status;
            public       postgres    false    203         ?            1259    16570    users    TABLE     1  CREATE TABLE public.users (
    id_user integer NOT NULL,
    name character varying(256) NOT NULL,
    email character varying(256) NOT NULL,
    password character varying(256) NOT NULL,
    is_active integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.users;
       public         postgres    false         ?            1259    16576    users_id_user_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public       postgres    false    204         6           0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
            public       postgres    false    205         ?
           2604    16578    comics id_komik    DEFAULT     r   ALTER TABLE ONLY public.comics ALTER COLUMN id_komik SET DEFAULT nextval('public.comics_id_komik_seq'::regclass);
 >   ALTER TABLE public.comics ALTER COLUMN id_komik DROP DEFAULT;
       public       postgres    false    197    196         ?
           2604    16579    detail_comic id_detail    DEFAULT     ?   ALTER TABLE ONLY public.detail_comic ALTER COLUMN id_detail SET DEFAULT nextval('public.detail_comic_id_detail_seq'::regclass);
 E   ALTER TABLE public.detail_comic ALTER COLUMN id_detail DROP DEFAULT;
       public       postgres    false    199    198         ?
           2604    16580    genre id_genre    DEFAULT     p   ALTER TABLE ONLY public.genre ALTER COLUMN id_genre SET DEFAULT nextval('public.genre_id_genre_seq'::regclass);
 =   ALTER TABLE public.genre ALTER COLUMN id_genre DROP DEFAULT;
       public       postgres    false    201    200         ?
           2604    16581    status_comic id_status    DEFAULT     ?   ALTER TABLE ONLY public.status_comic ALTER COLUMN id_status SET DEFAULT nextval('public.status_comic_id_status_seq'::regclass);
 E   ALTER TABLE public.status_comic ALTER COLUMN id_status DROP DEFAULT;
       public       postgres    false    203    202         ?
           2604    16582    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public       postgres    false    205    204         "          0    16547    comics 
   TABLE DATA               ?   COPY public.comics (id_komik, judul, jenis, penulis, deskripsi, status, rilis, usia_pembaca, rating, "imageUrl", is_active, created_at, updated_at) FROM stdin;
    public       postgres    false    196       2850.dat $          0    16555    detail_comic 
   TABLE DATA               ]   COPY public.detail_comic (id_detail, id_comic, id_genre, created_at, updated_at) FROM stdin;
    public       postgres    false    198       2852.dat &          0    16560    genre 
   TABLE DATA               M   COPY public.genre (id_genre, nama_genre, created_at, updated_at) FROM stdin;
    public       postgres    false    200       2854.dat (          0    16565    status_comic 
   TABLE DATA               >   COPY public.status_comic (id_status, nama_status) FROM stdin;
    public       postgres    false    202       2856.dat *          0    16570    users 
   TABLE DATA               b   COPY public.users (id_user, name, email, password, is_active, created_at, updated_at) FROM stdin;
    public       postgres    false    204       2858.dat 7           0    0    comics_id_komik_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.comics_id_komik_seq', 70, true);
            public       postgres    false    197         8           0    0    detail_comic_id_detail_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.detail_comic_id_detail_seq', 248, true);
            public       postgres    false    199         9           0    0    genre_id_genre_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.genre_id_genre_seq', 21, true);
            public       postgres    false    201         :           0    0    status_comic_id_status_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.status_comic_id_status_seq', 2, true);
            public       postgres    false    203         ;           0    0    users_id_user_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_id_user_seq', 29, true);
            public       postgres    false    205         ?
           2606    16584    comics comics_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.comics
    ADD CONSTRAINT comics_pkey PRIMARY KEY (id_komik);
 <   ALTER TABLE ONLY public.comics DROP CONSTRAINT comics_pkey;
       public         postgres    false    196         ?
           2606    16586    detail_comic detail_comic_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.detail_comic
    ADD CONSTRAINT detail_comic_pkey PRIMARY KEY (id_detail);
 H   ALTER TABLE ONLY public.detail_comic DROP CONSTRAINT detail_comic_pkey;
       public         postgres    false    198         ?
           2606    16588    genre genre_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id_genre);
 :   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pkey;
       public         postgres    false    200         ?
           2606    16590    status_comic status_comic_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.status_comic
    ADD CONSTRAINT status_comic_pkey PRIMARY KEY (id_status);
 H   ALTER TABLE ONLY public.status_comic DROP CONSTRAINT status_comic_pkey;
       public         postgres    false    202         ?
           2606    16592    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    204         ?
           2606    16593    detail_comic id_comic    FK CONSTRAINT     ?   ALTER TABLE ONLY public.detail_comic
    ADD CONSTRAINT id_comic FOREIGN KEY (id_comic) REFERENCES public.comics(id_komik) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.detail_comic DROP CONSTRAINT id_comic;
       public       postgres    false    2717    196    198         ?
           2606    16598    detail_comic id_genre    FK CONSTRAINT     ?   ALTER TABLE ONLY public.detail_comic
    ADD CONSTRAINT id_genre FOREIGN KEY (id_genre) REFERENCES public.genre(id_genre) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.detail_comic DROP CONSTRAINT id_genre;
       public       postgres    false    200    2721    198         ?
           2606    16603    comics status    FK CONSTRAINT     ?   ALTER TABLE ONLY public.comics
    ADD CONSTRAINT status FOREIGN KEY (status) REFERENCES public.status_comic(id_status) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 7   ALTER TABLE ONLY public.comics DROP CONSTRAINT status;
       public       postgres    false    196    202    2723                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   2850.dat                                                                                            0000600 0004000 0002000 00000055121 14026067755 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        52	The Dungeon Master	Manhwa	Jae-Hoo Park	<p>Manhwa The Dungeon Master yang dibuat oleh komikus bernama Jae-Hoo Park ini bercerita tentang &#39;Oh Ju-Yoon&#39; adalah part-timer harian khas Anda. Dia hampir mati karena kecelakaan secara kebetulan, tetapi karena kebaikannya, dia diberi kesempatan lain untuk hidup di dunia yang baru dan berbeda. Namun, masa depannya bukan sebagai pahlawan, atau penyihir ... tapi makhluk di dasar rantai makanan, &#39;Brick Worm&#39;, menghadapi krisis yang mengerikan ?! Peristiwa nyata! Fantasi naik level yang tak terduga!</p>	1	2018	Semua umur	6.48000000000000043	1613951159The_Dungeon_Master.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
21	Naruto	Manga	KISHIMOTO Masashi	<p>Manga Naruto yang dibuat oleh komikus bernama KISHIMOTO Masashi ini bercerita tentang Dua belas tahun yang lalu, Rubah Sembilan-Ekor Iblis yang kuat menyerang desa Ninja Konohagakure. Setan itu dengan cepat dikalahkan dan disegel ke dalam bayi Naruto Uzumaki, oleh Hokage Keempat yang mengorbankan hidupnya untuk melindungi desa. Sekarang Naruto adalah ninja buku knucklehead nomor satu yang bertekad untuk menjadi Hokage berikutnya dan mendapatkan pengakuan oleh semua orang yang pernah meragukannya! Tahun &quot;penghargaan dalam kategori seni rupa media oleh Badan Urusan Budaya pada tahun 2015.</p>	2	1999	Semua Umur	8	1613947074Naruto.jpg	0	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
22	Boruto	Manga	KODACHI Ukyo	<p>Manga Boruto yang dibuat oleh komikus bernama KODACHI Ukyo ini bercerita tentang Naruto adalah seorang shinobi muda dengan bakat yang tidak dapat diperbaiki untuk kerusakan. Dia mencapai mimpinya untuk menjadi ninja terhebat di desa dan wajahnya duduk di atas monumen Hokage. Tapi ini bukan ceritanya ... Generasi ninja baru siap naik ke panggung, dipimpin oleh putra Naruto sendiri, Boruto!</p>	1	2016	Semua Umur	7.70000000000000018	1613947276Boruto.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
44	OddEye	Manhua	KENAZ	<p>Manhua OddEye yang dibuat oleh komikus bernama KENAZ ini bercerita tentang Ketika membuka matanya, berada di gang malam hari dengan menggenggam pisau penuh darah ditangan tanpa dia sadari. Dan menemukan mayat perempuan dekat tempat dia sadarkan diri. Dia tidak lagi ingat siapa dirinya, mengapa dia memiliki kekuatan super, dan mengapa dia tidak sadar di tempat itu. Dalam kekacauan ini, ia harus menghindari polisi terlebih dahulu dan menyelidiki masalah ini secara pribadi. Kisah pertempuran antara Hajin dengan organisasi misterius untuk menemukan ingatannya yang hilang.</p>	1	2020	Semua umur	7	1613950168OddEye.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
45	A Returner’s Magic Should Be Special	Manhwa	Yu So Nan	<p>Manhwa A Returner&rsquo;s Magic Should Be Special yang dibuat oleh komikus bernama Yu So Nan ini bercerita tentang &quot;Sekarang aku kembali, aku tidak akan membiarkan orang yang kucintai mati lagi!&quot; The Shadow Labyrinth - bencana paling mematikan yang pernah dikenal manusia. Desir Arman, salah satu dari enam yang selamat dari umat manusia, ada di dalam Labirin. Enam dari mereka berusaha untuk menghapus tingkat akhir Labirin tetapi akhirnya gagal, dan dunia berakhir. Namun, ketika Desir berpikir dia akan menemui ajalnya, yang muncul di hadapannya adalah dunia ... tiga belas tahun yang lalu ?! Desir dikembalikan ke masa lalu, kembali ke masa ketika ia mendaftar di akademi sihir terbaik bangsa, Havrion. Dia dipersatukan kembali dengan teman-temannya yang berharga, dan dia bertekad untuk mengubah masa lalu untuk menyelamatkan dunia dan orang-orang yang dicintainya ...! Tiga tahun tersisa sebelum munculnya Dunia Bayangan! Ubah masa lalu dan kumpulkan kawan-kawan yang kuat untuk menyelamatkan umat manusia!</p>	1	2018	Semua umur	9	1613950290A_Returner’s_Magic_Should_Be_Special.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
23	Raid	Manhwa	Choe Jong Hyeog	<p>Manhwa Raid yang dibuat oleh komikus bernama Choe Jong Hyeog ini bercerita tentang Sekitar 50 tahun yang lalu, setelah Perang Korea, Demon World Gates muncul tiba-tiba di seluruh dunia. Melalui Gates, makhluk Iblis muncul. Makhluk dunia lain ini, benar-benar kebal terhadap persenjataan modern, menghujani kehancuran di seluruh dunia. Ketika semua harapan bagi umat manusia hilang, para &ldquo;Tuan&rdquo; terbangun: satu-satunya kesempatan manusia untuk keselamatan. Dengan kemunculan entitas-entitas ini, dunia mulai berubah dengan cepat. 50 tahun kemudian- Kami bertemu Gang Kyu Sung, yang pernah bekerja di sebuah perusahaan kecil sebagai wakil yang tidak pernah bisa mendapatkan keberuntungan atau bahkan dipromosikan. Begitulah, sampai dia terbangun sebagai seorang Master &hellip;? Master Peringkat 5 yang pernah diabaikan dan dicemooh- Dengan demikian dimulailah pemberontakan seorang pria yang bekerja dari atas ke bawah!</p>	1	2016	Semua Umur	7	1613947414Raid.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
37	I Picked Up An Attribute	Manhua	N/A	<p>Manhua I Picked Up An Attribute yang dibuat oleh komikus bernama N/A ini bercerita tentang Kaisar game Feng Xia tidak sengaja dipindahkan ke era sihir dan kultivasi, kemampuan atribut dan strategi digunakan untuk mengalahkan lawannya, dia mendapatkan kemampuan dan atribut musuh yang dikalahkannya. Feng Xia memiliki &ldquo;unparalleled skills&rdquo; yaitu kemampuan mencuri kemampuan lawannya dan menjadikan miliknya!</p>	1	2020	Semua umur	7	1613949347I_Picked_Up_An_Attribute.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
34	Tokyo Ghoul	Manga	ISHIDA Sui	<p>Manga Tokyo Ghoul yang dibuat oleh komikus bernama ISHIDA Sui ini bercerita tentang Pembunuhan aneh sedang terjadi di Tokyo. Karena bukti cair di tempat kejadian, polisi menyimpulkan serangan itu adalah tindakan monster pemakan manusia, hantu. Teman-teman kampus Kaneki dan Hide datang dengan gagasan bahwa hantu meniru manusia sehingga itulah sebabnya mereka belum pernah melihat satu. Sedikit yang mereka tahu bahwa teori mereka mungkin benar-benar kenyataan.</p>	2	2011	Semua umur	8.34999999999999964	1613948963Tokyo_Ghoul.jpg	0	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
46	Above All Gods	Manhua	N/A	<p>Manhua Above All Gods yang dibuat oleh komikus bernama N/A ini bercerita tentang Sirius kuno dari Raja Merah, ibu kota Raja Iblis, dikepung oleh semua orang, cemburu surga, terkepung di Chiyan Ridge, diadili oleh surga, dirampas dari fondasi jalan peri, takhta jalur sihir, dan meninggal. Namun, Sirius kuno lahir 500 tahun kemudian dengan batu giok kuno yang misterius! Musuh-musuh kehidupan terakhir, balas dendam kehidupan ini, rasa malu kehidupan terakhir, salju kehidupan ini! Saya seorang Sirius kuno, dan saya berbicara sendiri&nbsp;</p>	1	2018	Semua umur	6.71999999999999975	1613950404Above_All_Gods.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
24	Black Clover	Manga	TABATA Yuuki	<p>Manga Black Clover yang dibuat oleh komikus bernama TABATA Yuuki ini bercerita tentang Asta dan Yuno ditinggalkan bersama sebagai bayi di keranjang di gereja yang sama pada hari yang sama, dan sejak itu tidak dapat dipisahkan. Sebagai anak-anak, mereka berjanji bahwa mereka akan bersaing satu sama lain untuk melihat siapa yang akan menjadi Raja Penyihir berikutnya. Namun, ketika mereka tumbuh dewasa, beberapa perbedaan di antara mereka menjadi jelas - Yuno adalah keajaiban ajaib, sementara Asta tidak bisa menggunakan sihir sama sekali. Di negara di mana sihir adalah segalanya dan kemampuan atletik tidak ada apa-apanya, Asta berusaha setiap hari untuk memprovokasi bahkan sihir paling sederhana dari dirinya dengan pelatihan fisik dan proklamasi keras wasiatnya. Pada usia 15, selama upacara kelompok di mana grimoires tiga daun semanggi dari desain yang berbeda melayang ke setiap orang, Yuno menerima buku spektakuler dengan semanggi empat daun yang legendaris, sementara Asta tidak menerima apa-apa sama sekali. Namun, kemudian, ketika Yuno terkejut dan terperangkap oleh seorang ksatria sihir yang jatuh, kebenaran tentang kekuatan dan tekad Asta terungkap &mdash; grimoire berpola gelap yang berpola gelap keluar dari menara upacara dan muncul di depannya! Buku anti-sihir &quot;semanggi hitam&quot; ini memiliki semanggi lima daun di sampulnya, meskipun Asta sendiri tidak melihatnya karena buku itu menyala sebentar hanya sekali ketika dia membela temannya. Sekarang kedua teman, jenius daun empat semanggi dan tidak-bakat dengan semanggi hitam tersembunyi, sedang menuju keluar di dunia, bersaing untuk tujuan yang sama ...</p>	1	2015	Semua Umur	7.5	1613947536Black_Clover.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
27	Crazy Professor System	Manhua	极漫文化	<p>Manhua Crazy Professor System yang dibuat oleh komikus bernama 极漫文化 ini bercerita tentang Ning Fan bereinkarnasi sebagai guru tingkat S tetapi ditugaskan di kelas D terburuk di sekolah. Tidak masalah, karena saya sudah memiliki &ndash; sistem, mari kita lihat bagaimana saya mencapai hati semua siswa, mengalahkan para pengkhianat itu, mengambil akademi, membangun sebuah organisasi untuk mencapai puncak benua.</p>	1	2019	Semua umur	7	1613948449Crazy_Professor_System.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
30	Reborn of War God	Manhua	UN社	<p>Manhua Reborn of War God yang dibuat oleh komikus bernama UN社 ini bercerita tentang Seratus tahun yang lalu, generasi dewa perang Ye Qingyun lahir, menghancurkan anak-anak Tianjiao, membuat musuh ketakutan, tetapi secara tak terduga dikhianati oleh kekasihnya Luo Ling, saudara Serigala Tiga Belas, dan jatuh ke dalam jurang sepuluh setan! Seratus tahun kemudian, semua lapisan masyarakat telah memasuki zaman keemasan, dan pelaku kejahatan telah muncul dengan gila! Ye Qingyun terlahir kembali di Ye Family Disciples of Family Kecil dan Menengah dari Delapan Wastelands! Nasib terbalik dan nasib berubah! Dalam hidup ini, saya tidak hanya harus menjadi jenius, tetapi saya juga akan membunuh semua orang yang melahirkan saya! Pedang yang kejam, pisau pembunuh naga, bunuh segalanya, satukan dewa, dan mendominasi semua hal!</p>	1	2019	Semua umur	7	1613948194Reborn_of_War_God.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
26	Apotheosis	Manhua	Ranzai Studio	<p>Manhua Apotheosis yang dibuat oleh komikus bernama Ranzai Studio ini bercerita tentang Apotheosis - peningkatan status dewa. Luo Zheng, sekarang seorang budak yang rendah hati dilahirkan sebagai putra tertua dari keluarga kaya. Karena penurunan keluarganya, penculikan saudara perempuannya dengan kekuatan yang kuat, dia sekarang hanya bisa diinjak oleh orang lain. Namun, surga tidak pernah menutup semua jalan keluar. Sebuah buku kuno yang ditinggalkan oleh ayahnya mengungkapkan teknik ilahi rahasia, memberi kekuatan besar kepada pembaca! Tapi apa yang ada di balik kekuatan ini? Ini adalah kontes melawan takdir.</p>	1	2018	Semua Umur	6.76999999999999957	1613948422Apotheosis.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
28	The Strongest War God	Manhua	Qidian	<p>Manhua The Strongest War God yang dibuat oleh komikus bernama Qidian ini bercerita tentang Prajurit terkuat dan sekelompok pahlawan ganas &ndash; berjuang untuk negara mereka, berjuang untuk rakyat mereka! Hanya kematian yang bisa menghentikan mereka, dan mereka akan terus maju hingga hembusan napas terakhir mereka saat sekarat!</p>	1	2019	Semua umur	7	1613948472The_Strongest_War_God.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
29	Memorize	Manhwa	Eugene	<p>Manhwa Memorize yang dibuat oleh komikus bernama Eugene ini bercerita tentang Hall Plain, dunia lain di zaman modern. Suatu hari Kim Soo-hyun tiba-tiba dipanggil ke dunia Hall Plain setelah keluar dari militer. Setelah melewati banyak hal dia berhasil mencapai puncak, sepuluh tahun di Hall Plain juga diwarnai oleh masa lalu yang menyedihkan. Untuk mengubah masa lalu yang menyedihkan itu, Kim Soo-hyun memutuskan untuk menggunakan kekuatan &lsquo;Code Zero&rsquo; untuk membalikkan waktu 10 tahun yang lalu.</p>	1	2020	Semua umur	7	1613948490Memorize.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
31	Shingeki no Kyojin	Manga	ISAYAMA Hajime	<p>Manga Shingeki no Kyojin yang dibuat oleh komikus bernama ISAYAMA Hajime ini bercerita tentang Beberapa ratus tahun yang lalu, manusia hampir dibasmi oleh para raksasa. Titans yang memiliki fisik tinggi, tapi tidak memiliki kecerdasan, memakan manusia, dan yang terburuk dari semua itu, tampaknya mereka melakukannya untuk kesenangan dan bukan sebagai sumber makanan. Sebagian kecil umat manusia bertahan hidup di dalam di kota yang dilindungi oleh dinding yang sangat tinggi, bahkan dinding tersebut lebih tinggi dari raksasa yang paling besar.</p>	1	2009	Semua umur	8.57000000000000028	1613958107Shingeki_no_Kyojin.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
32	Against the Gods	Manhua	Mars Gravity	<p>Manhua Against the Gods yang dibuat oleh komikus bernama Mars Gravity ini bercerita tentang Mythical Abode Mountain, Cloud&#39;s End Cliff, yang paling berbahaya dari empat area mematikan Azure Cloud Continent. Basis End Cliff di Cloud dikenal sebagai Pemakaman Grim Reaper. Selama bertahun-tahun yang tak terhitung jumlahnya, jumlah orang yang jatuh dari tebing ini terlalu tinggi untuk dihitung. Tak satu pun dari mereka, bahkan tiga yang lebih kuat dari tuan dewa, yang kekuatannya bisa menembus langit, bisa kembali hidup-hidup. Namun, seorang anak laki-laki yang dikejar oleh berbagai orang karena dia sendiri yang memegang harta yang tak ternilai, melompat dari tebing, tetapi bukannya mati, dia terbangun dalam tubuh seorang anak laki-laki dengan nama yang sama di dunia lain! Ini adalah kisah tentang seorang bocah lelaki yang memegang Mutiara Racun Langit, mengolah kekuatan untuk menentang langit dan bumi, seorang penguasa yang memandang dunia!</p>	1	2018	Semua umur	6.55999999999999961	1613948590Against_the_Gods.png	0	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
43	6 Worlds of Cultivation	Manhua	N/A	<p>Manhua 6 Worlds of Cultivation yang dibuat oleh komikus bernama N/A ini bercerita tentang Dibiarkan sendirian di depan biara selama masa sulit, Yub SeJun dianggap bayi normal yang ditinggalkan. Namun, ia memiliki kekuatan untuk mengubah dunia seperti yang diinginkannya. Di dunia, semua orang mengikuti kultivasi klasik; Namun, SeJun mengikuti akhlaknya dan menciptakan metode penanaman novel. Bisakah dia menjadi pahlawan baru yang akan membawa dunia keluar dari kekacauan?</p>	1	2019	Semua umur	7	16139500676_Worlds_of_Cultivation.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
36	Tales of Demons and Gods	Manhua	Mad Snail	<p>Manhua Tales of Demons and Gods yang dibuat oleh komikus bernama Mad Snail ini bercerita tentang Dalam kehidupan masa lalunya, meskipun terlalu lemah untuk melindungi rumahnya ketika dihitung, karena tekad bulat Nie Li menjadi Spiritual Demon Spirit terkuat dan berdiri di puncak dunia bela diri. Namun, ia kehilangan nyawanya selama pertempuran dengan Kaisar Sage dan enam binatang peringkat dewa. Jiwanya dibawa kembali ke ketika ia masih 13 tahun. Meskipun dia adalah yang terlemah di kelasnya dengan bakat terendah, hanya memiliki dunia jiwa merah dan yang lemah pada saat itu, dengan bantuan pengetahuan luas yang dia kumpulkan dari kehidupan sebelumnya, dia memutuskan untuk berlatih lebih cepat daripada yang bisa diharapkan siapa pun. Dia juga memutuskan untuk membantu mereka yang meninggal dengan mulia dalam kehidupan sebelumnya untuk berlatih lebih cepat juga. Dia bertujuan untuk melindungi kota dari masa depan yang akan datang dihancurkan oleh binatang iblis dan nasib sebelumnya berakhir dengan dihancurkan. Dia bertujuan untuk melindungi kekasihnya, teman-teman, keluarga dan sesama warga yang meninggal dalam serangan binatang atau setelahnya. Dan dia bertujuan untuk menghancurkan apa yang disebut keluarga Suci yang dengan sombong meninggalkan tugas mereka dan mengkhianati kota dalam kehidupan masa lalunya.</p>	1	2017	Semua umur	8.19999999999999929	1613949212Tales_of_Demons_and_Gods.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
38	It Starts With a Kingpin Account	Manhua	Renshan Animation	<p>Manhua It Starts With a Kingpin Account yang dibuat oleh komikus bernama Renshan Animation ini bercerita tentang Krisis yang datang secara mendadak membawa bumi langsung ke era OL, dan semua umat ​​manusia berkurang di tangan pasukan tidak diketahui. Semuanya berusaha menjadi petarung kelas pertama di era yang kejam ini, era dari yang lemah dan yang kuat, siswa sekolah menengah bernama Ye Hao hanya dapat naik hingga ke level 3, saat dia hampir mati, dia tiba-tiba membuka sistem akun raja. Bisakah Ye Hao menjadi raja terkuat?</p>	1	2020	Semua umur	7	1613949447It_Starts_With_a_Kingpin_Account.jpg	0	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
39	Otherworldly Sword King’s Survival Records	Manhwa	Kwon sun kyu, studio khit	<p>Manhwa Otherworldly Sword King&rsquo;s Survival Records yang dibuat oleh komikus bernama Kwon sun kyu, studio khit ini bercerita tentang Kau terpilih sebagai yang paling cocok&rdquo; &ldquo;Dengan bakatmu, tingkat kelangsungan hidup [5%] di Selha Latna lebih rendah.&rdquo; &ldquo;Apakah kau ingin bunuh diri? Y / T&rdquo; 22 tahun. Pertempuran yang tak terhitung jumlahnya dengan anjing iblis. Di neraka ini; aku bertahan hidup sendirian. Tersembunyi di belakang level 5, bersama dengan statistik tersembunyi yang keterlaluan! Catatan bertahan hidup ekstrim dari pendekar pedang level 5 terkuat Ryu han bin yang terlempar ke dunia lain ini hanya dengan pedang.</p>	1	2019	Semua umur	7	1613949606Otherworldly_Sword_King’s_Survival_Records.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
51	Reborn Doctor	Manhua	Yu Xuan	<p>Manhua Reborn Doctor yang dibuat oleh komikus bernama Yu Xuan ini bercerita tentang Xing Aofei, seorang dokter, tewas dalam kecelakaan mobil karena kesalahannya dalam praktik. Namun, ia mendapat peluang kelahiran kembali karena kemalangan. Dia kembali ke masa mudanya dan bekerja keras untuk menulis ulang kehidupannya yang gagal. Tapi tanpa disangka-sangka, Xing Aofei ditakdirkan untuk menjadi dokter sekali lagi, dan dia juga dikirim oleh pemerintah daerah sebagai apa yang disebut &ldquo;tas&rdquo; bagi Anda untuk pergi ke puncak sistem kehidupan Anda? Jalan kelahiran kembali Xing Aofei ditakdirkan untuk menjadi jalan kesedihan.</p>	1	2019	Semua umur	7	1613951026Reborn_Doctor.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
53	The Hunter	Manhua	Big Bear	<p>Manhua The Hunter yang dibuat oleh komikus bernama Big Bear ini bercerita tentang Chen BeiMing pernah menjadi pemburu muda dan berbakat dari Aliansi Surgawi, sampai ia dikhianati dan dibunuh oleh The Five Lords. Dia akan dibangkitkan ke masa lalu sementara ingatannya masih utuh dan bersumpah bahwa dia akan membalas dendam pada orang-orang yang mengkhianatinya. Dengan bantuan sprite pertempurannya, dia pernah naik ke jalan untuk menjadi yang terkuat lagi &hellip;</p>	1	2018	Semua umur	7.90000000000000036	1613953628The_Hunter.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
40	Arcane Sniper	Manhwa	샤 이멜	<p>Manhwa Arcane Sniper yang dibuat oleh komikus bernama 샤 이멜 ini bercerita tentang Serial tentang gane fantasi hiper-realistis! &ldquo;Sersan Ha, dasar bajingan gila. Kau menembak dengan tepat sasaran lagi?&rdquo; Penembak jitu Ha Leeha hanya ingin menjadi bagian dari militer untuk selamanya. Namun, dikarenakan kecelakaan yang malang, dia menjadi lumpuh dan dilempar kembali ke masyarakat. Revolusioner VR game [Middle Earth] menyajikan kehidupan baru untuknya. Uang yang didaptkan di [Middle Earth] memiliki nilai pada nunia byata! Meskipun begitu, dia menghancurkan kesempatannya dengan memilih karakter dengan tingkat terendah! &ldquo;Aku tidak sama seperti yang lainnya. Hanya ini yang kumiliki.&rdquo; Bubuk mesiu hitam, bola besi, dan ramrod&hellip; Akan kutunjukkan padamu bagaimana &lsquo;musketeer&rsquo; yang sesungguhnya!</p>	1	2021	Semua umur	7	1613949757Arcane_Sniper.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
41	To Be The Castellan King	Manhua	palm reading	<p>Manhua To Be The Castellan King yang dibuat oleh komikus bernama palm reading ini bercerita tentang Ketika seorang otaku sedang bermain game, dia tidak sengaja menginjak kabel listrik.. Dan membuatnya tersetrum dan dia di bawa ke dua isekai.. Di sana dia meliat manusia yang bertelinga kucing, bertelinga kelinci dan lain-lain. . Dia memikir kan apakah ini bumi?, tetapi ini bukan seperti bumi!, apakah aku di bawa kedunia lain?!, ya tidak salah lagi!, ini dunia lain!.. Dan tak seganja dia bertemu dengan seorang bangsawan,dan bangsawan itu menawarkan kepadanya, sebuah kota.. Karena bangsawa itu sedang membutuhkan uang jadi dia menjual kotanya sendiri.. Dan sekaligus suruh memimpin rakyatnya! ,di karenakan raja sebelumnya tidak mampu memimpin rakyatnya sendiri.. Bagaimana si mc memimpin rakyatnya nantinya?.. Kita saksikan sendiri.. Apakah dia memimpin masih sama seperti raja sebelumnya atau, kota tersebut akan mengalami banyak perubahan setelah si mc menjadi raja kota selanjutnya?</p>	1	2019	Semua umur	7	1613949862To_Be_The_Castellan_King.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
42	Monk Fron the Future	Manhua	青亭文化	<p>Manhua Monk Fron the Future yang dibuat oleh komikus bernama 青亭文化 ini bercerita tentang Teknologi asing, seni bela diri manusia, tabrakan dan konfrontasi antara dua dunia. Puncak yang kuat, bintang alien kehilangan menyedihkan, waktu SMA kelahiran kembali! Di dunia ini, Tang Ming memutuskan untuk bangkit dengan kuat dan menjaga dunia. Dewi masa lalu, gadis berbakat, guru seksi, saudara perempuan Kerajaan berkaki panjang, dan putri asing semuanya di bawah komandonya; tiga belas sekolah seni bela diri, kekuatan agama, budidaya kuat yang tersembunyi, dijauhi saya Chang, terhadap saya melalui kekerasan! Saya tak terkalahkan di zaman kultivasi yang berkembang!</p>	1	2020	Semua umur	7	1613949943Monk_Fron_the_Future.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
47	Star Martial God Technique	Manhua	Mad Snail	<p>Manhua Star Martial God Technique yang dibuat oleh komikus bernama Mad Snail ini bercerita tentang Di seluruh dunia ada dua belas jalur untuk memanjat Tower of God, dan dalam legenda kedua belas jalur ini mengarah ke jalan legendaris keabadian. Namun jalan di Menara Tuhan ini, terlalu panjang, tanpa akhir. Pada zaman kuno dulu ada banyak jenis seni bela diri, sayangnya dunia mengalami perubahan yang mengerikan, dan hanya tiga yang tersisa: Api, Naga dan Seni Bela Diri Bintang. Generasi ahli dari ketiga seni bela diri ini mencari jalan keabadian. Seorang praktisi Bintang Seni Bela Diri dalam perjalanan hidupnya, berencana untuk menjadi Dewa Tertinggi.</p>	1	2016	Semua umur	7.21999999999999975	1613950552Star_Martial_God_Technique.jpg	1	2021-03-13 16:23:15.761757+07	2021-03-13 16:23:15.761757+07
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                               2852.dat                                                                                            0000600 0004000 0002000 00000012076 14026067755 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        225	31	3	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
226	31	7	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
227	31	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
228	31	10	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
229	31	15	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
34	21	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
35	21	6	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
36	21	7	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
37	21	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
38	21	15	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
46	22	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
47	22	6	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
48	22	7	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
49	22	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
50	22	15	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
56	23	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
57	23	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
58	23	15	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
60	24	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
61	24	6	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
62	24	7	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
63	24	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
64	24	15	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
87	30	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
88	30	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
89	30	17	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
122	32	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
123	32	6	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
124	32	7	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
125	32	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
133	34	10	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
134	34	14	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
135	34	16	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
141	36	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
142	36	6	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
143	36	7	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
144	36	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
146	37	17	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
148	38	3	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
149	38	4	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
150	38	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
151	38	17	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
153	39	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
154	39	6	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
155	39	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
157	40	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
158	40	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
160	41	12	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
162	42	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
164	43	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
166	44	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
167	44	13	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
169	45	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
170	45	6	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
171	45	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
172	45	17	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
174	46	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
175	46	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
176	46	15	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
177	46	16	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
179	47	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
180	47	7	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
181	47	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
182	47	12	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
183	47	17	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
194	52	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
195	52	7	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
196	52	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
197	52	15	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
198	52	16	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
231	53	5	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
232	53	7	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
233	53	8	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
234	53	12	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
235	53	17	2021-03-13 16:27:36.796895+07	2021-03-13 16:27:36.796895+07
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                  2854.dat                                                                                            0000600 0004000 0002000 00000002117 14026067755 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	sci-fi	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
3	mystery	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
5	adventure	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
6	comedy	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
7	drama	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
8	fantasy	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
9	historical	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
10	horror	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
11	reincarnation	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
12	romance	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
13	school	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
14	seinen	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
15	shounen	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
16	supernatural	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
17	martial arts	2021-03-13 16:27:25.28605+07	2021-03-13 16:27:25.28605+07
21	action	2021-03-21 20:02:24+07	2021-03-21 20:02:24+07
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                 2856.dat                                                                                            0000600 0004000 0002000 00000000027 14026067755 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Ongoing
2	Tamat
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         2858.dat                                                                                            0000600 0004000 0002000 00000002334 14026067755 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	fahmi rahmat uii	fahmi@gmail.com	$2y$10$Q.owpUs9ff2QSjTKjAmSWudESli/4HPE6x78pCQ5rTVKu8zex55AO	1	2021-03-13 16:27:00.738629+07	2021-03-13 16:27:00.738629+07
3	alex	alex@gmail.com	$2y$10$584DQ9VS/JYE5Pk/06y8Me4LljGnPrvjOB8NMmhqfcgQvU/1oHtyG	0	2021-03-13 16:27:00.738629+07	2021-03-13 16:27:00.738629+07
22	fafa	fafa@gmail.com	$2y$10$Gbd/JnRDDkcQ2quPx8M4UOyx3S/D7UXuMadniNfejQbtxdP15fYIK	0	2021-03-14 00:05:09+07	2021-03-14 00:05:09+07
23	caca	caca@gmail.com	$2y$10$ATLoHvGbbbOsD4/z4wTgzeMAU.98r82CqqqVtrTWEKytz7dU4vyUK	0	2021-03-14 20:10:11+07	2021-03-14 20:10:11+07
24	fitri	fitri@gmail.co	$2y$10$HgZ2f5Qa8Gg9ReqGkravlu./hYA4AQ0Mc./XWYXamjFG/x2WlnH/q	0	2021-03-19 11:55:50+07	2021-03-19 11:55:50+07
25	test	test@gmail.com	$2y$10$Vc/6SuObXf1/Jr486y/RVO8ZN2yX5FLN5342GZ58s/L2TmjaCyZae	1	2021-03-19 12:24:19+07	2021-03-19 12:24:19+07
26	masa	masa@gmail.com	$2y$10$xj9NIpw5PnZy/yj.wi59bu/hsV46H0zWS4QfglBg.Ip722ec39acS	0	2021-03-19 12:24:42+07	2021-03-19 12:24:42+07
27	atuyul RF	atuyul@gmail.com	$2y$10$YWJ0Ufpmx68CJQ9pTirvs.cKDvCIAfSBpKfp.MSPbP9Alic3SpV5i	1	2021-03-19 12:29:14+07	2021-03-19 13:09:57+07
29	athaya	athaya@gmail.com	$2y$10$8hSYSTpOZbAPSo40GRVFwOk6Aj/9XohC98903rVg7SG7TBpYogiju	0	2021-03-19 20:13:28+07	2021-03-19 20:13:28+07
\.


                                                                                                                                                                                                                                                                                                    restore.sql                                                                                         0000600 0004000 0002000 00000024710 14026067755 0015404 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.11
-- Dumped by pg_dump version 11.11

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

DROP DATABASE ci3komik_laravel;
--
-- Name: ci3komik_laravel; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ci3komik_laravel WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE ci3komik_laravel OWNER TO postgres;

\connect ci3komik_laravel

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

SET default_with_oids = false;

--
-- Name: comics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comics (
    id_komik integer NOT NULL,
    judul character varying(256) NOT NULL,
    jenis character varying(256) NOT NULL,
    penulis character varying(256) NOT NULL,
    deskripsi text NOT NULL,
    status integer NOT NULL,
    rilis integer NOT NULL,
    usia_pembaca character varying(256) NOT NULL,
    rating double precision,
    "imageUrl" character varying(256),
    is_active integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.comics OWNER TO postgres;

--
-- Name: comics_id_komik_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comics_id_komik_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comics_id_komik_seq OWNER TO postgres;

--
-- Name: comics_id_komik_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comics_id_komik_seq OWNED BY public.comics.id_komik;


--
-- Name: detail_comic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_comic (
    id_detail integer NOT NULL,
    id_comic integer NOT NULL,
    id_genre integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.detail_comic OWNER TO postgres;

--
-- Name: detail_comic_id_detail_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detail_comic_id_detail_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detail_comic_id_detail_seq OWNER TO postgres;

--
-- Name: detail_comic_id_detail_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detail_comic_id_detail_seq OWNED BY public.detail_comic.id_detail;


--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id_genre integer NOT NULL,
    nama_genre character varying(256) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: genre_id_genre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_id_genre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_genre_seq OWNER TO postgres;

--
-- Name: genre_id_genre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_id_genre_seq OWNED BY public.genre.id_genre;


--
-- Name: status_comic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_comic (
    id_status integer NOT NULL,
    nama_status character varying(256) NOT NULL
);


ALTER TABLE public.status_comic OWNER TO postgres;

--
-- Name: status_comic_id_status_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_comic_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_comic_id_status_seq OWNER TO postgres;

--
-- Name: status_comic_id_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_comic_id_status_seq OWNED BY public.status_comic.id_status;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_user integer NOT NULL,
    name character varying(256) NOT NULL,
    email character varying(256) NOT NULL,
    password character varying(256) NOT NULL,
    is_active integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_user_seq OWNER TO postgres;

--
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;


--
-- Name: comics id_komik; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comics ALTER COLUMN id_komik SET DEFAULT nextval('public.comics_id_komik_seq'::regclass);


--
-- Name: detail_comic id_detail; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_comic ALTER COLUMN id_detail SET DEFAULT nextval('public.detail_comic_id_detail_seq'::regclass);


--
-- Name: genre id_genre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN id_genre SET DEFAULT nextval('public.genre_id_genre_seq'::regclass);


--
-- Name: status_comic id_status; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_comic ALTER COLUMN id_status SET DEFAULT nextval('public.status_comic_id_status_seq'::regclass);


--
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);


--
-- Data for Name: comics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comics (id_komik, judul, jenis, penulis, deskripsi, status, rilis, usia_pembaca, rating, "imageUrl", is_active, created_at, updated_at) FROM stdin;
\.
COPY public.comics (id_komik, judul, jenis, penulis, deskripsi, status, rilis, usia_pembaca, rating, "imageUrl", is_active, created_at, updated_at) FROM '$$PATH$$/2850.dat';

--
-- Data for Name: detail_comic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_comic (id_detail, id_comic, id_genre, created_at, updated_at) FROM stdin;
\.
COPY public.detail_comic (id_detail, id_comic, id_genre, created_at, updated_at) FROM '$$PATH$$/2852.dat';

--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id_genre, nama_genre, created_at, updated_at) FROM stdin;
\.
COPY public.genre (id_genre, nama_genre, created_at, updated_at) FROM '$$PATH$$/2854.dat';

--
-- Data for Name: status_comic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_comic (id_status, nama_status) FROM stdin;
\.
COPY public.status_comic (id_status, nama_status) FROM '$$PATH$$/2856.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_user, name, email, password, is_active, created_at, updated_at) FROM stdin;
\.
COPY public.users (id_user, name, email, password, is_active, created_at, updated_at) FROM '$$PATH$$/2858.dat';

--
-- Name: comics_id_komik_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comics_id_komik_seq', 70, true);


--
-- Name: detail_comic_id_detail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detail_comic_id_detail_seq', 248, true);


--
-- Name: genre_id_genre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_id_genre_seq', 21, true);


--
-- Name: status_comic_id_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_comic_id_status_seq', 2, true);


--
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 29, true);


--
-- Name: comics comics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comics
    ADD CONSTRAINT comics_pkey PRIMARY KEY (id_komik);


--
-- Name: detail_comic detail_comic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_comic
    ADD CONSTRAINT detail_comic_pkey PRIMARY KEY (id_detail);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id_genre);


--
-- Name: status_comic status_comic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_comic
    ADD CONSTRAINT status_comic_pkey PRIMARY KEY (id_status);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- Name: detail_comic id_comic; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_comic
    ADD CONSTRAINT id_comic FOREIGN KEY (id_comic) REFERENCES public.comics(id_komik) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: detail_comic id_genre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_comic
    ADD CONSTRAINT id_genre FOREIGN KEY (id_genre) REFERENCES public.genre(id_genre) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: comics status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comics
    ADD CONSTRAINT status FOREIGN KEY (status) REFERENCES public.status_comic(id_status) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        