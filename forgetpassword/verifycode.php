<?php

include "../connect.php";
$email = filterRequest("email");
$verfiycode   = filterRequest("verfiycode");

$stmt = $con->prepare("SELECT * FROM users WHERE users_email = ? AND users_verfiycode = ?");
$stmt->execute([$email, $verfiycode]);
$count = $stmt->rowCount();
result($count);

