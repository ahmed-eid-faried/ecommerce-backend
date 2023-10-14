<?php

include "../connect.php";

// $items_categories=filterRequest("items_categories");
// $items = getAllData("items1view", "items_categories = $items_categories");
$categoriesid = filterRequest("categoriesid");
$userid = filterRequest("userid");
getAllData("finalallitems", "finalallitems.users_id = $userid ", null, false);
$stmt = $con->prepare("
(SELECT finalallitems.*, 1 AS `favorite`, rating.rating_rating AS `rating`,rating.rating_comment AS `comment`, finalallitems.items_price-((finalallitems.items_price*finalallitems.items_discount)/100) AS `itemspricediscount` FROM `finalallitems`
 INNER JOIN favorite ON favorite.favorite_items = finalallitems.items_id AND favorite.favorite_usersid =  $userid
 LEFT JOIN rating ON rating.rating_item = finalallitems.items_id AND rating.rating_userid =  $userid
WHERE finalallitems.items_categories = $categoriesid AND finalallitems.users_id = $userid)
 UNION  ALL
(SELECT finalallitems.*, 0 AS `favorite` ,rating.rating_rating AS `rating`,rating.rating_comment AS `comment`,  finalallitems.items_price-((finalallitems.items_price*finalallitems.items_discount)/100) AS `itemspricediscount` FROM `finalallitems` 
LEFT JOIN rating ON rating.rating_item = finalallitems.items_id AND rating.rating_userid = $userid
WHERE  finalallitems.items_categories = $categoriesid AND finalallitems.users_id = $userid AND finalallitems.items_id NOT IN (SELECT favorite_items FROM favorite WHERE favorite.favorite_usersid = $userid));
");


$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
// ALL
// $stmt = $con->prepare("
// (SELECT items1view.*, 1 AS `favorite`,SUM( rating.rating_rating)/COUNT( rating.rating_rating) AS `totalrating` , rating.rating_rating AS `rating`,rating.rating_comment AS `comment`, items1view.items_price-((items1view.items_price*items1view.items_discount)/100) AS `itemspricediscount` FROM `items1view`
//  INNER JOIN favorite ON favorite.favorite_items = items1view.items_id AND favorite.favorite_usersid = $userid
//  LEFT JOIN rating ON rating.rating_item = items1view.items_id AND rating.rating_userid = $userid
//  WHERE items1view.items_categories = $categoriesid)
//  UNION  ALL
// (SELECT items1view.*, 0 AS `favorite` ,SUM( rating.rating_rating)/COUNT( rating.rating_rating) AS `totalrating` ,rating.rating_rating AS `rating`,rating.rating_comment AS `comment`,  items1view.items_price-((items1view.items_price*items1view.items_discount)/100) AS `itemspricediscount` FROM `items1view` 
// LEFT JOIN rating ON rating.rating_item = items1view.items_id AND rating.rating_userid = $userid
// WHERE items1view.items_categories = $categoriesid AND items1view.items_id NOT IN (SELECT favorite_items FROM favorite WHERE favorite.favorite_usersid = $userid));
// ");
// $stmt = $con->prepare("
// (SELECT myratingview.*, 1 AS `favorite`, myratingview.items_price-((myratingview.items_price*myratingview.items_discount)/100) AS `itemspricediscount` FROM `myratingview`
//  INNER JOIN favorite ON favorite.favorite_items = myratingview.items_id AND favorite.favorite_usersid = $userid
//  WHERE myratingview.items_categories = $categoriesid  GROUP BY items_id) 
//  UNION  ALL
// (SELECT myratingview.*, 0 AS `favorite`, myratingview.items_price-((myratingview.items_price*myratingview.items_discount)/100) AS `itemspricediscount` FROM `myratingview` 
// WHERE myratingview.items_categories = $categoriesid AND myratingview.items_id NOT IN (SELECT favorite_items FROM favorite WHERE favorite.favorite_usersid = $userid)  GROUP BY items_id)
// ");

// $stmt = $con->prepare("
// (SELECT finalallitems.*, 1 AS `favorite`, FROM `finalallitems`
//  INNER JOIN favorite ON favorite.favorite_items = finalallitems.items_id AND favorite.favorite_usersid = $userid
//  WHERE finalallitems.items_categories = $categoriesid  GROUP BY items_id) 
//  UNION  ALL
// (SELECT finalallitems.*, 0 AS `favorite`, FROM `finalallitems` 
// WHERE finalallitems.items_categories = $categoriesid AND finalallitems.items_id NOT IN (SELECT favorite_items FROM favorite WHERE favorite.favorite_usersid = $userid)  GROUP BY items_id)
// ");
// $stmt = $con->prepare("SELECT * FROM `finalallitems`
//  INNER JOIN favorite ON favorite.favorite_items = finalallitems.items_id 
//  AND finalallitems.users_id = $userid
//  WHERE finalallitems.items_categories = $categoriesid
//  ");
// $stmt = $con->prepare("
// (SELECT items1view.*, 1 AS `favorite`,SUM( rating.rating_rating)/COUNT( rating.rating_rating) AS `totalrating` , rating.rating_rating AS `rating`,rating.rating_comment AS `comment`, items1view.items_price-((items1view.items_price*items1view.items_discount)/100) AS `itemspricediscount` FROM `items1view`
//  INNER JOIN favorite ON favorite.favorite_items = items1view.items_id AND favorite.favorite_usersid = $userid
//  LEFT JOIN rating ON rating.rating_item = items1view.items_id AND rating.rating_userid = $userid
//  WHERE items1view.items_categories = $categoriesid)
//  UNION  ALL
// (SELECT items1view.*, 0 AS `favorite` ,SUM( rating.rating_rating)/COUNT( rating.rating_rating) AS `totalrating` ,rating.rating_rating AS `rating`,rating.rating_comment AS `comment`,  items1view.items_price-((items1view.items_price*items1view.items_discount)/100) AS `itemspricediscount` FROM `items1view` 
// LEFT JOIN rating ON rating.rating_item = items1view.items_id AND rating.rating_userid = $userid
// WHERE items1view.items_categories = $categoriesid AND items1view.items_id NOT IN (SELECT favorite_items FROM favorite WHERE favorite.favorite_usersid = $userid));
// ");









// (SELECT myratingview.*, 1 AS `favorite`, rating.rating_rating AS `rating`,rating.rating_comment AS `comment`, myratingview.items_price-((myratingview.items_price*myratingview.items_discount)/100) AS `itemspricediscount` FROM `myratingview`
//  INNER JOIN favorite ON favorite.favorite_items = myratingview.items_id AND favorite.favorite_usersid = $userid
//  LEFT JOIN rating ON rating.rating_item = myratingview.items_id AND rating.rating_userid = $userid
//  WHERE myratingview.items_categories = $categoriesid)
//  UNION  ALL
// (SELECT myratingview.*, 0 AS `favorite` ,rating.rating_rating AS `rating`,rating.rating_comment AS `comment`,  myratingview.items_price-((myratingview.items_price*myratingview.items_discount)/100) AS `itemspricediscount` FROM `myratingview` 
// LEFT JOIN rating ON rating.rating_item = myratingview.items_id AND rating.rating_userid = $userid
// WHERE myratingview.items_categories = $categoriesid AND myratingview.items_id NOT IN (SELECT favorite_items FROM favorite WHERE favorite.favorite_usersid = $userid));
