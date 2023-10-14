<?php

include "../../connect.php";
$email = filterRequest("email");
$password = sha1Request("password");
$data = array("admin_password" => $password);

updateData("admin", $data, " admin_email = '$email' ");


