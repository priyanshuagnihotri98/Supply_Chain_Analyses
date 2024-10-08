create database supplychai;

create table supplychain(Type varchar(255),shipping_days_real int,shipment_days_scheduled int,benefit_per_order decimal,
Sales_per_customer decimal ,Delivery_Status varchar(255),Late_delivery_risk	int, category_Id int,shipping_date date,shipping_month varchar(255),
shipping_year year,Shipping_Mode varchar(255),Customer_City varchar(255),Customer_Country varchar(255), Customer_Fname varchar(255)	,Customer_Id int,Customer_Lname	varchar (255),
  Custcustomer_Segment varchar(255), Customer_State varchar(255),Customer_Street varchar(255),Customer_Zipcode int	,Department_Id	int,
  Department_Name varchar(255),Market varchar(255),Order_City char(255),Order_Country varchar(255),Order_Customer_Id varchar(255),Order_Date date	
,Order_Month varchar(25),Order_Year year,Order_Id int,Order_Item_Cardprod_Id int,Order_Item_Discount decimal,Order_Item_Discount_Rate decimal,
Order_Item_Id int,Order_Item_Product_Price decimal,Order_Item_Profit_Ratio decimal,Order_Item_Quantity int,sales decimal, Order_Profit_Per_Order decimal,
Order_Region varchar(255),Order_State varchar(255),Order_Status varchar(255),Product_Card_Id int,Product_Category_Id int,Product_Name varchar(255),
Product_Price decimal);

select * from datacosupplychaindataset;

ALTER TABLE datacosupplychaindataset
DROP COLUMN Product_Status ;

select sum(sales) from datacosupplychaindataset;

--  revenue after dis by category
select sum(order_item_total) as revenue_afterdis  , category_name
from datacosupplychaindataset
group by Category_name
order by revenue_afterdis DESC ;

select sum(Order_Item_Total) as total_revenue_afterdis from datacosupplychaindataset;

-- total revenue before dis
select sum(sales) as total_revenue_beforedis from datacosupplychaindataset;

-- compare revenue after and before discount
select sum(order_item_total) as after_dis, sum(sales) as bef from datacosupplychaindataset;

-- sales by year
select order_year, sum(order_item_total) as total_revenue
 from datacosupplychaindataset
 group by order_year
 order by total_revenue DESC;
 
 
 
 select month(order_date) as month , sum(order_item_total) as total_revenue
 from datacosupplychaindataset
 where order_date = 2016
 group by month
 order by total_revenue ;

-- revenue by department 
select sum(order_item_total) as total_sum, department_name
 from datacosupplychaindataset
 group by department_name
 order by total_sum desc ;
 
 -- revenue by category and product
 select  category_name, product_name,sum(order_item_total) as revenue
 from datacosupplychaindataset
 group by category_name, product_name
 order by revenue desc 
 limit 10;
 
 -- revenue by customer
 select  Customer_Id, sum(order_item_total) as revenue, concat(customer_fname," ",customer_Lname) as name
 from datacosupplychaindataset
 group by customer_id,name
 order by revenue desc;
 
 select concat(customer_fname," ",customer_Lname) as name, customer_id
 
 
 
 
 
 
 
 
 