<?php

// include "../connect.php";

// $orderid=filterRequest("orderid");
// getAllData("orderdetailsview"," `cart_orders` = $orderid ");



include "../connect.php";

$orderid=filterRequest("orderid");
getAllData("orderitemsview"," `cart_orders` = $orderid ");


