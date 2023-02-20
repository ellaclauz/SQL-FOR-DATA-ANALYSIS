-- data cleaning
-- check for missing values

select *
from project 
where year is null or month is null or supplier is null or itemcode is null 
or itemdescription is null or itemtype is null or retailsales is null or retailtransfers is null
or warehousesales is null;

-- check for duplicates

select year, month, supplier, itemcode, itemdescription, itemtype, retailsales, retailtransfers, warehousesales
from project 
group by year, month, supplier, itemcode, itemdescription, itemtype, retailsales, retailtransfers, warehousesales
having count(*) > 1;

/* removing rows with missing values
since it is less than 1% of the whole dataset */

delete from project 
where year is null or month is null or supplier is null or itemcode is null 
or itemdescription is null or itemtype is null or retailsales is null or retailtransfers is null
or warehousesales is null; 