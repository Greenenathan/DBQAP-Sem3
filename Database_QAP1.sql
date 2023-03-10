PGDMP         3                {            QAP1    15.1    15.1 $    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    16440    QAP1    DATABASE     h   CREATE DATABASE "QAP1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "QAP1";
                postgres    false            ?            1259    16462    aircraft    TABLE     ?   CREATE TABLE public.aircraft (
    id bigint NOT NULL,
    type text NOT NULL,
    airline text NOT NULL,
    passengers bigint NOT NULL
);
    DROP TABLE public.aircraft;
       public         heap    postgres    false            ?            1259    16495    aircraft_airport    TABLE     j   CREATE TABLE public.aircraft_airport (
    aircraft_id bigint NOT NULL,
    airport_id bigint NOT NULL
);
 $   DROP TABLE public.aircraft_airport;
       public         heap    postgres    false            ?            1259    16455    airport    TABLE     h   CREATE TABLE public.airport (
    id bigint NOT NULL,
    name text NOT NULL,
    code text NOT NULL
);
    DROP TABLE public.airport;
       public         heap    postgres    false            ?            1259    16441    cities    TABLE     }   CREATE TABLE public.cities (
    id bigint NOT NULL,
    name text NOT NULL,
    state text NOT NULL,
    population text
);
    DROP TABLE public.cities;
       public         heap    postgres    false            ?            1259    16469    city_airport    TABLE     b   CREATE TABLE public.city_airport (
    city_id bigint NOT NULL,
    airport_id bigint NOT NULL
);
     DROP TABLE public.city_airport;
       public         heap    postgres    false            ?            1259    16482    pass_aircraft    TABLE     d   CREATE TABLE public.pass_aircraft (
    pass_id bigint NOT NULL,
    aircraft_id bigint NOT NULL
);
 !   DROP TABLE public.pass_aircraft;
       public         heap    postgres    false            ?            1259    16508    pass_airport    TABLE     b   CREATE TABLE public.pass_airport (
    pass_id bigint NOT NULL,
    airport_id bigint NOT NULL
);
     DROP TABLE public.pass_airport;
       public         heap    postgres    false            ?            1259    16521    pass_cities    TABLE     ^   CREATE TABLE public.pass_cities (
    pass_id bigint NOT NULL,
    city_id bigint NOT NULL
);
    DROP TABLE public.pass_cities;
       public         heap    postgres    false            ?            1259    16448 
   passengers    TABLE     ?   CREATE TABLE public.passengers (
    id bigint NOT NULL,
    f_name text NOT NULL,
    l_name text NOT NULL,
    phone text NOT NULL
);
    DROP TABLE public.passengers;
       public         heap    postgres    false            1          0    16462    aircraft 
   TABLE DATA           A   COPY public.aircraft (id, type, airline, passengers) FROM stdin;
    public          postgres    false    217   2'       4          0    16495    aircraft_airport 
   TABLE DATA           C   COPY public.aircraft_airport (aircraft_id, airport_id) FROM stdin;
    public          postgres    false    220   ?'       0          0    16455    airport 
   TABLE DATA           1   COPY public.airport (id, name, code) FROM stdin;
    public          postgres    false    216   ?'       .          0    16441    cities 
   TABLE DATA           =   COPY public.cities (id, name, state, population) FROM stdin;
    public          postgres    false    214   :(       2          0    16469    city_airport 
   TABLE DATA           ;   COPY public.city_airport (city_id, airport_id) FROM stdin;
    public          postgres    false    218   ?(       3          0    16482    pass_aircraft 
   TABLE DATA           =   COPY public.pass_aircraft (pass_id, aircraft_id) FROM stdin;
    public          postgres    false    219   ?(       5          0    16508    pass_airport 
   TABLE DATA           ;   COPY public.pass_airport (pass_id, airport_id) FROM stdin;
    public          postgres    false    221   ?)       6          0    16521    pass_cities 
   TABLE DATA           7   COPY public.pass_cities (pass_id, city_id) FROM stdin;
    public          postgres    false    222   ?)       /          0    16448 
   passengers 
   TABLE DATA           ?   COPY public.passengers (id, f_name, l_name, phone) FROM stdin;
    public          postgres    false    215   ?)       ?           2606    16468    aircraft Aircraft_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT "Aircraft_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT "Aircraft_pkey";
       public            postgres    false    217            ?           2606    16461    airport Airport_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.airport
    ADD CONSTRAINT "Airport_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.airport DROP CONSTRAINT "Airport_pkey";
       public            postgres    false    216            ?           2606    16447    cities Cities_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT "Cities_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cities DROP CONSTRAINT "Cities_pkey";
       public            postgres    false    214            ?           2606    16454    passengers Passengers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT "Passengers_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.passengers DROP CONSTRAINT "Passengers_pkey";
       public            postgres    false    215            ?           2606    16498    aircraft_airport aircraft.fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.aircraft_airport
    ADD CONSTRAINT "aircraft.fk" FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);
 H   ALTER TABLE ONLY public.aircraft_airport DROP CONSTRAINT "aircraft.fk";
       public          postgres    false    217    220    3477            ?           2606    16490    pass_aircraft aircraft_fk    FK CONSTRAINT        ALTER TABLE ONLY public.pass_aircraft
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);
 C   ALTER TABLE ONLY public.pass_aircraft DROP CONSTRAINT aircraft_fk;
       public          postgres    false    217    3477    219            ?           2606    16503    aircraft_airport airport.fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.aircraft_airport
    ADD CONSTRAINT "airport.fk" FOREIGN KEY (airport_id) REFERENCES public.airport(id);
 G   ALTER TABLE ONLY public.aircraft_airport DROP CONSTRAINT "airport.fk";
       public          postgres    false    3475    220    216            ?           2606    16516    pass_airport airport.fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.pass_airport
    ADD CONSTRAINT "airport.fk" FOREIGN KEY (airport_id) REFERENCES public.airport(id);
 C   ALTER TABLE ONLY public.pass_airport DROP CONSTRAINT "airport.fk";
       public          postgres    false    221    216    3475            ?           2606    16477    city_airport airport_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.city_airport
    ADD CONSTRAINT airport_fk FOREIGN KEY (airport_id) REFERENCES public.airport(id) NOT VALID;
 A   ALTER TABLE ONLY public.city_airport DROP CONSTRAINT airport_fk;
       public          postgres    false    216    3475    218            ?           2606    16529    pass_cities city.fk    FK CONSTRAINT     u   ALTER TABLE ONLY public.pass_cities
    ADD CONSTRAINT "city.fk" FOREIGN KEY (city_id) REFERENCES public.cities(id);
 ?   ALTER TABLE ONLY public.pass_cities DROP CONSTRAINT "city.fk";
       public          postgres    false    3471    214    222            ?           2606    16472    city_airport city_fk    FK CONSTRAINT     t   ALTER TABLE ONLY public.city_airport
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES public.cities(id);
 >   ALTER TABLE ONLY public.city_airport DROP CONSTRAINT city_fk;
       public          postgres    false    214    3471    218            ?           2606    16511    pass_airport pass.fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.pass_airport
    ADD CONSTRAINT "pass.fk" FOREIGN KEY (pass_id) REFERENCES public.passengers(id);
 @   ALTER TABLE ONLY public.pass_airport DROP CONSTRAINT "pass.fk";
       public          postgres    false    215    3473    221            ?           2606    16524    pass_cities pass.fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.pass_cities
    ADD CONSTRAINT "pass.fk" FOREIGN KEY (pass_id) REFERENCES public.passengers(id);
 ?   ALTER TABLE ONLY public.pass_cities DROP CONSTRAINT "pass.fk";
       public          postgres    false    222    215    3473            ?           2606    16485    pass_aircraft pass_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.pass_aircraft
    ADD CONSTRAINT pass_fk FOREIGN KEY (pass_id) REFERENCES public.passengers(id);
 ?   ALTER TABLE ONLY public.pass_aircraft DROP CONSTRAINT pass_fk;
       public          postgres    false    219    3473    215            1   ^   x?3?,?I?K?O-.?J-?4?2?????g??sq?@E<S???K2R?3?r2?"?\?P9??sb^bJ"P?fBIfN?Ki^^>L?1W? ?$K      4   6   x???  ????????;?`?N?Z??.?ƭ?????M_?}???@?      0   D   x?5?+?@P?????=?? Q????=?????OH1?@?W??ի?b?f?{?8??C<7???u      .   x   x?E?A
?0 ϻ??$??9[<?œ?e	?.?????}Ao??tp?_?????䇘?ʥ?
?0-???p?Q6?}??-?Ԛ
Ɍ????5?8??p&q?J?ٲ?D?oZ?	R?]??Q?)      2   &   x?3?4?2?4?2?4b 6?2?4?2?4?????? C??      3   7   x???  C?3?a???/M??????R???d?|?T?k~C?]?A?      5   A   x?%??	?PѳTL???RL??#9?<??KM?֦r?<܃?B??n?????????<~??(      6      x?????? ? ?      /   ?   x?m?=1?9??:(?????p??.?? ?@)H??\
???7F??p?D?`??c?V?`W??ꍘ??r??prE	p^??-????(?W?۟?[xd?w/1?b?4???w??_^Aʰ?3s+?B|??i 9?     