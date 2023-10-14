<?php

include "../connect.php";

getAllData("finalallitems", " items_discount != 0   ORDER BY `items_discount` DESC;");

// $stmt = $con->prepare("SELECT myratingview.*, 1 AS `favorite` ,  myratingview.items_price-((myratingview.items_price*myratingview.items_discount)/100) 
// AS `itemspricediscount` FROM `myratingview`
//  INNER JOIN favorite ON favorite.favorite_items = myratingview.items_id  
//  WHERE  `items_discount` != 0   GROUP BY items_id
//  UNION  ALL
// (SELECT myratingview.*, 0 AS `favorite` ,  
// myratingview.items_price-((myratingview.items_price*myratingview.items_discount)/100) AS `itemspricediscount`
//  FROM `myratingview` 
// WHERE `items_discount` != 0  AND myratingview.items_id NOT IN
//  (SELECT favorite_items FROM favorite )  GROUP BY items_id);
// ");
// $stmt->execute();
// $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
// $count = $stmt->rowCount();
// if ($count > 0) {
//     echo json_encode(array("status" => "success", "data" => $data));
// } else {
//     echo json_encode(array("status" => "failure"));
// }



// $stmt = $con->prepare("SELECT items1view.*, 1 AS `favorite` ,  items1view.items_price-((items1view.items_price*items1view.items_discount)/100) 
// AS `itemspricediscount` FROM `items1view`
//  INNER JOIN favorite ON favorite.favorite_items = items1view.items_id  
//  WHERE  `items_discount` != 0 
//  UNION  ALL
// (SELECT items1view.*, 0 AS `favorite` ,  
// items1view.items_price-((items1view.items_price*items1view.items_discount)/100) AS `itemspricediscount`
//  FROM `items1view` 
// WHERE `items_discount` != 0  AND items1view.items_id NOT IN
//  (SELECT favorite_items FROM favorite ));
// ");