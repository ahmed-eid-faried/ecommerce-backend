<?php

include "../connect.php";
$userid = filterRequest("userid");
$itemsid = filterRequest("itemsid");
$data = array(
    "favorite_usersid" => $userid,
    "favorite_items" => $itemsid
);
deleteData("favorite", " `favorite_usersid`=$userid AND
`favorite_items`= $itemsid ");
