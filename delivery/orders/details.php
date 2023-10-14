<?php

include "../../connect.php";

$orderid=filterRequest("orderid");
getAllData("orderitemsview"," `cart_orders` = $orderid ");


