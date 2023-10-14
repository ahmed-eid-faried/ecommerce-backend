<?php

include "../connect.php";
$userid = filterRequest("userid");
$itemsid = filterRequest("itemsid");

// deleteData("cart", "cart_userid = $userid AND cart_itemsid = $itemsid "); // for all
deleteData("cart", "cart_userid = $userid AND cart_itemsid = $itemsid  AND cart_orders = 0 LIMIT 1 "); //for one

