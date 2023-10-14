<?php


include "../../connect.php";
$name = filterRequest("name");
$namear = filterRequest("namear");
$categoriesid = filterRequest("categoriesid");
$imageold = filterRequest("imageold");

$image = imageUpload("../../upload/categories", "file");
if ($image == "empty") {
    $data = array(
        "categories_name" => $name,
        "categories_name_ar" => $namear,
    );
} else {
    deleteFile("../../upload/categories", $imageold);
    $data = array(
        "categories_name" => $name,
        "categories_name_ar" => $namear,
        "categories_image" => $image,

    );
}
updateData("categories", $data, " categories_id = $categoriesid ");
