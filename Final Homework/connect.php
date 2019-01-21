<?php

$db_host = "localhost";
$db_username = "root";
$db_password = "";
$db_name = "swift_beta";

$connect = mysqli_connect($db_host, $db_username, $db_password, $db_name);
mysqli_set_charset($connect,"utf8");

?>