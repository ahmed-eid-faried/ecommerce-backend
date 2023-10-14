<?php

include "../../connect.php";
$email = filterRequest("email");
$verfiycode     = rand(10000, 99999);
$data = array("delivery_verfiycode" => $verfiycode);
sendEmail($email, "Verfiy Code Ecommerce", "Verfiy Code $verfiycode");
updateData("delivery", $data, " `delivery_email` = '$email' ");
