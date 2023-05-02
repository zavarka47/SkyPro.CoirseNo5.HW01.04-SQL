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


skypro=#