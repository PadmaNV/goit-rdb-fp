/*5. Побудуйте власну функцію.

Створіть і використайте функцію, що будує такий же атрибут,
 як і в попередньому завданні: функція має приймати на вхід 
 значення року, а повертати різницю в роках між поточною датою 
 та датою, створеною з атрибута року (1996 рік → ‘1996-01-01’).
     */
     
     
DROP FUNCTION IF EXISTS diff_years;

DELIMITER  //

create function diff_years(input_year int)
	returns int
    deterministic
    no sql
    begin
		return timestampdiff(YEAR, makedate(input_year,1), curdate());
end;
    //
    
DELIMITER ;

select 
	icn.year,
    diff_years(icn.year)
    from infectious_cases_norm icn;
