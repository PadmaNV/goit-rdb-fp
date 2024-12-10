/*3. Проаналізуйте дані:

Для кожної унікальної комбінації Entity та Code або їх id порахуйте середнє,
 мінімальне, максимальне значення та суму для атрибута Number_rabies.
💡 Врахуйте, що атрибут Number_rabies може містити порожні значення ‘’
 — вам попередньо необхідно їх відфільтрувати.

Результат відсортуйте за порахованим середнім значенням у порядку спадання.
Оберіть тільки 10 рядків для виведення на екран.
     */

select
	country_id,
    avg(Number_rabies) as aver,
    min(Number_rabies) as min,
    max(Number_rabies) as max,
    sum(Number_rabies) as sum
from infectious_cases_norm
where Number_rabies is not null and Number_rabies <> ''
group by country_id
order by aver desc
limit 10;