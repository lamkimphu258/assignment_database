# Create database
create database airport;

use airport;

# Create table
                          create table plane
                      (
                          registration_number int        not null primary key,
                          model_number        varchar(5) not null
    );

create table test_track
(
    registration_number int        not null,
    FAA_number          varchar(7) not null,
    date                date       not null,
    number_of_hours     float      not null,
    score               float      not null,
    primary key (registration_number, FAA_number)
);

create table test
(
    FAA_number             varchar(7)    not null primary key,
    name                   nvarchar(255) not null,
    maximum_possible_score int,
    address                nvarchar(255) not null
);

create table model
(
    model_number varchar(5) not null primary key,
    capacity     int        not null,
    weight       float      not null
);

create table technician_model
(
    model_number  varchar(5) not null,
    technician_id int        not null,
    primary key (model_number, technician_id)
);

create table technician
(
    id           int           not null auto_increment primary key,
    name         nvarchar(255) not null,
    phone_number varchar(20)   not null,
    address      nvarchar(255) not null,
    salary       float         not null
);

alter table plane
    add foreign key (model_number) references model (model_number);

alter table test_track
    add foreign key (registration_number) references plane (registration_number);
alter table test_track
    add foreign key (FAA_number) references test (FAA_number);

alter table technician_model
    add foreign key (technician_id) references technician (id);
alter table technician_model
    add foreign key (model_number) references model (model_number);

# Insert data (at least 4 rows for each table)
insert into plane(registration_number, model_number)
values (1, 'AD123'),
       (2, 'BD123'),
       (3, 'CD123'),
       (4, 'AD123');

insert into model(model_number, capacity, weight)
values ('AD123', 400, 250),
       ('BD123', 500, 350),
       ('CD123', 200, 100),
       ('DD123', 100, 50);

insert into test(FAA_number, name, maximum_possible_score, address)
values ('FA123', 'test 1', 50, 'John Doe address'),
       ('FA456', 'test 2', 100, 'Jane Doe address'),
       ('FA789', 'test 3', 150, 'That Doe address'),
       ('FA135', 'test 4', 500, 'John Us address');

insert into technician(name, phone_number, address, salary)
values ('Harry Porter', '1234567890', 'Hogwart High School Magic School', 34.5),
       ('Peter Parker', '123456791', 'Homeless', 25.98),
       ('Yu', '1234567892', 'Mi', 78.29),
       ('King Kong', '1234567893', 'Skull Island', 45.36);

insert into technician_model(model_number, technician_id)
values ('FA123', 1),
       ('FA456', 2),
       ('FA789', 3),
       ('FA135', 4);

insert into test_track(registration_number, FAA_number, date, number_of_hours, score)
values (1, 'FA123', '2020-01-02', 24, 100),
       (2, 'FA456', '2020-03-02', 25, 82),
       (3, 'FA123', '2020-02-01', 12, 10),
       (4, 'FA135', '1998-02-01', 10, 100);

# queries
select model_number, technician_id
from technician_model
where model_number like '%FA%';

select model_number, technician_id
from technician_model
where model_number like '%3%';

select sum(score) as sum_score
from test_track;
select avg(score) as average_score
from test_track;
select max(score) as max_score
from test_track;
