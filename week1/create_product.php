<?php
// import section
$page_title = "Create Product";
include_once "header.php";
include_once 'objects/category.php';
include_once 'objects/product.php';

echo "<div class='right-button-margin'>";
    echo "<a href='index.php' class='btn btn-default pull-right'>Read Products</a>";
echo "</div>";

// connect database
include_once 'config/database.php';
$database = new Database();
$db = $database->getConnection();




// ถ้ามีการใช้คำสั่ง post เข้ามา
if($_POST){
// เก็บค่า ที่ได้รับมาจาก post
    $productName = $_POST['name'];
    $productPrice = $_POST['price'];
    $productDesc = $_POST['description'];
    $productCate = $_POST['category_id'];
    // create object :: Product class
    $createProduct = new product($db);
    
    // บันทึกค่าลง class product
    $createProduct->name = $productName;
    $createProduct->price = $productPrice;
    $createProduct->description = $productDesc;
    $createProduct->category_id = $productCate;
    // เรียกใช้ method create() เพิ่มข้อมูลใน database
    if($createProduct->create()){
        echo "<div class=\"alert alert-success alert-dismissable\">";
            echo "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>";
            echo "Product was created.";
            echo "<script>setTimeout(function(){window.location = 'index.php'},2500)</script>";
        echo "</div>";
    }
 
    // if unable to create the product, tell the user
    else {
        echo "<div class=\"alert alert-danger alert-dismissable\">";
            echo "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>";
            echo "Unable to create product.";
        echo "</div>";
    }
}
?>
<!-- HTML form for creating a product -->
<form action='create_product.php' method='post'>
    <table class='table table-hover table-responsive table-bordered'>
        <tr>
          <td>Name</td>
          <td><input type='text' name='name' class='form-control' required></td>
        </tr>
        <tr>
          <td>Price</td>
          <td><input type='text' name='price' class='form-control' required></td>
        </tr>
        <tr>
          <td>Description</td>
         <td><textarea name='description' class='form-control' required></textarea></td>
        </tr>
        <tr>
            <td>Category</td>
            <td>
            <!-- categories from database will be here -->
           	<?php
			// read the product categories from the database
			$cate = new Category($db);
			$result = $cate->readAll();
			// put them in a select drop-down
			echo "<select class='form-control' name='category_id'>";
			echo "<option>Select category...</option>";
			while($row_category = $result->fetch_array()) {
				echo "<option value='{$row_category["id"]}'>{$row_category["name"]}</option>";
			}
			echo "</select>";
		?>
            </td>
        </tr>
 
        <tr>
            <td></td>
            <td>
                <button type="submit" class="btn btn-primary">Create</button>
            </td>
        </tr>
 
    </table>
</form>

<?php
include_once "footer.php";
?>
