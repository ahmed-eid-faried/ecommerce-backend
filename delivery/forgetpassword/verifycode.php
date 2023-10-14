<?php

include "../../connect.php";
$email = filterRequest("email");
$verfiycode   = filterRequest("verfiycode");

$stmt = $con->prepare("SELECT * FROM delivery WHERE delivery_email = ? AND delivery_verfiycode = ?");
$stmt->execute([$email, $verfiycode]);
$count = $stmt->rowCount();
result($count);

