<!--
start project
12/7/2018
18:17
@ DPU Library
-->

<!--start index page-->

<?php
session_start();
include('connect.php');

$recommend_dish_query = "SELECT shopping.product_id, SUM(shopping.shopping_amount) AS \"orders\", product.product_name, product.product_desp, product.product_price FROM shopping, product WHERE product.product_id = shopping.product_id GROUP BY shopping.product_id ORDER BY SUM(shopping.shopping_amount) DESC LIMIT 3";
$recommend_dish_result = mysqli_query($connect, $recommend_dish_query);
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
    <!-- External CSS -->

    <link rel="stylesheet" href="css/linearicons.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/main.css">

    <!-- Internal CSS @ Head Tag -->

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
        }

        /*mobile size*/
        @media only screen and (max-width: 425px){

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


<!-- recommended dishes area -->
<!--loop start here-->
<section class="top-dish-area section-gap" id="dish">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-8">
                <div class="title text-center">
                    <h1 class="mb-10">เมนูแนะนำจากทางร้าน</h1>
                    <p>เมนูแนะนำจากทางร้านที่ถูกคัดสรรโดยเหล่าบรรดาเชฟที่มีฝีมือของทางร้าน</p>
                    <a href="product.php" class="genric-btn primary-border radius">ดูเมนูทั้งหมดของทางร้าน</a>
                </div>
            </div>
        </div>
        <!--PHP_recommended dishes-->

        <div class="row">

    <?php
    while($recommend_dish_rows = mysqli_fetch_array($recommend_dish_result)) {
    ?>

    <div class="single-dish col-lg-4">
        <div class="thumb">
            <img class="img-fluid" src="img/menu/<?php echo $recommend_dish_rows['product_id'] ?>.jpg" alt="">
        </div>
        <h4 class="text-uppercase pt-20 pb-20"><?php echo $recommend_dish_rows['product_name'] ?></h4>
        <p>
            <?php echo $recommend_dish_rows['product_desp'] ?>
        </p>
    </div>

    <?php
    }
    ?>
        </div>
</section>

<!-- Start video area -->
<section class="video-area">
    <div class="container">
        <div class="row justify-content-center align-items-center flex-column">
            <a class="play-btn" href="https://www.youtube.com/watch?v=OCqN1kpOCOs">
                <img src="img/play-btn.png" alt="">
            </a>
            <h3 class="pt-20 pb-20 text-white">คัดสรรวัตถุดิบที่ดีส่งตรงถึงคุณทุกๆวัน</h3>
            <p class="text-white">คลิกเพื่อดูวีดีโอแนะนำร้านอาหาร</p>
        </div>
    </div>
</section>

<!-- Start features Area -->
<section class="features-area pt-100" id="feature">
    <div class="container">
        <div class="feature-section">
            <div class="row">
                <div class="single-feature col-lg-3 col-md-6">
                    <img src="img/f1.png" alt="">
                    <h4 class="pt-20 pb-20">มื้อเช้าแสนอร่อย</h4>
                    <p>
                        มื้อเช้า ถือเป็นมื้อที่สำคัญที่สุดของวัน เพราะถือเป็นการเริ่มต้นวัน ที่จะกำหนดชีวิตของเราไปตลอดทั้งวัน หากมี อาหารเช้า ที่ดีก็จะช่วยให้วันนั้นเป็นวันดีดีเช่นกัน
                    </p>
                </div>
                <div class="single-feature col-lg-3 col-md-6">
                    <img src="img/f2.png" alt="">
                    <h4 class="pt-20 pb-20">มื้อกลางวันเพิ่มกำลังวังชา</h4>
                    <p>
                        อาหารมื้อกลางวัน เป็นมื้อระหว่างวันที่ร่างการต้องการพลังงานในการทำกิจกรรมจนถึงเย็น
                    </p>
                </div>
                <div class="single-feature col-lg-3 col-md-6">
                    <img src="img/f3.png" alt="">
                    <h4 class="pt-20 pb-20">มื้อเย็นแสนพิเศษ</h4>
                    <p>
                        การงดรับประทานอาหารในมื้อเย็นไม่ได้ส่งผลดีต่อสุขภาพของเราอย่างที่หลายๆ คนคิด เราควรใช้การลดปริมาณอาหาร หรือรับประทานอาหารที่มีแคลอรีน้อยๆแทนจัดดีกว่า
                    </p>
                </div>
                <div class="single-feature col-lg-3 col-md-6">
                    <img src="img/f4.png" alt="">
                    <h4 class="pt-20 pb-20">ของหวานล้างปาก</h4>
                    <p>
                        เขาว่ากันว่า กินคาวไม่กินหวาน ....... ก็ไม่เป็นไร แต่ของหวานทางร้านเรา เราภูมิใจนำเสนออย่างยิ่ง อยากให้ทุกท่านได้ลิ้มลอง
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End features Area -->

<!-- Start team Area -->
<section class="team-area section-gap" id="chefs">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-70 col-lg-8">
                <div class="title text-center">
                    <h1 class="mb-10">พนักงานในร้าน</h1>
                    <p>สุดยอดเหล่าทีมงานและเชฟกระทะเหล็กที่จะมารังสรรค์เมนูสุดพิเศษให้แก่ท่าน</p>
                </div>
            </div>
        </div>
        <div class="row justify-content-center d-flex align-items-center">
            <div class="col-md-3 single-team">
                <div class="thumb">
                    <img class="img-fluid" src="img/t1.jpg" alt="">
                    <div class="align-items-center justify-content-center d-flex">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="meta-text mt-30 text-center">
                    <h4>เพิ่มพูน เชาวนพูนผล</h4>
                    <p>ประธานคณะผู้บริหารฝ่ายงานระบบ</p>
                </div>
            </div>
            <div class="col-md-3 single-team">
                <div class="thumb">
                    <img class="img-fluid" src="img/t2.jpg" alt="">
                    <div class="align-items-center justify-content-center d-flex">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="meta-text mt-30 text-center">
                    <h4>Phansaphong Saisuwan</h4>
                    <p>ประธานคณะผู้บริหารฝ่ายเนื้อหา</p>
                </div>
            </div>
            <div class="col-md-3 single-team">
                <div class="thumb">
                    <img class="img-fluid" src="img/t3.jpg" alt="">
                    <div class="align-items-center justify-content-center d-flex">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="meta-text mt-30 text-center">
                    <h4>Gordon Ramsay</h4>
                    <p>หัวหน้าเชฟกิตติมศักดิ์</p>
                </div>
            </div>
            <div class="col-md-3 single-team">
                <div class="thumb">
                    <img class="img-fluid" src="img/t4.jpg" alt="">
                    <div class="align-items-center justify-content-center d-flex">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="meta-text mt-30 text-center">
                    <h4>Adam Jones</h4>
                    <p>รองหัวหน้าเชฟระดับมิชลินสตาร์ 5 ดาว</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End team Area -->

<!-- start blog Area -->
<!--loop start here-->
<section class="blog-area section-gap" id="blog">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-70 col-lg-8">
                <div class="title text-center">
                    <h1 class="mb-10">ติดตามข้อมูลทางร้าน</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6 single-blog">
                <div class="thumb">
                    <img class="img-fluid" src="img/b1.jpg" alt="">
                </div>
                <p class="date">10 ม.ค. 2018</p>
                <a href="#"><h4>ร้านขอปรับราคาอาหารขึ้น</h4></a>
                <p>
                   เนื่องจากสภาพเศรษฐกิจไม่ค่อยสู้ดี เลยขอปรับราคาอาหารขึ้นนิดนึง
                </p>
                <div class="meta-bottom d-flex justify-content-between">
                    <p><span class="lnr lnr-heart"></span> 15 ถูกใจ</p>
                    <p><span class="lnr lnr-bubble"></span> 05 คอมเม้น</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 single-blog">
                <div class="thumb">
                    <img class="img-fluid" src="img/b2.jpg" alt="">
                </div>
                <p class="date">28 ต.ค. 2018</p>
                <a href="#"><h4>วันนี้วันเกิดเจ้าของร้าน กินฟรี</h4></a>
                <p>
                    วันนี้เจ้าของร้านเลี้ยง ไม่อั้น ๆ
                </p>
                <div class="meta-bottom d-flex justify-content-between">
                    <p><span class="lnr lnr-heart"></span> 115 ถูกใจ</p>
                    <p><span class="lnr lnr-bubble"></span> 25 คอมเม้น</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 single-blog">
                <div class="thumb">
                    <img class="img-fluid" src="img/b3.jpg" alt="">
                </div>
                <p class="date">31 ธ.ค. 2018</p>
                <a href="#"><h4>ส่งท้ายปี แจกฟรีอีกแล้ว</h4></a>
                <p>
                    เจ้าของร้านใจดี แจกฟรีอีกแล้ว กินฟรีทั้งร้าน
                </p>
                <div class="meta-bottom d-flex justify-content-between">
                    <p><span class="lnr lnr-heart"></span> 155 ถูกใจ</p>
                    <p><span class="lnr lnr-bubble"></span> 99 คอมเม้น</p>
                </div>
            </div>

    </div>
</section>
<!--loop end here-->
<!-- end blog Area -->

<!-- Start Contact Area -->
<section class="contact-area" id="contact">
    <div class="container-fluid">
        <div class="row align-items-center d-flex justify-content-start">
            <div class="col-lg-6 col-md-12 contact-left no-padding">
                <div style=" width:100%;
	                height: 545px;" id="map"></div>
            </div>
            <div class="col-lg-4 col-md-12 pt-100 pb-100">
                <form class="form-area" id="myForm" action="mail.php" method="post" class="contact-form text-right">
                    <input name="fname" placeholder="กรุณากรอกชื่อ นามสกุล" onfocus="this.placeholder = ''" onblur="this.placeholder = 'กรุณากรอกชื่อ นามสกุล'" class="common-input mt-10" required="" type="text">
                    <input name="email" placeholder="กรุณากรอกอีเมลล์ติดต่อกลับ" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'กรุณากรอกอีเมลล์ติดต่อกลับ'" class="common-input mt-10" required="" type="email">
                    <textarea class="common-textarea mt-10" name="message" placeholder="ข้อความ" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ข้อความ'" required=""></textarea>
                    <button class="primary-btn mt-20">ส่งข้อความถึงเรา<span class="lnr lnr-arrow-right"></span></button>
                    <div class="mt-10 alert-msg">
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- End Contact Area -->

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

<!--end index page-->