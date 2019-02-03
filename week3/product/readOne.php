<?php
  header("Content-Type: application/json; charset=UTF-8");
  include_once '../config/database.php';
  include_once '../objects/product.php';
  include_once '../objects/category.php';
  // instantiate database and product object
  $database = new Database();
  $db = $database->getConnection();
  //query product
  $product = new Product($db);
  $product->id = isset($_GET['id']) ? $_GET['id'] : die();
  $product->readOne();
  if($product->name!=null){
    $cate = new Category($db);
    $cate->id = $product->category_id;
    $cate->readName();
    $product_arr = array(
    "id" => $product->id,
    "name" => $product->name,
    "description" => $product->description,
    "price" => $product->price,
    "category_id" => $product->category_id,
    "category_name" => $cate->name
    );
    // set response code - 200 OK
    http_response_code(200);
    echo json_encode($product_arr);
  }
  else{
    // set response code - 404 Not found
    http_response_code(404);
    echo json_encode(array("message" => "No products found."));
  }
?>
