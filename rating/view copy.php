<?php

include "../connect.php";
$userid=filterRequest("userid");
// getAllData("myfavoriteview","favorite_usersid=?",array($userid));
  

$stmt = $con->prepare("SELECT  myfavoriteratingview.* , SUM( rating.rating_rating)/COUNT( rating.rating_rating) AS `totalrating` FROM  myfavoriteview WHERE   favorite_usersid=$userid  ");
$stmt->execute($values);
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}


