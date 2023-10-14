<?php

include "../connect.php";
$alldata = array();
$alldata['status'] = "success";
$settings = getAllData("settings", null, null, false); 
$alldata['settings'] = $settings;
echo json_encode($alldata);

