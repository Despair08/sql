--Таблица employees
--Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

--Наполнить таблицу employee 70 строками
insert into employees (employee_name)
values ('Natalie'),
	   ('Nicola'),
	   ('Olivia'),
	   ('Penelope'),
	   ('Pippa'),
	   ('Rachel'),
	   ('Rebecca'),
	   ('Rose'),
	   ('Ruth'),	 
	   ('Sally');

--проверка  
select * from employees e ;

--Таблица salary
--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null

create table salary(
	id serial primary key,
	monthly_salary int not null
);

--Наполнить таблицу salary 15 строками:
--- 1000
--- 1100
--- 1200
--- 1300
--- 1400
--- 1500
--- 1600
--- 1700
--- 1800
--- 1900
--- 2000
--- 2100
--- 2200
--- 2300
--- 2400
--- 2500

insert into salary (monthly_salary)
values (1000),
 	   (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400),
       (2500);

--Таблица employee_salary

--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
       
create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

--Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (employee_id, salary_id)
values (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4),
	   (5, 5),
	   (6, 6),
	   (7, 7),
	   (8, 8),
	   (9, 9),
	   (10, 10),
	   (11, 11),
	   (12, 12),
	   (13, 13),
	   (14, 14),
	   (15, 15),
	   (16, 16),
	   (17, 17),
	   (18, 18),
	   (19, 19),
	   (20, 20),
	   (21, 21),
	   (22, 22),
	   (23, 23),
	   (24, 24),
	   (25, 25),
	   (26, 26),
	   (27, 27),
	   (28, 28),
	   (29, 29),
	   (71, 30),
	   (72, 31),
	   (73, 32),
	   (74, 33),
	   (75, 34),
	   (76, 35),
	   (77, 36),
	   (78, 37),
	   (79, 38),
	   (80, 39),
	   (81, 40);
	   
--проверка	  
select * from employee_salary;
	  
--Таблица roles
--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique

create table roles (
	id serial primary key,
	role_name int not null unique
);

--Поменять тип столба role_name с int на varchar(30)

ALTER TABLE roles 
ALTER COLUMN role_name
TYPE varchar(30);

--проверка
select column_name, data_type
FROM  information_schema.columns
WHERE table_name = 'roles';

--Наполнить таблицу roles 20 строками:

insert into roles (role_name)
values ('Junior Python developer'),
	   ('Middle Python developer'),
	   ('Senior Python developer'),
	   ('Junior Java developer'),
	   ('Middle Java developer'),   
	   ('Senior Java developer'),
	   ('Junior JavaScript developer'),
	   ('Middle JavaScript developer'),
	   ('Senior JavaScript developer'),
	   ('Junior Manual QA engineer'),
	   ('Middle Manual QA engineer'),
	   ('Senior Manual QA engineer'),
	   ('Project Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales manager'),
	   ('Junior Automation QA engineer'),
	   ('Middle Automation QA engineer'),
	   ('Senior Automation QA engineer');

--проверка
select * from roles;


--Таблица roles_employee
--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee(
	id serial  primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

--Наполнить таблицу roles_employee 40 строками:
	  
insert into roles_employee (employee_id,role_id)
values (1,20),
	   (2,21),
	   (3,22),
	   (4,23),
	   (5,24),
	   (6,25),
	   (7,26), 
	   (8,27),
	   (9,28),
	   (10,29),
	   (11,30),
	   (12,31),
	   (13,32),
	   (14,33),
	   (15,34),
	   (16,35), 
	   (17,36),
	   (18,37),
	   (19,38),
	   (20,39),
	   (21,21),
	   (22,22),
	   (23,23),
	   (24,24),
	   (25,25),
	   (26,26),
	   (27,27), 
	   (28,28),
	   (29,29),
	   (30,30),
	   (31,31),
	   (32,32),
	   (33,33),
	   (34,34),
	   (35,35),
	   (36,36),
	   (37,37),
	   (38,38), 
	   (39,39),
	   (40,20);
	  
	  