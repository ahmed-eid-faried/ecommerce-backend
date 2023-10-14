<?php

include "../connect.php";
$email = filterRequest("email");
$verfiycode     = rand(10000, 99999);
$data = array("users_verfiycode" => $verfiycode);
sendEmail($email, "Verfiy Code Ecommerce", "Verfiy Code $verfiycode");
updateData("users", $data, " `users_email` = '$email' ");
