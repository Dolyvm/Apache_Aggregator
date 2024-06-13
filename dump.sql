PGDMP  #    9                |            postgres    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4852            �           0    0    DATABASE postgres    ACL     -   GRANT ALL ON DATABASE postgres TO gentelman;
                   postgres    false    4852            �           0    0    SCHEMA public    ACL     )   GRANT ALL ON SCHEMA public TO gentelman;
                   pg_database_owner    false    6                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16409 
   access_log    TABLE     �   CREATE TABLE public.access_log (
    id integer NOT NULL,
    ip_address character varying(50),
    date timestamp without time zone,
    request character varying(200),
    status integer,
    size integer
);
    DROP TABLE public.access_log;
       public         heap 	   gentelman    false            �            1259    16408    access_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.access_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.access_log_id_seq;
       public       	   gentelman    false    219            �           0    0    access_log_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.access_log_id_seq OWNED BY public.access_log.id;
          public       	   gentelman    false    218            �            1259    16399    access_logs    TABLE     �   CREATE TABLE public.access_logs (
    id integer NOT NULL,
    ip character varying(15),
    datetime timestamp without time zone,
    request text,
    status integer,
    size integer
);
    DROP TABLE public.access_logs;
       public         heap    postgres    false            �           0    0    TABLE access_logs    ACL     4   GRANT ALL ON TABLE public.access_logs TO gentelman;
          public          postgres    false    217            �            1259    16398    access_logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.access_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.access_logs_id_seq;
       public          postgres    false    217            �           0    0    access_logs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.access_logs_id_seq OWNED BY public.access_logs.id;
          public          postgres    false    216            W           2604    16412    access_log id    DEFAULT     n   ALTER TABLE ONLY public.access_log ALTER COLUMN id SET DEFAULT nextval('public.access_log_id_seq'::regclass);
 <   ALTER TABLE public.access_log ALTER COLUMN id DROP DEFAULT;
       public       	   gentelman    false    219    218    219            V           2604    16402    access_logs id    DEFAULT     p   ALTER TABLE ONLY public.access_logs ALTER COLUMN id SET DEFAULT nextval('public.access_logs_id_seq'::regclass);
 =   ALTER TABLE public.access_logs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �          0    16409 
   access_log 
   TABLE DATA           Q   COPY public.access_log (id, ip_address, date, request, status, size) FROM stdin;
    public       	   gentelman    false    219   �       �          0    16399    access_logs 
   TABLE DATA           N   COPY public.access_logs (id, ip, datetime, request, status, size) FROM stdin;
    public          postgres    false    217   M       �           0    0    access_log_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.access_log_id_seq', 20, true);
          public       	   gentelman    false    218            �           0    0    access_logs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.access_logs_id_seq', 1, false);
          public          postgres    false    216            [           2606    16414    access_log access_log_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.access_log
    ADD CONSTRAINT access_log_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.access_log DROP CONSTRAINT access_log_pkey;
       public         	   gentelman    false    219            Y           2606    16406    access_logs access_logs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT access_logs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.access_logs DROP CONSTRAINT access_logs_pkey;
       public            postgres    false    217            �   �   x����� Eg��� -�Aiy��ѡ��11q�����B	��{nnށ`� MVi�`:�l�����tCwY��>F�����x޿���݇�g���I�cMdU��BK�I�b2�9�>�;��X�4g�%�/͙s��T�7	��aR�2���D�l��#Q��f�8bu�hv��L4ۤ��[/�����      �      x������ � �     