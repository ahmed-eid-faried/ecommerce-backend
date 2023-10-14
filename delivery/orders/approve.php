<?php

include "../../connect.php";

$ordersid = filterRequest("ordersid");
$userid = filterRequest("userid");
$deliveryid = filterRequest("deliveryid");

$deliveryaddresslat = filterRequest("deliveryaddresslat");
$deliveryaddresslong = filterRequest("deliveryaddresslong");

$data = array(
    "orders_status" => 3,
    "orders_deliveryid" => $deliveryid,
    "orders_deliveryaddresslat" => $deliveryaddresslat,
    "orders_deliveryaddresslong" => $deliveryaddresslong,

);

updateData("orders", $data, " orders_id = $ordersid AND orders_status = 2 ");
insertNotify(
    $userid,
    "SUCCESS",
    "Your Order On The Way",
    "users$userid",
    "none",
    "refreshorderpending"
);
insertNotify(
    $userid,
    "SUCCESS",
    "Your Order On The Way",
    "delivery$userid",
    "none",
    "refreshorderpending"
);
sendGCM("Success", "The Orders Have Been Approved By Delivery", "services", "none", "refreshorderpending");
sendGCM("Success", "The Orders Have Been Approved By Delivery" . $deliveryid, "delivery", "none", "refreshorderpending");
