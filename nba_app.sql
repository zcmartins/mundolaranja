PGDMP                      |            nba_app    16.3    16.3 4    R           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            S           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            T           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            U           1262    57434    nba_app    DATABASE     s   CREATE DATABASE nba_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE nba_app;
                postgres    false            �            1259    57494    comentarios    TABLE     �   CREATE TABLE public.comentarios (
    id integer NOT NULL,
    texto text NOT NULL,
    noticia_id integer,
    usuario_id integer
);
    DROP TABLE public.comentarios;
       public         heap    postgres    false            �            1259    57493    comentarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.comentarios_id_seq;
       public          postgres    false    224            V           0    0    comentarios_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;
          public          postgres    false    223            �            1259    57461 	   jogadores    TABLE       CREATE TABLE public.jogadores (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    data_nascimento date NOT NULL,
    time_atual integer,
    cidade_nascimento character varying(100) NOT NULL,
    universidade character varying(100),
    resumo text
);
    DROP TABLE public.jogadores;
       public         heap    postgres    false            �            1259    57460    jogadores_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jogadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.jogadores_id_seq;
       public          postgres    false    220            W           0    0    jogadores_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.jogadores_id_seq OWNED BY public.jogadores.id;
          public          postgres    false    219            �            1259    57514    messages    TABLE     �   CREATE TABLE public.messages (
    id integer NOT NULL,
    author character varying(100) NOT NULL,
    message text NOT NULL
);
    DROP TABLE public.messages;
       public         heap    postgres    false            �            1259    57513    messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.messages_id_seq;
       public          postgres    false    226            X           0    0    messages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;
          public          postgres    false    225            �            1259    57475    noticias    TABLE     �   CREATE TABLE public.noticias (
    id integer NOT NULL,
    titulo character varying(200) NOT NULL,
    texto text NOT NULL,
    jogador_id integer,
    time_id integer
);
    DROP TABLE public.noticias;
       public         heap    postgres    false            �            1259    57474    noticias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.noticias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.noticias_id_seq;
       public          postgres    false    222            Y           0    0    noticias_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.noticias_id_seq OWNED BY public.noticias.id;
          public          postgres    false    221            �            1259    57454    times    TABLE     �   CREATE TABLE public.times (
    id integer NOT NULL,
    nome_time character varying(100) NOT NULL,
    cidade character varying(100) NOT NULL,
    numero_titulos integer,
    conferencia character varying(50),
    divisao character varying(50)
);
    DROP TABLE public.times;
       public         heap    postgres    false            �            1259    57453    times_id_seq    SEQUENCE     �   CREATE SEQUENCE public.times_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.times_id_seq;
       public          postgres    false    218            Z           0    0    times_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.times_id_seq OWNED BY public.times.id;
          public          postgres    false    217            �            1259    57436    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    senha character varying(100) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    57435    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    216            [           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    215            �           2604    57497    comentarios id    DEFAULT     p   ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);
 =   ALTER TABLE public.comentarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    57464    jogadores id    DEFAULT     l   ALTER TABLE ONLY public.jogadores ALTER COLUMN id SET DEFAULT nextval('public.jogadores_id_seq'::regclass);
 ;   ALTER TABLE public.jogadores ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    57517    messages id    DEFAULT     j   ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);
 :   ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    57478    noticias id    DEFAULT     j   ALTER TABLE ONLY public.noticias ALTER COLUMN id SET DEFAULT nextval('public.noticias_id_seq'::regclass);
 :   ALTER TABLE public.noticias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    57457    times id    DEFAULT     d   ALTER TABLE ONLY public.times ALTER COLUMN id SET DEFAULT nextval('public.times_id_seq'::regclass);
 7   ALTER TABLE public.times ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    57439    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            M          0    57494    comentarios 
   TABLE DATA           H   COPY public.comentarios (id, texto, noticia_id, usuario_id) FROM stdin;
    public          postgres    false    224   �9       I          0    57461 	   jogadores 
   TABLE DATA           s   COPY public.jogadores (id, nome, data_nascimento, time_atual, cidade_nascimento, universidade, resumo) FROM stdin;
    public          postgres    false    220   :       O          0    57514    messages 
   TABLE DATA           7   COPY public.messages (id, author, message) FROM stdin;
    public          postgres    false    226   �:       K          0    57475    noticias 
   TABLE DATA           J   COPY public.noticias (id, titulo, texto, jogador_id, time_id) FROM stdin;
    public          postgres    false    222   �:       G          0    57454    times 
   TABLE DATA           \   COPY public.times (id, nome_time, cidade, numero_titulos, conferencia, divisao) FROM stdin;
    public          postgres    false    218   r;       E          0    57436    usuarios 
   TABLE DATA           :   COPY public.usuarios (id, nome, email, senha) FROM stdin;
    public          postgres    false    216   �;       \           0    0    comentarios_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.comentarios_id_seq', 1, true);
          public          postgres    false    223            ]           0    0    jogadores_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.jogadores_id_seq', 1, true);
          public          postgres    false    219            ^           0    0    messages_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.messages_id_seq', 71, true);
          public          postgres    false    225            _           0    0    noticias_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.noticias_id_seq', 1, true);
          public          postgres    false    221            `           0    0    times_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.times_id_seq', 2, true);
          public          postgres    false    217            a           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 7, true);
          public          postgres    false    215            �           2606    57501    comentarios comentarios_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_pkey;
       public            postgres    false    224            �           2606    57468    jogadores jogadores_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.jogadores
    ADD CONSTRAINT jogadores_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.jogadores DROP CONSTRAINT jogadores_pkey;
       public            postgres    false    220            �           2606    57521    messages messages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public            postgres    false    226            �           2606    57482    noticias noticias_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.noticias DROP CONSTRAINT noticias_pkey;
       public            postgres    false    222            �           2606    57459    times times_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.times
    ADD CONSTRAINT times_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.times DROP CONSTRAINT times_pkey;
       public            postgres    false    218            �           2606    57443    usuarios usuarios_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
       public            postgres    false    216            �           2606    57441    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    216            �           2606    57502 '   comentarios comentarios_noticia_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_noticia_id_fkey FOREIGN KEY (noticia_id) REFERENCES public.noticias(id);
 Q   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_noticia_id_fkey;
       public          postgres    false    224    222    3243            �           2606    57507 '   comentarios comentarios_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 Q   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_usuario_id_fkey;
       public          postgres    false    224    216    3237            �           2606    57469 #   jogadores jogadores_time_atual_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogadores
    ADD CONSTRAINT jogadores_time_atual_fkey FOREIGN KEY (time_atual) REFERENCES public.times(id);
 M   ALTER TABLE ONLY public.jogadores DROP CONSTRAINT jogadores_time_atual_fkey;
       public          postgres    false    220    3239    218            �           2606    57483 !   noticias noticias_jogador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_jogador_id_fkey FOREIGN KEY (jogador_id) REFERENCES public.jogadores(id);
 K   ALTER TABLE ONLY public.noticias DROP CONSTRAINT noticias_jogador_id_fkey;
       public          postgres    false    222    220    3241            �           2606    57488    noticias noticias_time_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_time_id_fkey FOREIGN KEY (time_id) REFERENCES public.times(id);
 H   ALTER TABLE ONLY public.noticias DROP CONSTRAINT noticias_time_id_fkey;
       public          postgres    false    222    218    3239            M   $   x�3�<<�$37Q!/������DENCNC�=... ��      I   w   x�3��Iu*��S�J�M-�4��0�54�56�4�t�J�(�{p��)�e�%���ؾ�E����yř)�E�)�
��
)��
��9�E��
Y��@a+%U�$$D%����z\1z\\\ �&�      O   C   x�33��JM�����23�LL�̈́����L ��(1'���*��ef�i`ndjanhihh������ ���      K   r   x�U��1c��W�%� �.Y|�:ЮqWD�p�A�H3����TJި�Ev��3��Y���I<��N�u���[��9Y���a���Y�*��3���B.�����0N      G   S   x�3��I�N-*���/Vp�KO�I-�44�O-.I-��HL�L�L�2�tN�)�L.�t�/.���qM��q,�I��q��qqq <�      E   C   x�3�����Sp�O��2�R�SR+srR���s9����R����8�R����\� �P?     