<?php


include "../../connect.php";
$itemsid = filterRequest("itemsid");
$name = filterRequest("name");
$namear = filterRequest("namear");
$des = filterRequest("des");
$desar = filterRequest("desar");
$count = filterRequest("count");
$active = filterRequest("active");
$price = filterRequest("price");
$discount = filterRequest("discount");
$categoriesid = filterRequest("categoriesid");
$date=date('y-m-d  H:i:s');
$image = imageUpload("../../upload/items", "file");
if ($image == "empty") {
    $data = array(
        "items_name" => $name,
        "items_name_ar" => $namear,
        "items_des" => $des,
        "items_des_ar" => $desar,
        "items_count" => $count,
        "items_active" => $active,
        "items_price" => $price,
        "items_discount" => $discount,
        "items_date" => $date,
        "items_categories" => $categoriesid, 
     );
} else {
    deleteFile("../../upload/items", $imageold);
    $data = array(
        "items_name" => $name,
        "items_name_ar" => $namear,
        "items_des" => $des,
        "items_des_ar" => $desar,
        "items_count" => $count,
        "items_active" => $active,
        "items_price" => $price,
        "items_discount" => $discount,
        "items_date" => $date,
        "items_categories" => $categoriesid, 
        "items_image" => $image,

    );
}
updateData("items", $data, " items_id = $itemsid ");
