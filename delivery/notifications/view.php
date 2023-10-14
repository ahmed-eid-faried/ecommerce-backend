<?php

include "../../connect.php";
$userid = filterRequest("userid");
 // getAllData("notifications",  " notifications_topic = $userid ");
getAllData("notifications",  " notifications_topic='users' OR  notifications_topic='delivery$userid' ORDER BY `notifications_datetime` DESC; ");

