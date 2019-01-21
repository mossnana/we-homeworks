<?php
/**
 * Created by PhpStorm.
 * User: PermpoonChaowanaphun
 * Date: 12/5/2018
 * Time: 16:10
 */

$xx = array("Permpoon", "Wow", "eiei", "4562547");

if (isset($_POST['suggestion'])) {
    $name = $_POST['suggestion'];

    foreach ($xx as $x) {
        if (strpos($x, $name) !== false) {
            echo $x;
            echo "<br>";
        } else {

        }
    }
}

?>