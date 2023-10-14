<?php

include "../connect.php";
$userid = filterRequest("userid");

$data = getAllData("cartview", "cart_userid=?", array($userid), false);

$stmt = $con->prepare("SELECT SUM(`itemsprice`) AS totalprice , SUM(`countitems`) AS totalcount FROM `cartview` 
WHERE cartview.cart_userid=$userid
GROUP BY cart_userid");
$stmt->execute();
$countprice =  $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array(
        "status" => "success",
        "data" => $data,
        "countprice" => $countprice
    ));
} else {
    printFailure();
}
