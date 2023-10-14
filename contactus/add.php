<?php


include "../connect.php";
$userid=filterRequest("userid");
$message=filterRequest("message");
$data=array(
    "contactus_userid"=>$userid,
    "contactus_message"=>$message);
insertData("contactus",$data);













?>