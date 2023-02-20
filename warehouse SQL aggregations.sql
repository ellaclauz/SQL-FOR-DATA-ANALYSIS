/* USING THE AGGREGATE FUNCTIONS */

-- what is the total retail sales for each supplier ?

select supplier, sum(retailsales) as total_retail_sales
from project 
group by supplier;

-- how many distinct item codes are in the dataset?

select count(distinct itemcode) as distinct_item_codes
from project;

-- what is the total retail sales for each item type 

select itemtype, sum(retailsales) as total_retail_sales
from project 
group by itemtype;

-- what is the total retail sales for each combination of supplier and month 

select supplier, year, month, sum(retailsales) as total_retail_sales
from project 
group by supplier, year, month;

-- what is the maximum warehouse sales for each item description?

select itemdescription, max(retailsales) as max_warehouse_sales
from project 
group by itemdescription;

-- what is the average retail transfer for each year 

select year, avg(retailtransfers) as avg_retail_transfers
from project 
group by year;

/* for each item description, what is the difference between the maximum and minimum retail sales? */

select itemdescription, max(retailsales) - min(retailsales) as diff_max_min_retail_sales
from project 
group by itemdescription;

/* what is the total retail sales for each item type where the retail sales exceed 1000?
*/

select itemtype, sum(retailsales) as total_retail_sales
from project 
where retailsales > 1000
group by itemtype;

/* what is the average daily retail sales for each combination of supplier and item code? */

select supplier, itemcode, avg(retailsales) as avg_daily_retail_sales
from project 
group by supplier, itemcode;