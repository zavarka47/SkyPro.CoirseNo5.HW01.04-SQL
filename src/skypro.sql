Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Пароль пользователя postgres:
psql (14.7)
ПРЕДУПРЕЖДЕНИЕ: Кодовая страница консоли (866) отличается от основной
                страницы Windows (1251).
                8-битовые (русские) символы могут отображаться некорректно.
                Подробнее об этом смотрите документацию psql, раздел
                "Notes for Windows users".
Введите "help", чтобы получить справку.

postgres-# \! chcp 1251
Текущая кодовая страница: 1251
postgres-# \l
                                          Список баз данных
    Имя    | Владелец | Кодировка |     LC_COLLATE      |      LC_CTYPE       |     Права доступа
-----------+----------+-----------+---------------------+---------------------+-----------------------
 postgres  | postgres | UTF8      | Russian_Russia.1251 | Russian_Russia.1251 |
 template0 | postgres | UTF8      | Russian_Russia.1251 | Russian_Russia.1251 | =c/postgres          +
           |          |           |                     |                     | postgres=CTc/postgres
 template1 | postgres | UTF8      | Russian_Russia.1251 | Russian_Russia.1251 | =c/postgres          +
           |          |           |                     |                     | postgres=CTc/postgres
(3 строки)

postgres=# CREATE DATABASE skypro;
CREATE DATABASE

postgres=#
postgres=# \c skypro;
Вы подключены к базе данных "skypro" как пользователь "postgres".
skypro=# CREATE TABLE employee (
    skypro(# id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# first_name VARCHAR(50) NOT NULL,
        skypro(# last_name VARCHAR(50) NOT NULL,
        skypro(# gender VARCHAR(6) NOT NULL,
        skypro(# age INT NOT NULL
        skypro(# );
CREATE TABLE

skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
(0 строк)


skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Ivan', 'Ivanov', 'm', 17);
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Peter', 'Petrov', 'm', 19);
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Klim', 'Chugunkin', 'm', 25);
INSERT 0 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Ivan       | Ivanov    | m      |  17
  2 | Peter      | Petrov    | m      |  19
  3 | Klim       | Chugunkin | m      |  25
(3 строки)


skypro=# UPDATE employee SET first_name='Daenerys', last_name='Targaryen', gender='w', age='14' where id='2';
UPDATE 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Ivan       | Ivanov    | m      |  17
  3 | Klim       | Chugunkin | m      |  25
  2 | Daenerys   | Targaryen | w      |  14
(3 строки)

skypro=# DELETE FROM employee WHERE id='1';
DELETE 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Klim       | Chugunkin | m      |  25
  2 | Daenerys   | Targaryen | w      |  14
(2 строки)


    ***********************************
    Выборка данных  и вложенные запросы

skypro=#


skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Ivan', 'Ivanov', 'm', 17);
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Ivan', 'Ivanov', 'm', 17);
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Daria', 'Zhelyaeva', 'w', 27);
INSERT 0 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Klim       | Chugunkin | m      |  25
  2 | Daenerys   | Targaryen | w      |  14
  4 | Ivan       | Ivanov    | m      |  17
  5 | Ivan       | Ivanov    | m      |  17
  6 | Daria      | Zhelyaeva | w      |  27
(5 строк)

skypro=# update employee SET first_name='Peter', last_name='Petrov', gender='m', age='19' where id='4';
UPDATE 1
skypro=# select * from employee order by id;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  2 | Daenerys   | Targaryen | w      |  14
  3 | Klim       | Chugunkin | m      |  25
  4 | Peter      | Petrov    | m      |  19
  5 | Ivan       | Ivanov    | m      |  17
  6 | Daria      | Zhelyaeva | w      |  27
(5 строк)

skypro=# SELECT first_name AS Имя, last_name AS Фамилия From employee;
   Имя    |  Фамилия
----------+-----------
 Klim     | Chugunkin
 Daenerys | Targaryen
 Ivan     | Ivanov
 Daria    | Zhelyaeva
 Peter    | Petrov
(5 строк)
                                                             ^
skypro=# SELECT first_name AS Имя, last_name AS Фамилия From employee where age between 30 and 50;
 Имя | Фамилия
-----+---------
(0 строк)

skypro=# SELECT first_name AS Имя, last_name AS Фамилия From employee where age < 30 or age > 50;
   Имя    |  Фамилия
----------+-----------
 Klim     | Chugunkin
 Daenerys | Targaryen
 Ivan     | Ivanov
 Daria    | Zhelyaeva
 Peter    | Petrov
(5 строк)

skypro=# SELECT * From employee order by last_name desc;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  6 | Daria      | Zhelyaeva | w      |  27
  2 | Daenerys   | Targaryen | w      |  14
  4 | Peter      | Petrov    | m      |  19
  5 | Ivan       | Ivanov    | m      |  17
  3 | Klim       | Chugunkin | m      |  25
(5 строк)

skypro=# SELECT first_name From employee where first_name like '____%';
 first_name
------------
 Klim
 Daenerys
 Ivan
 Daria
 Peter
(5 строк)


skypro=# SELECT first_name From employee where first_name like '_____%';
 first_name
------------
 Daenerys
 Daria
 Peter
(3 строки)

    *******************


skypro=# UPDATE employee SET first_name='Ivan', last_name='Ivanov' where id='2';
UPDATE 1
skypro=# UPDATE employee SET first_name='Peter', last_name='Petrov' where id='3';
UPDATE 1
skypro=# UPDATE employee SET gender='m' where id='2';
UPDATE 1
skypro=# Select * from employee order by first_name;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  6 | Daria      | Zhelyaeva | w      |  27
  5 | Ivan       | Ivanov    | m      |  17
  2 | Ivan       | Ivanov    | m      |  14
  4 | Peter      | Petrov    | m      |  19
  3 | Peter      | Petrov    | m      |  25
(5 строк)

skypro=# select first_name as имя, sum(age) as суммарный_возраст from employee group by first_name;
  имя  | суммарный_возраст
-------+-------------------
 Daria |                27
 Ivan  |                31
 Peter |                44
(3 строки)


skypro=# select first_name as имя, last_name as фамилия, age as возраст from employee where age=(select min(age) from employee);
 имя  | фамилия | возраст
------+---------+---------
 Ivan | Ivanov  |      14
(1 строка)



skypro=# select first_name as имя, last_name as фамилия, age as возраст from employee
skypro-# where age=(select max(age) from employee where first_name='Ivan')
skypro-# or
skypro-# age=(select max(age) from employee where first_name='Peter')
skypro-# order by age;
  имя  | фамилия | возраст
-------+---------+---------
 Ivan  | Ivanov  |      17
 Peter | Petrov  |      25
(2 строки)
