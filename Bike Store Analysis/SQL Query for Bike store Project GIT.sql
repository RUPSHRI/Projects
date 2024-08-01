SELECT
	O.ORDER_ID,
	CONCAT(C.FIRST_NAME, ' ', C.LAST_NAME) as 'customers' ,
	C.CITY,
	C.STATE,
	O.ORDER_DATE,
	SUM(i.QUANTITY) AS 'total_units',
	SUM(i.QUANTITY * i.LIST_PRICE) AS 'revenue',
	p.product_name,
	pc.category_name,
	pb.brand_name,
	ss.store_name,
	CONCAT(sst.FIRST_NAME, ' ', sst.LAST_NAME) AS 'sales_rep'
from sales.orders o
join sales.customers c
on o.customer_id = c.customer_id
join sales.order_items i
on o.order_id = i.order_id
join production.products p
on i.product_id = p.product_id
join production.categories pc
on p.category_id = pc.category_id
join sales.stores ss
on o.store_id = ss.store_id
join sales.staffs sst
on o.staff_id = sst.staff_id
join production.brands pb
on p.brand_id = pb.brand_id
group by 
	O.ORDER_ID,
	CONCAT(C.FIRST_NAME, ' ', C.LAST_NAME) ,
	C.CITY,
	C.STATE,
	O.ORDER_DATE,
	p.product_name,
	pc.category_name,
	pb.brand_name,
	ss.store_name,
	CONCAT(sst.FIRST_NAME, ' ', sst.LAST_NAME) 