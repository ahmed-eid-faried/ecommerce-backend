<?php

include "../../connect.php";

$ordersid = filterRequest("ordersid");
$userid = filterRequest("userid");
$ordersrecivetype = filterRequest("ordersrecivetype");//ordertype
if ($ordersrecivetype == "0") {
    $data = array( "orders_status" => 2 );
} else {
    $data = array("orders_status" => 4 );
}
updateData("orders", $data, " orders_id = $ordersid AND orders_status = 1 ");
insertNotify(
    $userid,
    "SUCCESS",
    "The Order Have Been Prepared",
    "users$userid",
    "none",
    "refreshorderpending"
);
if ($ordersrecivetype == "0") {
    sendGCM("Success", "The Orders Have Been Approve By Delivery", "services", "none", "refreshorderpending");
}
