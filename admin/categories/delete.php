<?php

include "../../connect.php";
$categoriesid = filterRequest("categoriesid");
$image = imageUpload("../../upload/categories","file");

deleteFile("../../upload/categories",$image);
deleteData("categories", " categories_id = $categoriesid ");
