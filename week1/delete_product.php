<?php
    // include database and object file
    include_once 'config/database.php';
    include_once 'objects/product.php';
    // get database connection
    $database = new Database();
    $db = $database->getConnection();
    $product = new product($db);
    // set product id to be deleted
    $product->id = $_GET['id'];
    
    // delete the product
    if($product->delete()){
        $msg = "Object was deleted.";
    }
    else{
        $msg = "Unable to delete object.";
    }
    echo $msg;
?>