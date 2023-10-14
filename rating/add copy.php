<?php


include "../connect.php";
$userid = filterRequest("userid");
$itemid = filterRequest("itemid");
$rating = filterRequest("rating");
$comment = filterRequest("comment");
$data = array(
    "rating_userid" => $userid,
    "rating_item" => $itemid,
    "rating_rating" => $rating,
    "rating_comment" => $comment,
);
insertData("rating", $data);
