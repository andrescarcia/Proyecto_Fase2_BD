PGDMP         0                {            DB_StarWars_project    15.3    15.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17153    DB_StarWars_project    DATABASE     �   CREATE DATABASE "DB_StarWars_project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 %   DROP DATABASE "DB_StarWars_project";
                postgres    false            �           1247    17354    dieta_domain    DOMAIN     P  CREATE DOMAIN public.dieta_domain AS character varying(15)
	CONSTRAINT dieta_domain_check CHECK (((VALUE)::text = ANY ((ARRAY['herbívoro'::character varying, 'carnívoro'::character varying, 'omnívoro'::character varying, 'carroñero'::character varying, 'geófago'::character varying, 'electrófago'::character varying])::text[])));
 !   DROP DOMAIN public.dieta_domain;
       public          postgres    false            �           1247    17254    genero_domain    DOMAIN     �   CREATE DOMAIN public.genero_domain AS character varying(15)
	CONSTRAINT genero_domain_check CHECK (((VALUE)::text = ANY ((ARRAY['M'::character varying, 'F'::character varying, 'Desc'::character varying, 'Otro'::character varying])::text[])));
 "   DROP DOMAIN public.genero_domain;
       public          postgres    false            �           1247    17257    tipo_actor_domain    DOMAIN     �   CREATE DOMAIN public.tipo_actor_domain AS character varying(15)
	CONSTRAINT tipo_actor_domain_check CHECK (((VALUE)::text = ANY ((ARRAY['interpreta'::character varying, 'presta su voz'::character varying])::text[])));
 &   DROP DOMAIN public.tipo_actor_domain;
       public          postgres    false            r           1247    17192    tipo_pelicula_domain    DOMAIN     �   CREATE DOMAIN public.tipo_pelicula_domain AS character varying(10)
	CONSTRAINT tipo_pelicula_domain_check CHECK (((VALUE)::text = ANY ((ARRAY['animada'::character varying, 'liveaction'::character varying])::text[])));
 )   DROP DOMAIN public.tipo_pelicula_domain;
       public          postgres    false            y           1247    17212    tipo_serie_domain    DOMAIN     �   CREATE DOMAIN public.tipo_serie_domain AS character varying(10)
	CONSTRAINT tipo_serie_domain_check CHECK (((VALUE)::text = ANY ((ARRAY['animada'::character varying, 'liveaction'::character varying])::text[])));
 &   DROP DOMAIN public.tipo_serie_domain;
       public          postgres    false            �           1247    17460    tripulacion_domain    DOMAIN     �   CREATE DOMAIN public.tripulacion_domain AS character varying(15)
	CONSTRAINT tripulacion_domain_check CHECK (((VALUE)::text = ANY ((ARRAY['piloto'::character varying, 'copiloto'::character varying, 'artillero'::character varying])::text[])));
 '   DROP DOMAIN public.tripulacion_domain;
       public          postgres    false            �            1255    17209    calcular_ganancia()    FUNCTION       CREATE FUNCTION public.calcular_ganancia() RETURNS trigger
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
       public          postgres    false            �            1259    17259    actor    TABLE       CREATE TABLE public.actor (
    nombre_principal_actor character varying(50) NOT NULL,
    apellido_actor character varying(50) NOT NULL,
    fecha_nacimiento date,
    genero public.genero_domain,
    nacionalidad character varying(50),
    tipo public.tipo_actor_domain
);
    DROP TABLE public.actor;
       public         heap    postgres    false    906    902            �            1259    17311    afiliación    TABLE     �   CREATE TABLE public."afiliación" (
    nombre_af character varying(50) NOT NULL,
    tipo_af character varying(50),
    nom_planeta character varying(50) NOT NULL
);
 !   DROP TABLE public."afiliación";
       public         heap    postgres    false            �            1259    17498    afiliado    TABLE     �   CREATE TABLE public.afiliado (
    nombre_personaje character varying(50) NOT NULL,
    nombre_af character varying(50) NOT NULL,
    fecha_af date NOT NULL
);
    DROP TABLE public.afiliado;
       public         heap    postgres    false            �            1259    17482    aparece    TABLE     t   CREATE TABLE public.aparece (
    nombre_personaje character varying(50) NOT NULL,
    id_medio integer NOT NULL
);
    DROP TABLE public.aparece;
       public         heap    postgres    false            �            1259    17481    aparece_id_medio_seq    SEQUENCE     �   CREATE SEQUENCE public.aparece_id_medio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.aparece_id_medio_seq;
       public          postgres    false    251                        0    0    aparece_id_medio_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.aparece_id_medio_seq OWNED BY public.aparece.id_medio;
          public          postgres    false    250            �            1259    17291    ciudad    TABLE     �   CREATE TABLE public.ciudad (
    nombre_ciudad character varying(50) NOT NULL,
    nom_planeta character varying(50) NOT NULL
);
    DROP TABLE public.ciudad;
       public         heap    postgres    false            �            1259    17420    combate    TABLE     �   CREATE TABLE public.combate (
    participante1 character varying(50) NOT NULL,
    participante2 character varying(50) NOT NULL,
    id_medio integer NOT NULL,
    fecha_combate date NOT NULL,
    lugar_combate character varying(100)
);
    DROP TABLE public.combate;
       public         heap    postgres    false            �            1259    17419    combate_id_medio_seq    SEQUENCE     �   CREATE SEQUENCE public.combate_id_medio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.combate_id_medio_seq;
       public          postgres    false    245                       0    0    combate_id_medio_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.combate_id_medio_seq OWNED BY public.combate.id_medio;
          public          postgres    false    244            �            1259    17357    criatura    TABLE     �   CREATE TABLE public.criatura (
    id_criatura integer NOT NULL,
    color_piel character varying(50),
    dieta public.dieta_domain
);
    DROP TABLE public.criatura;
       public         heap    postgres    false    937            �            1259    17356    criatura_id_criatura_seq    SEQUENCE     �   CREATE SEQUENCE public.criatura_id_criatura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.criatura_id_criatura_seq;
       public          postgres    false    239                       0    0    criatura_id_criatura_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.criatura_id_criatura_seq OWNED BY public.criatura.id_criatura;
          public          postgres    false    238            �            1259    17443    dueño    TABLE     �   CREATE TABLE public."dueño" (
    nombre_personaje character varying(50) NOT NULL,
    fecha_compra date NOT NULL,
    id_nave integer NOT NULL
);
    DROP TABLE public."dueño";
       public         heap    postgres    false            �            1259    17442    dueño_id_nave_seq    SEQUENCE     �   CREATE SEQUENCE public."dueño_id_nave_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."dueño_id_nave_seq";
       public          postgres    false    247                       0    0    dueño_id_nave_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."dueño_id_nave_seq" OWNED BY public."dueño".id_nave;
          public          postgres    false    246            �            1259    17322    especie    TABLE     �   CREATE TABLE public.especie (
    id_especie integer NOT NULL,
    idioma character varying(50),
    es_robot boolean,
    es_humano boolean,
    es_criatura boolean
);
    DROP TABLE public.especie;
       public         heap    postgres    false            �            1259    17321    especie_id_especie_seq    SEQUENCE     �   CREATE SEQUENCE public.especie_id_especie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.especie_id_especie_seq;
       public          postgres    false    233                       0    0    especie_id_especie_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.especie_id_especie_seq OWNED BY public.especie.id_especie;
          public          postgres    false    232            �            1259    17341    humano    TABLE     �   CREATE TABLE public.humano (
    id_humano integer NOT NULL,
    fecha_nacimiento date,
    fecha_muerte date,
    CONSTRAINT chk_fechas CHECK ((fecha_nacimiento < fecha_muerte))
);
    DROP TABLE public.humano;
       public         heap    postgres    false            �            1259    17340    humano_id_humano_seq    SEQUENCE     �   CREATE SEQUENCE public.humano_id_humano_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.humano_id_humano_seq;
       public          postgres    false    237                       0    0    humano_id_humano_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.humano_id_humano_seq OWNED BY public.humano.id_humano;
          public          postgres    false    236            �            1259    17281    idioma    TABLE     z   CREATE TABLE public.idioma (
    idioma character varying(50) NOT NULL,
    nom_planeta character varying(50) NOT NULL
);
    DROP TABLE public.idioma;
       public         heap    postgres    false            �            1259    17398    interpretado    TABLE     �   CREATE TABLE public.interpretado (
    id_medio integer NOT NULL,
    nombre_personaje character varying(50) NOT NULL,
    nombre_principal_actor character varying(50) NOT NULL,
    apellido_actor character varying(50) NOT NULL
);
     DROP TABLE public.interpretado;
       public         heap    postgres    false            �            1259    17397    interpretado_id_medio_seq    SEQUENCE     �   CREATE SEQUENCE public.interpretado_id_medio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.interpretado_id_medio_seq;
       public          postgres    false    243                       0    0    interpretado_id_medio_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.interpretado_id_medio_seq OWNED BY public.interpretado.id_medio;
          public          postgres    false    242            �            1259    17301    lugares_interes    TABLE     �   CREATE TABLE public.lugares_interes (
    nom_ciudad character varying(50) NOT NULL,
    lugar character varying(50) NOT NULL
);
 #   DROP TABLE public.lugares_interes;
       public         heap    postgres    false            �            1259    17163    medio    TABLE     B  CREATE TABLE public.medio (
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
       public         heap    postgres    false            �            1259    17162    medio_id_medio_seq    SEQUENCE     �   CREATE SEQUENCE public.medio_id_medio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.medio_id_medio_seq;
       public          postgres    false    217                       0    0    medio_id_medio_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.medio_id_medio_seq OWNED BY public.medio.id_medio;
          public          postgres    false    216            �            1259    17155    nave    TABLE     �  CREATE TABLE public.nave (
    id_nave integer NOT NULL,
    nombre_nave character varying(50),
    fabricante character varying(50),
    longitud integer,
    uso character varying(50),
    modelo character varying(50),
    CONSTRAINT chk_destructorasestelares CHECK ((((modelo)::text <> 'Destructoras Estelares'::text) OR ((longitud > 900) AND ((uso)::text = 'combate'::text))))
);
    DROP TABLE public.nave;
       public         heap    postgres    false            �            1259    17154    nave_id_nave_seq    SEQUENCE     �   CREATE SEQUENCE public.nave_id_nave_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.nave_id_nave_seq;
       public          postgres    false    215                       0    0    nave_id_nave_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.nave_id_nave_seq OWNED BY public.nave.id_nave;
          public          postgres    false    214            �            1259    17195    pelicula    TABLE       CREATE TABLE public.pelicula (
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
       public         heap    postgres    false    882            �            1259    17194    pelicula_id_pelicula_seq    SEQUENCE     �   CREATE SEQUENCE public.pelicula_id_pelicula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.pelicula_id_pelicula_seq;
       public          postgres    false    219            	           0    0    pelicula_id_pelicula_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.pelicula_id_pelicula_seq OWNED BY public.pelicula.id_pelicula;
          public          postgres    false    218            �            1259    17378 	   personaje    TABLE     ~  CREATE TABLE public.personaje (
    nombre_personaje character varying(50) NOT NULL,
    genero public.genero_domain,
    altura double precision,
    peso double precision,
    id_especie integer NOT NULL,
    nom_planeta character varying(50) NOT NULL,
    CONSTRAINT chk_personaje_valorespositivos CHECK (((altura > (0)::double precision) AND (peso > (0)::double precision)))
);
    DROP TABLE public.personaje;
       public         heap    postgres    false    902            �            1259    17377    personaje_id_especie_seq    SEQUENCE     �   CREATE SEQUENCE public.personaje_id_especie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.personaje_id_especie_seq;
       public          postgres    false    241            
           0    0    personaje_id_especie_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.personaje_id_especie_seq OWNED BY public.personaje.id_especie;
          public          postgres    false    240            �            1259    17276    planeta    TABLE     �   CREATE TABLE public.planeta (
    nombre_planeta character varying(50) NOT NULL,
    clima character varying(50),
    sector character varying(50),
    sistema_solar character varying(50)
);
    DROP TABLE public.planeta;
       public         heap    postgres    false            �            1259    17242 
   plataforma    TABLE     {   CREATE TABLE public.plataforma (
    id_videojuego integer NOT NULL,
    plataforma_dist character varying(50) NOT NULL
);
    DROP TABLE public.plataforma;
       public         heap    postgres    false            �            1259    17241    plataforma_id_videojuego_seq    SEQUENCE     �   CREATE SEQUENCE public.plataforma_id_videojuego_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.plataforma_id_videojuego_seq;
       public          postgres    false    225                       0    0    plataforma_id_videojuego_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.plataforma_id_videojuego_seq OWNED BY public.plataforma.id_videojuego;
          public          postgres    false    224            �            1259    17329    robot    TABLE     �   CREATE TABLE public.robot (
    id_robot integer NOT NULL,
    creador_robot character varying(50),
    clase_robot character varying(50)
);
    DROP TABLE public.robot;
       public         heap    postgres    false            �            1259    17328    robot_id_robot_seq    SEQUENCE     �   CREATE SEQUENCE public.robot_id_robot_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.robot_id_robot_seq;
       public          postgres    false    235                       0    0    robot_id_robot_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.robot_id_robot_seq OWNED BY public.robot.id_robot;
          public          postgres    false    234            �            1259    17215    serie    TABLE     M  CREATE TABLE public.serie (
    id_serie integer NOT NULL,
    nombre_creador_serie character varying(50),
    apellido_creador_serie character varying(50),
    total_episodio integer,
    canal character varying(50),
    tipo_serie public.tipo_serie_domain,
    CONSTRAINT chk_serie_valorespositivos CHECK ((total_episodio > 0))
);
    DROP TABLE public.serie;
       public         heap    postgres    false    889            �            1259    17214    serie_id_serie_seq    SEQUENCE     �   CREATE SEQUENCE public.serie_id_serie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.serie_id_serie_seq;
       public          postgres    false    221                       0    0    serie_id_serie_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.serie_id_serie_seq OWNED BY public.serie.id_serie;
          public          postgres    false    220            �            1259    17463    tripula    TABLE     �   CREATE TABLE public.tripula (
    nombre_personaje character varying(50) NOT NULL,
    id_nave integer NOT NULL,
    "tipo_tripulación" public.tripulacion_domain
);
    DROP TABLE public.tripula;
       public         heap    postgres    false    956            �            1259    17462    tripula_id_nave_seq    SEQUENCE     �   CREATE SEQUENCE public.tripula_id_nave_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tripula_id_nave_seq;
       public          postgres    false    249                       0    0    tripula_id_nave_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tripula_id_nave_seq OWNED BY public.tripula.id_nave;
          public          postgres    false    248            �            1259    17230 
   videojuego    TABLE     �   CREATE TABLE public.videojuego (
    id_videojuego integer NOT NULL,
    tipo_juego character varying(50),
    "compañía" character varying(50)
);
    DROP TABLE public.videojuego;
       public         heap    postgres    false            �            1259    17229    videojuego_id_videojuego_seq    SEQUENCE     �   CREATE SEQUENCE public.videojuego_id_videojuego_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.videojuego_id_videojuego_seq;
       public          postgres    false    223                       0    0    videojuego_id_videojuego_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.videojuego_id_videojuego_seq OWNED BY public.videojuego.id_videojuego;
          public          postgres    false    222            �           2604    17485    aparece id_medio    DEFAULT     t   ALTER TABLE ONLY public.aparece ALTER COLUMN id_medio SET DEFAULT nextval('public.aparece_id_medio_seq'::regclass);
 ?   ALTER TABLE public.aparece ALTER COLUMN id_medio DROP DEFAULT;
       public          postgres    false    251    250    251            �           2604    17423    combate id_medio    DEFAULT     t   ALTER TABLE ONLY public.combate ALTER COLUMN id_medio SET DEFAULT nextval('public.combate_id_medio_seq'::regclass);
 ?   ALTER TABLE public.combate ALTER COLUMN id_medio DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    17360    criatura id_criatura    DEFAULT     |   ALTER TABLE ONLY public.criatura ALTER COLUMN id_criatura SET DEFAULT nextval('public.criatura_id_criatura_seq'::regclass);
 C   ALTER TABLE public.criatura ALTER COLUMN id_criatura DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    17446    dueño id_nave    DEFAULT     t   ALTER TABLE ONLY public."dueño" ALTER COLUMN id_nave SET DEFAULT nextval('public."dueño_id_nave_seq"'::regclass);
 ?   ALTER TABLE public."dueño" ALTER COLUMN id_nave DROP DEFAULT;
       public          postgres    false    246    247    247            �           2604    17325    especie id_especie    DEFAULT     x   ALTER TABLE ONLY public.especie ALTER COLUMN id_especie SET DEFAULT nextval('public.especie_id_especie_seq'::regclass);
 A   ALTER TABLE public.especie ALTER COLUMN id_especie DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    17344    humano id_humano    DEFAULT     t   ALTER TABLE ONLY public.humano ALTER COLUMN id_humano SET DEFAULT nextval('public.humano_id_humano_seq'::regclass);
 ?   ALTER TABLE public.humano ALTER COLUMN id_humano DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    17401    interpretado id_medio    DEFAULT     ~   ALTER TABLE ONLY public.interpretado ALTER COLUMN id_medio SET DEFAULT nextval('public.interpretado_id_medio_seq'::regclass);
 D   ALTER TABLE public.interpretado ALTER COLUMN id_medio DROP DEFAULT;
       public          postgres    false    243    242    243            �           2604    17166    medio id_medio    DEFAULT     p   ALTER TABLE ONLY public.medio ALTER COLUMN id_medio SET DEFAULT nextval('public.medio_id_medio_seq'::regclass);
 =   ALTER TABLE public.medio ALTER COLUMN id_medio DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    17158    nave id_nave    DEFAULT     l   ALTER TABLE ONLY public.nave ALTER COLUMN id_nave SET DEFAULT nextval('public.nave_id_nave_seq'::regclass);
 ;   ALTER TABLE public.nave ALTER COLUMN id_nave DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    17198    pelicula id_pelicula    DEFAULT     |   ALTER TABLE ONLY public.pelicula ALTER COLUMN id_pelicula SET DEFAULT nextval('public.pelicula_id_pelicula_seq'::regclass);
 C   ALTER TABLE public.pelicula ALTER COLUMN id_pelicula DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    17381    personaje id_especie    DEFAULT     |   ALTER TABLE ONLY public.personaje ALTER COLUMN id_especie SET DEFAULT nextval('public.personaje_id_especie_seq'::regclass);
 C   ALTER TABLE public.personaje ALTER COLUMN id_especie DROP DEFAULT;
       public          postgres    false    240    241    241            �           2604    17245    plataforma id_videojuego    DEFAULT     �   ALTER TABLE ONLY public.plataforma ALTER COLUMN id_videojuego SET DEFAULT nextval('public.plataforma_id_videojuego_seq'::regclass);
 G   ALTER TABLE public.plataforma ALTER COLUMN id_videojuego DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    17332    robot id_robot    DEFAULT     p   ALTER TABLE ONLY public.robot ALTER COLUMN id_robot SET DEFAULT nextval('public.robot_id_robot_seq'::regclass);
 =   ALTER TABLE public.robot ALTER COLUMN id_robot DROP DEFAULT;
       public          postgres    false    235    234    235            �           2604    17218    serie id_serie    DEFAULT     p   ALTER TABLE ONLY public.serie ALTER COLUMN id_serie SET DEFAULT nextval('public.serie_id_serie_seq'::regclass);
 =   ALTER TABLE public.serie ALTER COLUMN id_serie DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    17466    tripula id_nave    DEFAULT     r   ALTER TABLE ONLY public.tripula ALTER COLUMN id_nave SET DEFAULT nextval('public.tripula_id_nave_seq'::regclass);
 >   ALTER TABLE public.tripula ALTER COLUMN id_nave DROP DEFAULT;
       public          postgres    false    249    248    249            �           2604    17233    videojuego id_videojuego    DEFAULT     �   ALTER TABLE ONLY public.videojuego ALTER COLUMN id_videojuego SET DEFAULT nextval('public.videojuego_id_videojuego_seq'::regclass);
 G   ALTER TABLE public.videojuego ALTER COLUMN id_videojuego DROP DEFAULT;
       public          postgres    false    223    222    223            �          0    17259    actor 
   TABLE DATA           u   COPY public.actor (nombre_principal_actor, apellido_actor, fecha_nacimiento, genero, nacionalidad, tipo) FROM stdin;
    public          postgres    false    226   ��       �          0    17311    afiliación 
   TABLE DATA           H   COPY public."afiliación" (nombre_af, tipo_af, nom_planeta) FROM stdin;
    public          postgres    false    231   !�       �          0    17498    afiliado 
   TABLE DATA           I   COPY public.afiliado (nombre_personaje, nombre_af, fecha_af) FROM stdin;
    public          postgres    false    252   �       �          0    17482    aparece 
   TABLE DATA           =   COPY public.aparece (nombre_personaje, id_medio) FROM stdin;
    public          postgres    false    251   I�       �          0    17291    ciudad 
   TABLE DATA           <   COPY public.ciudad (nombre_ciudad, nom_planeta) FROM stdin;
    public          postgres    false    229   ��       �          0    17420    combate 
   TABLE DATA           g   COPY public.combate (participante1, participante2, id_medio, fecha_combate, lugar_combate) FROM stdin;
    public          postgres    false    245   ��       �          0    17357    criatura 
   TABLE DATA           B   COPY public.criatura (id_criatura, color_piel, dieta) FROM stdin;
    public          postgres    false    239   �       �          0    17443    dueño 
   TABLE DATA           K   COPY public."dueño" (nombre_personaje, fecha_compra, id_nave) FROM stdin;
    public          postgres    false    247   ��       �          0    17322    especie 
   TABLE DATA           W   COPY public.especie (id_especie, idioma, es_robot, es_humano, es_criatura) FROM stdin;
    public          postgres    false    233   e�       �          0    17341    humano 
   TABLE DATA           K   COPY public.humano (id_humano, fecha_nacimiento, fecha_muerte) FROM stdin;
    public          postgres    false    237   ��       �          0    17281    idioma 
   TABLE DATA           5   COPY public.idioma (idioma, nom_planeta) FROM stdin;
    public          postgres    false    228   G�       �          0    17398    interpretado 
   TABLE DATA           j   COPY public.interpretado (id_medio, nombre_personaje, nombre_principal_actor, apellido_actor) FROM stdin;
    public          postgres    false    243   %�       �          0    17301    lugares_interes 
   TABLE DATA           <   COPY public.lugares_interes (nom_ciudad, lugar) FROM stdin;
    public          postgres    false    230   ��       �          0    17163    medio 
   TABLE DATA           {   COPY public.medio (id_medio, "título", fecha_estreno, rating, sinopsis, es_pelicula, es_serie, es_videojuego) FROM stdin;
    public          postgres    false    217   �       �          0    17155    nave 
   TABLE DATA           W   COPY public.nave (id_nave, nombre_nave, fabricante, longitud, uso, modelo) FROM stdin;
    public          postgres    false    215   l�       �          0    17195    pelicula 
   TABLE DATA           �   COPY public.pelicula (id_pelicula, nombre_director, apellido_director, "duración", distribuidor, coste_prod, tipo_pelicula, ingreso_taquilla, ganancia) FROM stdin;
    public          postgres    false    219   ��       �          0    17378 	   personaje 
   TABLE DATA           d   COPY public.personaje (nombre_personaje, genero, altura, peso, id_especie, nom_planeta) FROM stdin;
    public          postgres    false    241   ��       �          0    17276    planeta 
   TABLE DATA           O   COPY public.planeta (nombre_planeta, clima, sector, sistema_solar) FROM stdin;
    public          postgres    false    227   1�       �          0    17242 
   plataforma 
   TABLE DATA           D   COPY public.plataforma (id_videojuego, plataforma_dist) FROM stdin;
    public          postgres    false    225   ��       �          0    17329    robot 
   TABLE DATA           E   COPY public.robot (id_robot, creador_robot, clase_robot) FROM stdin;
    public          postgres    false    235   ��       �          0    17215    serie 
   TABLE DATA           z   COPY public.serie (id_serie, nombre_creador_serie, apellido_creador_serie, total_episodio, canal, tipo_serie) FROM stdin;
    public          postgres    false    221   ��       �          0    17463    tripula 
   TABLE DATA           Q   COPY public.tripula (nombre_personaje, id_nave, "tipo_tripulación") FROM stdin;
    public          postgres    false    249   *�       �          0    17230 
   videojuego 
   TABLE DATA           M   COPY public.videojuego (id_videojuego, tipo_juego, "compañía") FROM stdin;
    public          postgres    false    223   #�                  0    0    aparece_id_medio_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.aparece_id_medio_seq', 1, false);
          public          postgres    false    250                       0    0    combate_id_medio_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.combate_id_medio_seq', 1, false);
          public          postgres    false    244                       0    0    criatura_id_criatura_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.criatura_id_criatura_seq', 11, true);
          public          postgres    false    238                       0    0    dueño_id_nave_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."dueño_id_nave_seq"', 1, false);
          public          postgres    false    246                       0    0    especie_id_especie_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.especie_id_especie_seq', 56, true);
          public          postgres    false    232                       0    0    humano_id_humano_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.humano_id_humano_seq', 8, true);
          public          postgres    false    236                       0    0    interpretado_id_medio_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.interpretado_id_medio_seq', 1, false);
          public          postgres    false    242                       0    0    medio_id_medio_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.medio_id_medio_seq', 27, true);
          public          postgres    false    216                       0    0    nave_id_nave_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.nave_id_nave_seq', 1, false);
          public          postgres    false    214                       0    0    pelicula_id_pelicula_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pelicula_id_pelicula_seq', 18, true);
          public          postgres    false    218                       0    0    personaje_id_especie_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.personaje_id_especie_seq', 1, true);
          public          postgres    false    240                       0    0    plataforma_id_videojuego_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.plataforma_id_videojuego_seq', 1, false);
          public          postgres    false    224                       0    0    robot_id_robot_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.robot_id_robot_seq', 9, true);
          public          postgres    false    234                       0    0    serie_id_serie_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.serie_id_serie_seq', 1, false);
          public          postgres    false    220                       0    0    tripula_id_nave_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tripula_id_nave_seq', 1, false);
          public          postgres    false    248                       0    0    videojuego_id_videojuego_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.videojuego_id_videojuego_seq', 1, false);
          public          postgres    false    222                       2606    17315    afiliación afiliación_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."afiliación"
    ADD CONSTRAINT "afiliación_pkey" PRIMARY KEY (nombre_af);
 J   ALTER TABLE ONLY public."afiliación" DROP CONSTRAINT "afiliación_pkey";
       public            postgres    false    231                       2606    17295    ciudad ciudad_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (nombre_ciudad);
 <   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_pkey;
       public            postgres    false    229                       2606    17364    criatura criatura_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.criatura
    ADD CONSTRAINT criatura_pkey PRIMARY KEY (id_criatura);
 @   ALTER TABLE ONLY public.criatura DROP CONSTRAINT criatura_pkey;
       public            postgres    false    239                       2606    17327    especie especie_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.especie
    ADD CONSTRAINT especie_pkey PRIMARY KEY (id_especie);
 >   ALTER TABLE ONLY public.especie DROP CONSTRAINT especie_pkey;
       public            postgres    false    233                       2606    17347    humano humano_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.humano
    ADD CONSTRAINT humano_pkey PRIMARY KEY (id_humano);
 <   ALTER TABLE ONLY public.humano DROP CONSTRAINT humano_pkey;
       public            postgres    false    237            �           2606    17171    medio medio_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.medio
    ADD CONSTRAINT medio_pkey PRIMARY KEY (id_medio);
 :   ALTER TABLE ONLY public.medio DROP CONSTRAINT medio_pkey;
       public            postgres    false    217            �           2606    17161    nave nave_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.nave
    ADD CONSTRAINT nave_pkey PRIMARY KEY (id_nave);
 8   ALTER TABLE ONLY public.nave DROP CONSTRAINT nave_pkey;
       public            postgres    false    215                        2606    17203    pelicula pelicula_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT pelicula_pkey PRIMARY KEY (id_pelicula);
 @   ALTER TABLE ONLY public.pelicula DROP CONSTRAINT pelicula_pkey;
       public            postgres    false    219                       2606    17386    personaje personaje_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.personaje
    ADD CONSTRAINT personaje_pkey PRIMARY KEY (nombre_personaje);
 B   ALTER TABLE ONLY public.personaje DROP CONSTRAINT personaje_pkey;
       public            postgres    false    241                       2606    17265    actor pk_actor 
   CONSTRAINT     p   ALTER TABLE ONLY public.actor
    ADD CONSTRAINT pk_actor PRIMARY KEY (nombre_principal_actor, apellido_actor);
 8   ALTER TABLE ONLY public.actor DROP CONSTRAINT pk_actor;
       public            postgres    false    226    226            (           2606    17502 !   afiliado pk_afliciacion_personaje 
   CONSTRAINT     �   ALTER TABLE ONLY public.afiliado
    ADD CONSTRAINT pk_afliciacion_personaje PRIMARY KEY (nombre_personaje, nombre_af, fecha_af);
 K   ALTER TABLE ONLY public.afiliado DROP CONSTRAINT pk_afliciacion_personaje;
       public            postgres    false    252    252    252                       2606    17285    idioma pk_idioma 
   CONSTRAINT     _   ALTER TABLE ONLY public.idioma
    ADD CONSTRAINT pk_idioma PRIMARY KEY (idioma, nom_planeta);
 :   ALTER TABLE ONLY public.idioma DROP CONSTRAINT pk_idioma;
       public            postgres    false    228    228                       2606    17305     lugares_interes pk_lugar_interes 
   CONSTRAINT     m   ALTER TABLE ONLY public.lugares_interes
    ADD CONSTRAINT pk_lugar_interes PRIMARY KEY (lugar, nom_ciudad);
 J   ALTER TABLE ONLY public.lugares_interes DROP CONSTRAINT pk_lugar_interes;
       public            postgres    false    230    230                        2606    17425    combate pk_participantes_medio 
   CONSTRAINT     �   ALTER TABLE ONLY public.combate
    ADD CONSTRAINT pk_participantes_medio PRIMARY KEY (participante1, participante2, id_medio);
 H   ALTER TABLE ONLY public.combate DROP CONSTRAINT pk_participantes_medio;
       public            postgres    false    245    245    245                       2606    17403 %   interpretado pk_personaje_actor_medio 
   CONSTRAINT     �   ALTER TABLE ONLY public.interpretado
    ADD CONSTRAINT pk_personaje_actor_medio PRIMARY KEY (id_medio, nombre_personaje, nombre_principal_actor, apellido_actor);
 O   ALTER TABLE ONLY public.interpretado DROP CONSTRAINT pk_personaje_actor_medio;
       public            postgres    false    243    243    243    243            &           2606    17487    aparece pk_personaje_medio 
   CONSTRAINT     p   ALTER TABLE ONLY public.aparece
    ADD CONSTRAINT pk_personaje_medio PRIMARY KEY (nombre_personaje, id_medio);
 D   ALTER TABLE ONLY public.aparece DROP CONSTRAINT pk_personaje_medio;
       public            postgres    false    251    251            $           2606    17470    tripula pk_personaje_nave 
   CONSTRAINT     n   ALTER TABLE ONLY public.tripula
    ADD CONSTRAINT pk_personaje_nave PRIMARY KEY (nombre_personaje, id_nave);
 C   ALTER TABLE ONLY public.tripula DROP CONSTRAINT pk_personaje_nave;
       public            postgres    false    249    249            "           2606    17448    dueño pk_personaje_nave_fecha 
   CONSTRAINT     �   ALTER TABLE ONLY public."dueño"
    ADD CONSTRAINT pk_personaje_nave_fecha PRIMARY KEY (nombre_personaje, id_nave, fecha_compra);
 J   ALTER TABLE ONLY public."dueño" DROP CONSTRAINT pk_personaje_nave_fecha;
       public            postgres    false    247    247    247                       2606    17247    plataforma pk_plataforma 
   CONSTRAINT     r   ALTER TABLE ONLY public.plataforma
    ADD CONSTRAINT pk_plataforma PRIMARY KEY (id_videojuego, plataforma_dist);
 B   ALTER TABLE ONLY public.plataforma DROP CONSTRAINT pk_plataforma;
       public            postgres    false    225    225            
           2606    17280    planeta planeta_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.planeta
    ADD CONSTRAINT planeta_pkey PRIMARY KEY (nombre_planeta);
 >   ALTER TABLE ONLY public.planeta DROP CONSTRAINT planeta_pkey;
       public            postgres    false    227                       2606    17334    robot robot_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.robot
    ADD CONSTRAINT robot_pkey PRIMARY KEY (id_robot);
 :   ALTER TABLE ONLY public.robot DROP CONSTRAINT robot_pkey;
       public            postgres    false    235                       2606    17223    serie serie_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.serie
    ADD CONSTRAINT serie_pkey PRIMARY KEY (id_serie);
 :   ALTER TABLE ONLY public.serie DROP CONSTRAINT serie_pkey;
       public            postgres    false    221                       2606    17235    videojuego videojuego_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.videojuego
    ADD CONSTRAINT videojuego_pkey PRIMARY KEY (id_videojuego);
 D   ALTER TABLE ONLY public.videojuego DROP CONSTRAINT videojuego_pkey;
       public            postgres    false    223            D           2620    17210 "   pelicula calcular_ganancia_trigger    TRIGGER     �   CREATE TRIGGER calcular_ganancia_trigger BEFORE INSERT OR UPDATE ON public.pelicula FOR EACH ROW EXECUTE FUNCTION public.calcular_ganancia();
 ;   DROP TRIGGER calcular_ganancia_trigger ON public.pelicula;
       public          postgres    false    219    253            0           2606    17316 (   afiliación afiliación_nom_planeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."afiliación"
    ADD CONSTRAINT "afiliación_nom_planeta_fkey" FOREIGN KEY (nom_planeta) REFERENCES public.planeta(nombre_planeta) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."afiliación" DROP CONSTRAINT "afiliación_nom_planeta_fkey";
       public          postgres    false    227    231    3338            B           2606    17508     afiliado fk_afiliado_afiliación    FK CONSTRAINT     �   ALTER TABLE ONLY public.afiliado
    ADD CONSTRAINT "fk_afiliado_afiliación" FOREIGN KEY (nombre_af) REFERENCES public."afiliación"(nombre_af) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.afiliado DROP CONSTRAINT "fk_afiliado_afiliación";
       public          postgres    false    3346    252    231            C           2606    17503    afiliado fk_afiliado_personaje    FK CONSTRAINT     �   ALTER TABLE ONLY public.afiliado
    ADD CONSTRAINT fk_afiliado_personaje FOREIGN KEY (nombre_personaje) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.afiliado DROP CONSTRAINT fk_afiliado_personaje;
       public          postgres    false    252    3356    241            @           2606    17493    aparece fk_aparece_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.aparece
    ADD CONSTRAINT fk_aparece_medio FOREIGN KEY (id_medio) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.aparece DROP CONSTRAINT fk_aparece_medio;
       public          postgres    false    251    3326    217            A           2606    17488    aparece fk_aparece_personaje    FK CONSTRAINT     �   ALTER TABLE ONLY public.aparece
    ADD CONSTRAINT fk_aparece_personaje FOREIGN KEY (nombre_personaje) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.aparece DROP CONSTRAINT fk_aparece_personaje;
       public          postgres    false    251    241    3356            .           2606    17296    ciudad fk_ciudad_planeta    FK CONSTRAINT     �   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_ciudad_planeta FOREIGN KEY (nom_planeta) REFERENCES public.planeta(nombre_planeta) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT fk_ciudad_planeta;
       public          postgres    false    227    229    3338            9           2606    17436    combate fk_combate_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.combate
    ADD CONSTRAINT fk_combate_medio FOREIGN KEY (id_medio) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.combate DROP CONSTRAINT fk_combate_medio;
       public          postgres    false    217    3326    245            :           2606    17426    combate fk_combate_personaje1    FK CONSTRAINT     �   ALTER TABLE ONLY public.combate
    ADD CONSTRAINT fk_combate_personaje1 FOREIGN KEY (participante1) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.combate DROP CONSTRAINT fk_combate_personaje1;
       public          postgres    false    3356    241    245            ;           2606    17431    combate fk_combate_personaje2    FK CONSTRAINT     �   ALTER TABLE ONLY public.combate
    ADD CONSTRAINT fk_combate_personaje2 FOREIGN KEY (participante2) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.combate DROP CONSTRAINT fk_combate_personaje2;
       public          postgres    false    241    3356    245            3           2606    17365    criatura fk_criatura_especie    FK CONSTRAINT     �   ALTER TABLE ONLY public.criatura
    ADD CONSTRAINT fk_criatura_especie FOREIGN KEY (id_criatura) REFERENCES public.especie(id_especie) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.criatura DROP CONSTRAINT fk_criatura_especie;
       public          postgres    false    239    3348    233            <           2606    17454    dueño fk_dueño_nave    FK CONSTRAINT     �   ALTER TABLE ONLY public."dueño"
    ADD CONSTRAINT "fk_dueño_nave" FOREIGN KEY (id_nave) REFERENCES public.nave(id_nave) ON UPDATE CASCADE ON DELETE SET NULL;
 C   ALTER TABLE ONLY public."dueño" DROP CONSTRAINT "fk_dueño_nave";
       public          postgres    false    215    3324    247            =           2606    17449    dueño fk_dueño_personaje    FK CONSTRAINT     �   ALTER TABLE ONLY public."dueño"
    ADD CONSTRAINT "fk_dueño_personaje" FOREIGN KEY (nombre_personaje) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public."dueño" DROP CONSTRAINT "fk_dueño_personaje";
       public          postgres    false    247    241    3356            2           2606    17348    humano fk_humano_especie    FK CONSTRAINT     �   ALTER TABLE ONLY public.humano
    ADD CONSTRAINT fk_humano_especie FOREIGN KEY (id_humano) REFERENCES public.especie(id_especie) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.humano DROP CONSTRAINT fk_humano_especie;
       public          postgres    false    237    3348    233            -           2606    17286    idioma fk_idioma_planeta    FK CONSTRAINT     �   ALTER TABLE ONLY public.idioma
    ADD CONSTRAINT fk_idioma_planeta FOREIGN KEY (nom_planeta) REFERENCES public.planeta(nombre_planeta) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.idioma DROP CONSTRAINT fk_idioma_planeta;
       public          postgres    false    228    3338    227            6           2606    17414 "   interpretado fk_interpretado_actor    FK CONSTRAINT     �   ALTER TABLE ONLY public.interpretado
    ADD CONSTRAINT fk_interpretado_actor FOREIGN KEY (nombre_principal_actor, apellido_actor) REFERENCES public.actor(nombre_principal_actor, apellido_actor) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.interpretado DROP CONSTRAINT fk_interpretado_actor;
       public          postgres    false    243    226    243    226    3336            7           2606    17409 "   interpretado fk_interpretado_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.interpretado
    ADD CONSTRAINT fk_interpretado_medio FOREIGN KEY (id_medio) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.interpretado DROP CONSTRAINT fk_interpretado_medio;
       public          postgres    false    217    243    3326            8           2606    17404 &   interpretado fk_interpretado_personaje    FK CONSTRAINT     �   ALTER TABLE ONLY public.interpretado
    ADD CONSTRAINT fk_interpretado_personaje FOREIGN KEY (nombre_personaje) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.interpretado DROP CONSTRAINT fk_interpretado_personaje;
       public          postgres    false    241    243    3356            /           2606    17306    lugares_interes fk_lugar_ciudad    FK CONSTRAINT     �   ALTER TABLE ONLY public.lugares_interes
    ADD CONSTRAINT fk_lugar_ciudad FOREIGN KEY (nom_ciudad) REFERENCES public.ciudad(nombre_ciudad) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.lugares_interes DROP CONSTRAINT fk_lugar_ciudad;
       public          postgres    false    230    229    3342            )           2606    17204    pelicula fk_pelicula_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT fk_pelicula_medio FOREIGN KEY (id_pelicula) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.pelicula DROP CONSTRAINT fk_pelicula_medio;
       public          postgres    false    3326    219    217            1           2606    17335    robot fk_robot_especie    FK CONSTRAINT     �   ALTER TABLE ONLY public.robot
    ADD CONSTRAINT fk_robot_especie FOREIGN KEY (id_robot) REFERENCES public.especie(id_especie) ON UPDATE CASCADE ON DELETE SET NULL;
 @   ALTER TABLE ONLY public.robot DROP CONSTRAINT fk_robot_especie;
       public          postgres    false    3348    233    235            *           2606    17224    serie fk_serie_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.serie
    ADD CONSTRAINT fk_serie_medio FOREIGN KEY (id_serie) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 >   ALTER TABLE ONLY public.serie DROP CONSTRAINT fk_serie_medio;
       public          postgres    false    217    3326    221            >           2606    17476    tripula fk_tripula_nave    FK CONSTRAINT     �   ALTER TABLE ONLY public.tripula
    ADD CONSTRAINT fk_tripula_nave FOREIGN KEY (id_nave) REFERENCES public.nave(id_nave) ON UPDATE CASCADE ON DELETE SET NULL;
 A   ALTER TABLE ONLY public.tripula DROP CONSTRAINT fk_tripula_nave;
       public          postgres    false    249    3324    215            ?           2606    17471    tripula fk_tripula_personaje    FK CONSTRAINT     �   ALTER TABLE ONLY public.tripula
    ADD CONSTRAINT fk_tripula_personaje FOREIGN KEY (nombre_personaje) REFERENCES public.personaje(nombre_personaje) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.tripula DROP CONSTRAINT fk_tripula_personaje;
       public          postgres    false    249    3356    241            ,           2606    17248    plataforma fk_videojuego_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.plataforma
    ADD CONSTRAINT fk_videojuego_id FOREIGN KEY (id_videojuego) REFERENCES public.videojuego(id_videojuego) ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.plataforma DROP CONSTRAINT fk_videojuego_id;
       public          postgres    false    223    3332    225            +           2606    17236    videojuego fk_videojuego_medio    FK CONSTRAINT     �   ALTER TABLE ONLY public.videojuego
    ADD CONSTRAINT fk_videojuego_medio FOREIGN KEY (id_videojuego) REFERENCES public.medio(id_medio) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.videojuego DROP CONSTRAINT fk_videojuego_medio;
       public          postgres    false    217    3326    223            4           2606    17387 #   personaje personaje_id_especie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje
    ADD CONSTRAINT personaje_id_especie_fkey FOREIGN KEY (id_especie) REFERENCES public.especie(id_especie) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.personaje DROP CONSTRAINT personaje_id_especie_fkey;
       public          postgres    false    3348    233    241            5           2606    17392 $   personaje personaje_nom_planeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje
    ADD CONSTRAINT personaje_nom_planeta_fkey FOREIGN KEY (nom_planeta) REFERENCES public.planeta(nombre_planeta) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.personaje DROP CONSTRAINT personaje_nom_planeta_fkey;
       public          postgres    false    3338    227    241            �     x�}�Mn�0F��)rW� ˶��G��u��FW6$Jn�eϑ�uH�*��k�={�L�~��kA�Vq��j�0`�F6-q 0<���4`T�δ��n/u],3ߪX���p�bӸ����֣a�Щ��$��zo*:�SW�ұJ4TW��<�^��O���_�Ja����'d��Ҡ�E�[)=o�L��܏ֺ��qO��g���Fj�&�J>/&�]�w����%
��Y-'=��x�ܞ��%�!�B����򺸺�bܞ�<{'�lW�7Q� jH��      �   �   x�m�=N�P���>�˂�Ѧ�8y���Ŏ���g�����PPDgi>͌g����f�7���.�:X+�jUm>��4�6�sb�N����H	��V�IX�K����T6�"���.�$�	YH��;n9'^|�M���+^s���@*ǟ2<���xc�ҒB�I�4Q6��l�JWc���y��Q�o���Tq��������b
.����/O7A�*9��L2<��q��-      �     x�u�QN!E�al LZ�O��j��iM�Ɵ���R0�Zw�ZܘLß5!/!��{�~�l�;��0�+g�[�Fg�(��\H:��Z�����F���w�l
Yq9�+m�3xv�>hKVѠg4�@S.}��7�ul��*����'\	����S�6���wdcS[^�\*z4�L��.K=�7�B�EEZJ^	� ���"��3;V�`tU��Bѧ���^�{2V߅�l�/T���9z��r�'�{���Tq5�u�Mg�N)k�gꬴ��rL�.(���k�       �   k  x�u�QO� ǟ����X�@_uQ��8���B7�-4��}{�
���	���ww�1;lYlNG�ݘ����T��5yӫ1�7��][�dl״��ܷviv;23�&��[[=诧���S[;D�]�ɽ��/��v�v�� ܭͱ���9�N�t�̒bX\CŰʊ�n���d��b��cG,�i�{*�T�<P9�V1�J'U�2�`V!3�	�+2-߂��)`"`��+Vf��c%���T�QU:*��*�U�� WA�
\��u�m��u�Z�:��7������R��7�_'�~����_���kt�H.!��q��b�������	>�L��.��5�ޒ��
9��)Z8귕VqZ�xN��.��}w�      �     x�e�MN�@�דS���@�PA��R� �q,&v5?�g`�6�	��������7���<� ��W��G�hȱGIU��P{�ZT��:�0��v��=��}L���-��Gh|a�+,�Fh�
E�!��-iFCHp���W<����k/�ƽ�'���Z��ky���=iܡ�D4b;��ZG��#���3ʀ^�����#�l���x��=ɜn��CN	˞Z3�e/�~�j._��=ٵ��aL��cA����t����.a�d�)�9���6���7������_�G�      �      x������ � �      �   r   x�m�;
�0��9�X���%j�A��#�bvh���ǟ�V��{W���4,�kI�1WŞu��(��9�9��!)�CE+��1����n&���NL����.�y�XM      �   �   x�5��J�@��w�b_`dg��x�E[ś�d�K�6	�ooJ����ڎ��}{9˩�l�1�["-�F�p�����#$gv!�$���q6!�'�[��־�[�bw�W�7#W��W�H)Z#]��h�؍}A�����.�}�a(tެ�p	����T�r�I�����W�Gv��ǣ��������{xg�py��iz�s �$�E      �   S  x���Mn�0���)��1?˴�ZU�&ɲ+!�����p���$�A�ņ�x�0���R��:���1�Y�d�+%KmM�e��ά&�诪1�j��γ��6�z,�|��[c��|ﲕ��J�.��N�1x����CS����j����軭^���c��!0��T��i:�uŬ�Z�è��L��Ez�d��4g�����ئ�+E�(�E�v�g���hD^�b�T�*����/���Y���r�?�)�H.�(�0r�x
!&��B
}�Ol
!�9�g]�&�fA�;���؁��I��g����6���gGy^���ϧ ~�)��      �   o   x�m���@�"�Qq�����ǡa��Lv��
Mx^�O����P'w��P	����q5`-�xZ�M��F�$y+���ÑWY��,���3�R�ɟ������?���]�"R      �   �   x���An�@E��)rV� �*�݄R7&�Tז<N�'g��H�r���}[���O�X�C�&&|K1�ڢ��]jPvdj�Q�x`�*}�:�k�5�gq0w����O1��-�}A��w�rb��~R�0��:Я,B^�>����U�~�}�Ғ�4�Bkc]���߬6���Hd�؂�:��֯�s�N+';�ҟ�������      �   �  x����n�0F����RuM��l�v�&Ѯ��Q��0
^#�v���sS�⁻�?�>监7�Ɩ���|BՒ�{4-��Q*lh�&����
|�5Lw��e�R^<�oIw��o�*؍Rk�{��ԕ�ޑ�po�P#\�1�`+������$���PtG�eO�.��J�4���p5*�U�?�GY�n��;j��
��(k_7t*��4|h��K�E!�2k��:��-!bJ�J�๫�u�?��/y��9꘥��x�:^5�x��g�	$�@�$�*�d*�0�I��I��R�-e�R~���t�&ci2�&[�.[�t6m:�J�-:�S�Y��Q˧P93������Q��Ka3�`��(�~���x]l�i�&�7,6��U�bJ�<���~�h�e�gW0Ϯ�v�ɠ
o��n�J�N����b��eqk1}@�S�.�� ��x�      �      x������ � �      �   M  x��W�nG=S_���Q�e��E^	��N�\jfJdK=ݓ^�P�9���˫��p(�H C�{�z�ի��prɫ��Su�������j_�bI��KR:�doi2;;=�?8�?<�O.��˛�G27�U`�,+�_��*2��S�q���e���N��nN6r���s7�Y��ظ��t�Au�I2K�gH��ПKX�8D���+�E�&_��S���F��6.z�"����l���4��T����;�<����;�ḿ��;_������&qr5�ڛ=�`wn�.W��Ʌ8���d�f���K���wAN�#!+���+6�|`���	����UH��9��))�����tl�H�qq1U���dP��R���$���\C#�B

k�5�[\x��&�&`T�t�۽d��ul�7�D��U�^q���#��@�T� �(���;��/A���E�!�"�g���y����
���7)��}�U���WR�V��gq�EA�6���(O^���G~�~��!s��`R�����4�O��#^�9�̢uB	-�bB�-8�����"��$O�g�y� %0���V�xv&x��&���@a��P4!�udĪ2Buj�BԦ�¶����:el�6_�%��w�q���ѕ/��
��Bz�x��q�E��|�3����TG��H^,%^/����@�䅹��Z��E�X��	.b��4���a�z�A:@Sj�6�r�f�Kk�U��["��@�LY��=�t&������w-�l��-t��ʐ�DM��S�Z����5�c��? ��ٺJ�%���l��Բ�)0tCqc@E�V�B��֩��~�^��Zci�ZjN��l�����U1�w��z���t��B��w�K�x�L�8���ɽ�$����د�_]i;��p����s�q%\
}�%��Z�*��\��()w��T���|tPܺZK�SQ.�Zj�cٶ�p�ێ��Kab3����چ�U�߀Փ�8]/�&�ؘ�_���� �f��p�O&����3o*��m���0��4����l�}c�m�"D�R����,�?��ir���Bf��K�j8��EW�ł?VT�b�J0�>��g����п�C{z�+ �}��&�g��D��dN32'�.�)9�d!n,�,��� �����%s*lIXi�Wq7,���x֟PW�%�}�J�Vyp������(�ZH��LՆ�����S6R?����Ã����ޤB�.�kv�^�9t��hr�El�|�~DKXX������#kHD"�v2�{	W��ݸ��+���"���N�BE������u�Lld"�=K�5�<��3��gq�'��7����$�5j5*�~/�D�b[�+�|���seD����'sm�}�z�����3I�iBB���0�I��8����|<,熮�d�q֨W}�ʂ��ɡl4�-� ++bt����N�"L�\��}���5�7)�I߈g& �z�Y�aw�x^�K]�������`~��B5j�Bj�є�l9 Ġk�Y��v �Ԉr�h�8����?�ݪcn;ñ����u@@���R�A�pF�P��Ь) l��]}�KQڷE��Z0?V_��(�eP���0��Υ�\�ʬ�,]����h��7
sP��aE�e�`g�S�� ��y}��݌~�Erk���5��'�i���|D�Yj�L~����zp�d�:�����G��'���r�8����F�L�Rѷ�Qg��ǿ}F6)�r�T���/��� ��b4|��2G�KKz
����V�0��no�+���C��ٷ:r/�m���5���4tͻ��Y���U�Ef�w�䅋��~����/�1��      �   S  x��T�n�0>�O�`'��#�TE]�T�V���]�Fv�V�N{�#�b;)�69��X���f��ƒ��[b"��V` lm��T�ߌX����n���&{Km���(��0�1{�N�h����-�B�3`�����B!A�#����C����P[/���� :i͔& �l�l�n2 2�;X�Y�=p��Zm���sG&Q���.�C��"���P��O����F>WZӽ2�o�n��ș�G'qNhT�䀇����'�m7�#�{���LD�R�
������oIh�3�5g=����:ҦYv�,7�֡w�g�;�VQ�Ԭ
:PLPy>x�1Gu��~ �́~K+�"ۿ���c,xй�����*��YQ$Y��DSCeḌ�k5G_82*�� W<��&��$ert+UR(&fm�Ԣ��[ku�
���˘�;ؐ��}jux7J�'\ښ�mS5I�����rO>�Z�{�+��-��Ϙp�?�9�F�!�ʩ�l6���,���̗ZR����e�����B���
����`�����ޣf�D�?�q9�.Ӣݳ����g���r��b����m�~|���p�      �      x�mұN�0���y�Ⱦ�c{DE 
,0����"�ZG8IEߞB�J$�d����s��n�����#dS_o\��x��o�����������C�^.����<�8���3'
�^s���%2�8/~������_�p*�#�kP�J�`�@�(Km!ݵ��`;]&�JT��(d릭0צ&7UK����Z�B��:i�Ͷ���h�-5���T��1�S�:͝F@�,��ͫ�)o՜�`l�>��Or�E��Z��D�I��l��BQQgJ�gLߛ��~ �ѽ@      �   "  x�E��N�0���4��6?�Ҫ �RD+��:YcKN���g�"8��w��/�:�����p�zk�C+��� ���,�O�����[����RN��]>������^�Ȣ<��0�`K�zD/^C�lH�<�g`��it�ߐ�ml8����rx@��	円�Z�[	l��� N��(�����JX�H�Y��9�ɻ��T�*X���Ū������t	JiP)��v�N<��Z�IiR��~���p����mM}YR�u�0��{"����mU      �   B  x�]��N�@�g�)�LLl�T�T� Z!!uqK=z�+ߥ(#���+��Ÿ�$-H���lٿ��Zr�[.O�
��F笢�h>̥��I�;p|������'����Z�H�g�� ]�j��$������r�Eۃ#1\���^�\+�BF��E#���.9e���*���S�FbkKL*sz��Hvt޳e	1H����-EU'|-�c�q!rI�F=�]��T����n�wk�N|��Up$��F٧җ��,9i�8.�t��s�)��'���B��C��t��:�sŎ�h�p�7���R�ڳ� ݗ��C]���YWu��1�� �/n�v      �   U   x�32�p�2�9���%�%��y
& ����
��T�/3�$5/%_!�<�$9���E�1H ���� ,	4�F�l�08F��� H�#�      �   �   x��P;
A�'����\�B���3A3��6����#��l�����^�7��:+���,QJ{��a0U�ɳ�5yRt�>��d�Q�b}vJ$y��9b���J#�_6f���ڬT�@_�3f����+)��`h�.�,�,��\Ћ¤�{���I�vrw��s�%E�Ȕ����g�z ��Ջ�      �   j   x�32�tO�/JO��)MN,�446�tN,*���S�K-)�/��L���MLI�22���������KJ-J�47�t�,�K�T�pA�2&�D|&�d��&&�d��q��qqq R�5�      �   �   x�u�Q�0ǟ�O�/@�<#H,!!^�ۅfM+�|{�G汿^��]R�����
*G˺�"�)M�|���j>[��2Z����稍�^��R�X<A	|aO��ݦ�}�78�����e&MU���� >��d=�*�Rh)����� Z�n�LQ��gՍj8:�U@�~u�
[���B8&�1[�M?3�O������?ڵ��w�k�t�@!?�������?K�3:�� x ���l      �   K   x�32�LLN�<�9O�R!�,5���(�ӧ49�ر����Ȝ3%�� �(���5'5��(?/3Y"g�M/��=... |#�     