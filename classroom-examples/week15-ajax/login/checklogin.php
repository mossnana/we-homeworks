<?php
session_start();
include("connection.php");

$UserName = $_REQUEST["UserName"];
$UserPwd = MD5($_REQUEST["UserPwd"]);
$query = "SELECT * FROM User WHERE UserName='$UserName' and UserPwd='$UserPwd' ";

$result = mysqli_query($con, $query);
if (mysqli_num_rows($result) > 0){
  $row = mysqli_fetch_array($result);
  $_SESSION["UserId"] = $row["UserId"];
  //$_SESSION["username"] = $row["firstname"] . " " . $row["lastname"];
  $_SESSION["UserName"] = $row["UserName"];
  echo $row["UserLevel"];
}
else{
  echo "Fail";
}
?>
