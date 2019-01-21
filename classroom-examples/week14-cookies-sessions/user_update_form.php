<?php
session_start();
if (!isset($_SESSION["username"]))
{ echo "<script>alert('กรุณา login ก่อนเข้าใช้งาน');";
  echo "window.location='login.php';</script>";
  exit();
}
?>
<!doctype html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  </head>
  <body>
  <?php
    $userid = $_GET["userid"];
    include("connection.php");
    $query = "SELECT * FROM User WHERE userid=$userid" or die("Error:" . mysqli_error());
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_array($result);
   ?>
    <form action="user_update.php" method="post">
      <h3>แก้ไขข้อมูลผู้ใช้</h3>
      <h4>รหัสผู้ใช้</h4><input type="text" value="<?=$row["userid"]?>" disabled="disabled"/>
      <input type="hidden" name="userid" value="<?=$row["userid"]?>">
      <h4>ชื่อ</h4><input type="text" name="firstname" value="<?=$row["firstname"]?>"/>
      <h4>สกุล</h4><input type="text" name="lastname" value="<?=$row["lastname"]?>"/>
      <h4>อายุ</h4><input type="text" name="age" value="<?=$row["age"]?>"/>
      <h4>เพศ</h4>
      <input type="radio" name="gender" value="M"
      <?php if($row["gender"] == 'M') echo "checked='checked'"; ?>
      >ชาย
      <input type="radio" name="gender" value="F"
      <?php if($row["gender"] == 'F') echo "checked='checked'"; ?>>หญิง
      <h4>แผนก</h4>
        <select name="divid">
          <?php
          $query2 = "SELECT * FROM division" or die("Error:" . mysqli_error());
          $result2 = mysqli_query($con, $query2);
          while($row2 = mysqli_fetch_array($result2)) {
            echo "<option value='" . $row2["divid"] ."' ";
            if ($row["divid"] == $row2["divid"])
              echo "selected='selected' ";
            echo ">" . $row2["divname"] . "</option>";
          }
           ?>
        </select>
      <br />
      <input type="submit" value="บันทึกข้อมูล" />
      <?php mysqli_close($con); ?>
    </form>
  </body>
</html>
