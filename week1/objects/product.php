<?php
class product{
    private $conn;
 
    // object properties
    public $id;
    public $name;
    public $price;
    public $description;
    public $category_id;
    public $timestamp;
 
    public function __construct($db){
        $this->conn = $db;
    }
 
    function readAll(){
        $query = "SELECT id, name, description, price, category_id
                FROM products
                ORDER BY name ASC";

        $result = $this->conn->query($query);
        return $result;
    }

    function readOne(){
        $query = "SELECT name, price, description, category_id
                FROM products
                WHERE id =  " . $this->id ;

        $result = $this->conn->query($query);
        $row = $result->fetch_array();      
        $this->name = $row['name'];
        $this->price = $row['price'];
        $this->description = $row['description'];
        $this->category_id = $row['category_id'];
    }

    // create products
    function create(){
        // to get time-stamp for 'created' field
        $this->getTimestamp();
        //write query
        $query = "INSERT INTO products(name, price, description, category_id, created) VALUES ('" . $this->name. "', '" . $this->price. "', '" . $this->description. "', '" . $this->category_id. "', '" . $this->timestamp. "' )";
        if($this->conn->query($query)){
            return true;
        }else{
            return false;
        }
    }
	
   // used for the 'created' field when creating a products
    function getTimestamp(){
        date_default_timezone_set('Asia/Bangkok');
        $this->timestamp = date('Y-m-d H:i:s');
    } 

    function update(){
        $query = "UPDATE products
                SET
                    name = '" . $this->name . "',
                    price = '" . $this->price . "',
                    description = '" . $this->description . "',
                    category_id  = '" . $this->category_id . "'
                WHERE id = '" . $this->id . "'";
     
        if($this->conn->query($query)){    
            return true;
        }else{
            return false;
        }
    }

    // delete the products
    function delete(){
        $query = "DELETE FROM products WHERE id = '" . $this->id . "'";
     
        if($this->conn->query($query)){    
            return true;
        }else{
            return false;
        }
    }
}

?>