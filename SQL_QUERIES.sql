
--displaying exactly ten columns
select * from retailed_sales
limit 10
--to count total number of rows
select count(*) from retailed_sales
--displaying all rows having missing or null values
select * from retailed_sales
where transactions_id is NULL or 
sale_date	is NULL or
sale_time is NULL or
customer_id	is NULL or
gender is NULL	or
age is NULL	or
category is NULL or
quantiy is NULL or
price_per_unit is NULL or
cogs is NULL or
total_sale is NULL 
--deleting the rows having null values
delete from retailed_sales
where
transactions_id is NULL or 
sale_date	is NULL or
sale_time is NULL or
customer_id	is NULL or
gender is NULL	or
age is NULL	or
category is NULL or
quantiy is NULL or
price_per_unit is NULL or
cogs is NULL or
total_sale is NULL 
--data exploration

--how many total rows
select count(*) as total_sale from retailed_sales
--count the total number of customers we have
select count(distinct customer_id) as customers from retailed_sales
-- display the types of categories
select distinct category from retailed_sales
--Data Analysis and Bussiness Key Problems
--My Analysis and Findings
--1) WRITE AN SQL QUERY TO RETREIVE ALL THE SALES MADE ON '2022-11-05'
select * from retailed_sales 
where sale_date = '2022-11-05';
--2) Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
select * from retailed_sales where category = 'Clothing' and quantiy > 4 and TO_CHAR(sale_date,'YYYY-MM') = '2022-11';
--3)Write a SQL query to calculate the total sales (total_sale) for each category.:
select category , sum(total_sale) as net_sale,count(*) as total_orders
from retailed_sales 
group by  category;
--4)Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
SELECT ROUND(AVG(age),2) as average_age 
from retailed_sales
where category = 'Beauty'
--5)Write a SQL query to find all transactions where the total_sale is greater than 1000.:
SELECT * from retailed_sales
where total_sale > 1000
--6)**Write a SQL query to find the top 5 customers based on the highest total sales **:
select customer_id, sum(total_sale) 
from retailed_sales
group by 1 
order by 2 desc
limit 5
--7)Write a SQL query to find the number of unique customers who purchased items from each category.:
select category,count(customer_id) as total_customers 
from retailed_sales
group by category;
--8)Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select category,gender ,count(*)
from retailed_sales
group by category,gender

