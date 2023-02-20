CREATE TABLE "project" (YEAR text, MONTH int, SUPPLIER varchar(250), ITEMCODE varchar(50), ITEMDESCRIPTION varchar(355), ITEMTYPE varchar(50), RETAILSALES real, RETAILTRANSFERS real, WAREHOUSESALES real) 

select * from project;

COPY public."project" FROM 'C:\Users\STELLA\Downloads\Warehouse_and_Retail_Sales.csv' DELIMITER ',' CSV HEADER;