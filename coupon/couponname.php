<?php
include "../connect.php";
$couponname = filterRequest("couponname");
$now = date("Y-m-d H:i:s");
getData("coupon", " coupon_name=?  AND coupon_expiredate >? AND coupon_count > 0", array($couponname, $now));

// // getData("coupon", " coupon_name=?  AND coupon_expiredate >?  AND coupon_count > 0 ", array($couponname, $now));
// $stmt = $con->prepare("SELECT  * FROM coupon WHERE   coupon_name=$couponname  AND coupon_expiredate >$now   AND coupon_count > 1 ");
// $stmt->execute();
// $data = $stmt->fetch(PDO::FETCH_ASSOC);
// $count  = $stmt->rowCount();
// if ($count > 0) {
//     $dataupdate = array("coupon_count" => $data['coupon_count'] - 1);
//     updateData("address", $dataupdate, "coupon_name=$couponname  AND coupon_expiredate >$now   AND coupon_count > 1 ", false);
//     echo json_encode(array("status" => "success", "data" => $data));
// } else {
//     echo json_encode(array("status" => "failure"));
// }
