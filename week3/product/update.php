<?php
header("Content-Type: application/json; charset=UTF-8");
include_once '../config/database.php';
include_once '../objects/product.php';
// instantiate database and product object
$database = new Database();
$db       = $database->getConnection();
$product  = new Product($db);
// gets the raw POST data
$data     = json_decode(file_get_contents("php://input"));
if (!empty($data->name) && !empty($data->price) && !empty($data->description) && !empty($data->category_id)) {
    $product->id          = $data->id;
    $product->name        = $data->name;
    $product->price       = $data->price;
    $product->description = $data->description;
    $product->category_id = $data->category_id;
    // create the product
    if ($product->update()) {
        // set response code - 201 created
        http_response_code(201);
        echo json_encode(array(
            "message" => "Product was updated."
        ));
    }
    // unable to create the product
    else {
        // set response code - 503 service unavailable
        http_response_code(503);
        echo json_encode(array(
            "message" => "Unable to updated product."
        ));
    }
}
// data is incomplete
else {
    // set response code - 400 bad request
    http_response_code(400);
    echo json_encode(array(
        "message" => "Unable to updated product. Data is
    incomplete."
    ));

}
?>
