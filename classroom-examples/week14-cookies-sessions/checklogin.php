<?php
session_start();
$email = $_POST["email"];
$password = MD5($_POST["password"]);

include("connection.php");
$query = "SELECT * FROM User WHERE email = '$email' and password = '$password' " or die("Error:" . mysqli_error());
$result = mysqli_query($con, $query);
if (mysqli_num_rows($result) > 0){
  $row = mysqli_fetch_array($result);
  $_SESSION["userid"] = $row["userid"];
  $_SESSION["username"] = $row["firstname"] . " " . $row["lastname"];
  if($row["role"] == "A"){
    echo "<script>window.location='user_select.php';</script>";
  }
  else{
    echo "<script>window.location='index.php';</script>";
  }
}
else{
  echo "<script>alert('ข้อมูลชื่อผู้ใช้ และรหัสผ่านไม่ถูกต้อง');";
  echo "window.location='login.php';</script>";
}
?>
