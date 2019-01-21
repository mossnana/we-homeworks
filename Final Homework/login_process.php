<?php
session_start();

$input_username = $_POST['login_username'];
$input_password = MD5($_POST['login_password']);
include 'connect.php';
$login_query = "SELECT * FROM member WHERE member_username = '$input_username' AND member_password = '$input_password'" or die("Error:" . mysqli_error());
$login_result = mysqli_query($connect, $login_query);
if(mysqli_num_rows($login_result) > 0) {
    $login_array = mysqli_fetch_array($login_result);
    $_SESSION['member_id'] = $login_array['member_id'];
    echo "<script>window.location = 'product.php'</script>";
} else {
    echo "<script>window.alert('กรุณาตรวจสอบข้อมูลการล็อกอินของท่านใหม่')</script>";
    echo "<script>window.location = 'login.php#login'</script>";
///// $login_array = mysqli_fetch_array($login_result);
//  vardump($login_result);
//    echo $input_password;
}
?>