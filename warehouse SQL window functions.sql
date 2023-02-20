/* USING THE WINDOW FUNCTIONS */

-- what is the total retail sales for each supplier, broken down by year and month 

select year, month, supplier,
       sum(retailsales) over (partition by supplier, year, month) as total_retail_sales
from project;

-- what is the running total of retail sales for each item type, order by month?

select year, month, itemtype,
       sum(retailsales) over (partition by itemtype order by month) as running_total_retail_sales
from project;

-- for each item description , what is the month with the highest retail sales in each year?

select year, itemdescription,
       max(retailsales) over (partition by year, itemdescription) as highest_retail_sales_month
from project;

/* what is the difference in retail sales between each month and the previous month, for each
 * supplier and item type?
 */ 

select year, month, supplier, itemtype,
       retailsales - lag(retailsales) over (partition by supplier, itemtype order by year, month) as diff_retail_sales
from project;   

/* what is the average retail sales for each item type compared to the overall average retail sales across
 * all item types for each year?
 */

select year, itemtype,
       avg(retailsales) over (partition by year, itemtype) as avg_retail_sales,
       avg(retailsales) over (partition by year) as overall_avg_retail_sales
from project;

-- what is the cumulative sum of warehouse sales for each supplier, broken down by year?

select year, supplier,
       sum(warehousesales) over (partition by supplier order by year) as cumulative_sum_warehouse_sales
from project;

/* What is the percentage of retail sales for each supplier, compared to the total retail sales
 *  across all suppliers, broken down by year and month?
*/ 

select year, month, supplier,
       100*sum(retailsales) over (partition by supplier, year, month)/sum(retailsales) over (partition by year, month) as pct_of_total_retail_sales
from project;

-- What is the month with the highest retail transfer for each supplier, for the past 12 months?

select year, month, supplier, 
       max(retailtransfers) over (partition by supplier order by year, month rows between 11 preceding and current row) as highest_retail_transfer
from project;

