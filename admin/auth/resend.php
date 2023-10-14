<?php

include "../../connect.php";
$email = filterRequest("email");
$verfiycode     = rand(10000, 99999);
$data = array("admin_verfiycode" => $verfiycode);
sendEmail($email, "Verfiy Code Ecommerce", "Verfiy Code $verfiycode");
updateData("admin", $data, " `admin_email` = '$email' ");
