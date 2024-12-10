/*4. Побудуйте колонку різниці в роках.

Для оригінальної або нормованої таблиці для колонки Year побудуйте з використанням вбудованих SQL-функцій:

атрибут, що створює дату першого січня відповідного року,
💡 Наприклад, якщо атрибут містить значення ’1996’, то значення нового атрибута має бути ‘1996-01-01’.
атрибут, що дорівнює поточній даті,
атрибут, що дорівнює різниці в роках двох вищезгаданих колонок.
💡 Перераховувати всі інші атрибути, такі як Number_malaria, не потрібно.


👉🏼 Для пошуку необхідних вбудованих функцій вам може знадобитися матеріал до теми 7.
     */
     
     
select 
	Year,
    makedate(Year, 1) as first_date_of_year,
    curdate() as today,
    timestampdiff(YEAR, makedate(Year, 1), curdate()) as diff_time

from infectious_cases_norm;