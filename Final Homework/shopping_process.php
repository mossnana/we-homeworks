
<?php
session_start();
if(!(isset($_SESSION['member_id']))) {
    echo "<script>window.alert('กรุณาล็อกอินก่อนครับ');</script>";
    echo "<script>window.location='login.php#login';</script>";
} else {
    include 'cart_process.php';
}

?>




<?php
$now_member_id = $_SESSION['member_id'];
if($_GET['customer_address'] == 'new_address') {
    $cus_name = $_POST['name'];
    $cus_phone = $_POST['phone'];
    $cus_address = $_POST['address'];
} else if ($_GET['customer_address'] == 'old_address') {
    $get_member_address_query = "SELECT * FROM member WHERE member_id = '$now_member_id' LIMIT 1";
    $get_member_address_result = mysqli_query($connect, $get_member_address_query);
    while($get_member_address_row = mysqli_fetch_array($get_member_address_result)) {
        $cus_name = $get_member_address_row['member_name'];
        $cus_phone = $get_member_address_row['member_phone'];
        $cus_address = $get_member_address_row['member_address'];
    }
} else {
    echo "<script>window.alert('กรุณากลับไปใส่ ที่อยู่การจัดส่งอีกครั้ง');</script>";
    echo "<script>window.location = 'cart.php';</script>";
}

$new_invoice_query = "INSERT INTO invoice(member_id, invoice_customer, 	invoice_phone, 	invoice_address) VALUES ('$now_member_id', '$cus_name', '$cus_phone', '$cus_address')";
$new_invoice_result = mysqli_query($connect, $new_invoice_query);
$id_invoice_query = "SELECT * FROM invoice WHERE member_id = '$now_member_id' ORDER BY  invoice_id DESC LIMIT 1";

$id_invoice_result = mysqli_query($connect, $id_invoice_query);

$id_invoice_array = mysqli_fetch_array($id_invoice_result);


foreach ($_SESSION["shopping_cart"] as $keys => $values) {
    $product_id = $values["product_id"];
    $product_amount = $values["product_quantity"];
    $invoice_id = $id_invoice_array['invoice_id'];
    $new_shopping_list_query = "INSERT INTO shopping(product_id, shopping_amount, member_id, invoice_id) VALUES ('$product_id', '$product_amount', '$now_member_id', '$invoice_id')";

    $new_shopping_list_result = mysqli_query($connect, $new_shopping_list_query);

    $product_table_query = "SELECT * FROM product WHERE product_id = '$product_id'";
    $product_table_result = mysqli_query($connect, $product_table_query);
    $product_table_array = mysqli_fetch_array($product_table_result);
    $product_table_row = $product_table_array['product_stock'];
    $update_product_stock_query = "UPDATE product SET product_stock = $product_table_row-$product_amount WHERE product_id = '$product_id'";
    $update_product_stock_result = mysqli_query($connect, $update_product_stock_query);
}

if($new_shopping_list_result) {
    $_SESSION["shopping_cart"] = null;
    echo "<script>window.alert('สำเร็จ !!! ทางระบบกำลังจัดส่งอาหารไปให้ท่าน');</script>";
    echo "<script>window.location = 'index.php';</script>";
} else {
    echo "<script>window.alert('เกิดข้อผิดผลาด');</script>";
    echo "<script>window.location = 'cart.php';</script>";
}
?>