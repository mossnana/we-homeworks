<?php
$word = $_REQUEST["word"];
include("connection.php");
$query = "select * from autocomplete where term like '%$word%' ";
$result = mysqli_query($con, $query);
echo "<table border='0' class='hint'>";
while($row = mysqli_fetch_array($result)){
	echo "<tr><td onclick='setword(\"" . $row["term"] . "\")'><a href='#'>" . $row["term"] . "</a></td></tr>";
}
echo "</table>";
?>