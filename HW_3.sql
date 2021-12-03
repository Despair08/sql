--Если для какого-то кейса надо сделать дополнительную таблицу, наполнить её данными, то делайте )
--
--
-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name as "имя работника", 
	   monthly_salary as "зп работника" 
from employee_salary
join employees
on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name as "имя работника", 
	   monthly_salary as "зп работника < 2000" 
from employee_salary
join employees
on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id
where salary.monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary as "ЗП", 
	   employee_id    as "кто-то, кто ее получает"
from salary
join employee_salary
on employee_salary.employee_id = salary.id;
	  
-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary as "ЗП < 2000", 
	   employee_id    as "кто-то, кто ее получает"
from salary
join employee_salary
on employee_salary.employee_id = salary.id
where monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select employee_name as "имя работника без ЗП", 
	   monthly_salary as "ЗП отсутствует"
from salary
join employee_salary
on employee_salary.employee_id = salary.id
right join employees
on employee_salary.employee_id = employees.id
where employees.id > 16;

-- 6. Вывести всех работников с названиями их должности.

select employee_name as "имя работника",
	   role_name     as "название его должности"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.

select employee_name as "имя Java разаработчика",
	   role_name     as "должность"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
where role_name like '%Java %';

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name as "имя Python разаработчика",
	   role_name     as "должность"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
	 
select employee_name as "имя QA инженера",
	   role_name     as "должность"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
where role_name like '%QA%';	 

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name as "имя ручного QA инженера",
	   role_name     as "должность"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
where role_name like '%Manual%QA%'
	or role_name like '%manual%QA%'
	or role_name like '%QA%Manual%'
	or role_name like '%QA%manual%';

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name as "имя автоматизатора QA",
	   role_name     as "должность"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
where role_name like '%Automation%QA%'
	or role_name like '%QA%Automation%'
	or role_name like '%QA%automation%'
	or role_name like '%automation%QA%';

-- 12. Вывести имена и зарплаты Junior специалистов

select  employee_name as "имя Junior специалиста", 
		monthly_salary as "ЗП Junior специалиста"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%Junior%'
	or role_name like '%junior%';

-- 13. Вывести имена и зарплаты Middle специалистов

select  employee_name as "имя Middle специалиста", 
		monthly_salary as "ЗП Middle специалиста"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%Middle%'
	or role_name like '%middle%';

-- 14. Вывести имена и зарплаты Senior специалистов

select  employee_name as "имя Senior специалиста", 
		monthly_salary as "ЗП Senior специалиста"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%Senior%'
	or role_name like '%senior%';

-- 15. Вывести зарплаты Java разработчиков

select  employee_name as "имя Java специалиста", 
		monthly_salary as "ЗП Java специалиста"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%Java %'
	or role_name like '%java %';

-- 16. Вывести зарплаты Python разработчиков

select  employee_name as "имя Python специалиста", 
		monthly_salary as "ЗП Python специалиста"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%Python%'
	or role_name like '%python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select  employee_name as "имя Junior Python специалиста", 
		monthly_salary as "ЗП Junior Python специалиста"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%Junior%'
	and role_name like '%Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select  employee_name as "имя Middle JS специалиста", 
		monthly_salary as "ЗП Middle JS специалиста"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%Middle%' 
	and (role_name like '%JavaScript%'
		 or role_name like '%JS%');

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select  employee_name as "имя Senior Java специалиста",
		monthly_salary as "ЗП Senior Java специалиста"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%Java %'
	and role_name like '%Senior%';

-- 20. Вывести зарплаты Junior QA инженеров

select monthly_salary as "ЗП Junior QA инженера"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%Junior%'
	and role_name like '%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select  employee_name as "имя Junior специалиста",
		role_name,
		monthly_salary as "ЗП Junior специалиста"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%Junior%QA%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) as "Сумма зарплат JS разработчиков"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров

select  min(monthly_salary) as "Минимальная ЗП QA инженеров"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
left join salary
on salary.id = employee_salary.salary_id 
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров

select  max(monthly_salary) as "максимальная ЗП QA инженеров"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
left join salary
on salary.id = employee_salary.salary_id 
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров

select count(employees.id) as "Количество QA инженеров"
from roles
join roles_employee
on roles_employee.role_id = roles.id 
join employees 
on roles_employee.employee_id = employees.id
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.

select count(employees.id) as "Количество Middle специалистов"
from roles
join roles_employee
on roles_employee.role_id = roles.id 
join employees 
on roles_employee.employee_id = employees.id
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков

select count(employees.id) as "Количество разработчиков"
from roles
join roles_employee
on roles_employee.role_id = roles.id 
join employees 
on roles_employee.employee_id = employees.id
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) as "Сумма зарплат разработчиков"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name as "имена",
	   role_name as "должности",
	   monthly_salary as "ЗП по возрастанию"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
order by monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name as "имена",
	   role_name as "должности",
	   monthly_salary as "ЗП от 1700 до 2300"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where monthly_salary between 1700 and 2300
order by monthly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name as "имена",
	   role_name as "должности",
	   monthly_salary as "ЗП меньше 2300"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where monthly_salary < 2300
order by monthly_salary;


-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name as "имена",
	   role_name as "должности",
	   monthly_salary as "ЗП равна 1100, 1500, 2000"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
join salary
on salary.id = employee_salary.salary_id 
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;

--Сколько денег зарабатывает какая роль

select DISTINCT role_name as "название роли",
	   monthly_salary as "зп роли"
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id = roles.id
join employee_salary
on employee_salary.salary_id = roles_employee.role_id 
left join salary
on salary.id = employee_salary.salary_id
order by monthly_salary;



