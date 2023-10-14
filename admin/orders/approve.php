<?php

include "../../connect.php";

$ordersid = filterRequest("ordersid");
$userid = filterRequest("userid");

$data = array(
    "orders_status" => 1,
);

updateData("orders", $data, " orders_id = $ordersid AND orders_status = 0 ");
insertNotify(
    $userid,
    "SUCCESS",
    "The Orders Have Been Approve",
    "users$userid",
    "none",
    "refreshorderpending"
);
