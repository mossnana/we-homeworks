<?php
  header("Content-Type: application/json; charset=UTF-8");
  include_once '../config/database.php';
  include_once '../objects/product.php';
  // instantiate database and product object
  $database = new Database();
  $db = $database->getConnection();
  //query product
  $product = new Product($db);
  $product->id = isset($_GET['id']) ? $_GET['id'] : die();
  if($product->delete()){
    // set response code - 200 OK
    http_response_code(200);
    echo json_encode(array("message" => "ลบสำเร็จแว้ว", "test" => $product->id));
  }
  else{
    // set response code - 404 Not found
    http_response_code(404);
    echo json_encode(array("message" => "No products found.", "test" => $product->id));
  }
?>
