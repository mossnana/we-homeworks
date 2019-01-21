<?php
session_start();
if (!isset($_SESSION["username"]))
{ echo "<script>alert('กรุณา login ก่อนเข้าใช้งาน');";
  echo "window.location='login.php';</script>";
  exit();
}

include("connection.php");

$userid = $_GET["userid"];
$query = "DELETE FROM user WHERE userid=$userid" or die("Error:" . mysqli_error());
$result = mysqli_query($con, $query);
if($result){
  echo "<script>alert('ลบข้อมูลเรียบร้อยแล้ว');";
  echo "window.location='user_select.php';</script>";
}
else{
  echo "<script>alert('ลบข้อมูลไม่สำเร็จ');";
  echo "window.location='user_create_form.php';</script>";
}
mysqli_close($con);
 ?>
