/*💡 Як бачите, атрибути Entity та Code постійно повторюються. 
	 Позбудьтеся цього за допомогою нормалізації даних.
     
     2. Нормалізуйте таблицю infectious_cases до 3ї нормальної форми.
     Збережіть у цій же схемі дві таблиці з нормалізованими даними.
     */

create table country (
id int auto_increment primary key,
entity varchar(34) not null,
code varchar(8) not null
);

insert into country (entity, code)
select distinct Entity, Code from infectious_cases;

select * from country;

drop table if exists infectious_cases_norm;

create table infectious_cases_norm like infectious_cases;
select * from infectious_cases_norm;

alter table infectious_cases_norm
add column id int unsigned not null auto_increment first, add primary key (id),
add column country_id int,
add constraint infectious_cases_norm_country_fk
foreign key (country_id) references  country(id),
drop column entity, 
drop column code;

insert into infectious_cases_norm
(
   `country_id`,
   `Year`,
   `Number_yaws`,
   `polio_cases`,
   `cases_guinea_worm`,
   `Number_rabies`,
   `Number_malaria`,
   `Number_hiv`,
   `Number_tuberculosis`,
   `Number_smallpox`,
   `Number_cholera_cases`
 )
 (
 select 
   country.`id`,
   `Year`,
   `Number_yaws`,
   `polio_cases`,
   `cases_guinea_worm`,
   `Number_rabies`,
   `Number_malaria`,
   `Number_hiv`,
   `Number_tuberculosis`,
   `Number_smallpox`,
   `Number_cholera_cases`
   
   from infectious_cases
   inner join country on infectious_cases.Entity = country.entity and infectious_cases.Code=country.code
 
 )
 ;
 
select * from country;
select * from infectious_cases_norm;

drop table if exists infectious_cases;