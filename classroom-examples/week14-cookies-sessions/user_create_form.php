<?php
session_start();
if (!isset($_SESSION["username"]))
{ echo "<script>alert('กรุณา login ก่อนเข้าใช้งาน');";
  echo "window.location='login.php';</script>";
}
else
{
?>
<!doctype html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  </head>
  <body>
    <form action="user_create.php" method="post">
      <h3>เพิ่มข้อมูลผู้ใช้ใหม่</h3>
      <h4>ชื่อ</h4><input type="text" name="firstname" />
      <h4>สกุล</h4><input type="text" name="lastname" />
      <h4>อายุ</h4><input type="text" name="age" />
      <h4>เพศ</h4>
      <input type="radio" name="gender" value="M">ชาย
      <input type="radio" name="gender" value="F">หญิง
      <h4>แผนก</h4>
        <select name="divid">
          <?php
          include("connection.php");
          $query = "SELECT * FROM division" or die("Error:" . mysqli_error());
          $result = mysqli_query($con, $query);
          while($row = mysqli_fetch_array($result)) {
            echo "<option value='" . $row["divid"] ."'>" . $row["divname"] . "</option>";
          }
          mysqli_close($con);
           ?>
        </select>
      <br />
      <input type="submit" value="บันทึกข้อมูล" />
    </form>
  </body>
</html>
<?php
}
?>
