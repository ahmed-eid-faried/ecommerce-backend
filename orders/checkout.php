<?php
include "../connect.php";
$userid = filterRequest("userid");
$address = filterRequest("address");
$recivetype = filterRequest("recivetype");
$pricedelivery = filterRequest("pricedelivery");
$orderprice = filterRequest("price");
$couponid = filterRequest("couponid");
$paymentmethod = filterRequest("paymentmethod");
$coupondiscount = filterRequest("coupondiscount");
$total = filterRequest("total");
$couponprice ='0';
 

$totalprice = $orderprice + $pricedelivery;
$now = date("Y-m-d H:i:s");
$checkcoupon = getData("coupon", " coupon_expiredate >'$now' AND coupon_id='$couponid' AND coupon_count > 0 ",null, false);
if ($checkcoupon > 0) {
    // $totalprice = $totalprice - ($orderprice * $coupondiscount) / 100;
    $totalprice = $total;
    $couponprice =  ($orderprice * $coupondiscount) / 100;

     $stmt = $con->prepare(" UPDATE `coupon` SET `coupon_count`=`coupon_count`-1  WHERE coupon_id=$couponid ");
    $stmt->execute();
}
$data = array(
    "orders_userid" => $userid,
    "orders_address" => $address,
    "orders_recivetype" => $recivetype,
    "orders_pricedelivery" => $pricedelivery,
    "orders_price" => $orderprice,
    "orders_coupon" => $couponid,
    "orders_paymentmethod" => $paymentmethod,
    "orders_totalprice" => $totalprice,
    "orders_couponprice" => $couponprice,

);
$count = insertData("orders", $data, false);
if ($count > 0) {
    $stmt = $con->prepare(" SELECT MAX(orders_id) FROM orders ");
    $stmt->execute();
    $maxid = $stmt->fetchColumn();
    $dataupdate = array("cart_orders" => $maxid);
    updateData("cart", $dataupdate, "cart_userid=$userid  AND cart_orders = 0 ");
}
