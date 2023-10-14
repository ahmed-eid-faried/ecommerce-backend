<?php

include "../../connect.php";
$itemsid = filterRequest("itemsid");
$image = imageUpload("../../upload/items","file");

deleteFile("../../upload/items",$image);
deleteData("items", " items_id = $itemsid ");
