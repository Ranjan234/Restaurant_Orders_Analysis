-- 1. Combine the menu items and order_details tables in a single table.alter
select * from menu_items;
select * from order_details;

select * 
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id;
-- 2. What were the least and most ordered items? What categories were they in?
select  item_name, category, count(order_details_id) as num_purchases
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
 group by item_name, category 
 order by num_purchases desc;
-- 3. What were the top 5 orders that spent the most money?

    
-- 4.View the details of the heighest spend order. What insights can you gather from the 
select category, count(item_id) as num_items
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
where order_id = 440
group by category;
-- 5. view the details of the 5 highest spend orders. What insights can you gather 
select order_id, category, count(item_id) as num_items
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
where order_id in (440, 2075, 1975, 330,2675)
group by order_id, category;

'440' , '192.15'
'2075',	'191.05'
'1957',	'190.10'
'330',	'189.70'
'2675',	'185.10'