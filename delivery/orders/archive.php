<?php

include "../../connect.php";

$deliveryid=filterRequest("deliveryid");

getAllData("ordersview","1=1 AND orders_status = 4 AND orders_deliveryid = $deliveryid ");



