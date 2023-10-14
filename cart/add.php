<?php

include "../connect.php";
$userid = filterRequest("userid");
$itemsid = filterRequest("itemsid");
$data = array(
    "cart_userid" => $userid,
    "cart_itemsid" => $itemsid
);

insertData("cart", $data);







// include "../connect.php";
// $userid = filterRequest("userid");
// $itemsid = filterRequest("itemsid");
// $count = getData("cart", " cart_userid = ?, cart_itemsid = ? ", [$userid, $itemsid], $json = false);
// $data = array(
//     "cart_userid" => $userid,
//     "cart_itemsid" => $itemsid
// );
// if ($count > 0) {
//     updateData("cart", $data, " cart_userid = $userid, cart_itemsid = $itemsid ", $json = false);
// } else {
//     insertData("cart", $data);
// }
/////////////////////////////////////////////