PGDMP     7    6                {         3   DB_StarWars_Project_FINAL_VERSION_FINAL_FINAL_FINAL    15.3    15.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    19063 3   DB_StarWars_Project_FINAL_VERSION_FINAL_FINAL_FINAL    DATABASE     �   CREATE DATABASE "DB_StarWars_Project_FINAL_VERSION_FINAL_FINAL_FINAL" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 E   DROP DATABASE "DB_StarWars_Project_FINAL_VERSION_FINAL_FINAL_FINAL";
                postgres    false            l           1247    19065    dieta_domain    DOMAIN     v  CREATE DOMAIN public.dieta_domain AS character varying(15)
	CONSTRAINT dieta_domain_check CHECK (((VALUE)::text = ANY (ARRAY[('herbívoro'::character varying)::text, ('carnívoro'::character varying)::text, ('omnívoro'::character varying)::text, ('carroñero'::character varying)::text, ('geófago'::character varying)::text, ('electrófago'::character varying)::text])));
 !   DROP DOMAIN public.dieta_domain;
       public          postgres    false            p           1247    19068    genero_domain    DOMAIN     	  CREATE DOMAIN public.genero_domain AS character varying(15)
	CONSTRAINT genero_domain_check CHECK (((VALUE)::text = ANY (ARRAY[('M'::character varying)::text, ('F'::character varying)::text, ('Desc'::character varying)::text, ('Otro'::character varying)::text])));
 "   DROP DOMAIN public.genero_domain;
       public          postgres    false            t           1247    19071    tipo_actor_domain    DOMAIN     �   CREATE DOMAIN public.tipo_actor_domain AS character varying(15)
	CONSTRAINT tipo_actor_domain_check CHECK (((VALUE)::text = ANY (ARRAY[('interpreta'::character varying)::text, ('presta su voz'::character varying)::text])));
 &   DROP DOMAIN public.tipo_actor_domain;
       public          postgres    false            x           1247    19074    tipo_pelicula_domain    DOMAIN     �   CREATE DOMAIN public.tipo_pelicula_domain AS character varying(10)
	CONSTRAINT tipo_pelicula_domain_check CHECK (((VALUE)::text = ANY (ARRAY[('animada'::character varying)::text, ('liveaction'::character varying)::text])));
 )   DROP DOMAIN public.tipo_pelicula_domain;
       public          postgres    false            |           1247    19077    tipo_serie_domain    DOMAIN     �   CREATE DOMAIN public.tipo_serie_domain AS character varying(10)
	CONSTRAINT tipo_serie_domain_check CHECK (((VALUE)::text = ANY (ARRAY[('animada'::character varying)::text, ('liveaction'::character varying)::text])));
 &   DROP DOMAIN public.tipo_serie_domain;
       public          postgres    false            �           1247    19080    tripulacion_domain    DOMAIN       CREATE DOMAIN public.tripulacion_domain AS character varying(15)
	CONSTRAINT tripulacion_domain_check CHECK (((VALUE)::text = ANY (ARRAY[('piloto'::character varying)::text, ('copiloto'::character varying)::text, ('artillero'::character varying)::text])));
 '   DROP DOMAIN public.tripulacion_domain;
       public          postgres    false            �            1255    19082    calcular_ganancia()    FUNCTION       CREATE FUNCTION public.calcular_ganancia() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    NEW.ganancia := NEW.ingreso_taquilla - NEW.coste_prod;
    IF NEW.ganancia < 0 THEN
      RAISE NOTICE 'La ganancia es negativa';
    END IF;
    RETURN NEW;
  END;
$$;
 *   DROP FUNCTION public.calcular_ganancia();
       public          postgres    false            �            1259    19083    actor    TABLE       CREATE TABLE public.actor (
    nombre_principal_actor character varying(50) NOT NULL,
    apellido_actor character varying(50) NOT NULL,
    fecha_nacimiento date,
    genero public.genero_domain,
    nacionalidad character varying(50),
    tipo public.tipo_actor_domain
);
    DROP TABLE public.actor;
       public         heap    postgres    false    880    884            �            1259    19088    afiliación    TABLE     �   CREATE TABLE public."afiliación" (
    nombre_af character varying(50) NOT NULL,
    tipo_af character varying(50),
    nom_planeta character varying(50) NOT NULL
);
 !   DROP TABLE public."afiliación";
       public         heap    postgres    false            �            1259    19091    afiliado    TABLE     �   CREATE TABLE public.afiliado (
    nombre_personaje character varying(50) NOT NULL,
    nombre_af character varying(50) NOT NULL,
    fecha_af date NOT NULL
);
    DROP TABLE public.afiliado;
       public         heap    postgres    false            �            1259    19094    aparece    TABLE     t   CREATE TABLE public.aparece (
    nombre_personaje character varying(50) NOT NULL,
    id_medio integer NOT NULL
);
    DROP TABLE public.aparece;
       public         heap    postgres    false            �            1259    19097    aparece_id_medio_seq    SEQUENCE     �   CREATE SEQUENCE public.aparece_id_medio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.aparece_id_medio_seq;
       public          postgres    false    217                        0    0    aparece_id_medio_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.aparece_id_medio_seq OWNED BY public.aparece.id_medio;
          public          postgres    false    218            �            1259    19098    ciudad    TABLE     �   CREATE TABLE public.ciudad (
    nombre_ciudad character varying(50) NOT NULL,
    nom_planeta character varying(50) NOT NULL
);
    DROP TABLE public.ciudad;
       public         heap    postgres    false            �            1259    19101    combate    TABLE     �   CREATE TABLE public.combate (
    participante1 character varying(50) NOT NULL,
    participante2 character varying(50) NOT NULL,
    id_medio integer NOT NULL,
    fecha_combate date NOT NULL,
    lugar_combate character varying(100)
);
    DROP TABLE public.combate;
       public         heap    postgres    false            �            1259    19104    combate_id_medio_seq    SEQUENCE     �   CREATE SEQUENCE public.combate_id_medio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.combate_id_medio_seq;
       public          postgres    false    220                       0    0    combate_id_medio_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.combate_id_medio_seq OWNED BY public.combate.id_medio;
          public          postgres    false    221            �            1259    19105    criatura    TABLE     �   CREATE TABLE public.criatura (
    id_criatura integer NOT NULL,
    color_piel character varying(50),
    dieta public.dieta_domain
);
    DROP TABLE public.criatura;
       public         heap    postgres    false    876            �            1259    19110    criatura_id_criatura_seq    SEQUENCE     �   CREATE SEQUENCE public.criatura_id_criatura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.criatura_id_criatura_seq;
       public          postgres    false    222                       0    0    criatura_id_criatura_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.criatura_id_criatura_seq OWNED BY public.criatura.id_criatura;
          public          postgres    false    223            �            1259    19111    dueño    TABLE     �   CREATE TABLE public."dueño" (
    nombre_personaje character varying(50) NOT NULL,
    fecha_compra date NOT NULL,
    id_nave integer NOT NULL
);
    DROP TABLE public."dueño";
       public         heap    postgres    false            �            1259    19114    dueño_id_nave_seq    SEQUENCE     �   CREATE SEQUENCE public."dueño_id_nave_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."dueño_id_nave_seq";
       public          postgres    false    224                       0    0    dueño_id_nave_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."dueño_id_nave_seq" OWNED BY public."dueño".id_nave;
          public          postgres    false    225            �            1259    19115    especie    TABLE     �   CREATE TABLE public.especie (
    id_especie integer NOT NULL,
    idioma character varying(50),
    es_robot boolean,
    es_humano boolean,
    es_criatura boolean
);
    DROP TABLE public.especie;
       public         heap    postgres    false            �            1259    19118    especie_id_especie_seq    SEQUENCE     �   CREATE SEQUENCE public.especie_id_especie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.especie_id_especie_seq;
       public          postgres    false    226                       0    0    especie_id_especie_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.especie_id_especie_seq OWNED BY public.especie.id_especie;
          public          postgres    false    227            �            1259    19119    humano    TABLE     �   CREATE TABLE public.humano (
    id_humano integer NOT NULL,
    fecha_nacimiento date,
    fecha_muerte date,
    CONSTRAINT chk_fechas CHECK ((fecha_nacimiento < fecha_muerte))
);
    DROP TABLE public.humano;
       public         heap    postgres    false            �            1259    19123    humano_id_humano_seq    SEQUENCE     �   CREATE SEQUENCE public.humano_id_humano_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.humano_id_humano_seq;
       public          postgres    false    228                       0    0    humano_id_humano_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.humano_id_humano_seq OWNED BY public.humano.id_humano;
          public          postgres    false    229            �            1259    19124    idioma    TABLE     z   CREATE TABLE public.idioma (
    idioma character varying(50) NOT NULL,
    nom_planeta character varying(50) NOT NULL
);
    DROP TABLE public.idioma;
       public         heap    postgres    false            �            1259    19127    interpretado    TABLE     �   CREATE TABLE public.interpretado (
    id_medio integer NOT NULL,
    nombre_personaje character varying(50) NOT NULL,
    nombre_principal_actor character varying(50) NOT NULL,
    apellido_actor character varying(50) NOT NULL
);
     DROP TABLE public.interpretado;
       public         heap    postgres    false            �            1259    19130    interpretado_id_medio_seq    SEQUENCE     �   CREATE SEQUENCE public.interpretado_id_medio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.interpretado_id_medio_seq;
       public          postgres    false    231                       0    0    interpretado_id_medio_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.interpretado_id_medio_seq OWNED BY public.interpretado.id_medio;
          public          postgres    false    232            �            1259    19131    lugares_interes    TABLE     �   CREATE TABLE public.lugares_interes (
    nom_ciudad character varying(50) NOT NULL,
    lugar character varying(50) NOT NULL
);
 #   DROP TABLE public.lugares_interes;
       public         heap    postgres    false            �            1259    19134    medio    TABLE     B  CREATE TABLE public.medio (
    id_medio integer NOT NULL,
    "título" character varying(60),
    fecha_estreno date,
    rating integer,
    sinopsis character varying(500),
    es_pelicula boolean,
    es_serie boolean,
    es_videojuego boolean,
    CONSTRAINT chk_rating CHECK (((rating >= 1) AND (rating <= 5)))
);
    DROP TABLE public.medio;
       public         heap    postgres    false            �            1259    19140    medio_id_medio_seq    SEQUENCE     �   CREATE SEQUENCE public.medio_id_medio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.medio_id_medio_seq;
       public          postgres    false    234                       0    0    medio_id_medio_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.medio_id_medio_seq OWNED BY public.medio.id_medio;
          public          postgres    false    235            �            1259    19141    nave    TABLE     �  CREATE TABLE public.nave (
    id_nave integer NOT NULL,
    nombre_nave character varying(50),
    fabricante character varying(50),
    longitud integer,
    uso character varying(50),
    modelo character varying(50),
    CONSTRAINT chk_destructorasestelares CHECK ((((modelo)::text <> 'Destructoras Estelares'::text) OR ((longitud > 900) AND ((uso)::text = 'combate'::text))))
);
    DROP TABLE public.nave;
       public         heap    postgres    false            �            1259    19145    nave_id_nave_seq    SEQUENCE     �   CREATE SEQUENCE public.nave_id_nave_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.nave_id_nave_seq;
       public          postgres    false    236                       0    0    nave_id_nave_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.nave_id_nave_seq OWNED BY public.nave.id_nave;
          public          postgres    false    237            �            1259    19146    pelicula    TABLE       CREATE TABLE public.pelicula (
    id_pelicula integer NOT NULL,
    nombre_director character varying(50),
    apellido_director character varying(50),
    "duración" integer,
    distribuidor character varying(50),
    coste_prod double precision,
    tipo_pelicula public.tipo_pelicula_domain,
    ingreso_taquilla double precision,
    ganancia double precision,
    CONSTRAINT chk_pelicula_valorespositivos CHECK ((("duración" > 0) AND (ingreso_taquilla > (0)::double precision) AND (coste_prod > (0)::double precision)))
);
    DROP TABLE public.pelicula;
       public         heap    postgres    false    888            �            1259    19152    pelicula_id_pelicula_seq    SEQUENCE     �   CREATE SEQUENCE public.pelicula_id_pelicula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.pelicula_id_pelicula_seq;
       public          postgres    false    238            	           0    0    pelicula_id_pelicula_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.pelicula_id_pelicula_seq OWNED BY public.pelicula.id_pelicula;
          public          postgres    false    239            �            1259    19153 	   personaje    TABLE     ~  CREATE TABLE public.personaje (
    nombre_personaje character varying(50) NOT NULL,
    genero public.genero_domain,
    altura double precision,
    peso double precision,
    id_especie integer NOT NULL,
    nom_planeta character varying(50) NOT NULL,
    CONSTRAINT chk_personaje_valorespositivos CHECK (((altura > (0)::double precision) AND (peso > (0)::double precision)))
);
    DROP TABLE public.personaje;
       public         heap    postgres    false    880            �            1259    19159    personaje_id_especie_seq    SEQUENCE     �   CREATE SEQUENCE public.personaje_id_especie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.personaje_id_especie_seq;
       public          postgres    false    240            
           0    0    personaje_id_especie_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.personaje_id_especie_seq OWNED BY public.personaje.id_especie;
          public          postgres    false    241            �            1259    19160    planeta    TABLE     �   CREATE TABLE public.planeta (
    nombre_planeta character varying(50) NOT NULL,
    clima character varying(50),
    sector character varying(50),
    sistema_solar character varying(50)
);
    DROP TABLE public.planeta;
       public         heap    postgres    false            �            1259    19163 
   plataforma    TABLE     {   CREATE TABLE public.plataforma (
    id_videojuego integer NOT NULL,
    plataforma_dist character varying(50) NOT NULL
);
    DROP TABLE public.plataforma;
       public         heap    postgres    false            �            1259    19166    plataforma_id_videojuego_seq    SEQUENCE     �   CREATE SEQUENCE public.plataforma_id_videojuego_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.plataforma_id_videojuego_seq;
       public          postgres    false    243                       0    0    plataforma_id_videojuego_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.plataforma_id_videojuego_seq OWNED BY public.plataforma.id_videojuego;
          public          postgres    false    244            �            1259    19167    robot    TABLE     �   CREATE TABLE public.robot (
    id_robot integer NOT NULL,
    creador_robot character varying(50),
    clase_robot character varying(50)
);
    DROP TABLE public.robot;
       public         heap    postgres    false            �            1259    19170    robot_id_robot_seq    SEQUENCE     �   CREATE SEQUENCE public.robot_id_robot_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.robot_id_robot_seq;
       public          postgres    false    245                       0    0    robot_id_robot_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.robot_id_robot_seq OWNED BY public.robot.id_robot;
          public          postgres    false    246            �            1259    19171    serie    TABLE     M  CREATE TABLE public.serie (
    id_serie integer NOT NULL,
    nombre_creador_serie character varying(50),
    apellido_creador_serie character varying(50),
    total_episodio integer,
    canal character varying(50),
    tipo_serie public.tipo_serie_domain,
    CONSTRAINT chk_serie_valorespositivos CHECK ((total_episodio > 0))
);
    DROP TABLE public.serie;
       public         heap    postgres    false    892            �            1259    19177    serie_id_serie_seq    SEQUENCE     �   CREATE SEQUENCE public.serie_id_serie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.serie_id_serie_seq;
       public          postgres    false    247                       0    0    serie_id_serie_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.serie_id_serie_seq OWNED BY public.serie.id_serie;
          public          postgres    false    248            �            1259    19178    tripula    TABLE     �   CREATE TABLE public.tripula (
    nombre_personaje character varying(50) NOT NULL,
    id_nave integer NOT NULL,
    "tipo_tripulación" public.tripulacion_domain
);
    DROP TABLE public.tripula;
       public         heap    postgres    false    896            �            1259    19183    tripula_id_nave_seq    SEQUENCE     �   CREATE SEQUENCE public.tripula_id_nave_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tripula_id_nave_seq;
       public          postgres    false    249                       0    0    tripula_id_nave_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tripula_id_nave_seq OWNED BY public.tripula.id_nave;
          public          postgres    false    250            �            1259    19184 
   videojuego    TABLE     �   CREATE TABLE public.videojuego (
    id_videojuego integer NOT NULL,
    tipo_juego character varying(50),
    "compañía" character varying(50)
);
    DROP TABLE public.videojuego;
       public         heap    postgres    false            �            1259    19187    videojuego_id_videojuego_seq    SEQUENCE     �   CREATE SEQUENCE public.videojuego_id_videojuego_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.videojuego_id_videojuego_seq;
       public          postgres    false    251                       0    0    videojuego_id_videojuego_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.videojuego_id_videojuego_seq OWNED BY public.videojuego.id_videojuego;
          public          postgres    false    252            �           2604    19188    aparece id_medio    DEFAULT     t   ALTER TABLE ONLY public.aparece ALTER COLUMN id_medio SET DEFAULT nextval('public.aparece_id_medio_seq'::regclass);
 ?   ALTER TABLE public.aparece ALTER COLUMN id_medio DROP DEFAULT;
       public          postgres    false    218    217            �           2604    19189    combate id_medio    DEFAULT     t   ALTER TABLE ONLY public.combate ALTER COLUMN id_medio SET DEFAULT nextval('public.combate_id_medio_seq'::regclass);
 ?   ALTER TABLE public.combate ALTER COLUMN id_medio DROP DEFAULT;
       public          postgres    false    221    220            �           2604    19190    criatura id_criatura    DEFAULT     |   ALTER TABLE ONLY public.criatura ALTER COLUMN id_criatura SET DEFAULT nextval('public.criatura_id_criatura_seq'::regclass);
 C   ALTER TABLE public.criatura ALTER COLUMN id_criatura DROP DEFAULT;
       public          postgres    false    223    222            �           2604    19191    dueño id_nave    DEFAULT     t   ALTER TABLE ONLY public."dueño" ALTER COLUMN id_nave SET DEFAULT nextval('public."dueño_id_nave_seq"'::regclass);
 ?   ALTER TABLE public."dueño" ALTER COLUMN id_nave DROP DEFAULT;
       public          postgres    false    225    224            �           2604    19192    especie id_especie    DEFAULT     x   ALTER TABLE ONLY public.especie ALTER COLUMN id_especie SET DEFAULT nextval('public.especie_id_especie_seq'::regclass);
 A   ALTER TABLE public.especie ALTER COLUMN id_especie DROP DEFAULT;
       public          postgres    false    227    226            �           2604    19193    humano id_humano    DEFAULT     t   ALTER TABLE ONLY public.humano ALTER COLUMN id_humano SET DEFAULT nextval('public.humano_id_humano_seq'::regclass);
 ?   ALTER TABLE public.humano ALTER COLUMN id_humano DROP DEFAULT;
       public          postgres    false    229    228            �           2604    19194    interpretado id_medio    DEFAULT     ~   ALTER TABLE ONLY public.interpretado ALTER COLUMN id_medio SET DEFAULT nextval('public.interpretado_id_medio_seq'::regclass);
 D   ALTER TABLE public.interpretado ALTER COLUMN id_medio DROP DEFAULT;
       public          postgres    false    232    231            �           2604    19195    medio id_medio    DEFAULT     p   ALTER TABLE ONLY public.medio ALTER COLUMN id_medio SET DEFAULT nextval('public.medio_id_medio_seq'::regclass);
 =   ALTER TABLE public.medio ALTER COLUMN id_medio DROP DEFAULT;
       public          postgres    false    235    234            �           2604    19196    nave id_nave    DEFAULT     l   ALTER TABLE ONLY public.nave ALTER COLUMN id_nave SET DEFAULT nextval('public.nave_id_nave_seq'::regclass);
 ;   ALTER TABLE public.nave ALTER COLUMN id_nave DROP DEFAULT;
       public          postgres    false    237    236            �           2604    19197    pelicula id_pelicula    DEFAULT     |   ALTER TABLE ONLY public.pelicula ALTER COLUMN id_pelicula SET DEFAULT nextval('public.pelicula_id_pelicula_seq'::regclass);
 C   ALTER TABLE public.pelicula ALTER COLUMN id_pelicula DROP DEFAULT;
       public          postgres    false    239    238            �           2604    19198    personaje id_especie    DEFAULT     |   ALTER TABLE ONLY public.personaje ALTER COLUMN id_especie SET DEFAULT nextval('public.personaje_id_especie_seq'::regclass);
 C   ALTER TABLE public.personaje ALTER COLUMN id_especie DROP DEFAULT;
       public          postgres    false    241    240            �           2604    19199    plataforma id_videojuego    DEFAULT     �   ALTER TABLE ONLY public.plataforma ALTER COLUMN id_videojuego SET DEFAULT nextval('public.plataforma_id_videojuego_seq'::regclass);
 G   ALTER TABLE public.plataforma ALTER COLUMN id_videojuego DROP DEFAULT;
       public          postgres    false    244    243            �           2604    19200    robot id_robot    DEFAULT     p   ALTER TABLE ONLY public.robot ALTER COLUMN id_robot SET DEFAULT nextval('public.robot_id_robot_seq'::regclass);
 =   ALTER TABLE public.robot ALTER COLUMN id_robot DROP DEFAULT;
       public          postgres    false    246    245            �           2604    19201    serie id_serie    DEFAULT     p   ALTER TABLE ONLY public.serie ALTER COLUMN id_serie SET DEFAULT nextval('public.serie_id_serie_seq'::regclass);
 =   ALTER TABLE public.serie ALTER COLUMN id_serie DROP DEFAULT;
       public          postgres    false    248    247            �           2604    19202    tripula id_nave    DEFAULT     r   ALTER TABLE ONLY public.tripula ALTER COLUMN id_nave SET DEFAULT nextval('public.tripula_id_nave_seq'::regclass);
 >   ALTER TABLE public.tripula ALTER COLUMN id_nave DROP DEFAULT;
       public          postgres    false    250    249            �           2604    19203    videojuego id_videojuego    DEFAULT     �   ALTER TABLE ONLY public.videojuego ALTER COLUMN id_videojuego SET DEFAULT nextval('public.videojuego_id_videojuego_seq'::regclass);
 G   ALTER TABLE public.videojuego ALTER COLUMN id_videojuego DROP DEFAULT;
       public          postgres    false    252    251            �          0    19083    actor 
   TABLE DATA           u   COPY public.actor (nombre_principal_actor, apellido_actor, fecha_nacimiento, genero, nacionalidad, tipo) FROM stdin;
    public          postgres    false    214   W�       �          0    19088    afiliación 
   TABLE DATA           H   COPY public."afiliación" (nombre_af, tipo_af, nom_planeta) FROM stdin;
    public          postgres    false    215   ��       �          0    19091    afiliado 
   TABLE DATA           I   COPY public.afiliado (nombre_personaje, nombre_af, fecha_af) FROM stdin;
    public          postgres    false    216   {�       �          0    19094    aparece 
   TABLE DATA           =   COPY public.aparece (nombre_personaje, id_medio) FROM stdin;
    public          postgres    false    217   ��       �          0    19098    ciudad 
   TABLE DATA           <   COPY public.ciudad (nombre_ciudad, nom_planeta) FROM stdin;
    public          postgres    false    219   ��       �          0    19101    combate 
   TABLE DATA           g   COPY public.combate (participante1, participante2, id_medio, fecha_combate, lugar_combate) FROM stdin;
    public          postgres    false    220   
�       �          0    19105    criatura 
   TABLE DATA           B   COPY public.criatura (id_criatura, color_piel, dieta) FROM stdin;
    public          postgres    false    222   ��       �          0    19111    dueño 
   TABLE DATA           K   COPY public."dueño" (nombre_personaje, fecha_compra, id_nave) FROM stdin;
    public          postgres    false    224   P�       �          0    19115    especie 
   TABLE DATA           W   COPY public.especie (id_especie, idioma, es_robot, es_humano, es_criatura) FROM stdin;
    public          postgres    false    226   -�       �          0    19119    humano 
   TABLE DATA           K   COPY public.humano (id_humano, fecha_nacimiento, fecha_muerte) FROM stdin;
    public          postgres    false    228   5�       �          0    19124    idioma 
   TABLE DATA           5   COPY public.idioma (idioma, nom_planeta) FROM stdin;
    public          postgres    false    230   ��       �          0    19127    interpretado 
   TABLE DATA           j   COPY public.interpretado (id_medio, nombre_personaje, nombre_principal_actor, apellido_actor) FROM stdin;
    public          postgres    false    231   ��       �          0    19131    lugares_interes 
   TABLE DATA           <   COPY public.lugares_interes (nom_ciudad, lugar) FROM stdin;
    public          postgres    false    233   D�       �          0    19134    medio 
   TABLE DATA           {   COPY public.medio (id_medio, "título", fecha_estreno, rating, sinopsis, es_pelicula, es_serie, es_videojuego) FROM stdin;
    public          postgres    false    234   a�       �          0    19141    nave 
   TABLE DATA           W   COPY public.nave (id_nave, nombre_nave, fabricante, longitud, uso, modelo) FROM stdin;
    public          postgres    false    236   Z�       �          0    19146    pelicula 
   TABLE DATA           �   COPY public.pelicula (id_pelicula, nombre_director, apellido_director, "duración", distribuidor, coste_prod, tipo_pelicula, ingreso_taquilla, ganancia) FROM stdin;
    public          postgres    false    238   ��       �          0    19153 	   personaje 
   TABLE DATA           d   COPY public.personaje (nombre_personaje, genero, altura, peso, id_especie, nom_planeta) FROM stdin;
    public          postgres    false    240   ��       �          0    19160    planeta 
   TABLE DATA           O   COPY public.planeta (nombre_planeta, clima, sector, sistema_solar) FROM stdin;
    public          postgres    false    242   �       �          0    19163 
   plataforma 
   TABLE DATA           D   COPY public.plataforma (id_videojuego, plataforma_dist) FROM stdin;
    public          postgres    false    243   ��       �          0    19167    robot 
   TABLE DATA           E   COPY public.robot (id_robot, creador_robot, clase_robot) FROM stdin;
    public          postgres    false    245   K�       �          0    19171    serie 
   TABLE DATA           z   COPY public.serie (id_serie, nombre_creador_serie, apellido_creador_serie, total_episodio, canal, tipo_serie) FROM stdin;
    public          postgres    false    247   �       �          0    19178    tripula 
   TABLE DATA           Q   COPY public.tripula (nombre_personaje, id_nave, "tipo_tripulación") FROM stdin;
    public          postgres    false    249   {�       �          0    19184 
   videojuego 
   TABLE DATA           M   COPY public.videojuego (id_videojuego, tipo_juego, "compañía") FROM stdin;
    public          postgres    false    251   t�                  0    0    aparece_id_medio_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.aparece_id_medio_seq', 1, false);
          public          postgres    false    218                       0    0    combate_id_medio_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.combate_id_medio_seq', 1, false);
          public          postgres    false    221                       0    0    criatura_id_criatura_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.criatura_id_criatura_seq', 1, false);
          public          postgres    false    223                       0    0    dueño_id_nave_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."dueño_id_nave_seq"', 1, false);
          public          postgres    false    225                       0    0    especie_id_especie_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.especie_id_especie_seq', 1, false);
          public          postgres    false    227                       0    0    humano_id_humano_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.humano_id_humano_seq', 1, false);
          public          postgres    false    229                       0    0    interpretado_id_medio_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.interpretado_id_medio_seq', 1, false);
          public          postgres    false    232                       0    0    medio_id_medio_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.medio_id_medio_seq', 1, false);
          public          postgres    false    235                       0    0    nave_id_nave_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.nave_id_nave_seq', 1, false);
          public          postgres    false    237                       0    0    pelicula_id_pelicula_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pelicula_id_pelicula_seq', 1, false);
          public          postgres    false    239                       0    0    personaje_id_especie_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.personaje_id_especie_seq', 1, false);
          public          postgres    false    241                       0    0    plataforma_id_videojuego_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.plataforma_id_videojuego_seq', 1, false);
          public          postgres    false    244                       0    0    robot_id_robot_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.robot_id_robot_seq', 1, false);
          public          postgres    false    246                       0    0    serie_id_serie_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.serie_id_serie_seq', 1, false);
          public          postgres    false    248                       0    0    tripula_id_nave_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tripula_id_nave_seq', 1, false);
          public          postgres    false    250                       0    0    videojuego_id_videojuego_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.videojuego_id_videojuego_seq', 1, false);
          public          postgres    false    252            �           2606    19205    afiliación afiliación_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."afiliación"
    ADD CONSTRAINT "afiliación_pkey" PRIMARY KEY (nombre_af);
 J   ALTER TABLE ONLY public."afiliación" DROP CONSTRAINT "afiliación_pkey";
       public            postgres    false    215                       2606    19207    ciudad ciudad_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (nombre_ciudad);
 <   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_pkey;
       public            postgres    false    219                       2606    19209    criatura criatura_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.criatura
    ADD CONSTRAINT criatura_pkey PRIMARY KEY (id_criatura);
 @   ALTER TABLE ONLY public.criatura DROP CONSTRAINT criatura_pkey;
       public            postgres    false    222                       2606    19211    especie especie_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.especie
    ADD CONSTRAINT especie_pkey PRIMARY KEY (id_especie);
 >   ALTER TABLE ONLY public.especie DROP CONSTRAINT especie_pkey;
       public            postgres    false    226                       2606    19213    humano humano_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.humano
    ADD CONSTRAINT humano_pkey PRIMARY KEY (id_humano);
 <   ALTER TABLE ONLY public.humano DROP CONSTRAINT humano_pkey;
       public            postgres    false    228                       2606    19215    medio medio_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.medio
    ADD CONSTRAINT medio_pkey PRIMARY KEY (id_medio);
 :   ALTER TABLE ONLY public.medio DROP CONSTRAINT medio_pkey;
       public            postgres    false    234                       2606    19217    nave nave_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.nave
    ADD CONSTRAINT nave_pkey PRIMARY KEY (id_nave);
 8   ALTER TABLE ONLY public.nave DROP CONSTRAINT nave_pkey;
       public            postgres    false    236                       2606    19219    pelicula pelicula_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT pelicula_pkey PRIMARY KEY (id_pelicula);
 @   ALTER TABLE ONLY public.pelicula DROP CONSTRAINT pelicula_pkey;
       public            postgres    false    238                       2606    19221    personaje personaje_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.personaje
    ADD CONSTRAINT personaje_pkey PRIMARY KEY (nombre_personaje);
 B   ALTER TABLE ONLY public.personaje DROP CONSTRAINT personaje_pkey;
       public            postgres    false    240            �           2606    19223    actor pk_actor 
   CONSTRAINT     p   ALTER TABLE ONLY public.actor
    ADD CONSTRAINT pk_actor PRIMARY KEY (nombre_principal_actor, apellido_actor);
 8   ALTER TABLE ONLY public.actor DROP CONSTRAINT pk_actor;
       public            postgres    false    214    214                        2606    19225 !   afiliado pk_afliciacion_personaje 
   CONSTRAINT     �   ALTER TABLE ONLY public.afiliado
    ADD CONSTRAINT pk_afliciacion_personaje PRIMARY KEY (nombre_personaje, nombre_af, fecha_af);
 K   ALTER TABLE ONLY public.afiliado DROP CONSTRAINT pk_afliciacion_personaje;
       public            postgres    false    216    216    216                       2606    19227    idioma pk_idioma 
   CONSTRAINT     _   ALTER TABLE ONLY public.idioma
    ADD CONSTRAINT pk_idioma PRIMARY KEY (idioma, nom_planeta);
 :   ALTER TABLE ONLY public.idioma DROP CONSTRAINT pk_idioma;
       public            postgres    false    230    230                       2606    19229     lugares_interes pk_lugar_interes 
   CONSTRAINT     m   ALTER TABLE ONLY public.lugares_interes
    ADD CONSTRAINT pk_lugar_interes PRIMARY KEY (lugar, nom_ciudad);
 J   ALTER TABLE ONLY public.lugares_interes DROP CONSTRAINT pk_lugar_interes;
       public            postgres    false    233    233                       2606    19231    combate pk_participantes_medio 
   CONSTRAINT     �   ALTER TABLE ONLY public.combate
    ADD CONSTRAINT pk_participantes_medio PRIMARY KEY (participante1, participante2, id_medio);
 H   ALTER TABLE ONLY public.combate DROP CONSTRAINT pk_participantes_medio;
       public            postgres    false    220    220    220                       2606    19233 %   interpretado pk_personaje_actor_medio 
   CONSTRAINT     �   ALTER TABLE ONLY public.interpretado
    ADD CONSTRAINT pk_personaje_actor_medio PRIMARY KEY (id_medio, nombre_personaje, nombre_principal_actor, apellido_actor);
 O   ALTER TABLE ONLY public.interpretado DROP CONSTRAINT pk_personaje_actor_medio;
       public            postgres    false    231    231    231    231                       2606    19235    aparece pk_personaje_medio 
   CONSTRAINT     p   ALTER TABLE ONLY public.aparece
    ADD CONSTRAINT pk_personaje_medio PRIMARY KEY (nombre_personaje, id_medio);
 D   ALTER TABLE ONLY public.aparece DROP CONSTRAINT pk_personaje_medio;
       public            postgres    false    217    217            &           2606    19237    tripula pk_personaje_nave 
   CONSTRAINT     n   ALTER TABLE ONLY public.tripula
    ADD CONSTRAINT pk_personaje_nave PRIMARY KEY (nombre_personaje, id_nave);
 C   ALTER TABLE ONLY public.tripula DROP CONSTRAINT pk_personaje_nave;
       public            postgres    false    249    249            
           2606    19239    dueño pk_personaje_nave_fecha 
   CONSTRAINT     �   ALTER TABLE ONLY public."dueño"
    ADD CONSTRAINT pk_personaje_nave_fecha PRIMARY KEY (nombre_personaje, id_nave, fecha_compra);
 J   ALTER TABLE ONLY public."dueño" DROP CONSTRAINT pk_personaje_nave_fecha;
       public            postgres    false    224    224    224                        2606    19241    plataforma pk_plataforma 
   CONSTRAINT     r   ALTER TABLE ONLY public.plataforma
    ADD CONSTRAINT pk_plataforma PRIMARY KEY (id_videojuego, plataforma_dist);
 B   ALTER TABLE ONLY public.plataforma DROP CONSTRAINT pk_plataforma;
       public            postgres    false    243    243                       2606    19243    planeta planeta_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.planeta
    ADD CONSTRAINT planeta_pkey PRIMARY KEY (nombre_planeta);
 >   ALTER TABLE ONLY public.planeta DROP CONSTRAINT planeta_pkey;
       public            postgres    false    242            "           2606    19245    robot robot_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.robot
    ADD CONSTRAINT robot_pkey PRIMARY KEY (id_robot);
 :   ALTER TABLE ONLY public.robot DROP CONSTRAINT robot_pkey;
       public            postgres    false    245            $           2606    19247    serie serie_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.serie
    ADD CONSTRAINT serie_pkey PRIMARY KEY (id_serie);
 :   ALTER TABLE ONLY public.serie DROP CONSTRAINT serie_pkey;
       public            postgres    false    247            (           2606    19249    videojuego videojuego_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.videojuego
    ADD CONSTRAINT videojuego_pkey PRIMARY KEY (id_videojuego);
 D   ALTER TABLE ONLY public.videojuego DROP CONSTRAINT videojuego_pkey;
       public            postgres    false    251            D           2620    19250 "   pelicula calcular_ganancia_trigger    TRIGGER     �   CREATE TRIGGER calcular_ganancia_trigger BEFORE INSERT OR UPDATE ON public.pelicula FOR EACH ROW EXECUTE FUNCTION public.calcular_ganancia();
 ;   DROP TRIGGER calcular_ganancia_trigger ON public.pelicula;
       public          postgres    false    238    253            )           2606    19251 (   afiliación afiliación_nom_planeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."afiliación"
    ADD CONSTRAINT "afiliación_nom_planeta_fkey" FOREIGN KEY (nom_planeta) REFERENCES public.planeta(nombre_planeta) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."afiliación" DROP CONSTRAINT "afiliación_nom_planeta_fkey";
       public          postgres    false    215    3358    242            *           2606    19256     afiliado fk_afiliado_afiliación    FK CONSTRAINT     �   ALTER TABLE ONLY public.afiliado
    ADD CONSTRAINT "fk_afiliado_afiliación" FOREIGN KEY (nombre_af) REFERENCES public."afiliación"(nombre_af) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.afiliado DROP CONSTRAINT "fk_afiliado_afiliación";
       public          postgres    false    215    3326    216            +           2606    19261    afiliado fk_afiliado_personaje    FK CONSTRAINT     �   ALTER TABLE ONLY public.afiliado
    ADD CONSTRAINT fk_afiliado_personaje FOREIGN KEY (nombre_personaje) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.afiliado DROP CONSTRAINT fk_afiliado_personaje;
       public          postgres    false    240    3356    216            ,           2606    19266    aparece fk_aparece_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.aparece
    ADD CONSTRAINT fk_aparece_medio FOREIGN KEY (id_medio) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.aparece DROP CONSTRAINT fk_aparece_medio;
       public          postgres    false    217    3350    234            -           2606    19271    aparece fk_aparece_personaje    FK CONSTRAINT     �   ALTER TABLE ONLY public.aparece
    ADD CONSTRAINT fk_aparece_personaje FOREIGN KEY (nombre_personaje) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.aparece DROP CONSTRAINT fk_aparece_personaje;
       public          postgres    false    3356    217    240            .           2606    19276    ciudad fk_ciudad_planeta    FK CONSTRAINT     �   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_ciudad_planeta FOREIGN KEY (nom_planeta) REFERENCES public.planeta(nombre_planeta) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT fk_ciudad_planeta;
       public          postgres    false    3358    219    242            /           2606    19281    combate fk_combate_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.combate
    ADD CONSTRAINT fk_combate_medio FOREIGN KEY (id_medio) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.combate DROP CONSTRAINT fk_combate_medio;
       public          postgres    false    220    3350    234            0           2606    19286    combate fk_combate_personaje1    FK CONSTRAINT     �   ALTER TABLE ONLY public.combate
    ADD CONSTRAINT fk_combate_personaje1 FOREIGN KEY (participante1) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.combate DROP CONSTRAINT fk_combate_personaje1;
       public          postgres    false    220    240    3356            1           2606    19291    combate fk_combate_personaje2    FK CONSTRAINT     �   ALTER TABLE ONLY public.combate
    ADD CONSTRAINT fk_combate_personaje2 FOREIGN KEY (participante2) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.combate DROP CONSTRAINT fk_combate_personaje2;
       public          postgres    false    220    3356    240            2           2606    19296    criatura fk_criatura_especie    FK CONSTRAINT     �   ALTER TABLE ONLY public.criatura
    ADD CONSTRAINT fk_criatura_especie FOREIGN KEY (id_criatura) REFERENCES public.especie(id_especie) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.criatura DROP CONSTRAINT fk_criatura_especie;
       public          postgres    false    226    222    3340            3           2606    19301    dueño fk_dueño_nave    FK CONSTRAINT     �   ALTER TABLE ONLY public."dueño"
    ADD CONSTRAINT "fk_dueño_nave" FOREIGN KEY (id_nave) REFERENCES public.nave(id_nave) ON UPDATE CASCADE ON DELETE SET NULL;
 C   ALTER TABLE ONLY public."dueño" DROP CONSTRAINT "fk_dueño_nave";
       public          postgres    false    236    3352    224            4           2606    19306    dueño fk_dueño_personaje    FK CONSTRAINT     �   ALTER TABLE ONLY public."dueño"
    ADD CONSTRAINT "fk_dueño_personaje" FOREIGN KEY (nombre_personaje) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public."dueño" DROP CONSTRAINT "fk_dueño_personaje";
       public          postgres    false    3356    240    224            5           2606    19311    humano fk_humano_especie    FK CONSTRAINT     �   ALTER TABLE ONLY public.humano
    ADD CONSTRAINT fk_humano_especie FOREIGN KEY (id_humano) REFERENCES public.especie(id_especie) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.humano DROP CONSTRAINT fk_humano_especie;
       public          postgres    false    226    228    3340            6           2606    19316    idioma fk_idioma_planeta    FK CONSTRAINT     �   ALTER TABLE ONLY public.idioma
    ADD CONSTRAINT fk_idioma_planeta FOREIGN KEY (nom_planeta) REFERENCES public.planeta(nombre_planeta) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.idioma DROP CONSTRAINT fk_idioma_planeta;
       public          postgres    false    242    3358    230            7           2606    19321 "   interpretado fk_interpretado_actor    FK CONSTRAINT     �   ALTER TABLE ONLY public.interpretado
    ADD CONSTRAINT fk_interpretado_actor FOREIGN KEY (nombre_principal_actor, apellido_actor) REFERENCES public.actor(nombre_principal_actor, apellido_actor) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.interpretado DROP CONSTRAINT fk_interpretado_actor;
       public          postgres    false    214    231    214    231    3324            8           2606    19326 "   interpretado fk_interpretado_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.interpretado
    ADD CONSTRAINT fk_interpretado_medio FOREIGN KEY (id_medio) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.interpretado DROP CONSTRAINT fk_interpretado_medio;
       public          postgres    false    231    234    3350            9           2606    19331 &   interpretado fk_interpretado_personaje    FK CONSTRAINT     �   ALTER TABLE ONLY public.interpretado
    ADD CONSTRAINT fk_interpretado_personaje FOREIGN KEY (nombre_personaje) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.interpretado DROP CONSTRAINT fk_interpretado_personaje;
       public          postgres    false    240    3356    231            :           2606    19336    lugares_interes fk_lugar_ciudad    FK CONSTRAINT     �   ALTER TABLE ONLY public.lugares_interes
    ADD CONSTRAINT fk_lugar_ciudad FOREIGN KEY (nom_ciudad) REFERENCES public.ciudad(nombre_ciudad) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.lugares_interes DROP CONSTRAINT fk_lugar_ciudad;
       public          postgres    false    233    219    3332            ;           2606    19341    pelicula fk_pelicula_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT fk_pelicula_medio FOREIGN KEY (id_pelicula) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.pelicula DROP CONSTRAINT fk_pelicula_medio;
       public          postgres    false    3350    238    234            ?           2606    19346    robot fk_robot_especie    FK CONSTRAINT     �   ALTER TABLE ONLY public.robot
    ADD CONSTRAINT fk_robot_especie FOREIGN KEY (id_robot) REFERENCES public.especie(id_especie) ON UPDATE CASCADE ON DELETE SET NULL;
 @   ALTER TABLE ONLY public.robot DROP CONSTRAINT fk_robot_especie;
       public          postgres    false    226    3340    245            @           2606    19351    serie fk_serie_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.serie
    ADD CONSTRAINT fk_serie_medio FOREIGN KEY (id_serie) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 >   ALTER TABLE ONLY public.serie DROP CONSTRAINT fk_serie_medio;
       public          postgres    false    3350    247    234            A           2606    19356    tripula fk_tripula_nave    FK CONSTRAINT     �   ALTER TABLE ONLY public.tripula
    ADD CONSTRAINT fk_tripula_nave FOREIGN KEY (id_nave) REFERENCES public.nave(id_nave) ON UPDATE CASCADE ON DELETE SET NULL;
 A   ALTER TABLE ONLY public.tripula DROP CONSTRAINT fk_tripula_nave;
       public          postgres    false    236    249    3352            B           2606    19361    tripula fk_tripula_personaje    FK CONSTRAINT     �   ALTER TABLE ONLY public.tripula
    ADD CONSTRAINT fk_tripula_personaje FOREIGN KEY (nombre_personaje) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.tripula DROP CONSTRAINT fk_tripula_personaje;
       public          postgres    false    249    3356    240            >           2606    19366    plataforma fk_videojuego_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.plataforma
    ADD CONSTRAINT fk_videojuego_id FOREIGN KEY (id_videojuego) REFERENCES public.videojuego(id_videojuego) ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.plataforma DROP CONSTRAINT fk_videojuego_id;
       public          postgres    false    3368    251    243            C           2606    19371    videojuego fk_videojuego_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.videojuego
    ADD CONSTRAINT fk_videojuego_medio FOREIGN KEY (id_videojuego) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.videojuego DROP CONSTRAINT fk_videojuego_medio;
       public          postgres    false    251    3350    234            <           2606    19376 #   personaje personaje_id_especie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje
    ADD CONSTRAINT personaje_id_especie_fkey FOREIGN KEY (id_especie) REFERENCES public.especie(id_especie) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.personaje DROP CONSTRAINT personaje_id_especie_fkey;
       public          postgres    false    3340    226    240            =           2606    19381 $   personaje personaje_nom_planeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje
    ADD CONSTRAINT personaje_nom_planeta_fkey FOREIGN KEY (nom_planeta) REFERENCES public.planeta(nombre_planeta) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.personaje DROP CONSTRAINT personaje_nom_planeta_fkey;
       public          postgres    false    240    242    3358            �     x�}�Mn�0F��)rW� ˶��G��u��FW6$Jn�eϑ�uH�*��k�={�L�~��kA�Vq��j�0`�F6-q 0<���4`T�δ��n/u],3ߪX���p�bӸ����֣a�Щ��$��zo*:�SW�ұJ4TW��<�^��O���_�Ja����'d��Ҡ�E�[)=o�L��܏ֺ��qO��g���Fj�&�J>/&�]�w����%
��Y-'=��x�ܞ��%�!�B����򺸺�bܞ�<{'�lW�7Q� jH��      �   �   x�m�=N�P���>�˂�Ѧ�8y���Ŏ���g�����PPDgi>͌g����f�7���.�:X+�jUm>��4�6�sb�N����H	��V�IX�K����T6�"���.�$�	YH��;n9'^|�M���+^s���@*ǟ2<���xc�ҒB�I�4Q6��l�JWc���y��Q�o���Tq��������b
.����/O7A�*9��L2<��q��-      �     x�u�QN!E�al LZ�O��j��iM�Ɵ���R0�Zw�ZܘLß5!/!��{�~�l�;��0�+g�[�Fg�(��\H:��Z�����F���w�l
Yq9�+m�3xv�>hKVѠg4�@S.}��7�ul��*����'\	����S�6���wdcS[^�\*z4�L��.K=�7�B�EEZJ^	� ���"��3;V�`tU��Bѧ���^�{2V߅�l�/T���9z��r�'�{���Tq5�u�Mg�N)k�gꬴ��rL�.(���k�       �   +  x�u��J�0���)����t�`a�DQ�9m�)�-soo�q&��UH �w��S�����t�Ck����aO_���m+�~G��*�u��{Zt�?�AX~>U��wp.L��
��s��ml7�a~�7�
��g�_ox˼���q<�8y�ÿ��G�cCd���X>��4�h"�D��d�I��eMN�L4��]FNbNe�Z��ĩ�S��T��t�i��:)�c	�K�"�]1��$J�R��bV�x��KAfQ�B����yQ~�('w�z?~���~��>Y|��m�f���!��O �      �     x�e�MN�@�דS���@�PA��R� �q,&v5?�g`�6�	��������7���<� ��W��G�hȱGIU��P{�ZT��:�0��v��=��}L���-��Gh|a�+,�Fh�
E�!��-iFCHp���W<����k/�ƽ�'���Z��ky���=iܡ�D4b;��ZG��#���3ʀ^�����#�l���x��=ɜn��CN	˞Z3�e/�~�j._��=ٵ��aL��cA����t����.a�d�)�9���6���7������_�G�      �   �  x�m�MN�0���)�A�,��o4=Т[�@l*I���m#��\kvl��t�I�&�"�ޫ�޲��w�/hv�����;���5R�l4��X��Pp�'�/yS��Z�E�Z���%� K�7�	-
�Ιfj.V5�� ��o�!'�]���ZW��A���G�`7,��{����+��W \P�b�Z���VLR�8�ب\��q���$K\��bK/�%�i2�t����Vegjs�܎ņ���f�j��fU���<����F�T��[���x��^븕��I�4������Pt1�/�q�F�k�:���B�F��ߢ��S�Y���~%�>�o��U
1�h���`�*���W�k��ٿ��@u2+%.��h�->檎1��KER�Oǟ�g�mM�-�T!5�]�{/���}�Q      �      x�e�;�0���>j P�H'�
��*�b@!+ Eb���Q�H�o3�4�ŉ
6���Z�#��eˎ4�3�;������~8�nB�_�~���A��ʁ���i��-����������6C�?Sas      �   �   x�=��J1E�3_�������U�
-TZQ_&��[��ݥ��mi�u��;��S���'9v�;ft���<웴7���3T�6D|�dך�o)"������(v��%I�3r}�~����
��o��6��P�����bu�c�Λ%���f�))��r�I����S�Gv������4�_u}�{�1��|���0|� �fEH      �   �   x���An�0E��S���2��T��IXv3
Nc�Œ1B9g�b�E�����x����?����1
��q�ư�"Gm����qX�F�RxAf~l�1dU�D�uY-�P�a	��s�)|a�w�ؙ|�Ç
N�5�b?��B�mJy0o�msp�u]���RXp��p;��5��r��S�^��W�S�r����`ښ��79�>B_\l���Jw���M_Q�=xmp�s\,��UX��{�㒿��p��J      �   r   x�m���@ߡ�������_ǙH��~�1cG���렟� ���k� 5.�S�J�'b�Qވ-P!���#��Q)s�R�}�Oy֝�q��^U?����O��cf?�;#�      �   �   x���An�@E��)rV� �*�݄R7&�Tז<N�'g��H�r���}[���O�X�C�&&|K1�ڢ��]jPvdj�Q�x`�*}�:�k�5�gq0w����O1��-�}A��w�rb��~R�0��:Я,B^�>����U�~�}�Ғ�4�Bkc]���߬6���Hd�؂�:��֯�s�N+';�ҟ�������      �   �  x����n�0����@*0���(�n[%�V�Z�e��b��@��ӯ�C��p���O
�SG�cw>�����n�h��R(яm��MHJ|7|(D��l^��w����K5�&�C�޸:��d0����n�{C�5CK>���\����9(��q��Ɛ\��[G�E��g������{�GӘ~�':x�K��h��޴t���4~y��J~�M� L���0P#%�oW�]�,�}����:���,Sq� �$H�C2��Y�lf�xSƙ�S.�rޔ˦|�)��rޔ���/����<J�(��g(ͣ4�Pz�TH��7�F.����Dl�D��d���|�$r�$K���hR�^��u�΁R����ԟ�"��	5�ȑG�N�{�uh-�,�лϜ�L��)-����W��UE�
�J'      �      x������ � �      �   �  x��WMs�F=������kl���a)(�@R�KKj�͈�XX��>pH��u�X^�H��1�*ʬ��L�{�_�f��H^} ��N�h�^�W��K�&^��б'{E������������pr�.Y�_�>��d��dY��'T�1�zɍ����6.:E޻9������]jf��e�j��Ց'�,�!5'C_4��\q�T���V�+�8M��S���F��6.�z�"����l���4��T����k�<����;�ḿ��3������{�8��\�܉�@wj�.'���yظ��g�f�{��@5���l�)!)���+6�{`���	y��UHB���9��)�r���ll�H=wq1U����$L��RF�p$���\C#�B

k�85�)<Oz�b	��5]�t/y�qۀm@M+Q=v�g� ཻ|Q�"m�O"����;�_�R)5t��CE�Έ�����L��
q���)��m�U���VR�V��{i�D�6x�[\t'�_'�����������e�h�H%�1|����f]�
(hkN��mW�}�Mlyxw1�3 !�u��(��Ɠ�sv29�<��E_G� �*� S�.Dm
*l�����Y�+A�S��fU��n��E�]b�ǟ�6�򥴟�+��:ε�W�/���:�Жꨗ�ɋ���SQs�g���ד_�켨��<�B�����F�W�#�7�0k�,�����A����+E�$��q̣̈́�#K��q[�K�̨z������PZ��Դ�k���\o[�o*����b�*D��Fϳ�C�
��P��}�h�H����S����q}�k���k�8y�d�p-�g8M/���?�؞K��B��^p��G��v���}��7�@r|��a��U��m��qg�7y��r�5��C�E�ı\Qx�k3�匞����V���[WkIv*�ZK-E,��t���n�Fϥ*�2���ۙ���UO� ��O\�Z��k̕/D]�b X3 u�;{ ��XJ��䡜;���k`
C[M�j���ܷD�&B�+�L[;�"��L��,�2S��XjW����RO������WU�K����[]�ƅ�v��[i������Z�x��M�m/@�8s�B����b��ʂ*X�aa�ν�(^�D���r�7��ќMg�E%WБ8���R��!?Z>V��Y'Rߜ��F�>���1H������k��ޠB����u��s"��à�~����S�(c	�j�_CxnD ��
����@x.�J'����ZA�X��(ot'���(j˃��eb#����WCƳ�qʿ�E�p��x��3�=OK[@R^C�Vc ��o�1�A�(>�u���wܭ�WFD;8��:���h�kn[���lr�#$������=	�
�>��������u��f�5�Yߚ��`|ef��|�v@P�-:q��x\�]ѥ�{���>����<ĉ@�f����Y0=�>&���R�h1���#�)�Ls�%G!��LJ]6bбШ�t;djD9x�C�[`�
T���NU�+���XZ���u�6�
}/�f�.ጺ]�67�M���� �3�9�^p,R)3�����_{E��8p8y�?@�����p�V&י����K-ʝ���qW5��>�j�y��������F=[=�_����<�����a"7�jt@m`i��c�Td_�/�@p��t�nu䞓m�x=�Z��=���;Ta�e$��O��F����p�&���vvv��Y�      �   K  x��T�n�0>�O�`'��#�TE]�T�*�e��c#;A�}�=�x��RJ��#{�}3�|�dc떘�H�C�[[� U�w#V(�f�F���1>��^�R�-!�#�x>�x̞�1ځ�++�H�P>�ؽ�9x�PH���0�9A�����`�j��px�@�������m[m�MlnS���@h�	��sG&Q���.�C��"�rE���T�'�l�N�f#�+�鿲��n���ș�G'eNh��䀇�����m7�#�{����ʲMJQ*D�?߫��%�Ϡ�\��.�g�G�n$����QW��3�Oͪ�E�4~��䃑�qT�����@�3�o)-���Ni><��۪�QJk���͊
 �⚥��`�#"��u���GF�����פ��$N�n�J��Ĭ���Z4R7l�Ua�
r�{R6��O��F����B[ӹm�&�1��q�\��Kv�O�ㆋ��+.��՜Y#���TE6�Du�zJ��K#�����Pߋ��[��o%����`�����ޣf�D'F�rx]�E��+��U�Ϯ�@�օ���K�����s��~r      �     x�m�AO� ��ï�/h`�G��X��/^pK,�.��ݸ��F�M�pz���{o���◃��`G`� ��W�.Ls�T��0I������ JmC�$A	�c<� O.�}pq��M�i�k��iR�ë?�6v�b��lC��q�{�B����YR�oר6���,<M45I���	iFj��f\i2��%O<#i���=�Im��p��ii	��8Uw~�R�Ms�P���6�>���'���m�v�ø��$q���.���'1���2U��Ub�5cV�GM�<D��      �     x�M��j�0Eף���XRb��4!-ͫ4��%��-j�B�&��W�K	�J�p��}��nh�� ,�9�9pk���Dۑ���oXE�'� &2���9I={GKw�:�c�rjp����Y��-U�ҽ�HO�-Fr��V&�@���Uc�&YV�����՟�YW����, :9Q:G�D�U]7Y�p	|y�z������D1���Q��a�S���C��Ha���%�Z�$�%���qv���04��6��"�Ǚ�Q��V�<^��,X�M|CrM!���p=      �   �  x�]��n�0���S�6�@O��]�Eڠ�:腵	D�,��-�=J�=_l�'�� �~~�~��-KJ��T�V��4�̊�s��_b�Y��nG�|������'[��Ke�O�����g��>S��$ڒa��Aƚ٠�б<���ЬL+�X71"��?5)u}˖=�ѲD��h�:H��E��u��P��7��f���z�M�l�Tc�c��D=�~|O��{y������ f�I��W=zn����ˠ�{��gx,����ɖ�E�e�9����O+3F�_��k6����W���^���8���2�_���hj��ek�vt�����R��Gj�}.�Pb�?#�e��gM�����7��kz?�f�[�F"q[���i�jD*F�gG�~��Dgʌ��'�R�gC��L�yMc��k�KNg�Lqv�'.3i7S/�1M�Z2      �   U   x�34�p�2�9���%�%��y
& ����
��T�/3�$5/%_!�<�$9���E�1H ���� ,	4�F�l�08F��� ?�#g      �   �   x���=
1���)rQ7�O�
����͐	$��6{Kk��3�`�f��x��TK�F�w�ʦO(����hr�`���k,�v�;Jc�>K����*�](U�+zo���p�n�cr섪@�D��#��S���2�1�uqߙ)�&��7E�i|MWn�V� �gc"��}�6�;̇�      �   W   x�34�tO�/JO��)MN,�445�tN,*���S�K-)�/��L���MLI�24���������KJ-J��u�,�K�T�p������� �q�      �   �   x�u�Q�0ǟ�O�/@�<#H,!!^�ۅfM+�|{�G汿^��]R�����
*G˺�"�)M�|���j>[��2Z����稍�^��R�X<A	|aO��ݦ�}�78�����e&MU���� >��d=�*�Rh)����� Z�n�LQ��gՍj8:�U@�~u�
[���B8&�1[�M?3�O������?ڵ��w�k�t�@!?�������?K�3:�� x ���l      �   J   x�34�LLN�<�9O�R!�,5���(��5'5��(?/3Y��������*����b��gJfqAbQ~1��=... ��#�     