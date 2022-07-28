CREATE
DATABASE MyDataBase; -- Создать базу данных с именем “MyDB”.

USE
MyDataBase;

/*В созданной базе данных (из задания 2) создать 3 таблицы:
  1-я содержит имена и номера телефонов сотрудников некой компании,
  2-я содержит ведомости об их зарплате, и должностях,
  3-я содержит информацию о семейном положении, дате рождения и месте проживания.
 */

CREATE TABLE personal_data
(
    id    INT AUTO_INCREMENT not null,
    name  VARCHAR(50),
    phone VARCHAR(15),
    PRIMARY KEY (id)
);

CREATE TABLE wage_info
(
    id       INT AUTO_INCREMENT not null,
    position VARCHAR(50),
    wage     DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE additional_personal_info
(
    id            INT AUTO_INCREMENT not null,
    family_status VARCHAR(15),
    dateOfBirth   DATE,
    address       VARCHAR(50),
    PRIMARY KEY (id)
);

INSERT INTO personal_data (name, phone)
VALUES ('Sergey', '0976854531'),
       ('Anton', '0999994531'),
       ('Andrew', '0916854531');

INSERT INTO wage_info (position, wage)
VALUES ('manager', 12000.00),
       ('manager', 11000.00),
       ('it support', 8000.00);

INSERT INTO additional_personal_info(family_status, dateOfBirth, address)
VALUES ('married', '1984-11-09', 'Western Creigend'),
       ('single', '1986-12-12', 'Rainbow ave, 12'),
       ('single', '1988-09-11', 'South Gate Road, 8');


-- Из задания 3 таблицы 2 получить id сотрудников, зарплата которых больше 10000.
SELECT id
FROM wage_info
WHERE wage > 10000.00;

-- Из задания 3 сотрудник по id 1 был не женат, женился изменить данные в третьей таблице о семейном положении.
UPDATE additional_personal_info
SET family_status = 'married'
WHERE id = 2;
SELECT *
FROM additional_personal_info;

/*
 Используя MySQL Workbench создать пустую базу данных автомобилей.
 Заполнить таблицу данными (id(Autoincrement), марка, модель, объем двигателя, цена, макс. скорость).
 */

CREATE
DATABASE cars;

USE
cars;

CREATE TABLE general_info
(
    id        INT AUTO_INCREMENT not null,
    mark      VARCHAR(50),
    model     VARCHAR(50),
    engine    INT not null,
    price     DOUBLE,
    max_speed INT,
    primary key (id)
);