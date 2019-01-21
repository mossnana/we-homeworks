<?php
session_start();
echo "<script>alert('ขอบคุณที่เข้าใช้งานระบบค่ะ');";
echo "window.location='login.php';</script>";
session_destroy();
?>
