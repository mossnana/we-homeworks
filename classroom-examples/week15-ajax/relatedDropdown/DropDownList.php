<meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#region").change(function(){
		$.post("changeDropDownList.php",
		{
			Reg_Id: $("#region").val()
		},
		function(data, status){
			$("#province").html(data);
		});
	});
});
</script>

<?php
include("connection.php");
$sql = "SELECT * FROM Region";
$result = mysqli_query($con, $sql);
echo "ภาค: <select id='region'>";
while($row = mysqli_fetch_array($result)) {
  echo "<option value='$row[0]' >" . $row["Reg_Name"] .  "</option>";
 //   echo "<option value='" . $row["Reg_Id"]. "' >" . $row["Reg_Name"] .  "</option>";
}
echo "</select>";
echo "<br />";
$sql2 = "SELECT * FROM Province WHERE Reg_Id = '1' ";
$result2 = mysqli_query($con, $sql2);
echo "จังหวัด: <select id='province'>";
while($row2 = mysqli_fetch_array($result2)) {
  echo "<option value='$row2[0]' >" . $row2["Prov_Name"] .  "</option>";
}
echo "</select>";

mysqli_close($con);
?>
