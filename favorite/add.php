<?php


include "../connect.php";
$userid=filterRequest("userid");
$itemsid=filterRequest("itemsid");
$data=array(
    "favorite_usersid"=>$userid,
    "favorite_items"=>$itemsid);
insertData("favorite",$data);











?>