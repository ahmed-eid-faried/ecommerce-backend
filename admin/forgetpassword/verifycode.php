<?php

include "../../connect.php";
$email = filterRequest("email");
$verfiycode   = filterRequest("verfiycode");

$stmt = $con->prepare("SELECT * FROM admin WHERE admin_email = ? AND admin_verfiycode = ?");
$stmt->execute([$email, $verfiycode]);
$count = $stmt->rowCount();
result($count);

