<?php

// ต้องตั้งค่า header ก่อนว่าให้เป็น json
header("Content-type: application/json; charset=UTF-8");
// แปลงค่าที่ get จาก JSON มาเป็น Object
$requestObj = json_decode($_GET["request"], false);
// set ค่าลงตัวแปร
$field = $requestObj->field;
$table = $requestObj->table;
// สร้างตัวแปรติดต่อฐานข้อมูล
$connect = new mysqli("localhost", "root", "", "resume-php");
// query ดึกข้อมูลออกมา
$stmt = $connect->prepare("SELECT $field FROM $table");
// bind parem ยังใช้ไม่ได้
//$stmt->bind_param("ss", $obj->field);
// run query
$stmt->execute();
// เก็บค่าที่ได้จากการ query
$result = $stmt->get_result();
// เก็บข้อมูลเป็น array
$outp = $result->fetch_all(MYSQLI_ASSOC);
// return ผลลัพท์กลุ่มของ array เป็น JSON
echo json_encode($outp);

?>
