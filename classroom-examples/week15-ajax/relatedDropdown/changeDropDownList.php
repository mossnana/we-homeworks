<?php
include("connection.php");
$Reg_Id = $_REQUEST["Reg_Id"];
$sql2 = "SELECT * FROM Province WHERE Reg_Id = '$Reg_Id' ";
$result2 = mysqli_query($con, $sql2);
while($row2 = mysqli_fetch_array($result2)) { 
  echo "<option value='$row2[0]' >" . $row2["Prov_Name"] .  "</option>";
}
?>