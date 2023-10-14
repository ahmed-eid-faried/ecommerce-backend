SELECT  *
FROM `users`;

SELECT  `users_email`
       ,`users_phone`
FROM `users`;

SELECT  `users_email`
       ,`users_phone`
FROM `users`
ORDER BY `users`.`users_phone` DESC;

SELECT  `users_email`
       ,`users_phone`
FROM `users`
ORDER BY `users`.`users_email` ASC;

SELECT  `users_email`
       ,`users_phone`
FROM `users`
ORDER BY `users`.`users_phone` DESC
LIMIT 2;

SELECT  `users_email`
       ,`users_phone`
FROM `users`
ORDER BY `users`.`users_phone` ASC
LIMIT 1;

SELECT  *
FROM `users`
WHERE `users_email` = 'ahemed@gmail.com';

SELECT  *
FROM `users`
WHERE `users_age` = 25;

SELECT  *
FROM `users`
WHERE NOT `users_age` = 25;

SELECT  *
FROM `users`
WHERE `users_age` >= 25
AND `users_age` <= 45;

SELECT  *
FROM `users`
WHERE `users_age` > 25 OR `users_age` < 45;

SELECT  *
FROM `users`
WHERE `users_age` > 25
ORDER BY `users`.`users_age` ASC
LIMIT 1;
INSERT INTO `users`( `users_email`, `users_phone`, `users_age`, `users_password`) VALUES('aaa@gmail.com', '0131812761', 25, 'SSSSSS');
INSERT INTO `users`( `users_email`, `users_phone`, `users_age`, `users_password`) VALUES('bbb@gmail.com', '0131812761', 25, 'SSSSSS'), ('ccc@gmail.com', '0131812761', 25, 'SSSSSS'); UPDATE `users`

SET `users_email` = "bbmmb@gmail.com"
WHERE `users_id` = 2; UPDATE `users`

SET `users_email` = "bbmmb@gmail.com" , `users_age` = 26
WHERE `users_id` = 2;
-- عرض العمود المطلوب مع الغاء التكرار فيه DISTINCT
SELECT  DISTINCT `users_age`
FROM `users`;

DELETE
FROM `users`
WHERE `users_age` > 25 || `users_age` < 45; DELETE
FROM `users`
WHERE `users_age` > 25;

SELECT  MAX(`users_age`)
FROM `users`;

SELECT  MIN(`users_age`)
FROM `users`;

SELECT  AVG(`users_age`)
FROM `users`;

SELECT  SUM(`users_age`)
FROM `users`;

SELECT  COUNT(`users_id`)
FROM `users`;

SELECT  COUNT(DISTINCT `users_country`)
FROM `users`;

-- يبدا ب
SELECT  *
FROM `users`
WHERE `users_email` LIKE 'a%';
-- ينتهى ب
SELECT  *
FROM `users`
WHERE `users_email` LIKE '%a';
-- يحتوى على
SELECT  *
FROM `users`
WHERE `users_email` LIKE '%or%';
-- يحتوى على حرفين على الاقل و الثانى يكون r
SELECT  *
FROM `users`
WHERE `users_email` LIKE '_r%';
-- يحتوى على حرفين على الاقل و الاول يكون a
SELECT  *
FROM `users`
WHERE `users_email` LIKE 'a_%';
-- يحتوى على ثلاثة احرف على الاقل و الاول يكون a
SELECT  *
FROM `users`
WHERE `users_email` LIKE 'a__%';
-- a يبدا ب
-- b و ينتهى ب
SELECT  *
FROM `users`
WHERE `users_email` LIKE 'a%m';

SELECT  *
FROM `users`
WHERE `users_age` = 25
AND `users_age` = 30;

SELECT  *
FROM `users`
WHERE `users_age`IN (25, 30); DELETE
FROM `users`
WHERE `users_age` BETWEEN 25 AND 45; DELETE
FROM `users`
WHERE `users_age` > 25
AND `users_age` < 45;

SELECT  COUNT(`users_id`) AS `count_of_users`
FROM `users`;

SELECT  `users_name`AS `name`
       ,COUNT(`users_id`) AS `count_of_users`
FROM `users`
GROUP BY  `users_name`;

SELECT  `users_name`AS `name`
       ,COUNT(`users_id`) AS `count_of_users`
FROM `users`
GROUP BY  `users_name`
HAVING `count_of_users` > 1;

-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
SELECT  items.*
       ,categories.categories_name
FROM items, categories
WHERE items.items_catogeries = categories.categories_id;
-- ---------------------------------------------------------------------------------
SELECT  items.*
       ,categories.categories_name
FROM items
INNER JOIN categories
ON items.items_catogeries = categories.categories_id;
-- ---------------------------------------------------------------------------------
SELECT  items.*
       ,categories.categories_name
FROM items -- THAT CONTAIN INNER AND ALL categories (RIGHT) UNTILL IT ISN'T EXIST FOR ITEMS
RIGHT JOIN categories
ON items.items_catogeries = categories.categories_id;
-- ---------------------------------------------------------------------------------
--WE MUST INSTANCE OF ITS LOCATIONS
SELECT  items.*
       ,categories.categories_name
FROM categories -- THAT CONTAIN INNER AND ALL categories (LEFT) UNTILL IT ISN'T EXIST FOR ITEMS
LEFT JOIN items
ON items.items_catogeries = categories.categories_id;
-- ---------------------------------------------------------------------------------
SELECT  items.*
       ,categories.categories_name
FROM items
INNER JOIN categories
ON items.items_catogeries = categories.categories_id
WHERE items.price > 2000;
-- ---------------------------------------------------------------------------------
SELECT  categories.categories_name
FROM categories
LEFT JOIN items
ON items.items_catogeries = categories.categories_id
WHERE items.price > 2000;
-- ---------------------------------------------------------------------------------
SELECT  categories.categories_name
FROM categories
WHERE EXISTS (
SELECT  items.*
FROM items
WHERE categories.categories_id = items.items_catogeries
AND items.price > 2000);
-- ---------------------------------------------------------------------------------
SELECT  *
FROM `ordersdetails` --errors
WHERE EXISTS (
SELECT  `items_name`
FROM `items`
WHERE ordersdetails.ordersdetails_items = items.items_id
AND ordersdetails.quantity = 2);
-- ---------------------------------------------------------------------------------
SELECT  ordersdetails.*
       ,items.items_name
FROM ordersdetails
INNER JOIN items
ON ordersdetails.ordersdetails_items = items.items_id
WHERE ordersdetails.quantity = 2;
-- ---------------------------------------------------------------------------------
SELECT  items.items_name
FROM items
WHERE items.items_id = any(
SELECT  ordersdetails.ordersdetails_items
FROM ordersdetails
WHERE ordersdetails.quantity = 2);
-- ---------------------------------------------------------------------------------
SELECT  items.items_name  AS `name`
       ,items.items_price AS `price`
FROM items
UNION
-- تطبيق الاستعلامين بدون حذف القيم المكررة
SELECT  categories.categories_name AS `name`
       ,categories.categories_id   AS `price`
FROM categories;
-- ---------------------------------------------------------------------------------
SELECT  items.items_name  AS `name`
       ,items.items_price AS `price`
FROM items
UNION ALL
-- تطبيق الاستعلامين مع حذف القيم المكررة
SELECT  categories.categories_name AS `name`
       ,categories.categories_id   AS `price`
FROM categories;
-- ---------------------------------------------------------------------------------
SELECT  items.items_name            AS `name`
       ,IFNULL(items.items_price,0) AS `price`
FROM items;

-- التحقق من تحويل القيمة المطلوبة ل 0 فى حالة عدم وجود قيمة
SELECT  items.items_name              AS `name`
       ,COALESCE(items.items_price,0) AS `price`
FROM items;

-- ---------------------------------------------------------------------------------

CREATE DATABASE AHMED;
-- ---------------------------------------------------------------------------------

DROP DATABASE AHMED;
-- ---------------------------------------------------------------------------------

CREATE TABLE itemsforahmed ( 
i_id int(11) NOT NULL AUTO_INCREMENT, 
i_name varchar(255) NOT NULL ,
 i_price float ,
 i_categories int(11) NOT NULL ,
  PRIMARY KEY(i_id) ,
  FOREIGN KEY(i_categories) REFERENCES categories(categories_id) ); 
--   CREATE TABLE itemsforahmed ( 
-- COLNAME DATATYPE(LENGTH) CONSTRAINT ,
-- COLNAME DATATYPE(LENGTH) CONSTRAINT ,
-- COLNAME DATATYPE(LENGTH) CONSTRAINT ,
--   PRIMARY KEY(COLNAME) ,
--   FOREIGN KEY(COLNAME) REFERENCES TABLEREF(COLNAMEREF) ); 
-- ---------------------------------------------------------------------------------
DROP TABLE itemsforahmed;
-- ---------------------------------------------------------------------------------
-- ---------------------------------EDIT FOR TABLE----------------------------------

ALTER TABLE itemsforahmed MODIFY i_name char(255) NOT NULL ;
-- ---------------------------------------------------------------------------------


ALTER TABLE itemsforahmed DROP i_name  ;
-- ---------------------------------------------------------------------------------

ALTER TABLE itemsforahmed ADD i_name varchar(255) NOT NULL ;
-- ---------------------------------------------------------------------------------

ALTER TABLE `itemsforahmed` ADD UNIQUE(i_name);
-- ---------------------------------------------------------------------------------

ALTER TABLE `itemsforahmed` DROP INDEX `i_name`;
-- ---------------------------------------------------------------------------------
CREATE VIEW itemsmobile AS SELECT  items.* FROM items WHERE items.items_catogeries =1;
CREATE VIEW itemslaptop AS SELECT  items.* FROM items WHERE items.items_catogeries =2;

-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------

ALTER TABLE `favorite` ADD FOREIGN KEY (`favorite_usersid`) REFERENCES `users`(`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------

SELECT items1view.*,1 AS `favorite` FROM `items1view` 
INNER JOIN favorite ON favorite.favorite_items=items1view.items_id and favorite.favorite_usersid=30
UNION ALL
SELECT items1view.*, 0 AS `favorite` FROM `items1view` 
WHERE items_id != (SELECT items1view.items_id, FROM `items1view`--XXXXXXXXXX
INNER JOIN favorite ON favorite.favorite_items=items1view.items_id and favorite.favorite_usersid=30);--XXXXXXXXXX
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------

(SELECT items1view.*, 1 AS `favorite` FROM `items1view`
 INNER JOIN favorite ON favorite.favorite_items = items1view.items_id AND favorite.favorite_usersid = 30)
 UNION ALL 
(SELECT items1view.*, 0 AS `favorite` FROM `items1view` 
WHERE items1view.items_id NOT IN (SELECT favorite_items FROM favorite WHERE favorite.favorite_usersid = 30));
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------