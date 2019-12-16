#1
SELECT * FROM employee ORDER BY employee_first_name;

#2
SELECT employee.employee_first_name, employee.employee_last_name,
       AVG(salary.salary_sum) AS average_salary
FROM employee
         INNER JOIN salary ON employee.employee_id = salary.employee_id
GROUP BY salary.employee_id;

#3
SELECT position.position_name,
       AVG(salary.salary_sum) AS average_salary,
       MAX(salary.salary_sum) AS max_salary
FROM position
         INNER JOIN salary ON position.position_id = salary.position_id
GROUP BY position.position_id;

#4
SELECT employee.employee_first_name,
       employee.employee_last_name,
       COUNT(income.date_of_work) AS total_worked_day,
       SUM(income.daily_profit)   as total_income
FROM employee
         INNER JOIN income ON income.employee_id = employee.employee_id
GROUP BY income.employee_id;

#5
SELECT transport.transport_id,
       transport.type_of_transport,
       transport.license_plate,
       SUM(income.daily_profit)   AS total_income,
       AVG(income.daily_profit)   AS average_incom,
       COUNT(income.date_of_work) AS worked_days
FROM income
         INNER JOIN transport ON income.transport_id = transport.transport_id
GROUP BY transport.transport_id
ORDER BY worked_days DESC;

#6
SELECT employee_first_name, employee_last_name, dob
FROM employee
WHERE MONTH(dob) = 05;

#7
SELECT employee_first_name,
       employee_last_name,
       date_of_employment,
       (YEAR(CURRENT_DATE) - YEAR(date_of_employment)) - (RIGHT(CURRENT_DATE, 5) < RIGHT(date_of_employment, 5))
           AS total_worked_years
FROM employee;
