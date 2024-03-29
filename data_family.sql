PGDMP                       |            data_family     16.0 (Ubuntu 16.0-1.pgdg23.04+1)     16.0 (Ubuntu 16.0-1.pgdg23.04+1)     F           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            I           1262    26835    data_family    DATABASE     w   CREATE DATABASE data_family WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE data_family;
                postgres    false            �            1259    26844    m_child    TABLE     z   CREATE TABLE public.m_child (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    parent_id integer
);
    DROP TABLE public.m_child;
       public         heap    postgres    false            �            1259    26843    m_child_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_child_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.m_child_id_seq;
       public          postgres    false    218            J           0    0    m_child_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.m_child_id_seq OWNED BY public.m_child.id;
          public          postgres    false    217            �            1259    26837    m_parent    TABLE     d   CREATE TABLE public.m_parent (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.m_parent;
       public         heap    postgres    false            �            1259    26836    m_parent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_parent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.m_parent_id_seq;
       public          postgres    false    216            K           0    0    m_parent_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.m_parent_id_seq OWNED BY public.m_parent.id;
          public          postgres    false    215            �           2604    26847 
   m_child id    DEFAULT     h   ALTER TABLE ONLY public.m_child ALTER COLUMN id SET DEFAULT nextval('public.m_child_id_seq'::regclass);
 9   ALTER TABLE public.m_child ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    26840    m_parent id    DEFAULT     j   ALTER TABLE ONLY public.m_parent ALTER COLUMN id SET DEFAULT nextval('public.m_parent_id_seq'::regclass);
 :   ALTER TABLE public.m_parent ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            C          0    26844    m_child 
   TABLE DATA           6   COPY public.m_child (id, name, parent_id) FROM stdin;
    public          postgres    false    218   %       A          0    26837    m_parent 
   TABLE DATA           ,   COPY public.m_parent (id, name) FROM stdin;
    public          postgres    false    216   h       L           0    0    m_child_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.m_child_id_seq', 4, true);
          public          postgres    false    217            M           0    0    m_parent_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.m_parent_id_seq', 4, true);
          public          postgres    false    215            �           2606    26849    m_child m_child_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.m_child
    ADD CONSTRAINT m_child_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.m_child DROP CONSTRAINT m_child_pkey;
       public            postgres    false    218            �           2606    26842    m_parent m_parent_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_pkey;
       public            postgres    false    216            �           2606    26850    m_child fk_child_parent    FK CONSTRAINT     {   ALTER TABLE ONLY public.m_child
    ADD CONSTRAINT fk_child_parent FOREIGN KEY (parent_id) REFERENCES public.m_parent(id);
 A   ALTER TABLE ONLY public.m_child DROP CONSTRAINT fk_child_parent;
       public          postgres    false    218    216    3245            C   3   x�3�J���4�2����H����2��,*O�
�p:e'rs��qqq �-
      A   +   x�3�J���2����H��2��,*O��2�t,�N����� ���     