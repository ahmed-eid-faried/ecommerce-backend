<?php

include "../../connect.php";

$ordersid = filterRequest("ordersid");
$userid = filterRequest("userid");

$data = array(
    "orders_status" => 4,
);

updateData("orders", $data, " orders_id = $ordersid AND orders_status = 3 ");
insertNotify(
    $userid,
    "SUCCESS",
    "Your Order Has Been Delivered",
    "users$userid",
    "none",
    "refreshorderpending"
);
insertNotify(
    $userid,
    "SUCCESS",
    "Your Order Has Been Delivered",
    "delivery$userid",
    "none",
    "refreshorderpending"
);
sendGCM("Success", "The Order Has Been Delivered To The Custom ", "services", "none", "refreshorderpending");
