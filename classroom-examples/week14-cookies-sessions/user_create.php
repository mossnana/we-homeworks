<?php
session_start();
if (!isset($_SESSION["username"]))
{ echo "<script>alert('กรุณา login ก่อนเข้าใช้งาน');";
  echo "window.location='login.php';</script>";
}
else
{
include("connection.php");

$firstname = $_POST["firstname"];
$lastname = $_POST["lastname"];
$age = $_POST["age"];
$gender = $_POST["gender"];
$divid = $_POST["divid"];

$query = "INSERT INTO USER(firstname, lastname, age, gender, divid) VALUES('$firstname', '$lastname', '$age', '$gender', '$divid')" or die("Error:" . mysqli_error());
$result = mysqli_query($con, $query);
if($result){
  echo "<script>alert('เพิ่มข้อมูลเรียบร้อยแล้ว');";
  echo "window.location='user_select.php';</script>";
}
else{
  echo "<script>alert('เพิ่มข้อมูลไม่สำเร็จ');";
  echo "window.location='user_create_form.php';</script>";
}
mysqli_close($con);
}
?>
