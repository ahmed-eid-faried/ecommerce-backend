<?php


include "../connect.php";
$userid = filterRequest("userid");
$itemid = filterRequest("itemid");
$rating = filterRequest("rating");
$comment = filterRequest("comment");
$stmt = $con->prepare("SELECT  * FROM  rating WHERE   `rating_userid` = $userid  AND  `rating_item` =  $itemid  ");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count) {
    $data = array(
        "rating_rating" => $rating,
        "rating_comment" => $comment,
    );
    updateData("rating", $data, " `rating_userid` = $userid  AND  `rating_item` =  $itemid");
} else {
    $data = array(
        "rating_userid" => $userid,
        "rating_item" => $itemid,
        "rating_rating" => $rating,
        "rating_comment" => $comment,
    );
    insertData("rating", $data);
}
