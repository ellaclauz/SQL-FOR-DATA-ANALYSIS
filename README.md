# SQL-FOR-DATA-ANALYSIS


![warehouse](https://user-images.githubusercontent.com/100838547/224486570-d7976cc8-bc0b-4a6e-a39f-1654016ceac8.jpg)

## PostgreSQL project for analyzing warehouse and retail sales with the following questions.

* what is the total retail sales for each supplier?

 QUERY:
 ```sql
 select supplier, sum(retailsales) as total_retail_sales
from project 
group by supplier;
 ```
RESULT:

![supply](https://user-images.githubusercontent.com/100838547/224489292-87e0be9c-c732-4b43-8bf8-565bbc054124.png)
* what is the total retail sales for each combination of supplier and month

QUERY:
```sql
select supplier, year, month, sum(retailsales) as total_retail_sales
from project 
group by supplier, year, month;
```
RESULT:

![S2](https://user-images.githubusercontent.com/100838547/224490032-fcd48f03-6b2a-4a76-a0f8-f4d74d25819d.png)

* what is the maximum warehouse sales for each item description?

QUERY:
```sql
select itemdescription, max(retailsales) as max_warehouse_sales
from project 
group by itemdescription;
```
RESULT:

![S3](https://user-images.githubusercontent.com/100838547/224490291-90dffa9b-fa4e-4514-8df8-5f2ffbb4cb28.png)

* what is the average retail transfer for each year 

QUERY:
```sql
select year, avg(retailtransfers) as avg_retail_transfers
from project 
group by year;
```

RESULT:

![S4](https://user-images.githubusercontent.com/100838547/224490466-0d7f489f-88b2-4aad-8156-c5072dd131ca.png)

* for each item description, what is the difference between the maximum and minimum retail sales? 
QUERY:
```sql
select itemdescription, max(retailsales) - min(retailsales) as diff_max_min_retail_sales
from project 
group by itemdescription;
```
RESULT:

![S5](https://user-images.githubusercontent.com/100838547/224490734-631015ab-8936-4c4a-9c73-3e3a399d0b68.png)

* what is the total retail sales for each supplier, broken down by year and month 

QUERY:
```sql
select year, month, supplier,
       sum(retailsales) over (partition by supplier, year, month) as total_retail_sales
from project;
```

RESULT:
![S6](https://user-images.githubusercontent.com/100838547/224491227-92c48a4c-6169-4b7e-9375-3d224715f18c.png)

* what is the running total of retail sales for each item type, order by month?
QUERY:
```sql
select year, month, itemtype,
       sum(retailsales) over (partition by itemtype order by month) as running_total_retail_sales
from project;
```

RESULT:

![S7](https://user-images.githubusercontent.com/100838547/224491546-11d65523-edc9-4f63-820f-7473c1926e81.png)


* what is the difference in retail sales between each month and the previous month, for each supplier and item type?
QUERY:
```sql
select year, month, supplier, itemtype,
       retailsales - lag(retailsales) over (partition by supplier, itemtype order by year, month) as diff_retail_sales
from project; 
```

RESULT:

![S8](https://user-images.githubusercontent.com/100838547/224491808-dd42d7ad-695e-45c0-81e1-0fb823980eb2.png)

* what is the average retail sales for each item type compared to the overall average retail sales across all item types for each year?
* What is the percentage of retail sales for each supplier, compared to the total retail sales across all suppliers, broken down by year and month?
* What is the month with the highest retail transfer for each supplier, for the past 12 months?


NOTE: This is just a sample of the query and results


 
