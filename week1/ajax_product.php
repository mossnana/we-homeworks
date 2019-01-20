<?php
include 'connecttion.php';

$cate_id = $_POST['cate_id'];
if($cate_id == 0) {
    $sql = "SELECT * FROM Products";
}else{
    $sql = "SELECT * FROM Products WHERE categort_id = $cate_id";
}
    $result = $conn->query($sql);
    if($result->num_rows > 0) {
        echo "<tr><th>Product</th><th>Price</th><th>Description</th> <th>Category</th><th>Actions</th></tr>";
        while($row = $result->fetch_array()) {
            extract($row);
            echo "<tr>";
            echo "<td>{$name}</td><td>{$price}</td><td>{$description}</td>"; 
            echo "<td>";
            echo "</td>";
            echo "<td>";
            echo "<a href='update_product.php?id={$id}'>Edit</a> ";
            echo "<a onclick='del({$id})'>Delete</a>";
            echo "</td>";
            echo "</tr>";
        }
    }


?>