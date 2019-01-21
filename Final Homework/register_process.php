<?php

include "connect.php";

// Check Username and Email
if (isset($_POST['suggestion_username'])) {
    $username_check = $_POST['suggestion_username'];
    $username_check_query = "SELECT * FROM member where member_username = '$username_check'";
    $username_check_result = mysqli_query($connect, $username_check_query);
    if (mysqli_num_rows($username_check_result) > 0) {
        echo "dup-username";
    } else {
        echo "no-dup-username";
    }
} else if (isset($_POST['suggestion_email'])) {
    $email_check = $_POST['suggestion_email'];
    $email_check_query = "SELECT * FROM member where member_email = '$email_check'";
    $email_check_result = mysqli_query($connect, $email_check_query);
    if (mysqli_num_rows($email_check_result) > 0) {
        echo "dup-email";
    } else {
        echo "no-dup-email";
    }
} else {
    if (isset($_POST['register_name'])) {
        $register_name= $_POST['register_name'];
        $register_username = $_POST['register_username'];
        $register_password = MD5($_POST['register_password']);
        $register_email = $_POST['register_email'];
        $register_phone = $_POST['register_phone'];
        $register_address = $_POST['register_address'];

        $insert_user_query = "INSERT INTO member(member_username, member_password, member_name, member_phone, member_email, member_address, level_id) VALUES ('$register_username', '$register_password', '$register_name', '$register_phone', '$register_email', '$register_address', '2')";
        $insert_user_result = mysqli_query($connect, $insert_user_query);
        if($insert_user_result) {
            echo "<script>window.alert('สมัครสมาชิกสำเร็จ ยินดีต้อนรับสู่ระบบ กรุณาล็อกอิน')</script>";
            echo "<script>window.location = 'login.php#login'</script>";
        } else {
            echo "<script>window.alert('เกิดข้อผิดพลาด กรุณากลับไปสมัครสมาชิกใหม่')</script>";
            echo "<script>window.location = 'register.php#register'</script>";
        }
    } else {
        echo "<script>window.alert('เกิดข้อผิดพลาด กรุณากลับไปสมัครสมาชิกใหม่')</script>";
        echo "<script>window.location = 'register.php#register'</script>";
    }
}















?>