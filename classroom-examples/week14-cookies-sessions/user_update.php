<?php
session_start();
if (!isset($_SESSION["username"]))
{ echo "<script>alert('กรุณา login ก่อนเข้าใช้งาน');";
  echo "window.location='login.php';</script>";
  
}
else
{
include("connection.php");

$userid = $_POST["userid"];
$firstname = $_POST["firstname"];
$lastname = $_POST["lastname"];
$age = $_POST["age"];
$gender = $_POST["gender"];
$divid = $_POST["divid"];

$query = "UPDATE USER SET firstname='$firstname', lastname='$lastname', age='$age', gender='$gender', divid='$divid' WHERE userid='$userid'" or die("Error:" . mysqli_error());
$result = mysqli_query($con, $query);
if($result){
  echo "<script>alert('แก้ไขข้อมูลเรียบร้อยแล้ว');";
  echo "window.location='user_select.php';</script>";
}
else{
  echo "<script>alert('แก้ไขข้อมูลไม่สำเร็จ');";
  echo "window.location='user_update_form.php?userid=$userid';</script>";
}
mysqli_close($con);
}
?>
