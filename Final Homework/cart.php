<?php
session_start();
if(!(isset($_SESSION['member_id']))) {
    echo "<script>window.alert('กรุณาล็อกอินก่อนครับ');</script>";
    echo "<script>window.location='login.php#login';</script>";
} else {
    include 'cart_process.php';
}

?>


<!DOCTYPE html>
<html lang="th" class="no-js">
<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
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
    <!--
    CSS
    ============================================= -->
    <link rel="stylesheet" href="css/linearicons.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
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

        tr {
            text-align: center;
        }

        /*desktop size*/
        @media only screen and (min-width: 769px){
            .nav-menu > li > a {
                font-size: 1em;
            }
            .text-product {
                color: black!important;
            }
            .img-responsive {
                width: 100px!important;
            }
        }

        /*tablet size*/
        @media only screen and (max-width: 768px){
            #logoInNav {
                display: none;
            }
            .text-product {
                color: black!important;
            }
            .img-responsive {
                width: 150px!important;
            }
        }

        /*mobile size*/
        @media only screen and (max-width: 425px){
            .text-product {
                color: white!important;
            }
        }

        .table>tbody>tr>td, .table>tfoot>tr>td{
            vertical-align: middle;
        }
        @media screen and (max-width: 600px) {
            table#cart tbody td .form-control{
                width:20%;
                display: inline !important;
            }
            .actions .btn{
                width:36%;
                margin:1.5em 0;
            }

            .actions .btn-info{
                float:left;
            }
            .actions .btn-danger{
                float:right;
            }

            table#cart thead { display: none; }
            table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
            table#cart tbody tr td:first-child { background: #333; color: #fff; }
            table#cart tbody td:before {
                /*content: attr(data-th); font-weight: bold;*/
                display: inline-block; width: 8rem;
            }



            table#cart tfoot td{display:block; }
            table#cart tfoot td .btn{display:block;}

        }
    </style>
</head>

<body>

<header id="header" id="home">
    <div class="container">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
                <a href="index.php"><img src="img/logo.jpg" id="logoInNav" width="200px" height="200px" alt="" title="" /></a>
            </div>
            <nav id="nav-menu-container">
                <ul class="nav-menu">
                    <li class="menu-active"><a href="index.php#home">หน้าแรก</a></li>
                    <li><a href="index.php#dish">เมนูประจำวัน</a></li>
                    <li><a href="index.php#chefs">เชฟทางร้าน</a></li>
                    <li><a href="index.php#blog">ประกาศทางร้าน</a></li>
                    <li><a href="index.php#contact">ติดต่อเรา</a></li>
                    <li><a href="cart.php"><i class="fas fa-shopping-cart"></i></a></li>
                    <?php
                    if (isset($_SESSION['member_id'])) {
                        echo '<li><a href="logout.php">ออกจากระบบ</a></li>';
                    } else {

                    }
                    ?>
                </ul>
            </nav>
            <!-- #nav-menu-container -->
        </div>
    </div>
</header>
<!-- Introduction area -->
<section class="banner-area relative" id="home">
    <div class="container">
        <div class="row fullscreen d-flex align-items-center justify-content-start">
            <div class="banner-content col-lg-8 col-md-12">
                <h1>
                    Swift Restaurant
                </h1>
                <p class="text-white">
                    ร้านอาหารที่พร้อมเสริฟอาหารให้ท่าน ในทุกที่ ทุกเวลา
                </p>
                <a href="product.php#sec-menu" class="primary-btn header-btn text-uppercase">ดูเมนูของทางร้าน</a>
            </div>
        </div>
    </div>
</section>



<div class="container">
    <table id="cart" class="table table-hover table-condensed">
        <thead>
        <tr>
            <th style="width:50%">สินค้า</th>
            <th style="width:10%">ราคาสินค้า</th>
            <th style="width:8%">จำนวน</th>
            <th style="width:22%" class="text-center">ราคา</th>
            <th style="width:10%"></th>
        </tr>
        </thead>
        <tbody>

        <!--loop start here-->
        <?php
        if(!empty($_SESSION["shopping_cart"])) {
            $total = 0;
            foreach ($_SESSION["shopping_cart"] as $keys => $values) {
                ?>

                <tr>
                    <td data-th="Product">
                        <div class="row">
                            <div class="col-sm-2 col-md-6 col-lg-4 hidden-xs"><img src="img/menu/<?php echo $values["product_id"]; ?>.jpg"
                                                                                   alt="..." class="img-responsive"/>
                            </div>
                            <div class="col-sm-10 col-md-6 col-lg-8">
                                <h4 class="nomargin text-product"><?php echo $values["product_name"]; ?></h4>

                            </div>
                        </div>
                    </td>
                    <td data-th="Price"><?php echo $values["product_price"]; ?></td>
                    <td data-th="Quantity">
                        <input type="number" class="form-control text-center" value="<?php echo $values["product_quantity"]; ?>">
                    </td>
                    <td data-th="Subtotal" class="text-center"><?php echo number_format($values["product_quantity"] * $values["product_price"], 2);?> บาท</td>
                    <td class="actions" data-th="">
                        <a href="cart.php?action=delete&id=<?php echo $values["product_id"]; ?>" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></a>
                    </td>
                </tr>

                <?php
                $total = $total + ($values["product_quantity"] * $values["product_price"]);
            }

        ?>
        <!--loop end here-->

        </tbody>
        <?php
        }
        ?>
        <tfoot>

        <tr>
            <td><a href="product.php" class="btn btn-warning"><i class="fa fa-angle-left"></i> เลือกอาหารต่อ</a></td>
            <td colspan="2" class="hidden-xs"></td>
            <td class="hidden-xs text-center"><strong>ราคาสุทธิ <?php
                    if(isset($total)){
                        echo number_format($total, 2);
                    }else {
                        echo "0";
                    }
                    ?> บาท</strong></td>
            <td><a href="shopping.php" class="btn btn-success btn-block">จ่ายเงิน <i class="fa fa-angle-right"></i></a></td>
        </tr>
        </tfoot>
    </table>


</div>



<!-- start footer Area -->
<footer class="footer-area section-gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-3  col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h4 class="text-white">เกี่ยวกับเรา</h4>
                    <p>
                        ร้านอาหารสไตล์ตามใจคนขายเป็นส่วนใหญ่
                    </p>
                </div>
            </div>
            <div class="col-lg-4  col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h4 class="text-white">ติดต่อเรา</h4>
                    <p>
                        110/1-4 ถนนประชาชื่น หลักสี่ กทม 10210
                    </p>
                    <p class="number">
                        02 - 589 - 9605<br>
                        080 - 677 - 5134
                    </p>
                </div>
            </div>
            <div class="col-lg-5  col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h4 class="text-white">รับข้อมูลข่าวสารผ่านอีเมลล์</h4>
                    <p>(ระบบกำลังพัฒนา).</p>
                    <div class="d-flex flex-row" id="mc_embed_signup">


                        <form class="navbar-form" novalidate="true" action="https://facebook.us19.list-manage.com/subscribe/post?u=1a5f400d36c159c3de1e97a6e&amp;id=0c405ad0ab" method="post">
                            <div class="input-group add-on">
                                <input class="form-control" name="EMAIL" placeholder="Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'" required="" type="email">
                                <div style="position: absolute; left: -5000px;">
                                    <input name="EMAIL" id="mce-EMAIL" tabindex="-1" value="" type="text">
                                </div>
                                <div class="input-group-btn">
                                    <button class="genric-btn" name="subscribe"><span class="lnr lnr-arrow-right"></span></button>
                                </div>
                            </div>
                            <div class="info mt-20"></div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom d-flex justify-content-between align-items-center flex-wrap">
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            <p class="footer-text m-0">Copyright &copy;<script>document.write(new Date().getFullYear());</script>  Swift Restaurant
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            <div class="footer-social d-flex align-items-center">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
            </div>
        </div>
    </div>
</footer>
<!-- End footer Area -->

<!--external js-->
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


</body>

</html>