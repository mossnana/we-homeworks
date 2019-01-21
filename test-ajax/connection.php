<?php

Class connection {
    public $con;
    private $host = 'localhost';
    private $username = 'root';
    private $password = '';
    private $dbname = 'test';

    public function __construct() {

    }
    public function connect() {
        $this->con = mysqli_connect($this->host, $this->username, $this->password, $this->dbname);
        mysqli_set_charset($this->con,"utf8");
        return $this->con;
    }
}

?>