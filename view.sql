CREATE OR REPLACE VIEW  items1view AS
SELECT items.* , categories.* , SUM( rating.rating_rating)/COUNT( rating.rating_rating) AS `totalrating` FROM rating,items 
INNER JOIN  categories on  items.items_categories = categories.categories_id
-- LEFT JOIN rating ON rating.rating_item = items.items_id 
-- RIGHT JOIN rating ON rating.rating_item = items.items_id 

-- CREATE OR REPLACE VIEW myratingview AS
-- SELECT rating.*,items.*, SUM( rating.rating_rating)/COUNT( rating.rating_rating) AS `totalrating`,users.users_id FROM `rating`
-- INNER JOIN users ON users.users_id= rating.rating_userid
-- INNER JOIN items ON items.items_id= rating.rating_item;

CREATE OR REPLACE VIEW myratingview AS
SELECT rating.*,items1view.*, users.users_id FROM `rating`
RIGHT JOIN users ON users.users_id= rating.rating_userid
RIGHT JOIN items1view ON items1view.items_id= rating.rating_item;

-- CREATE OR REPLACE VIEW myfavoriteview AS
-- SELECT favorite.*,myratingview.* FROM `favorite`
-- INNER JOIN myratingview ON myratingview.items_id= favorite.favorite_items;

-- CREATE OR REPLACE VIEW myfavoriteview AS
-- SELECT favorite.*,items.*,users.users_id FROM `favorite`
-- INNER JOIN users ON users.users_id= favorite.favorite_usersid
-- INNER JOIN items ON items.items_id= favorite.favorite_items;

-- CREATE OR REPLACE VIEW myfavoriteview AS
-- SELECT favorite.*,myratingview.*,users.users_id FROM `favorite`
-- INNER JOIN users ON users.users_id= favorite.favorite_usersid
-- INNER JOIN myratingview ON myratingview.items_id= favorite.favorite_items;

-- CREATE VIEW myfavoriteview AS
-- SELECT favorite.*,items.*,users.users_id FROM `favorite`
-- INNER JOIN users ON users.users_id= favorite.favorite_usersid
-- INNER JOIN items ON items.items_id= favorite.favorite_items;


-- CREATE OR REPLACE VIEW cartview AS
-- SELECT SUM( items.items_price) AS itemsprice, COUNT(cart.cart_itemsid) AS countitems , items.*,cart.* FROM `cart` 
-- INNER JOIN items ON items.items_id = cart.cart_itemsid
-- GROUP BY cart.cart_itemsid, cart.cart_userid

CREATE OR REPLACE VIEW cartview AS
SELECT SUM( items.items_price-((items.items_price*items.items_discount)/100)) AS itemsprice,
(SUM( items.items_price-((items.items_price*items.items_discount)/100))/COUNT(cart.cart_itemsid)) AS finalpriceofoneitem,
COUNT(cart.cart_itemsid) AS countitems , items.*,cart.* FROM `cart` 
INNER JOIN items ON items.items_id = cart.cart_itemsid
WHERE cart_orders=0
GROUP BY cart.cart_itemsid, cart.cart_userid, cart.cart_userid;


-- CREATE OR REPLACE VIEW ordersview AS
-- SELECT orders.*,  address.*  FROM `orders` 
-- LEFT JOIN address ON address.address_id = orders.orders_address;

CREATE OR REPLACE VIEW ordersview AS
SELECT orders.*, address.*,  users.* ,delivery.* FROM `orders`
LEFT JOIN users ON users.users_id = orders.orders_userid
LEFT JOIN delivery ON delivery.delivery_id = orders.orders_deliveryid
LEFT JOIN address ON address.address_id = orders.orders_address;



CREATE OR REPLACE VIEW orderdetailsview AS
SELECT SUM( items.items_price-((items.items_price*items.items_discount)/100)) AS itemsprice,
COUNT(cart.cart_itemsid) AS countitems , items.*,cart.* FROM `cart` 
INNER JOIN items ON items.items_id = cart.cart_itemsid
INNER JOIN ordersview ON ordersview.orders_id = cart.cart_orders
WHERE cart_orders!=0
GROUP BY cart.cart_itemsid AND cart.cart_userid;  



CREATE OR REPLACE VIEW itemstopselling AS
SELECT COUNT(`cart_itemsid`) AS `countitems`, cart.*, finalallitems.* FROM `cart`
INNER JOIN finalallitems ON finalallitems.items_id=cart.cart_itemsid
WHERE cart.cart_orders != 0
GROUP BY `cart_itemsid`
ORDER BY countitems DESC


CREATE OR REPLACE VIEW allitems AS
SELECT * FROM `myratingview` 
GROUP BY `myratingview`.`items_id`



CREATE OR REPLACE VIEW finalallitems AS
(SELECT myratingview.*, 1 AS `favorite`,SUM( myratingview.rating_rating)/COUNT( myratingview.rating_rating) AS `totalrating` , myratingview.items_price-((myratingview.items_price*myratingview.items_discount)/100) AS `itemspricediscount` FROM `myratingview`
 INNER JOIN favorite ON favorite.favorite_items = myratingview.items_id 
   GROUP BY items_id) 
 UNION  ALL
(SELECT myratingview.*, 0 AS `favorite`,SUM( myratingview.rating_rating)/COUNT( myratingview.rating_rating) AS `totalrating` , myratingview.items_price-((myratingview.items_price*myratingview.items_discount)/100) AS `itemspricediscount` FROM `myratingview` 
WHERE  myratingview.items_id NOT IN (SELECT favorite_items FROM favorite)  GROUP BY items_id)

-- CREATE OR REPLACE VIEW finalallitemsuser AS
-- (SELECT myratingview.*, 1 AS `favorite`,SUM( myratingview.rating_rating)/COUNT( myratingview.rating_rating) AS `totalrating` , myratingview.items_price-((myratingview.items_price*myratingview.items_discount)/100) AS `itemspricediscount` FROM `myratingview`
--  INNER JOIN favorite ON favorite.favorite_items = myratingview.items_id 
--    GROUP BY items_id AND users_id) 
--  UNION  ALL
-- (SELECT myratingview.*, 0 AS `favorite`,SUM( myratingview.rating_rating)/COUNT( myratingview.rating_rating) AS `totalrating` , myratingview.items_price-((myratingview.items_price*myratingview.items_discount)/100) AS `itemspricediscount` FROM `myratingview` 
-- WHERE  myratingview.items_id NOT IN (SELECT favorite_items FROM favorite)  GROUP BY items_id AND users_id)


CREATE OR REPLACE VIEW myfavoriteview AS
SELECT favorite.*,finalallitems.* FROM `favorite`
INNER JOIN finalallitems ON finalallitems.items_id= favorite.favorite_items;





CREATE OR REPLACE VIEW orderitemsview AS
SELECT  SUM( items.items_price-((items.items_price*items.items_discount)/100)) AS itemsprice,
COUNT(cart.cart_itemsid) AS countitems , items.*,cart.* FROM `cart` 
INNER JOIN items ON items.items_id = cart.cart_itemsid
GROUP BY  cart_itemsid , cart_orders , cart_userid;

CREATE OR REPLACE VIEW itemstoprating AS
SELECT   *  FROM `finalallitems`
 WHERE `finalallitems`.`rating_rating` >0
GROUP BY `finalallitems`.`items_id`
ORDER BY `finalallitems`.`totalrating` DESC;
-------------------------------------------------------------------------
CREATE OR REPLACE VIEW itemstoprating AS
SELECT SUM(`rating`.`rating_rating`)/COUNT(`rating`.`rating_id`) AS `totalrating`,
rating.*, items1view.*, users.users_id FROM `rating`
RIGHT JOIN users ON users.users_id= rating.rating_userid
RIGHT JOIN items1view ON items1view.items_id = rating.rating_item
WHERE `rating`.`rating_rating` >0
GROUP BY `rating`.`rating_item`
ORDER BY totalrating DESC;

-- -------------------------------------------------------------------------


CREATE OR REPLACE VIEW itemstoprating AS
SELECT SUM(finalallitems.`rating_rating`)/COUNT(finalallitems.`rating_id`) AS `totalrating`,
finalallitems.*, users.users_id FROM finalallitems
RIGHT JOIN users ON users.users_id= rating.rating_userid
WHERE finalallitems.`rating_rating` > 0
GROUP BY finalallitems.`rating_item`
ORDER BY totalrating DESC;


CREATE OR REPLACE VIEW myfavoriteview AS
SELECT SUM(`rating`.`rating_rating`)/COUNT(`rating`.`rating_id`) AS `totalrating`,
favorite.*,finalallitems.* FROM `favorite`
INNER JOIN finalallitems ON finalallitems.items_id= favorite.favorite_items;

CREATE OR REPLACE VIEW myratingview AS
SELECT SUM(`rating`.`rating_rating`)/COUNT(`rating`.`rating_id`) AS `totalrating`,
rating.*,items1view.*, users.users_id FROM `rating`
RIGHT JOIN users ON users.users_id= rating.rating_userid
RIGHT JOIN items1view ON items1view.items_id= rating.rating_item;


CREATE OR REPLACE VIEW myratingview AS
SELECT SUM(`rating`.`rating_rating`)/COUNT(`rating`.`rating_id`) AS `totalrating`,
SUM( rating.rating_rating)/COUNT( rating.rating_rating) AS `totalrating` ,
items1view.items_price-((items1view.items_price*items1view.items_discount)/100) AS `itemspricediscount`,
rating.*,items1view.*, users.users_id FROM `rating`
RIGHT JOIN users ON users.users_id= rating.rating_userid
RIGHT JOIN items1view ON items1view.items_id= rating.rating_item
GROUP BY `items1view`.`items_id`;



