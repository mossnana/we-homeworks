

<!DOCTYPE html>
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

        .text-center{
            text-align: center!important;
        }

        /*desktop size*/
        @media only screen and (min-width: 769px){
            .nav-menu > li > a {
                font-size: 1em;
            }
            .img-res {
                height: 350px;
            }
        }

        /*tablet size*/
        @media only screen and (max-width: 768px){
            #logoInNav {
                display: none;
            }
            .img-res {
                height: 250px;
            }
        }

        /*mobile size*/
        @media only screen and (max-width: 425px){
            .img-res {
                margin-bottom: 10px;
            }
        }



        /* for register section */
        .register{
            background: -webkit-linear-gradient(left, #3931af, #00c6ff);
            margin-top: 3%;
            padding: 3%;
        }
        .register-left{
            text-align: center;
            color: #fff;
            margin-top: 4%;
        }
        .register-left input{
            border: none;
            border-radius: 1.5rem;
            padding: 2%;
            width: 60%;
            background: #f8f9fa;
            font-weight: bold;
            color: #383d41;
            margin-top: 30%;
            margin-bottom: 3%;
            cursor: pointer;
        }
        .register-right{
            background: #f8f9fa;
            border-top-left-radius: 10% 50%;
            border-bottom-left-radius: 10% 50%;
        }
        .register-left img{
            margin-top: 15%;
            margin-bottom: 5%;
            width: 25%;
            -webkit-animation: mover 2s infinite  alternate;
            animation: mover 1s infinite  alternate;
        }
        @-webkit-keyframes mover {
            0% { transform: translateY(0); }
            100% { transform: translateY(-20px); }
        }
        @keyframes mover {
            0% { transform: translateY(0); }
            100% { transform: translateY(-20px); }
        }
        .register-left p{
            font-weight: lighter;
            padding: 12%;
            margin-top: -9%;
        }
        .register .register-form{
            padding: 10%;
            margin-top: 10%;
        }
        .btnRegister{
            float: right;
            margin-top: 10%;
            border: none;
            border-radius: 1.5rem;
            padding: 2%;
            background: #0062cc;
            color: #fff;
            font-weight: 600;
            width: 50%;
            cursor: pointer;
        }
        .register .nav-tabs{
            margin-top: 3%;
            border: none;
            background: #0062cc;
            border-radius: 1.5rem;
            width: 28%;
            float: right;
        }
        .register .nav-tabs .nav-link{
            padding: 2%;
            height: 34px;
            font-weight: 600;
            color: #fff;
            border-top-right-radius: 1.5rem;
            border-bottom-right-radius: 1.5rem;
        }
        .register .nav-tabs .nav-link:hover{
            border: none;
        }
        .register .nav-tabs .nav-link.active{
            width: 100px;
            color: #0062cc;
            border: 2px solid #0062cc;
            border-top-left-radius: 1.5rem;
            border-bottom-left-radius: 1.5rem;
        }
        .register-heading{
            text-align: center;
            margin-top: 8%;
            margin-bottom: -15%;
            color: #495057;
        }
    </style>
</head>

<body>

<!--navbar-->
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

<section id="login">

    <div class="container register">
        <div class="row">
            <div class="col-md-3 register-left">
                <img class="bicycle" src="img/bicycle.png" alt=""/>
                <h3>เข้าสู่ระบบ</h3>
                <p>กรุณาเข้าสู่ระบบก่อนการสั่งอาหาร</p>
                <a href="register.html#register"><input type="submit" name="" value="สมัครสมาชิก"/></a><br/>
            </div>
            <div class="col-md-9 register-right">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <h3 class="register-heading">เข้าสู่ระบบ</h3>
                        <div class="row register-form">
                            <div class="col-md-6 d-flex justify-content-center">
                                <img src="img/loginbox.jpg" alt="" class="img-res">
                            </div>
                            <div class="col-md-6">
                                <form action="login_process.php" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="login_username" placeholder="ชื่อผู้ใช้" />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="login_password" placeholder="รหัสผ่าน"/>
                                </div>
                                <input type="submit" class="btnRegister"  value="เข้าสู่ระบบ"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<br>
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
