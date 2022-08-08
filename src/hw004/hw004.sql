use mydatabase;

create table cells
(
    id     int auto_increment not null,
    name   VARCHAR(70)        not null,
    mobile VARCHAR(20)        not null,
    primary key (id)
);

insert cells
    (name, mobile)
values ('John', '0671111111'),
       ('Emma', '0992222222'),
       ('Eva', '0503333333');


create table salaries
(
    id_s      int auto_increment not null,
    wage      double             not null,
    positions VARCHAR(70)        not null,
    name_id   int                not null,
    primary key (id_s)
);

alter table salaries
    add constraint
        FK_cells_cells foreign key (name_id)
            references cells (id);

insert salaries
    (wage, positions, name_id)
values (100000.0, 'Main director', 1),
       (20000.0, 'Manager', 2),
       (10000.0, 'Employer', 3);

create table personal_info
(
    id            int auto_increment not null,
    family_status VARCHAR(20)        not null,
    date_of_birth VARCHAR(20)        not null,
    address       VARCHAR(70)        not null,
    person_id     int                not null,
    primary key (id),
    foreign key (person_id) references cells (id)
);

insert personal_info
    (family_status, date_of_birth, address, person_id)
values ('married', '12.12.1986', 'Main st., 3, f.77', 1),
       ('single', '11.11.1979', 'GateSide Road, 9, h. 88', 2),
       ('married', '10.10.1981', 'Cahun st., 11, h.8', 3);

-- task 4 point 001;
select cells.mobile as mobile_phone, personal_info.address as place_of_living
from cells
         inner join personal_info
                    on cells.id = personal_info.person_id;

select cells.name as FIO, cells.mobile as mobile_phone, personal_info.address as place_of_living
from cells
         inner join personal_info
                    on cells.id = personal_info.person_id;


-- task 4 point 002;

select personal_info.date_of_birth as bday, cells.mobile as mobile_phone
from personal_info
         inner join cells
                    on personal_info.person_id = cells.id
where personal_info.family_status = 'single';

select cells.name as FIO, personal_info.date_of_birth as bday, cells.mobile as mobile_phone
from personal_info
         join cells
              on personal_info.person_id = cells.id
where personal_info.family_status = 'single';

-- task 4 point 003;

select personal_info.date_of_birth as bday, cells.mobile as mobile_phone
from personal_info
         join cells
              on personal_info.person_id = cells.id
         join salaries
              on cells.id = salaries.name_id
where salaries.positions = 'manager';

select cells.name as FIO, personal_info.date_of_birth as bday, cells.mobile as mobile_phone
from personal_info
         join cells
              on personal_info.person_id = cells.id
         join salaries
              on cells.id = salaries.name_id
where salaries.positions = 'manager';
