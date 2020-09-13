<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hell2Pay</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css" />
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/slick.css">
<!--<link rel="stylesheet" href="CSS/nice-select.css">-->
<link rel="stylesheet" href="assets/css/style.css">
<!--<link href="CSS/header-footer.css" rel="stylesheet">-->
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@9/dist/sweetalert2.min.js"></script>
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/a7b3ea38a5.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Preloader -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- /Preloader -->
    
    <!-- Header -->
    <header>
       <div class="header-area">
            <div class="main-header ">
               <div class="header-bottom fixed-top">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            
                            <!-- Logo -->
                            <div class="col-xl-1 col-lg-1 col-md-1 col-sm-3">
                                <div class="logo">
                                  <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
                                
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>                                                
                                        <ul id="navigation">                                                                                                                                     
                                            <li class="hot"><a href="index.html">Inicio</a></li>
                                            <li><a href="#">Perfil</a>
                                            <ul class="submenu">
	                                            <li><a href="#">Ver perfil</a></li>
	                                            <li><a href="#">Salir</a></li>
                                        	</ul>
                                            </li>

                                        </ul>
                                    </nav>
                                </div>
                            </div> 
                            <div class="col-xl-5 col-lg-3 col-md-3 col-sm-3 fix-card">
                                <ul class="header-right f-right d-none d-lg-block d-flex justify-content-between">
                                    <!-- Search Bar -->
                                    <li class="d-none d-xl-block">
                                        <div class="form-box f-right ">
                                            <input type="text" name="Search" placeholder="Buscar">
                                            <div class="search-icon">
                                                <i class="fas fa-search special-tag"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- /Search Bar -->
                                    <li>
                                        <div class="favorit-items">
                                            <a href="#"><i class="fas fa-user"></i></a>
                                        </div>
                                    </li>
                                    <div class="main-menu f-right d-lg-block">
                                    <nav>                                                
                                        <ul>                                                                                                                                  
                                            <li>
                                            <div class="favorit-items"><i class="fas fa-bell"></i></div>
                                            <ul class="submenu" style="left: -100px;">
	                                            <li><a href="#"> Product list</a></li>
	                                            <li><a href="#"> Product Details</a></li>
                                        	</ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                </ul>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
    </header>
    <!-- /Header -->
    
    <!-- Wall -->
	<section id="wall">
	    <div class="card">
	      <div class="card-image"></div>
	      <div class="card-text">
	        <span class="date">4 days ago</span>
	        <h2>Post One</h2>
	        <p>Lorem ipsum dolor sit amet consectetur, Ducimus, repudiandae temporibus omnis illum maxime quod deserunt eligendi dolor</p>
	      </div>
	      <div class="card-stats">
	        <div class="stat">
	          <div class="value">4<sup>m</sup></div>
	          <div class="type">read</div>
	        </div>
	        <div class="stat border">
	          <div class="value">DONAR</div>
	        </div>
	        <div class="stat">
	          <div class="value">32</div>
	          <div class="type">comments</div>
	        </div>
	      </div>
	    </div>
	    <div class="card">
	      <div class="card-image card2"></div>
	      <div class="card-text card2">
	        <span class="date">1 week ago</span>
	        <h2>Post Two</h2>
	        <p>Adipisicing elit. Ducimus, repudiandae corrupti amet temporibus omnis provident illum maxime quod. Lorem ipsum dolor</p>
	      </div>
	      <div class="card-stats card2">
	        <div class="stat">
	          <div class="value">7<sup>m</sup></div>
	          <div class="type">read</div>
	        </div>
	        <div class="stat border">
	          <div class="value">DONAR</div>
	        </div>
	        <div class="stat">
	          <div class="value">21</div>
	          <div class="type">comments</div>
	        </div>
	      </div>
	    </div>
	    <div class="card">
        <div class="card-image card3"></div>
        <div class="card-text card3">
          <span class="date">3 week ago</span>
          <h2>Post Three</h2>
          <p>Repudiandae corrupti amet temporibus omnis provident illum maxime. Ducimus, lorem ipsum dolor adipisicing elit</p>
        </div>
        <div class="card-stats card3">
          <div class="stat">
            <div class="value">5<sup>m</sup></div>
            <div class="type">read</div>
          </div>
          <div class="stat border">
            <div class="value">DONAR</div>
          </div>
          <div class="stat">
            <div class="value">15</div>
            <div class="type">comments</div>
          </div>
        </div>
      </div>
    </section>
    <!-- /Wall -->
    
    <!-- Footer -->
    <footer id="footer" class="pb-4 pt-4 navbar-light">
        <div class="container navbar-nav">
            <div class="row text-center">
                <div class="col-12 col-lg"><a class="nav-link" href="#">Contáctanos</a></div>
                <div class="col-12 col-lg"><a class="nav-link disabled" href="#">Términos y condiciones</a></div>
                <div class="col-12 col-lg"><a class="nav-link disabled" href="#">Privacidad</a></div>
            </div>
        </div>
        <div class="row p-4 m-4">
            <copyright class="col-12 text-center">&copy; 2020 MadDog. All rights reserved.</copyright>
        </div>
    </footer>
    <!-- /Footer -->
</body>
<!-- Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
<script src="assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/slick.min.js"></script>

<!-- One Page, Animated-HeadLin -->
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/animated.headline.js"></script>

<!-- Scrollup, nice-select, sticky -->
<script src="assets/js/jquery.scrollUp.min.js"></script>
<script src="assets/js/jquery.nice-select.min.js"></script>
<script src="assets/js/jquery.sticky.js"></script>
    
<script src="assets/js/jquery.form.js"></script>
<script src="assets/js/jquery.validate.min.js"></script>
    
<!-- Jquery Plugins, main Jquery -->	
<script src="assets/js/plugins.js"></script>
<script src="assets/js/main.js"></script>
</html>