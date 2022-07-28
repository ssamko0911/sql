/*
Задание 2
Спроектируйте базу данных для оптового склада, у которого есть поставщики товаров,
персонал, постоянные заказчики. Поля таблиц продумать самостоятельно.
 */

create database Warehouse;

CREATE TABLE employees
(
    id INT auto_increment not null,
    fio VARCHAR (50) not null,
    date_of_birth VARCHAR (20) not null,
    pass_id VARCHAR (20) not null,
    mobile VARCHAR (20) not null,
    date_of_start_work VARCHAR (12) not null,
    primary key (id)
);

insert into employees
(fio, date_of_birth, pass_id, mobile, date_of_start_work)
values
    ('Serhii Samko', '09.11.1984','CO544655', '0996754321', '01.12.2020'),
    ('Ivan Ivanov', '30.08.1979','CH111895', '0965344123', '07.05.2018'),
    ('Anton Petrov', '12.07.1989','CK6711235', '0506456799', '04.01.2020');

create table suppliers
(
    id INT auto_increment not null,
    company_name VARCHAR (50) not null,
    adress VARCHAR (70) not null,
    tax_id INT not null,
    company_phone VARCHAR (20) not null,
    contact_person VARCHAR (12) not null,
    warehouse_manager_id INT not null,
    primary key (id),
    foreign key (warehouse_manager_id) references employees (id)
);

insert into suppliers
(company_name, adress, tax_id, company_phone, contact_person, warehouse_manager_id)
values
    ('DHL', 'Main str, 3', 187990, '0675438765', 'Joe', 1),
    ('3M', 'Road of Alan, 1', 122657, '0931212345', 'Mickey', 2);

create table customers
(
    id INT auto_increment not null,
    customer_name VARCHAR (50) not null,
    adress VARCHAR (70) not null,
    tax_id INT not null,
    customer_phone VARCHAR (20) not null,
    contact_person VARCHAR (25) not null,
    warehouse_manager_id INT not null,
    primary key (id),
    foreign key (warehouse_manager_id) references employees (id)
);

insert into customers
(customer_name, adress, tax_id, customer_phone, contact_person, warehouse_manager_id)
values
    ('Leroy Merlen', 'Wallace Crescend, 7', 124456, '0998765432', 'Joe', 3),
    ('HUB 4.0', 'Isla del Gatto, 1', 111334, '0987768781', 'Ivan', 3);

create table warehouse_goods
(
    id INT auto_increment not null,
    good_title VARCHAR (50) not null,
    price DOUBLE not null,
    amount_of_goods INT not null,
    supplier_id INT not null,
    primary key (id),
    foreign key (supplier_id) references suppliers (id)
);

insert into warehouse_goods
(good_title, price, amount_of_goods, supplier_id)
values
    ('Hookah Serbeti', 99.75, 2500, 1),
    ('Daily Hookah', 250.78, 300, 2);


create table orders
(
    id INT auto_increment not null,
    customer_id INT not null,
    good_id INT not null,
    quantity INT not null,
    order_amount DOUBLE not null,
    primary key (id),
    foreign key (customer_id) references customers (id),
    foreign key (good_id) references warehouse_goods (id)
);

insert into orders
(customer_id, good_id, quantity, order_amount)
values
    (1, 1, 1000, 9975.00),
    (1, 1, 300, 2966.00),
    (2, 2, 50, 4000.00),
    (2, 1, 2, 200.00);
