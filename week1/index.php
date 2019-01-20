<html>

<head>
<script>
// Delete Function จาก ปุ่มกด delete ทำเป็น Ajax
function del(id) {
  if (id=="") {
    return; // ถ้าส่งคำขอมาแบบไม่มี id ให้เป็นค่าว่าง
  }
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
	
// เริ่มการส่งคำขอ Ajax
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      document.getElementById("txtHint").innerHTML=this.responseText;
    }
  }
  xmlhttp.open("GET","delete_product.php?id="+id,true);
  xmlhttp.send();
}
</script>
</head>

<body>

<?php
// import section
	$page_title = "Read Products";
	include_once "header.php";
	include_once 'config/database.php';
	include_once 'objects/product.php';
	include_once 'objects/category.php';

// สร้าง object เพื่อติดต่อกับฐานข้อมูล และ ใน class Database มี method ที่ชื่อว่า getConnection() ทำการติดต่อฐานข้อมูล
    $database = new Database();
    $db= $database->getConnection();
/*
	สร้าง object เพื่อเรียกใช้ class product ผ่าน parameter เข้าไปหนึ่งตัวชื่อ $db ที่ได้จากการ return มาของ method getConnection(); 
	สร้าง $result เก็บค่าที่ได้จาก method readAll() ซึ่งเป็น method ทำหน้าที่ query ข้อมูล
*/
    $productRead = new product($db);
    $result = $productRead->readAll();
// ถ้าข้อมูลที่ query มี ให้ วน loop while จนกระทั่งข้อมูลหมด $result->fetch_array()
if($result->num_rows>0){
	echo "<table class='table table-hover table-responsive table-bordered'>";
	echo "<tr><th>Product</th><th>Price</th><th>Description</th> <th>Category</th><th>Actions</th></tr>";
	while($row = $result->fetch_array()) {
        extract($row);
		echo "<tr>";
		echo "<td>{$name}</td><td>{$price}</td><td>{$description}</td>"; 
        echo "<td>";
	$cate = new Category($db); // อยากให้ Category แสดงด้วยเลยต้องไปใช้ method ใน class Category
        $cate->id = $category_id; // ส่ง id ของ $row[category_id] เข้าไปใน class Category
        $cate->readName(); // จากนั้นให้มัน query ออกมาตาม id ที่ส่งเข้าไป ผ่าน method readName();
        echo $cate->name;
		echo "</td>";
		echo "<td>";
		echo "<a href='update_product.php?id={$id}'>Edit</a> "; // มีประโยชน์ต่อไปในการส่งข้อมูล get
		echo "<a onclick='del({$id})'>Delete</a>"; // เรียกใช้งาน function del(ผ่าน id เข้าไป) -> ajax
		echo "</td>";
		echo "</tr>";
	}
	echo "</table>";
	echo "<a href='create_product.php'><button class='btn btn-primary'>Create New Product</button></a>";
}
else{
	// ถ้า query แล้วไม่มีข้อมูลให้แสดง ข้อความ No products found
	echo "<div>No products found.</div>";
}

include_once "footer.php";
?>
<div id="txtHint"></div> // dom ไว้กับ del(); ไว้แสดง responseText จาก ajax
    
</body>
</html>
