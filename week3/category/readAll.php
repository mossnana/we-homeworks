<?php
header("Content-Type: application/json; charset=UTF-8");
include_once '../config/database.php';
include_once '../objects/category.php';
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
//query product
$category = new Category($db);
$result = $category->readAll();
$num = $result->num_rows;
$categories_arr = array();
$categories_arr["items"] = array();
if($num>0){
    while($row = $result->fetch_array()) {
        extract($row);
        $category_item = array(
            "category_id" => $id,
            "category_name" => $name
        );
        array_push($categories_arr["items"], $category_item);
    }
    // set response code - 200 OK
    http_response_code(200);
    echo json_encode($categories_arr);
}
else{
    // set response code - 404 Not found
    http_response_code(404);
    echo json_encode(array("message" => "No categories found."));
}
?>
