<?php
//session_start();
//if(!isset($_SESSION['member_id'])) {
//    echo '<script>window.alert("กรุณาเข้าสู่ระบบก่อนครับ");</script>';
//    echo '<script>window.location = "login.php#login"</script>';
//}
//?>


<?php

include 'connect.php';

$morning_menu_query = "SELECT * FROM product WHERE product.category_id = 1";
$lunch_menu_query = "SELECT * FROM product WHERE product.category_id = 2";
$dinner_menu_query = "SELECT * FROM product WHERE product.category_id = 3";
$dessert_menu_query = "SELECT * FROM product WHERE product.category_id = 4";

$morning_menu_result = mysqli_query($connect, $morning_menu_query);
$lunch_menu_result = mysqli_query($connect, $lunch_menu_query);
$dinner_menu_result = mysqli_query($connect, $dinner_menu_query);
$dessert_menu_result = mysqli_query($connect, $dessert_menu_query);

?>

<html lang="th" class="no-js">
<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="">
    <!-- Author Meta -->
    <meta name="author" content="swift restaurant chef">
    <!-- Meta Description -->
    <meta name="description" content="swift restaurant">
    <!-- Meta Keyword -->
    <meta name="keywords" content="swift restaurant">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Swift restaurant | ร้านอาหารสไลด์ฟิวชั่น</title>

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Bai+Jamjuree" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <!--
    CSS
    ============================================= -->
    <link rel="stylesheet" href="css/linearicons.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/main.css">
    <style>
        #logoInNav {
            position: absolute;
            transform: translateY(-30px);
        }

        .logoInNav-scrolled {
            display: none;
        }

        body {
            font-size: 1em!important;
            font-family: 'Bai Jamjuree', sans-serif;
        }


        /* shopping card */
        .quantity {
            width: 60px;
            margin-right: 10px;
        }

        .price-circle {
            position: absolute;
            transform: translate(100px, 120px);
            z-index: 100;
        }

        .price-tag {
            font-size: 25px;
            color: black;
            position: absolute;
            transform: translate(125px, 158px);
            z-index: 110;
        }

        .card-body {
            z-index: 200;
        }

        .card-img-top {
            height: 175px;
            z-index: 50;
        }

        .card {
            width: 300px!important;
            height: 400px!important;
            margin: 10px;
        }

        .load-more {
            margin-right: auto;
            margin-left: auto;
        }

        .morning-logo {
            background: linear-gradient(to top, #ffff00 0%, #9999ff 102%);
            background-position: bottom;
            background-size: cover;

        }

        .lunch-logo {
            background: linear-gradient(to top, #ffffcc 0%, #ff0000 102%);
            background-position: bottom;
            background-size: cover;
        }

        .dinner-logo {
            background: linear-gradient(to top, #ff0000 0%, #9933ff 102%);
            background-position: bottom;
            background-size: cover;
        }

        .dessert-logo {
            background: linear-gradient(to top, #ff99ff 0%, #99ff99 102%);
            background-position: bottom;
            background-size: cover;
        }

        .menu-2 {
            background-color: white;
        }


        /*desktop size*/
        @media only screen and (min-width: 769px){
            .nav-menu > li > a {
                font-size: 1em;
            }
        }

        /*tablet size*/
        @media only screen and (max-width: 768px){
            #logoInNav {
                display: none;
            }
            .card {
                margin-right: auto;
                margin-left: auto;
            }
        }

        /*mobile size*/
        @media only screen and (max-width: 425px){
            .card {
                margin-right: auto;
                margin-left: auto;
            }
        }




    </style>
</head>

<body>

<!-- Start product Area -->
<br/>

<section>
    <ul class="nav justify-content-center menu-2">
        <li class="nav-item">
            <a class="nav-link active" id="x1" href="#">อาหารเช้า</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="x2" href="#">อาหารกลางวัน</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="x3" href="#">อาหารเย็น</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="x4" href="#">ของหวาน</a>
        </li>
    </ul>
</section>

<br/>

<!--1-->
<section id="1">
    <div class="container">
        <div class="row">
            <?php
                while($morning_menu_row = mysqli_fetch_array($morning_menu_result)) {
                    ?>
                    <div class="col-lg-4">
                        <div class="card">
                            <img class="card-img-top" src="img/menu/<?php echo $morning_menu_row['product_id']  ?>.jpg" alt="">
                            <div class="price-tag">
                                ฿<?php echo $morning_menu_row['product_price']  ?>
                            </div>
                            <svg height="100" width="100" class="price-circle">
                                <circle cx="50" cy="50" r="40" stroke="" stroke-width="0" fill="white"/>
                            </svg>
                            <div class="card-body text-center">
                                <h5 class="card-title"><?php echo $morning_menu_row['product_name']  ?></h5>
                                <p class="card-text"><?php echo $morning_menu_row['product_desp']  ?></p>
                                <span>จำนวน : <input class="quantity" type="number" name="quantity"></span><a href="#"
                                                                                                              class="btn btn-success">ซื้อ</a>
                            </div>
                        </div>
                    </div>

                    <?php
                }
            ?>
        </div>
    </div>
</section>

<!--2-->
<section id = "2">
    <div class="container">
        <div class="row">
            <?php
            while($lunch_menu_row = mysqli_fetch_array($lunch_menu_result)) {
                ?>
                <div class="col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="img/menu/<?php echo $lunch_menu_row['product_id']  ?>.jpg" alt="">
                        <div class="price-tag">
                            ฿<?php echo $lunch_menu_row['product_price']  ?>
                        </div>
                        <svg height="100" width="100" class="price-circle">
                            <circle cx="50" cy="50" r="40" stroke="" stroke-width="0" fill="white"/>
                        </svg>
                        <div class="card-body text-center">
                            <h5 class="card-title"><?php echo $lunch_menu_row['product_name']  ?></h5>
                            <p class="card-text"><?php echo $lunch_menu_row['product_desp']  ?></p>
                            <span>จำนวน : <input class="quantity" type="number" name="quantity"></span><a href="#"
                                                                                                          class="btn btn-success">ซื้อ</a>
                        </div>
                    </div>
                </div>

                <?php
            }
            ?>
        </div>
    </div>
</section>

<!--3-->
<section id="3">
    <div class="container">
        <div class="row">

            <?php
            while($dinner_menu_row = mysqli_fetch_array($dinner_menu_result)) {
                ?>
                <div class="col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="img/menu/<?php echo $dinner_menu_row['product_id']  ?>.jpg" alt="">
                        <div class="price-tag">
                            ฿<?php echo $dinner_menu_row['product_price']  ?>
                        </div>
                        <svg height="100" width="100" class="price-circle">
                            <circle cx="50" cy="50" r="40" stroke="" stroke-width="0" fill="white"/>
                        </svg>
                        <div class="card-body text-center">
                            <h5 class="card-title"><?php echo $dinner_menu_row['product_name']  ?></h5>
                            <p class="card-text"><?php echo $dinner_menu_row['product_desp']  ?></p>
                            <span>จำนวน : <input class="quantity" type="number" name="quantity"></span><a href="#"
                                                                                                          class="btn btn-success">ซื้อ</a>
                        </div>
                    </div>
                </div>

                <?php
            }
            ?>

        </div>
    </div>
</section>

<!--4-->
<section id="4">
    <div class="container">
        <div class="row">
            <?php
            while($dessert_menu_row = mysqli_fetch_array($dessert_menu_result)) {
                ?>
                <div class="col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="img/menu/<?php echo $dessert_menu_row['product_id']  ?>.jpg" alt="">
                        <div class="price-tag">
                            ฿<?php echo $dessert_menu_row['product_price']  ?>
                        </div>
                        <svg height="100" width="100" class="price-circle">
                            <circle cx="50" cy="50" r="40" stroke="" stroke-width="0" fill="white"/>
                        </svg>
                        <div class="card-body text-center">
                            <h5 class="card-title"><?php echo $dessert_menu_row['product_name']  ?></h5>
                            <p class="card-text"><?php echo $dessert_menu_row['product_desp']  ?></p>
                            <span>จำนวน : <input class="quantity" type="number" name="quantity"></span><a href="#"
                                                                                                          class="btn btn-success">ซื้อ</a>
                        </div>
                    </div>
                </div>

                <?php
            }
            ?>

        </div>
    </div>
</section>

<br/>











<!--external script-->
<script src="js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="js/easing.min.js"></script>
<script src="js/hoverIntent.js"></script>
<script src="js/superfish.min.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/parallax.min.js"></script>
<script src="js/mail-script.js"></script>
<script src="js/main.js"></script>
<script>
    $(window).ready(function () {
        $("#1").hide();
        $("#2").hide();
        $("#3").hide();
        $("#4").hide();
    });

    $("#x1").click(function (event) {
        event.preventDefault();
        $("#1").hide();
        $("#2").hide();
        $("#3").hide();
        $("#4").hide();
        $("#1").fadeIn();

        $("body").removeClass("lunch-logo");
        $("body").removeClass("dinner-logo");
        $("body").removeClass("dessert-logo");
        $("body").addClass("morning-logo");

    });

    $("#x2").click(function (event) {
        event.preventDefault();
        $("#1").hide();
        $("#2").hide();
        $("#3").hide();
        $("#4").hide();
        $("#2").fadeIn();
        $("body").removeClass("morning-logo");
        $("body").removeClass("dinner-logo");
        $("body").removeClass("dessert-logo");
        $("body").addClass("lunch-logo");
    });

    $("#x3").click(function (event) {
        event.preventDefault();
        $("#1").hide();
        $("#2").hide();
        $("#3").hide();
        $("#4").hide();
        $("#3").fadeIn();
        $("body").removeClass("morning-logo");
        $("body").removeClass("lunch-logo");
        $("body").removeClass("dessert-logo");
        $("body").addClass("dinner-logo");
    });

    $("#x4").click(function (event) {
        event.preventDefault();
        $("#1").hide();
        $("#2").hide();
        $("#3").hide();
        $("#4").hide();
        $("#4").fadeIn();
        $("body").removeClass("morning-logo");
        $("body").removeClass("lunch-logo");
        $("body").removeClass("dinner-logo");
        $("body").addClass("dessert-logo");
    });


</script>

</body>
