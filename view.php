<?php

include "../connect.php";

$userid = filterRequest("userid");

getAllData("notifications",   " notifications_userid = 'delivery$userid' OR notifications_userid = 'users' ");
// getAllData("notifications",  " notifications_topic = $userid ");
