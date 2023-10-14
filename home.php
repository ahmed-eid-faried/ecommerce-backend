<?php

include "connect.php";
$alldata = array();
$alldata['status'] = "success";

$categories = getAllData("categories", null, null, false);
$alldata['categories'] = $categories;

// $items = getAllData("items", null, null, false);

$items1 = getAllData("finalallitems", null, null, false); 
$alldata['items'] = $items1;

$items2 = getAllData("finalallitems", " items_discount != 0   ORDER BY `items_discount` DESC;", null, false);
$alldata['items_discount'] = $items2;

$items3 = getAllData("itemstopselling", " 1=1 ", null, false); 
$alldata['itemstopselling'] = $items3;

$items4 = getAllData("itemstoprating", " 1=1 ", null, false); 
$alldata['itemstoprating'] = $items4;

$settings = getAllData("settings", null, null, false); 
$alldata['settings'] = $settings;



echo json_encode($alldata);

