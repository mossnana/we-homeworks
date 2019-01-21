<?php

require "connection.php";

$name = $_POST['suggestion'];

$connect = new connection();

$connect->connect();

$sql = "SELECT * FROM amphures where AMPHUR_NAME like '%$name%'";

$result = mysqli_query($connect->con, $sql);

if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_array($result)) {
        if (strpos($row['AMPHUR_NAME'], $name) !== false) {
            $xxx = $row["AMPHUR_NAME"];
            echo "<option value='$xxx'>";
        } else {
            return null;
        }
    }
}
?>
