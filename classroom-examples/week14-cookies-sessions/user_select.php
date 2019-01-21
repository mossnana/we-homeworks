<?php
session_start();
if (!isset($_SESSION["username"]))
{ echo "<script>alert('กรุณา login ก่อนเข้าใช้งาน');";
  echo "window.location='login.php';</script>";
}
else
{
?>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<?php
echo "<div style='text-align:right; font-size:12px; background-color:yellow'>ชื่อผู้ใช้งาน: " . $_SESSION["username"]  . " | <a href='logout.php'>ออกจากระบบ</a> </div>";
//1. conection:
include("connection.php");
//2. consultation:
$query = "SELECT * FROM User" or die("Error:" . mysqli_error());
//3. execute the query.
$result = mysqli_query($con, $query);
//4 . display information:
echo "<a href='user_create_form.php'>เพิ่มข้อมูลใหม่</a>";
echo "<table class='table'>";
echo "<tr><th>รหัส</th><th>ชื่อ</th><th>สกุล</th> <th>อายุ</th><th>เพศ</th><th>แผนก</th></tr>";
while($row = mysqli_fetch_array($result)) {
  echo "<tr>";
  echo "<td>" . $row["userid"] . "</td>";
  echo "<td>" . $row["firstname"] . "</td>";
  echo "<td>" . $row["lastname"] . "</td>";
  echo "<td>" . $row["age"] . "</td>";
  echo "<td>" . $row["gender"] . "</td>";
  //echo "<td>" . $row["divid"] . "</td>";
  $query2 = "SELECT * FROM division where divid=" . $row["divid"];
  $result2 = mysqli_query($con, $query2);
  $row2 = mysqli_fetch_array($result2);
  echo "<td>" . $row2["divname"] . "</td>";
  echo "<td><a href='user_update_form.php?userid=" . $row["userid"] . "'><i class='fas fa-pencil-alt'></i></td>";
  echo "<td><a href='user_delete.php?userid=" . $row["userid"] . "' onclick='return confirm(\"ต้องการลบข้อมูลนี้?\");'><i class='fas fa-trash-alt'></i><a></td>";
  echo "</tr>";
}
echo "</table>";

//5. close connection
mysqli_close($con);

}
?>
