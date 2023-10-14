<?php

include "../connect.php";
$userid=filterRequest("userid");
// getAllData("myfavoriteview","favorite_usersid=?",array($userid));
  

$stmt = $con->prepare("SELECT  myfavoriteview.* , myfavoriteview.items_price-((myfavoriteview.items_price*myfavoriteview.items_discount)/100) AS `itemspricediscount` FROM  myfavoriteview WHERE   favorite_usersid=$userid GROUP BY `favorite_items`");
$stmt->execute($values);
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}

// ////////////////////////////
// $userid = filterRequest("userid");
// $stmt = $con->prepare("
// (SELECT finalallitems.*, 1 AS `favorite`, FROM `finalallitems`
//  INNER JOIN favorite ON favorite.favorite_items = finalallitems.items_id AND favorite.favorite_usersid = $userid
//    GROUP BY items_id) 
//  UNION  ALL
// (SELECT finalallitems.*, 0 AS `favorite`, FROM `finalallitems` 
//  AND finalallitems.items_id NOT IN (SELECT favorite_items FROM favorite WHERE favorite.favorite_usersid = $userid)  GROUP BY items_id)
// ");
// $stmt->execute();
// $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
// $count = $stmt->rowCount();
// if ($count > 0) {
//     echo json_encode(array("status" => "success", "data" => $data));
// } else {
//     echo json_encode(array("status" => "failure"));
// }
