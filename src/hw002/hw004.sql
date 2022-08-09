create database HR_administration_unit;
/*
Задание 4
Спроектируйте базу данных для системы отдела кадров.
 */

create table employees_base
(
    id INT auto_increment not null,
    full_name VARCHAR(100),
    passport VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(20),
    date_of_birth date,
    PRIMARY KEY (id)
);

INSERT INTO employees_base
(full_name, passport, address, phone, date_of_birth)
VALUES
    ('Sergey Samko', 'CO56565', 'Ivana Kupala str., 12', '0991213333', '1984-11-09'),
    ('Andrey Ivanov', 'KO554445', 'Main str., 1', '09876545454', '1988-12-08');

create table positions
(
    id INT auto_increment not null,
    employee_id INT not null,
    position_name VARCHAR(100),
    work_experience INT,
    salary DOUBLE,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees_base(id)
);

INSERT INTO positions
(employee_id, position_name, work_experience, salary)
VALUES
    (1, 'Manager', 5, 20000.00),
    (2, 'IT support', 2, 30000.00);

CREATE TABLE agreements
(
    id INT auto_increment not null,
    employee_id INT unique,
    order_date date,
    start_of_work_date date,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees_base(id)
);

INSERT INTO agreements
(employee_id, order_date, start_of_work_date)
VALUES
    (1, '2017-12-12', '2017-12-16'),
    (2, '2019-09-10', '2019-09-20');

CREATE TABLE working_hours_list
(
    id INT auto_increment not null,
    employee_id INT,
    period_month INT,
    period_year INT,
    worked_days_plan INT,
    worked_days_fact INT,
    PRIMARY KEY(id),
    FOREIGN KEY (employee_id) REFERENCES employees_base(id)
);