<?php

include "../connect.php";

$userid = filterRequest("userid");

// getAllData("notifications",   " notifications_topic = 'users$userid' OR notifications_topic = 'users' ");
getAllData("notifications",  " notifications_topic='users' OR  notifications_topic='users$userid' ORDER BY `notifications_datetime` DESC; ");
