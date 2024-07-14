-- удаляю обе таблицы
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS address;


-- создаю таблицу address
CREATE TABLE IF NOT EXISTS public.address
(
    addressid integer NOT NULL,
    personid integer NOT NULL,
    region character varying(128) COLLATE pg_catalog."default" NOT NULL,
    city character varying(128) COLLATE pg_catalog."default" NOT NULL DEFAULT 'город не найден'::character varying,
    CONSTRAINT address_pkey PRIMARY KEY (addressid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.address
    OWNER to postgres;
	
-- создаю таблицу person	
CREATE TABLE IF NOT EXISTS public.person
(
    personid integer NOT NULL,
    firstname character varying(32) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(32) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT person_pkey PRIMARY KEY (personid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.person
    OWNER to postgres;
	
-- заполняю таблицу address 	
INSERT INTO address
VALUES
(1, 2, 'Новосибирская область', 'Новосибирск'),
(2, 3, 'Новосибирская область', 'Бердск');

-- заполняю таблицу person
INSERT INTO person
VALUES
(1, 'Петр', 'Иванов'),
(2, 'Алексей', 'Смирнов'),
(3, 'Георгий', 'Антонов');

-- решение задачи
SELECT COALESCE(city, 'hg') AS sity
FROM address;



SELECT person.personid, address.city

FROM person
FULL OUTER JOIN address
ON person.personid = address.personid

