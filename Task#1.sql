/*1. Завантажте дані: 
		-Створіть схему pandemic у базі даних за допомогою SQL-команди.
		-Оберіть її як схему за замовчуванням за допомогою SQL-команди.
		-Імпортуйте дані за допомогою Import wizard так, як ви вже робили це у темі 3.
		     Продивіться дані, щоб бути у контексті.
		  */
        
create schema if not exists pandemic;

use pandemic;

select * from infectious_cases;