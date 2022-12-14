--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-12-14 20:04:59

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
-- TOC entry 210 (class 1259 OID 24905)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24904)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 24911)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24910)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 24917)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24916)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 24923)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    email text NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    login character varying(50),
    password character varying(255),
    phone_number text NOT NULL,
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24922)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 24931)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time_of_created timestamp without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24940)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24939)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 24930)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3354 (class 0 OID 24905)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Ноутбуки');
INSERT INTO public.category (id, name) VALUES (2, 'Телефоны');
INSERT INTO public.category (id, name) VALUES (3, 'Умные часы');


--
-- TOC entry 3356 (class 0 OID 24911)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, 'be9c00a6-d69a-461a-ad60-425d5d54050d.pixel7pro1.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, 'e489e8d7-fcf2-4bcd-8070-95816ae7dcad.pixel7pro3.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, '0b362c20-e38e-45e2-b20a-a439907edb64.pixel7pro2.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, '9823fb31-4241-48e5-9c7f-cf3ffb991eca.pixel7pro4.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, 'd8eac1f6-9196-4767-a0bc-9435d3e83166.pixel7pro5.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, '61b44aa4-8537-40af-928e-a0ebe08ba731.1.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, '911e1770-b823-4453-b2a5-2a0590dcb79f.2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, '6306dd66-f56d-4e99-a68d-4a1b239b31aa.3.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, '6a8ef72a-163e-464a-82d7-ddc6ac52b1fc.4.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, '9978e2b1-4963-46c0-84a7-424dbd8dc0aa.5.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, 'aba3708d-8ffd-48db-a687-a6f63a9cc0ac.1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, 'd5264602-95da-4cb1-b006-aece4a1fa765.2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '35fce19e-bd72-44c8-a054-8e3e5e56f8b2.3.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '8cd0c50c-46ac-455e-8f53-c0bd6f3d6184.4.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '8483877e-3168-4cdf-bcc4-4cf71331a64b.5.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, 'b66d3346-b2b7-46ae-89ca-1629712a1787.1.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '7e3a9d27-cbcd-4f4b-beb7-f19a11438318.2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '044849fd-eb1c-4942-9e97-689c42e352a3.3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '03776a05-e86e-4fe5-b414-83ce7f109b4c.4.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '8c355b03-d624-43d0-af86-439c53b4289d.5.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '8e570b03-fbac-42a7-a2f5-283ec12dd001.1.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, '547a62db-3c14-44f6-981f-474ac03951cd.2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, 'eed62f90-6e92-441f-a18a-4019f84d2266.3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, '128fc6ba-f45a-44de-bd32-f81de02d3310.4.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '0e44bbea-5b99-4b24-a5d1-f20bc842ce73.5.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, '396e9b91-08b4-4974-be68-72dc53117abb.1.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '570992cb-14d2-49e9-ad96-f47ffd00b689.2.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '541b0a9a-acad-409a-a763-39129974ca5a.3.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, 'a1270640-8fa2-4eae-8b8d-c8ffe195b26e.4.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, '29290def-a742-4f94-92cd-4830befba117.5.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, 'e8902a38-7b6a-48f0-b447-76eb77af9a06.1.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, 'ff9fd36c-1100-4646-aeed-0fe7c3af3781.2.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, 'c2004463-9143-4f1b-ac4a-d82fefa93d87.3.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, '4a627bd6-c8ce-46ce-8ddf-99360d8bb877.4.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, 'f76bd9cb-f5b6-4ff2-9beb-dfd9d8d7a86e.5.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '362cb45b-38a3-4d76-95ad-6b241b548f50.1.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, 'f92519ec-cb92-490f-ae33-aec986469231.2.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, 'e33fcc79-08cb-4038-8c15-23173c68783e.3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, '65376aab-5dd5-4021-807e-f5c5a32200b9.4.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, '8afef1a9-e309-48cf-8d29-a33c114fb657.5.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (51, 'b47b49d0-c654-4bea-ac81-34a9dc9e52f6.1.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (52, '278fa7dc-2d33-4ff6-b6df-e5e97d58fc82.2.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (53, 'df049514-06f8-4ccd-af87-d307f317e9d5.3.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (54, 'b51e9910-378b-4639-a767-f78d138f25c6.4.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (55, '7e819869-4453-4536-a993-2a857335d8ff.5.jpg', 11);


--
-- TOC entry 3358 (class 0 OID 24917)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2022-12-09 19:52:18.522365', 'ccdd4332-ae5f-4670-bd77-21177058c5ee', 69999, 3, 5, 1);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2022-12-10 17:09:06.579195', 'cbc1b136-552e-4ef8-a8f2-aa4c76c2f930', 69999, 2, 7, 1);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2022-12-10 17:11:44.376587', '80c3dafd-aecb-41ed-819a-8590e2f21340', 49999, 1, 7, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2022-12-11 09:00:42.835315', '0720094a-ae16-458d-b495-7e8b70f0f63f', 69999, 1, 7, 1);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2022-12-11 12:33:08.3106', '70b0b587-9d79-4ef6-a4aa-49aff4b094ef', 49999, 2, 5, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (6, 1, '2022-12-11 12:33:08.326595', '70b0b587-9d79-4ef6-a4aa-49aff4b094ef', 33900, 1, 5, 11);


--
-- TOC entry 3360 (class 0 OID 24923)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, email, firstname, lastname, login, password, phone_number, role) VALUES (1, 'luris@list.ru', 'Максим', 'Приданов', 'admin', '$2a$10$tranvBpEys1G2HN3tDrpNOtqmhyEOBAwEpC9NzAA6ftRuL/mLmx5W', '+79608337997', 'ROLE_ADMIN');
INSERT INTO public.person (id, email, firstname, lastname, login, password, phone_number, role) VALUES (5, 'i@luris.su', 'Max', 'Pridanov', 'user', '$2a$10$YMRsvyKQ.ERtmWzvaxFmGuy2BfYkU.jOHj7n785gDB840mGjQXzCW', '+79608337979', 'ROLE_USER');
INSERT INTO public.person (id, email, firstname, lastname, login, password, phone_number, role) VALUES (6, 'prod@mail.ru', 'Лучший', 'Продавец', 'seller', '$2a$10$6P78wKlj4rPm8TFHYKvkU.3C7G1CsaPlog72QJ9Y/HqO5xQVzjtD6', '89514568496', 'ROLE_SELLER');
INSERT INTO public.person (id, email, firstname, lastname, login, password, phone_number, role) VALUES (7, 'novikov@mal.ru', 'Покупатель', 'Новиков', 'pokupatel', '$2a$10$XT5Ur4FP6v81nnASXdkXQOuj1H6270YsLkTExXhIbpJty96K38mX6', '+79517534565', 'ROLE_USER');
INSERT INTO public.person (id, email, firstname, lastname, login, password, phone_number, role) VALUES (8, 'user@user.com', 'User', 'Userov', 'user1', '$2a$10$OH0kTU3oyBoHViqGfBbOmu7VOJ9yc9HW7/mEypl4xlPRFdDQmLSfa', '+79517538521', 'ROLE_USER');


--
-- TOC entry 3362 (class 0 OID 24931)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (1, NULL, 'Мощный смартфон флагманского уровня на собственном чипсете Google Tensor G2. Серьёзный упор на фотовозможности и искусственный интеллект. Большой экран с динамической частотой обновления, умеренно быстрая зарядка, стереодинамики, три микрофона, все современные технологии', 69999, 'Лучший продавец', 'Pixel 7 Pro', 'Самара', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (4, NULL, 'В Pixel 7 производитель существенно уменьшил изгиб экрана по бокам. Смартфон получил 6,7-дюймовый POLED-дисплей с разрешением 3120х1440 пикселей, яркостью до 1500 нит и поддержкой технологии LTPO, что позволяет динамически регулировать частоту обновления от 10 до 120 Гц', 49999, 'Продавец-молодец', 'Pixel 7', 'Самара', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (5, '2022-12-09 21:09:41.060861', 'Google Pixel 6a - классный аппарат среднего класса. Дизайн компактный, металлическая рамка, защитное стекло на экране и спинка из пластика под стекло, что даже более надежно. Экран OLED 6.1 дюйма с разрешением 1080х2400. Процессор флагманский Google Tensor, он все так же хорош в обработке фотографий. Аккумулятор 4410 мАч, что неплохо, но не рекорд конечн. Зато камера, как всегда, демонстрирует высший пилотаж, несмотря на достаточно небольшое разрешение в 12МП у двух ее модулей.', 29990, 'Яндекс-Маркет', 'Pixel 6a', 'Самара', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (6, '2022-12-09 21:13:43.208748', 'Pixelbook Go — сверхтонкий и легкий ультрабук от Google с мощным процессором, потрясающим 13.3" Ultra HD сенсорным экраном 4K, операционной системой Chrome OS и встроенным Google Assistant, который всегда готов помочь решить поставленную задачу, найти ответ на вопросы, управлять расписанием и многое другое. Мощная аппаратная конфигурация компактного устройства включает в себя процессор Intel Core i7, 16 ГБ оперативной памяти и высокоскоростной твердотельный накопитель емкостью 256 ГБ. Одного заряда батареи достаточно, чтобы работать и наслаждаться отдыхом в течение всего дня не беспокоясь о необходимости подзарядки. Google Pixelbook Go создан для работы, развлечений и мобильности и всегда готов к работе, когда готовы вы.', 55450, 'Google Store', 'Pixelbook Go', 'Самара', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (7, '2022-12-09 21:19:11.093362', 'Теперь работа может быть такой же увлекательной, как и игра, благодаря первому в мире Chromebook QLED. Погрузитесь в свои любимые прошлые времена, учитесь ночью или представьте свою следующую большую идею с помощью цветного дисплея большего размера, чем жизнь. Кроме того, благодаря мощному и быстрому процессору Intel® Core™ и аккумулятору, работающему круглосуточно, в этом стильном и компактном Chromebook есть все, что вам нужно, чтобы всегда оставаться на связи.', 29000, 'Сам с унгом', 'Samsung Galaxy Chromebook 2', 'Самара', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (8, '2022-12-09 21:21:51.560091', 'Свобода быть собой везде
Легкий и достаточно компактный, чтобы брать его с собой куда угодно без розетки. Длительное время автономной работы позволяет отключиться от шнура, оставаясь на связи со всем миром.', 29000, 'ХэПэ', 'HP Chromebook', 'Самара', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (9, '2022-12-09 21:24:22.786522', 'Информация о товаре:

Быстрая и простая настройка. Чтобы сразу приступить к работе, просто подключите Google Pixel Watch к смартфону Android, а затем настройте все именно так, как вы хотите. Ваши личные контакты, встречи и многое другое автоматически переносятся на часы Pixel Watch. Ваши умные часы готовы к использованию всего через несколько минут. Однако, чтобы иметь доступ к интеллектуальным функциям, ваш смартфон должен постоянно находиться рядом с часами Pixel Watch.
Создайте свой день с Pixel Watch: Google Pixel Watch — ваш постоянный спутник в повседневной жизни. Умные предустановленные приложения, такие как Google Maps, Google Pay или Google Calendar, помогут вам всегда иметь представление о ваших встречах. Если вы не ориентируетесь в чужом городе, вам помогут Google Maps. И даже забытый кошелек больше не проблема благодаря Google Pay. Тем не менее, вам всегда нужно подключение к Интернету.
Всегда следите за своим уровнем физической подготовки: скажите «Привет» своему новому приятелю по фитнесу. Отправляйтесь на пробежку, плавание, катание на велосипеде или что-то еще, что вы можете придумать, с прочными и водонепроницаемыми часами Google Pixel Watch с предустановленным приложением Fitbit. Выберите один из 40 режимов упражнений, а также в любое время получите представление о своих зонах сжигания жира, выносливости и сердечного ритма. Носите Pixel Watch во время сна, чтобы на следующее утро получить подробные данные о качестве сна.
Ваш собственный индивидуальный дизайн: такой же индивидуальный, как и вы. Выбирайте из множества браслетов, циферблатов и четырех цветов корпуса для своих Pixel Watch. Устойчивое к царапинам стекло Corning Gorilla и корпус из нержавеющей стали, на 80 % изготовленный из переработанного материала, обеспечивают прочный и стильный внешний вид. Новая операционная система Wear OS от Google также идеально адаптируется к круглому корпусу Pixel Watch.
Мощный аккумулятор на весь день. Мощный встроенный перезаряжаемый литий-ионный аккумулятор емкостью 294 мАч обеспечивает питание ваших Google Pixel Watch в течение полных 24 часов. А если после этого вам понадобится новая батарея, ваши часы Pixel Watch зарядятся до 50 % всего за 30 минут благодаря магнитному зарядному кабелю USB-C.
Все, что вам нужно, всегда с вами: всего за несколько шагов подключите свой Android-смартфон к новым Pixel Watch, чтобы пользоваться множеством интеллектуальных функций. Например, вы можете использовать свои Pixel Buds, чтобы слушать любимую музыку во время тренировки или принимать входящие звонки и сообщения. Кроме того, у вас всегда есть все ваши встречи с вами через Календарь Google, Чтобы иметь возможность использовать эти и другие умные сервисы, вы всегда должны иметь при себе смартфон.', 32900, 'Google Store', 'Pixel Watch Black', 'Самара', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (10, '2022-12-09 21:25:28.194719', 'Информация о товаре: Быстрая и простая настройка. Чтобы сразу приступить к работе, просто подключите Google Pixel Watch к смартфону Android, а затем настройте все именно так, как вы хотите. Ваши личные контакты, встречи и многое другое автоматически переносятся на часы Pixel Watch. Ваши умные часы готовы к использованию всего через несколько минут. Однако, чтобы иметь доступ к интеллектуальным функциям, ваш смартфон должен постоянно находиться рядом с часами Pixel Watch. Создайте свой день с Pixel Watch: Google Pixel Watch — ваш постоянный спутник в повседневной жизни. Умные предустановленные приложения, такие как Google Maps, Google Pay или Google Calendar, помогут вам всегда иметь представление о ваших встречах. Если вы не ориентируетесь в чужом городе, вам помогут Google Maps. И даже забытый кошелек больше не проблема благодаря Google Pay. Тем не менее, вам всегда нужно подключение к Интернету. Всегда следите за своим уровнем физической подготовки: скажите «Привет» своему новому приятелю по фитнесу. Отправляйтесь на пробежку, плавание, катание на велосипеде или что-то еще, что вы можете придумать, с прочными и водонепроницаемыми часами Google Pixel Watch с предустановленным приложением Fitbit. Выберите один из 40 режимов упражнений, а также в любое время получите представление о своих зонах сжигания жира, выносливости и сердечного ритма. Носите Pixel Watch во время сна, чтобы на следующее утро получить подробные данные о качестве сна. Ваш собственный индивидуальный дизайн: такой же индивидуальный, как и вы. Выбирайте из множества браслетов, циферблатов и четырех цветов корпуса для своих Pixel Watch. Устойчивое к царапинам стекло Corning Gorilla и корпус из нержавеющей стали, на 80 % изготовленный из переработанного материала, обеспечивают прочный и стильный внешний вид. Новая операционная система Wear OS от Google также идеально адаптируется к круглому корпусу Pixel Watch. Мощный аккумулятор на весь день. Мощный встроенный перезаряжаемый литий-ионный аккумулятор емкостью 294 мАч обеспечивает питание ваших Google Pixel Watch в течение полных 24 часов. А если после этого вам понадобится новая батарея, ваши часы Pixel Watch зарядятся до 50 % всего за 30 минут благодаря магнитному зарядному кабелю USB-C. Все, что вам нужно, всегда с вами: всего за несколько шагов подключите свой Android-смартфон к новым Pixel Watch, чтобы пользоваться множеством интеллектуальных функций. Например, вы можете использовать свои Pixel Buds, чтобы слушать любимую музыку во время тренировки или принимать входящие звонки и сообщения. Кроме того, у вас всегда есть все ваши встречи с вами через Календарь Google, Чтобы иметь возможность использовать эти и другие умные сервисы, вы всегда должны иметь при себе смартфон.', 34900, 'Google Store', 'Pixel Watch Gold', 'Самара', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (11, '2022-12-09 21:26:15.282664', 'Информация о товаре: Быстрая и простая настройка. Чтобы сразу приступить к работе, просто подключите Google Pixel Watch к смартфону Android, а затем настройте все именно так, как вы хотите. Ваши личные контакты, встречи и многое другое автоматически переносятся на часы Pixel Watch. Ваши умные часы готовы к использованию всего через несколько минут. Однако, чтобы иметь доступ к интеллектуальным функциям, ваш смартфон должен постоянно находиться рядом с часами Pixel Watch. Создайте свой день с Pixel Watch: Google Pixel Watch — ваш постоянный спутник в повседневной жизни. Умные предустановленные приложения, такие как Google Maps, Google Pay или Google Calendar, помогут вам всегда иметь представление о ваших встречах. Если вы не ориентируетесь в чужом городе, вам помогут Google Maps. И даже забытый кошелек больше не проблема благодаря Google Pay. Тем не менее, вам всегда нужно подключение к Интернету. Всегда следите за своим уровнем физической подготовки: скажите «Привет» своему новому приятелю по фитнесу. Отправляйтесь на пробежку, плавание, катание на велосипеде или что-то еще, что вы можете придумать, с прочными и водонепроницаемыми часами Google Pixel Watch с предустановленным приложением Fitbit. Выберите один из 40 режимов упражнений, а также в любое время получите представление о своих зонах сжигания жира, выносливости и сердечного ритма. Носите Pixel Watch во время сна, чтобы на следующее утро получить подробные данные о качестве сна. Ваш собственный индивидуальный дизайн: такой же индивидуальный, как и вы. Выбирайте из множества браслетов, циферблатов и четырех цветов корпуса для своих Pixel Watch. Устойчивое к царапинам стекло Corning Gorilla и корпус из нержавеющей стали, на 80 % изготовленный из переработанного материала, обеспечивают прочный и стильный внешний вид. Новая операционная система Wear OS от Google также идеально адаптируется к круглому корпусу Pixel Watch. Мощный аккумулятор на весь день. Мощный встроенный перезаряжаемый литий-ионный аккумулятор емкостью 294 мАч обеспечивает питание ваших Google Pixel Watch в течение полных 24 часов. А если после этого вам понадобится новая батарея, ваши часы Pixel Watch зарядятся до 50 % всего за 30 минут благодаря магнитному зарядному кабелю USB-C. Все, что вам нужно, всегда с вами: всего за несколько шагов подключите свой Android-смартфон к новым Pixel Watch, чтобы пользоваться множеством интеллектуальных функций. Например, вы можете использовать свои Pixel Buds, чтобы слушать любимую музыку во время тренировки или принимать входящие звонки и сообщения. Кроме того, у вас всегда есть все ваши встречи с вами через Календарь Google, Чтобы иметь возможность использовать эти и другие умные сервисы, вы всегда должны иметь при себе смартфон.', 33900, 'Google Store', 'Pixel Watch Silver', 'Самара', 3);


--
-- TOC entry 3364 (class 0 OID 24940)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 55, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 6, true);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 8, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 14, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 11, true);


--
-- TOC entry 3191 (class 2606 OID 24909)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 24915)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 24921)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 24929)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 24944)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 24938)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 24948)
-- Name: person uk_2ldqhx89sy06ya51rrnndhwmc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT uk_2ldqhx89sy06ya51rrnndhwmc UNIQUE (phone_number);


--
-- TOC entry 3201 (class 2606 OID 24946)
-- Name: person uk_fwmwi44u55bo4rvwsv0cln012; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT uk_fwmwi44u55bo4rvwsv0cln012 UNIQUE (email);


--
-- TOC entry 3205 (class 2606 OID 24950)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3209 (class 2606 OID 24956)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3211 (class 2606 OID 24966)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3210 (class 2606 OID 24961)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3208 (class 2606 OID 24951)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3213 (class 2606 OID 24976)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3212 (class 2606 OID 24971)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-12-14 20:05:00

--
-- PostgreSQL database dump complete
--

