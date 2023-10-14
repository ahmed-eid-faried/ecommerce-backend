<?php

include "../../connect.php";
$email = filterRequest("email");
$password = sha1Request("password");

// $stmt = $con->prepare("SELECT * FROM delivery WHERE delivery_email = ? AND delivery_password = ? AND delivery_approve = 1 ");
// $stmt->execute(array($email, $password));
// $count = $stmt->rowCount();
// result($count);
// getData("delivery", "delivery_email = ? AND delivery_password = ? AND delivery_approve = 1 ", array($email, $password));


getData("delivery", "delivery_email = ? AND delivery_password = ? ", array($email, $password));
