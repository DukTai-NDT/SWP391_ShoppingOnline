<%-- 
    Document   : productManager
    Created on : Mar 3, 2025, 9:26:34 PM
    Author     : whyth
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Doctris - Doctor Appointment Booking System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.jsp" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

    </head>

    <body>
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <div class="page-wrapper doctris-theme toggled">
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <div class="sidebar-brand">
                        <a href="index.jsp">
                            <img src="images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                            <img src="images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                        </a>
                    </div>

                    <ul class="sidebar-menu pt-3">
                        <li><a href="Dashboard" class="active"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li><!--
                                                <li><a href="appointment.html"><i class="uil uil-stethoscope me-2 d-inline-block"></i>Appointment</a></li>-->

                        <li class="sidebar-dropdown">
                            <a href="AdminAccounts"><i class="uil uil-user me-2 d-inline-block"></i>Accounts</a>
                            <!--                                                    <div class="sidebar-submenu">
                                                                                    <ul>
                                                                                        <li><a href="AdminAccounts">All Accounts</a></li>
                                                                                        <li><a href="add-patient.html">Add Patients</a></li>
                                                                                        <li><a href="patient-profile.html">Profile</a></li>
                                                                                    </ul>
                                                                                </div>-->
                        </li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-capsule me-2 d-inline-block"></i>Products Manager</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="ProductManager">All Products</a></li>
                                    <li><a href="product-detail.html">Dermatological drugs</a></li>
                                    <li><a href="shopcart.html">Musculoskeletal</a></li>
                                    <li><a href="checkout.html">Supplements and vitamins</a></li>
                                    <li><a href="checkout.html">Cancer drugs</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-flip-h me-2 d-inline-block"></i>Blogs</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="admin">Blogs</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-file me-2 d-inline-block"></i>Pages</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="faqs.html">FAQs</a></li>
                                    <li><a href="review.html">Reviews</a></li>
                                    <li><a href="invoice-list.html">Invoice List</a></li>
                                    <li><a href="invoice.html">Invoice</a></li>
                                    <li><a href="terms.html">Terms & Policy</a></li>
                                    <li><a href="privacy.html">Privacy Policy</a></li>
                                    <li><a href="error.html">404 !</a></li>
                                    <li><a href="blank-page.html">Blank Page</a></li>
                                </ul>
                            </div>
                        </li>

                        <!--                        <li class="sidebar-dropdown">
                                                    <a href="javascript:void(0)"><i class="uil uil-sign-in-alt me-2 d-inline-block"></i>Authentication</a>
                                                    <div class="sidebar-submenu">
                                                        <ul>
                                                            <li><a href="jsp/login.jsp">Login</a></li>
                                                            <li><a href="jsp/signup.jsp">Signup</a></li>
                                                            <li><a href="forgot-password.html">Forgot Password</a></li>
                                                            <li><a href="jsp/login.jsp">Lock Screen</a></li>
                                                            <li><a href="thankyou.html">Thank you...!</a></li>
                                                        </ul>
                                                    </div>
                                                </li>
                        
                                                <li><a href="components.html"><i class="uil uil-cube me-2 d-inline-block"></i>Components</a></li>
                        
                                                <li><a href="../landing/index-two.html" target="_blank"><i class="uil uil-window me-2 d-inline-block"></i>Landing page</a></li>-->
                    </ul>
                    <!-- sidebar-menu  -->
                </div>
                <!-- sidebar-content  -->
                <ul class="sidebar-footer list-unstyled mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <a href="#" class="btn btn-icon btn-pills btn-soft-primary">
                            <i class="uil uil-comment icons"></i>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form role="search" method="get" id="searchform" class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search Keywords...">
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <ul class="list-unstyled mb-0">
                            <li class="list-inline-item mb-0">
                                <div class="dropdown dropdown-primary">
                                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/language/american.png" class="avatar avatar-ex-small rounded-circle p-2" alt=""></button>
                                    <div class="dropdown-menu dd-menu drop-ups dropdown-menu-end bg-white shadow border-0 mt-3 p-2" data-simplebar style="height: 175px;">
                                        <a href="javascript:void(0)" class="d-flex align-items-center">
                                            <img src="images/language/chinese.png" class="avatar avatar-client rounded-circle shadow" alt="">
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Chinese</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="images/language/european.png" class="avatar avatar-client rounded-circle shadow" alt="">
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">European</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="images/language/indian.png" class="avatar avatar-client rounded-circle shadow" alt="">
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Indian</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="images/language/japanese.png" class="avatar avatar-client rounded-circle shadow" alt="">
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Japanese</small>
                                            </div>
                                        </a>

                                        <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                            <img src="images/language/russian.png" class="avatar avatar-client rounded-circle shadow" alt="">
                                            <div class="flex-1 text-left ms-2 overflow-hidden">
                                                <small class="text-dark mb-0">Russian</small>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>

                            <li class="list-inline-item mb-0 ms-1">
                                <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                                    <div class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="settings" class="fea icon-sm"></i></div>
                                </a>
                            </li>

                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button type="button" class="btn btn-icon btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="mail" class="fea icon-sm"></i></button>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">4 <span class="visually-hidden">unread mail</span></span>

                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow rounded border-0 mt-3 px-2 py-2" data-simplebar style="height: 320px; width: 300px;">
                                        <a href="#" class="d-flex align-items-center justify-content-between py-2">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="images/client/02.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Janalia</b> <small class="text-muted fw-normal d-inline-block">1 hour ago</small></small>
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="images/client/Codepen.svg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>codepen</b>  <small class="text-muted fw-normal d-inline-block">4 hour ago</small></small>
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="images/client/03.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Cristina</b> <small class="text-muted fw-normal d-inline-block">5 hour ago</small></small>
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="images/client/dribbble.svg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Dribbble</b> <small class="text-muted fw-normal d-inline-block">24 hour ago</small></small>
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="images/client/06.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Donald Aghori</b> <small class="text-muted fw-normal d-inline-block">1 day ago</small></small>
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="images/client/07.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Calvin</b> <small class="text-muted fw-normal d-inline-block">2 day ago</small></small>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>

                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark" href="https://shreethemes.in/doctris/layouts/admin/profile.html">
                                            <img src="images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">Calvin Carlo</span>
                                                <small class="text-muted">Orthopedic</small>
                                            </div>
                                        </a>
                                        <a class="dropdown-item text-dark" href="index.jsp"><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a>
                                        <a class="dropdown-item text-dark" href="dr-profile.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="jsp/login.jsp"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <div>
                                <h5 class="mb-0">Doctris</h5>

                                <nav aria-label="breadcrumb" class="d-inline-block mt-1">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="#">Products Manager</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">All Products</li>
                                    </ul>
                                </nav>
                            </div>

                            <div class="mt-4 mt-sm-0">
                                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-product">Add Product</a>
                            </div>
                        </div>

                        <h6 class="mt-4 mb-0">Products</h6>

                        <div class="row row-cols-md-2 row-cols-lg-5">
                            <c:forEach var="p" items="${pList}">
                                <div class="col mt-4">
                                    <div class="card shop-list border-0 overflow-hidden rounded shadow">
                                        <div class="shop-image position-relative overflow-hidden">
                                            <a href="ProductManagerDetail?pid=${p.productID}">
                                                <img src="${p.image}" class="img-fluid" alt="${p.productName}">
                                            </a>
                                        </div>
                                        <div class="card-body content p-4 border-top">
                                            <div class="text-center">
                                                <a href="ProductManagerDetail?pid=${p.productID}" class="text-dark product-name h6">${p.productName}</a>
                                            </div>
                                            <div class="d-flex flex-column align-items-center mt-1">
<!--                                                <h6 class="text-muted small font-italic mb-1 mt-1">${p.price}</h6>-->
                                                <!--                                                <ul class="list-unstyled text-warning mb-0">
                                                                                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                                                </ul>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach><!--end col-->
                        </div><!--end col-->
                    </div><!--end row-->

                    <!--                    <h6 class="mt-4 mb-0">Categories</h6>-->

                    <!--                    <div class="row row-cols-md-2 row-cols-lg-5">
                                            <div class="col mt-4 pt-2">
                                                <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                                    <img src="images/pharmacy/skin.jpg" class="img-fluid" alt="">
                                                    <div class="category-title">
                                                        <span class="text-dark title-white"><span class="h5">Skin</span><br>Care</span>
                                                    </div>
                                                </a>
                                            </div>end col
                    
                                            <div class="col mt-4 pt-2">
                                                <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                                    <img src="images/pharmacy/sexual.jpg" class="img-fluid" alt="">
                                                    <div class="category-title">
                                                        <span class="text-dark title-white"><span class="h5">Sexual</span><br>Wallness</span>
                                                    </div>
                                                </a>
                                            </div>end col
                    
                                            <div class="col mt-4 pt-2">
                                                <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                                    <img src="images/pharmacy/weight.jpg" class="img-fluid" alt="">
                                                    <div class="category-title">
                                                        <span class="text-dark title-white"><span class="h5">Weight</span><br>Management</span>
                                                    </div>
                                                </a>
                                            </div>end col
                    
                                            <div class="col mt-4 pt-2">
                                                <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                                    <img src="images/pharmacy/pain.jpg" class="img-fluid" alt="">
                                                    <div class="category-title">
                                                        <span class="text-dark title-white"><span class="h5">Pain</span><br>Relief</span>
                                                    </div>
                                                </a>
                                            </div>end col
                    
                                            <div class="col mt-4 pt-2">
                                                <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                                    <img src="images/pharmacy/heart.jpg" class="img-fluid" alt="">
                                                    <div class="category-title">
                                                        <span class="text-dark title-white"><span class="h5">Heart</span><br>Health</span>
                                                    </div>
                                                </a>
                                            </div>end col
                    
                                            <div class="col mt-4 pt-2">
                                                <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                                    <img src="images/pharmacy/cough.jpg" class="img-fluid" alt="">
                                                    <div class="category-title">
                                                        <span class="text-dark title-white"><span class="h5">Cough</span><br> & Cold</span>
                                                    </div>
                                                </a>
                                            </div>end col
                    
                                            <div class="col mt-4 pt-2">
                                                <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                                    <img src="images/pharmacy/diabetes.jpg" class="img-fluid" alt="">
                                                    <div class="category-title">
                                                        <span class="text-dark title-white"><span class="h5">Diabetes</span><br>Care</span>
                                                    </div>
                                                </a>
                                            </div>end col
                    
                                            <div class="col mt-4 pt-2">
                                                <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                                    <img src="images/pharmacy/cancer.jpg" class="img-fluid" alt="">
                                                    <div class="category-title">
                                                        <span class="text-dark title-white"><span class="h5">Cancer</span><br>Care</span>
                                                    </div>
                                                </a>
                                            </div>end col
                                        </div>end row-->

                    <!--                    <h6 class="mt-4 mb-0">Popular Products</h6>-->

                    <!--                    <div class="row row-cols-md-2 row-cols-lg-5">                            
                                            <div class="col mt-4">
                                                <div class="card shop-list border-0 overflow-hidden rounded shadow">
                                                    <div class="shop-image position-relative overflow-hidden">
                                                        <a href="product-detail.html"><img src="images/pharmacy/shop/ashwagandha.jpg" class="img-fluid" alt=""></a>
                                                        <ul class="list-unstyled shop-icons">
                                                            <li><a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="eye" class="icons"></i></a></li>
                                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-warning"><i data-feather="shopping-cart" class="icons"></i></a></li>
                                                        </ul>                                
                    
                                                        <div class="qty-icons">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn btn-pills btn-icon btn-primary minus">-</button>
                                                            <input min="0" name="quantity" value="0" type="number" class="btn btn-pills btn-icon btn-primary qty-btn quantity">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn btn-pills btn-icon btn-primary plus">+</button>
                                                        </div>
                                                    </div>
                                                    <div class="card-body content p-4 border-top">
                                                        <a href="product-detail.html" class="text-dark product-name h6">Ashwagandha churna</a>
                                                        <div class="d-flex justify-content-between mt-1">
                                                            <h6 class="text-muted small font-italic mb-0 mt-1">$16.00 </h6>
                                                            <ul class="list-unstyled text-warning mb-0">
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>end col
                    
                                            <div class="col mt-4">
                                                <div class="card shop-list border-0 overflow-hidden rounded shadow">
                                                    <div class="shop-image position-relative overflow-hidden">
                                                        <a href="product-detail.html"><img src="images/pharmacy/shop/beby-products.jpg" class="img-fluid" alt=""></a>
                                                        <ul class="list-unstyled shop-icons">
                                                            <li><a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="eye" class="icons"></i></a></li>
                                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-warning"><i data-feather="shopping-cart" class="icons"></i></a></li>
                                                        </ul>                                
                    
                                                        <div class="qty-icons">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn btn-pills btn-icon btn-primary minus">-</button>
                                                            <input min="0" name="quantity" value="0" type="number" class="btn btn-pills btn-icon btn-primary qty-btn quantity">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn btn-pills btn-icon btn-primary plus">+</button>
                                                        </div>
                                                    </div>
                                                    <div class="card-body content p-4 border-top">
                                                        <a href="product-detail.html" class="text-dark product-name h6">Beby products</a>
                                                        <div class="d-flex justify-content-between mt-1">
                                                            <h6 class="text-muted small font-italic mb-0 mt-1">$16.00 </h6>
                                                            <ul class="list-unstyled text-warning mb-0">
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>end col
                    
                                            <div class="col mt-4">
                                                <div class="card shop-list border-0 overflow-hidden rounded shadow">
                                                    <div class="shop-image position-relative overflow-hidden">
                                                        <a href="product-detail.html"><img src="images/pharmacy/shop/kidney-tray.jpg" class="img-fluid" alt=""></a>
                                                        <ul class="list-unstyled shop-icons">
                                                            <li><a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="eye" class="icons"></i></a></li>
                                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-warning"><i data-feather="shopping-cart" class="icons"></i></a></li>
                                                        </ul>                                
                    
                                                        <div class="qty-icons">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn btn-pills btn-icon btn-primary minus">-</button>
                                                            <input min="0" name="quantity" value="0" type="number" class="btn btn-pills btn-icon btn-primary qty-btn quantity">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn btn-pills btn-icon btn-primary plus">+</button>
                                                        </div>
                                                    </div>
                                                    <div class="card-body content p-4 border-top">
                                                        <a href="product-detail.html" class="text-dark product-name h6">Kidney tray</a>
                                                        <div class="d-flex justify-content-between mt-1">
                                                            <h6 class="text-muted small font-italic mb-0 mt-1">$16.00 </h6>
                                                            <ul class="list-unstyled text-warning mb-0">
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>end col
                    
                                            <div class="col mt-4">
                                                <div class="card shop-list border-0 overflow-hidden rounded shadow">
                                                    <div class="shop-image position-relative overflow-hidden">
                                                        <a href="product-detail.html"><img src="images/pharmacy/shop/herbal-care.jpg" class="img-fluid" alt=""></a>
                                                        <ul class="list-unstyled shop-icons">
                                                            <li><a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="eye" class="icons"></i></a></li>
                                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-warning"><i data-feather="shopping-cart" class="icons"></i></a></li>
                                                        </ul>                                
                    
                                                        <div class="qty-icons">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn btn-pills btn-icon btn-primary minus">-</button>
                                                            <input min="0" name="quantity" value="0" type="number" class="btn btn-pills btn-icon btn-primary qty-btn quantity">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn btn-pills btn-icon btn-primary plus">+</button>
                                                        </div>
                                                    </div>
                                                    <div class="card-body content p-4 border-top">
                                                        <a href="product-detail.html" class="text-dark product-name h6">Herbal care product</a>
                                                        <div class="d-flex justify-content-between mt-1">
                                                            <h6 class="text-muted small font-italic mb-0 mt-1">$16.00 </h6>
                                                            <ul class="list-unstyled text-warning mb-0">
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>end col
                    
                                            <div class="col mt-4">
                                                <div class="card shop-list border-0 overflow-hidden rounded shadow">
                                                    <div class="shop-image position-relative overflow-hidden">
                                                        <a href="product-detail.html"><img src="images/pharmacy/shop/medical-equptment.jpg" class="img-fluid" alt=""></a>
                                                        <ul class="list-unstyled shop-icons">
                                                            <li><a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="eye" class="icons"></i></a></li>
                                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-warning"><i data-feather="shopping-cart" class="icons"></i></a></li>
                                                        </ul>                                
                    
                                                        <div class="qty-icons">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn btn-pills btn-icon btn-primary minus">-</button>
                                                            <input min="0" name="quantity" value="0" type="number" class="btn btn-pills btn-icon btn-primary qty-btn quantity">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn btn-pills btn-icon btn-primary plus">+</button>
                                                        </div>
                                                    </div>
                                                    <div class="card-body content p-4 border-top">
                                                        <a href="product-detail.html" class="text-dark product-name h6">Medical equptment</a>
                                                        <div class="d-flex justify-content-between mt-1">
                                                            <h6 class="text-muted small font-italic mb-1 mt-1 d-block">$16.00</h6>
                                                            <ul class="list-unstyled text-warning mb-0">
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                                <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>end col
                                        </div>end row-->
                </div>
        </div><!--end container-->

        <!-- Footer Start -->
        <!--        <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.jsp" target="_blank" class="text-reset">Shreethemes</a>.</p>
                                </div>
                            </div>end col
                        </div>end row
                    </div>end container
                </footer>end footer-->
        <!-- End -->
    </main>
    <!--End page-content" -->
</div>
<!-- page-wrapper -->

<!-- Offcanvas Start -->
<div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header p-4 border-bottom">
        <h5 id="offcanvasRightLabel" class="mb-0">
            <img src="images/logo-dark.png" height="24" class="light-version" alt="">
            <img src="images/logo-light.png" height="24" class="dark-version" alt="">
        </h5>
        <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
    </div>
    <div class="offcanvas-body p-4 px-md-5">
        <div class="row">
            <div class="col-12">
                <!-- Style switcher -->
                <div id="style-switcher">
                    <div>
                        <ul class="text-center list-unstyled mb-0">
                            <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="images/layouts/light-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="images/layouts/dark-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                            <li class="d-grid"><a href="../landing/index.jsp" target="_blank" class="mt-4"><img src="images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Landing Demos</span></a></li>
                        </ul>
                    </div>
                </div>
                <!-- end Style switcher -->
            </div><!--end col-->
        </div><!--end row-->
    </div>

    <div class="offcanvas-footer p-4 border-top text-center">
        <ul class="list-unstyled social-icon mb-0">
            <li class="list-inline-item mb-0"><a href="https://1.envato.market/doctris-template" target="_blank" class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://dribbble.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://www.facebook.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://www.instagram.com/shreethemes/" target="_blank" class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://twitter.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
            <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a></li>
            <li class="list-inline-item mb-0"><a href="../../../index.jsp" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
        </ul><!--end icon-->
    </div>
</div>
<!-- Offcanvas End -->

<!-- Start Modal -->
<div class="modal fade" id="add-product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="addProduct">Add Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-3 pt-4">
                <form action="AddProductController" method="post">
                    <div class="row">
                        <!-- Trường nhập ảnh -->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Image URL:</label>
                                <input type="text" name="image" id="image" class="form-control" placeholder="Enter image URL">
                            </div>
                            <div class="preview-box d-flex justify-content-center align-items-center rounded shadow overflow-hidden bg-light p-1"
                                 style="width: 200px; height: 200px; margin-left: 70px;">
                                <img id="preview-img" src="" alt="Preview Image" class="img-fluid d-none">
                            </div>
                        </div>

                        <!-- Các trường khác -->
                        <div class="col-md-6 mt-4 mt-sm-0">
                            <div class="row">
                                <div class="col-6">
                                    <div class="mb-3">
                                        <label class="form-label">Product Name: <span class="text-danger">*</span></label>
                                        <input name="productName" id="productName" type="text" class="form-control" placeholder="Product Name" required>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Price:</label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text border bg-transparent">$</span>
                                            <input name="price" id="price" type="number" min="0" step="1000" class="form-control" placeholder="Price" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Brand:</label>
                                        <select name="brandID" id="brandID" class="form-control">
                                            <c:forEach var="b" items="${bList}">
                                                <option value="${b.brandID}">${b.brandName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Category:</label>
                                        <select name="categoryID" id="categoryID" class="form-control">
                                            <c:forEach var="c" items="${cList}">
                                                <option value="${c.categoryID}">${c.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Unit:</label>
                                        <input name="unitPrice" id="unitPrice" type="text" class="form-control" placeholder="Unit" required>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Quantity:</label>
                                        <input name="quantity" id="quantity" type="number" min="0" step="1" class="form-control" placeholder="Quantity" required>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label">Description:</label>
                                        <input name="description" id="description" type="text" class="form-control" placeholder="Description" required>
                                    </div>
                                </div>

                                <!-- Checkbox isPrescriptionDrug -->
                                <div class="col-md-6">
                                    <div class="mb-3 form-check">
                                        <input name="isPrescriptionDrug" id="isPrescriptionDrug" type="checkbox" class="form-check-input" value="true">
                                        <label class="form-check-label" for="isPrescriptionDrug">Prescription Drug</label>
                                    </div>
                                </div>

                                <!-- Button Add -->
                                <div class="col-md-6 text-end">
                                    <button type="submit" class="btn btn-primary">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- Script hiển thị ảnh xem trước -->
                <script>
                    document.getElementById("image").addEventListener("input", function () {
                        const imgElement = document.getElementById("preview-img");
                        const imageUrl = this.value.trim();

                        if (imageUrl) {
                            imgElement.src = imageUrl;
                            imgElement.classList.remove("d-none");
                        } else {
                            imgElement.src = "";
                            imgElement.classList.add("d-none");
                        }
                    });
                </script>

            </div>
        </div>
    </div>
</div>
<!-- End modal -->

<!-- javascript -->
<script src="js/bootstrap.bundle.min.js"></script>
<!-- simplebar -->
<script src="js/simplebar.min.js"></script>
<!-- Icons -->
<script src="js/feather.min.js"></script>
<!-- Main Js -->
<script src="js/app.js"></script>

<script>
    const handleChange = () => {
        const fileUploader = document.querySelector('#input-file');
        const getFile = fileUploader.files
        if (getFile.length !== 0) {
            const uploadedFile = getFile[0];
            readFile(uploadedFile);
        }
    }

    const readFile = (uploadedFile) => {
        if (uploadedFile) {
            const reader = new FileReader();
            reader.onload = () => {
                const parent = document.querySelector('.preview-box');
                parent.innerHTML = `<img class="preview-content" src=${reader.result} />`;
            };

            reader.readAsDataURL(uploadedFile);
        }
    };
</script>
</body>

</html>


