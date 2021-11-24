-- 1. Вывести все поля и все строки.

SELECT * FROM students;

-- 2. Вывести всех студентов в таблице

SELECT name FROM students;

-- 3. Вывести только Id пользователей

SELECT id FROM students;

-- 4. Вывести только имя пользователей

SELECT name FROM students;

-- 5. Вывести только email пользователей

SELECT email FROM students;

-- 6. Вывести имя и email пользователей

SELECT name, email FROM students;

-- 7. Вывести id, имя, email и дату создания пользователей

SELECT name, email, created_on FROM students;

-- 8. Вывести пользователей где password 12333

SELECT * FROM students
WHERE password LIKE '%12333%';

-- 9. Вывести пользователей которые были созданы 2021-03-26 00:00:00

SELECT * FROM students
WHERE created_on = '2021-03-26 00:00:00';

-- 10. Вывести пользователей где в имени есть слово Анна

SELECT * FROM students
WHERE name LIKE '%Анна%';

-- 11. Вывести пользователей где в имени в конце есть 8

SELECT * FROM students
WHERE name LIKE '%8';

-- 12. Вывести пользователей где в имени в есть буква а

SELECT * FROM students
WHERE name LIKE '%a%' or name like '%а%';

-- 13. Вывести пользователей которые были созданы 2021-07-12 00:00:00

SELECT * FROM students
WHERE created_on = '2021-07-12 00:00:00';

--  14. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и имеют пароль 1m313

SELECT * FROM students
WHERE created_on = '2021-07-12 00:00:00' AND password = '1m313';

-- 15. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть слово Andrey


SELECT * FROM students
WHERE created_on = '2021-07-12 00:00:00' AND name LIKE '%Andrey%';

-- 16. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть цифра 8

SELECT * FROM students
WHERE created_on = '2021-07-12 00:00:00' AND name LIKE '%8%';


-- 17. Вывести пользователя у которых id равен 10

SELECT * FROM students
WHERE id = 10;

-- 18. Вывести пользователя у которых id равен 53

SELECT * FROM students
WHERE id = 53;

-- 19. Вывести пользователя у которых id больше 40

SELECT * FROM students
WHERE id > 40;

-- 20. Вывести пользователя у которых id меньше 30

SELECT * FROM students
WHERE id < 30;

-- 21. Вывести пользователя у которых id меньше 27 или больше 88

SELECT * FROM students
WHERE id < 27 OR id > 88;

-- 22. Вывести пользователя у которых id меньше либо равно 37

SELECT * FROM students
WHERE id <= 37;

-- 23. Вывести пользователя у которых id больше либо равно 37

SELECT * FROM students
WHERE id >= 37;

-- 24. Вывести пользователя у которых id больше 80 но меньше 90

SELECT * FROM students
WHERE id > 80 AND id < 90;

-- 25. Вывести пользователя у которых id между 80 и 90

SELECT * FROM students
WHERE id BETWEEN 80 AND 90;

-- 26. Вывести пользователей где password равен 12333, 1m313, 123313

SELECT * FROM students
WHERE password IN ('12333', '1m313', '123313');

-- 27. Вывести пользователей где created_on равен 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00

SELECT * FROM students
WHERE created_on IN ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

-- 28. Вывести минимальный id 

SELECT min(id) FROM students;

-- 29. Вывести максимальный.

SELECT max(id) FROM students;

-- 30. Вывести количество пользователей

SELECT count(id) FROM students;

-- 31. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку возрастания даты добавления пользоватлеля.

SELECT id, name, created_on FROM students
ORDER BY created_on;

-- 32. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку убывания даты добавления пользоватлеля.

SELECT id, name, created_on FROM students
ORDER BY created_on DESC;

