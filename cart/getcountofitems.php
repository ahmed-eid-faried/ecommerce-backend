<?php
include "../connect.php";
$userid = filterRequest("userid");
$itemsid = filterRequest("itemsid");
$stmt = $con->prepare("SELECT COUNT(`cart_id`) AS countitems FROM `cart`  WHERE cart_userid = $userid  AND cart_orders = 0 AND  cart_itemsid =$itemsid");
$stmt->execute($values);
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}