<?php
	include("connection.php");
	$UserName = $_REQUEST["UserName"];
	$query = "SELECT * FROM User WHERE UserName='$UserName'";

	$result = mysqli_query($con, $query);
	if (mysqli_num_rows($result) > 0){
	  echo "0"; //duplicate username
	}
	else{
	  echo "1";
	}
?>
