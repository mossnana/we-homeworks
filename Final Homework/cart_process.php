<?php
if(!isset($_SESSION['member_id'])) {
    echo '<script>window.alert("กรุณาเข้าสู่ระบบก่อนครับ");</script>';
    echo '<script>window.location = "login.php#login"</script>';
}
?>

<?php
include 'connect.php';

if(isset($_POST["add_to_cart"])){
    if(isset($_SESSION["shopping_cart"])) {
        $item_array_id = array_column($_SESSION['shopping_cart'],'product_id');

        if(!in_array($_GET['id'], $item_array_id)) {
            $count = count($_SESSION['shopping_cart']);
            $item_array = array(
                'product_id' => $_GET['id'],
                'product_name' => $_POST['hidden_name'],
                'product_price'		=>	$_POST["hidden_price"],
                'product_quantity'		=>	$_POST["quantity"]
            );
            $_SESSION["shopping_cart"][$count] = $item_array;
            echo '<script>alert("เพิ่มสินค้าลงในตะกร้าสินค้าแล้วครับ")</script>';
            echo '<script>window.location = "product.php"</script>';
        } else {
            $key = array_search($_GET['id'], array_column($_SESSION["shopping_cart"], 'product_id'));
            $_SESSION["shopping_cart"][$key]['product_quantity'] += $_POST['quantity'];
            echo '<script>alert("เพิ่มสินค้าลงในตะกร้าสินค้าแล้วครับ")</script>';
            echo '<script>window.location = "product.php"</script>';
        }
    } else {
        $item_array = array(
            'product_id' => $_GET['id'],
            'product_name' => $_POST['hidden_name'],
            'product_price'		=>	$_POST["hidden_price"],
            'product_quantity'		=>	$_POST["quantity"]
        );
        $_SESSION['shopping_cart'][0] = $item_array;
        echo '<script>alert("เพิ่มสินค้าลงในตะกร้าสินค้าแล้วครับ")</script>';
        echo '<script>window.location = "product.php"</script>';
    }
}

if(isset($_GET["action"])) // มีการรับค่า action มาไหม
{
    if($_GET["action"] == "delete") // ถ้ารับมา เป็น ค่า action อะไร ถ้าเป็น delete จะ...
    {
        foreach($_SESSION["shopping_cart"] as $keys => $values) // ทำการลูป array session shopping cart เก็บค่าลง values
        {
            if($values["product_id"] == $_GET["id"]) // ถ้ามี values ตัวไหน เท่ากับ id ที่ติดมากับ action ให้ทำการ....
            {
                unset($_SESSION["shopping_cart"][$keys]); // unset ตัวนั้นทิ้ง
                echo '<script>alert("ลบสินค้าเรียบร้อยครับ")</script>'; // และแจ้งเตือนว่า ถูกลบแล้ว
                echo '<script>window.location="cart.php"</script>'; // และทำการ refresh หน้า 1 รอบ
            }
        }
    }
}

?>
