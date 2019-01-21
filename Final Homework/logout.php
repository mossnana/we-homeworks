<?php
session_start();
echo "<script>window.alert('ขอบคุณที่เข้าใช้งานระบบค่ะ');</script>";
session_destroy();
echo "<script>window.location='index.php';</script>";
?>