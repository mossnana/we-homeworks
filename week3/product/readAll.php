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
  $result = $product->readAll();
  $num = $result->num_rows;
  $products_arr = array();
  $products_arr["items"] = array();
  if($num>0){
    $cate = new Category($db);
    while($row = $result->fetch_array()) {
    extract($row);
    $cate->id = $category_id;
    $cate->readName();
    $product_item = array(
    "id" => $id,
    "name" => $name,
    "description" => $description,
    "price" => $price,
    "category_id" => $category_id,
    "category_name" => $cate->name
    );
    array_push($products_arr["items"], $product_item);
    }
    // set response code - 200 OK
    http_response_code(200);
    echo json_encode($products_arr);
  }
  else{
  // set response code - 404 Not found
    http_response_code(404);
    echo json_encode(array("message" => "No products found."));
  }
?>
