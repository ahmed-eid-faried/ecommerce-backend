<?php


include "../../connect.php";
$name = filterRequest("name");
$namear = filterRequest("namear");
$image = imageUpload("../../upload/categories", "file");

$data = array(
    "categories_name" => $name,
    "categories_name_ar" => $namear,
    "categories_image" => $image,
);
if ($image != "empty" && $image != "fail" && strlen($namear) > 0 && strlen($name) > 0) {
    insertData("categories", $data);
}
