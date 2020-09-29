<%@ page import="java.sql.*"%>
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
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css" />
<link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/slicknav.css">
<link rel="stylesheet" type="text/css" href="assets/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/magnific-popup.css">
<link rel="stylesheet" type="text/css" href="assets/css/slick.css">
<!--<link rel="stylesheet" href="CSS/nice-select.css">-->
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
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
                    <img src="assets/img/logo/logo.png" alt="fait">
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
                                            <li class="hot"><a href="index.jsp">Inicio</a></li>
                                            <li><a href="#">Perfil</a>
                                            <ul class="submenu">
	                                            <li><a href="profile.jsp">Ver perfil</a></li>
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