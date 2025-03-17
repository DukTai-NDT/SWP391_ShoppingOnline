<%-- 
    Document   : displayProduct
    Created on : Feb 10, 2025, 9:35:21 PM
    Author     : quang
--%>
<%@ page import=" entity.Account " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="entity.Products, entity.Brand, java.util.Vector, entity.Categories" %>




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
        <meta name="website" content="https://shreethemes.in" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link rel="stylesheet" href="css/product-css.css">      
        <style>
            /* CSS cho giao diện danh sách sản phẩm */

            /* Đảm bảo body có khoảng cách để tránh navbar che phủ */
            body {
                padding: 0 !important; /* Đảm bảo không có padding-top mặc định ghi đè */
            }

            /* Đảm bảo container chính không bị navbar che phủ */
            .container {
                position: relative;
                z-index: 1;
                display: flex;
                gap: 30px;
                justify-content: space-evenly !important;
                max-width: 1200px;
                margin: 0 auto;
            }

            /* Navbar */
            #topnav.defaultscroll.sticky {
                position: sticky;
                top: 0;
                z-index: 1000 !important; /* Đảm bảo navbar ở trên các phần tử khác */
            }

            /* Sidebar bộ lọc */
            .sidebar {
                width: 250px;
                background-color: #fff;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                padding: 20px;
            }

            .sidebar h3 {
                font-size: 18px;
                font-weight: 600;
                color: #333;
                margin-bottom: 20px;
            }

            .filter-section {
                margin-bottom: 20px;
            }

            .filter-section h4 {
                font-size: 16px;
                font-weight: 600;
                color: #333;
                margin-bottom: 10px;
            }

            .price-filter a {
                display: block;
                font-size: 14px;
                color: #333;
                padding: 8px 0;
                text-decoration: none;
                border-bottom: 1px solid #e0e0e0;
            }

            .price-filter a:hover {
                color: #007bff;
            }



            /* Bộ lọc loại thuốc */
            .filter-section {
                margin-bottom: 20px;
                padding: 15px;
                background-color: #fff;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
            }

            .filter-section h4 {
                font-size: 16px;
                font-weight: 600;
                color: #333;
                margin-bottom: 10px;
            }

            .filter-section a {
                display: flex;
                align-items: center;
                gap: 10px;
                padding: 8px;
                border-radius: 5px;
                cursor: pointer;
                transition: background 0.3s;
            }

            .filter-section label:hover {
                background: #e6f7ff;
            }

            .filter-section input[type="radio"] {
                width: 16px;
                height: 16px;
                accent-color: #007bff; /* Màu xanh đồng bộ với giao diện */
                cursor: pointer;
            }

            .filter-section a {
                text-decoration: none;
                font-size: 14px;
                color: #333;
                font-weight: 500;
                transition: color 0.3s;
            }

            .filter-section a:hover {
                color: #007bff;
            }

            .filter-section select {
                width: 100%;
                padding: 10px;
                font-size: 14px;
                border: 1px solid #ddd;
                border-radius: 6px;
                background-color: #fff;
                cursor: pointer;
                transition: border-color 0.3s, box-shadow 0.3s;
            }

            .filter-section select:hover {
                border-color: #007bff;
            }

            .filter-section select:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            }


            /* Main content - Danh sách sản phẩm */
            .main-content {
                flex: 1;
                background-color: #fff;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                padding: 20px;
                position: relative;
                z-index: 1;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .header h2 {
                font-size: 20px;
                font-weight: 600;
                color: #333;
            }

            .sort-filter {
                display: flex;
                gap: 15px;
            }

            .sort-filter span a {
                font-size: 14px;
                color: #007bff;
                text-decoration: none;
            }

            .sort-filter span a:hover {
                text-decoration: underline;
            }

            /* Lưới sản phẩm */
            .product-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 20px;
            }

            .product-card {
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                padding: 15px;
                text-align: center;
                transition: box-shadow 0.3s ease;
            }

            .product-card:hover {
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            .product-card img {
                width: 100%;
                max-width: 150px;
                height: auto;
                margin-bottom: 10px;
            }

            .product-card h3 {
                font-size: 14px;
                font-weight: 600;
                color: #333;
                margin-bottom: 10px;
                height: 40px;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
            }

            .product-card .price {
                display: block;
                font-size: 16px;
                font-weight: 600;
                color: #e74c3c;
                margin-bottom: 15px;
            }

            .buttons {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .no-buy-btn button {
                padding: 8px 15px;
                font-size: 14px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .no-buy-btn button:hover {
                background-color: #0056b3;
            }

            .pack-btn {
                padding: 8px 15px;
                font-size: 14px;
                background-color: #fff;
                color: #333;
                border: 1px solid #ddd;
                border-radius: 5px;
                cursor: pointer;
            }

            .pack-btn:hover {
                background-color: #f5f5f5;
            }


        </style>
    </head>


    <%Vector<Products> vector = (Vector<Products>)request.getAttribute("vector");%>
    <%Vector<Brand> vectorB = (Vector<Brand>)request.getAttribute("vectorB");
    Account account = (Account)session.getAttribute("dataUser");
    Vector<Categories> vectorCat = (Vector<Categories>)request.getAttribute("vectorCat");
    %>
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

        <!-- Navbar STart -->
        <header id="topnav" class="defaultscroll sticky">
            <div class="container">
                <!-- Logo container-->
                <a class="logo" href="HomePageURL">
                    <img src="images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                    <img src="images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                </a>                
                <!-- Logo End -->

                <!-- Start Mobile Toggle -->
                <div class="menu-extras">
                    <div class="menu-item">
                        <!-- Mobile menu toggle-->
                        <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                        <!-- End mobile menu toggle-->
                    </div>
                </div>
                <!-- End Mobile Toggle -->

                <!-- Start Dropdown -->

                <!-- Start Dropdown -->

                <div id="navigation">
                    <!-- Navigation Menu-->   
                    <ul class="navigation-menu nav-left">              
                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)">Pharmacy</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="pharmacy.html" class="sub-menu-item">Pharmacy</a></li>
                                <li><a href="shop.jsp" class="sub-menu-item">Shop</a></li>
                                <li><a href="pharmacy-product-detail.html" class="sub-menu-item">Medicine Detail</a></li>
                                <li><a href="CartURL" class="sub-menu-item">Shop Cart</a></li>
                                <li><a href="CheckoutURL" class="sub-menu-item">Checkout</a></li>
                                <li><a href="pharmacy-account.html" class="sub-menu-item">Account</a></li>
                            </ul>
                        </li>

                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Categories</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <%for (Categories cat : vectorCat){%>
                                <li><a href="ProductURL?service=categories&cid=<%=cat.getCategoryID()%>" class="sub-menu-item"> <%=cat.getCategoryName()%></a></li>
                                <%}%>
                            </ul>
                        </li>
                        <li><a href="indexAdmin.jsp" class="sub-menu-item" target="_blank">Blog </a></li>
                        <li><a href="indexAdmin.jsp" class="sub-menu-item" target="_blank">Admin</a></li>
                    </ul><!--end navigation menu-->
                </div><!--end navigation-->
                <ul class="dropdowns list-inline mb-0">
                    <li class="list-inline-item mb-0">

                        <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                            <div class="btn btn-icon btn-pills btn-primary"><i data-feather="shopping-cart" class="fea icon-sm"></i></div>
                        </a>

                        
                        

                    </li>

                    <li class="list-inline-item mb-0 ms-1">
                        <a href="javascript:void(0)" class="btn btn-icon btn-pills btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                            <i class="uil uil-search"></i>
                        </a>
                    </li>

                    <li class="list-inline-item mb-0 ms-1">
                        <div class="dropdown dropdown-primary">


                            <%if(account != null){%>
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                                    <img src="" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1"><%=account.getUserName()%></span>

                                    </div>
                                </a>
                                <a class="dropdown-item text-dark" href="doctor-dashboard.jsp"><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a>
                                <a class="dropdown-item text-dark" href="doctor-profile-setting.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                <div class="dropdown-divider border-top"></div>
                                <a class="dropdown-item text-dark" href="LogOutURL"><span class="mb-0 d-inline-block me-1"><i class="uil ujsp/login.jspil-sign-out-alt align-middle h6"></i></span> Logout</a>
                            </div>        
                            <%}else{%>

                            <div class="auth-links">
                                <a href="SignUpURL?service=signup">Sign up</a>
                                <span>|</span>
                                <a href="LoginURL?service=login">Log in</a>
                            </div>
                            <%}%>

                        </div>
                    </li>
                </ul>
            </div><!--end container-->
        </header><!--end header-->
        <!-- Navbar End -->

        <!-- Hero Start -->
        <div class="container">
            <!-- Sidebar (Bộ lọc) -->
            <div class="sidebar">
                <h3>Bộ lọc</h3>

                <!-- Bộ lọc giá bán -->
                <div class="filter-section">
                    <h4>Giá bán</h4>
                    <div class="price-filter">
                        <a href="ProductURL?service=duoi100">Dưới 100.000đ</a>
                        <a href="ProductURL?service=duoi300">100.000đ đến 300.000đ</a>
                        <a href="ProductURL?service=duoi500">300.000đ đến 500.000đ</a>
                        <a href="ProductURL?service=tren500">Trên 500.000đ</a>
                    </div>
                </div>


                <!-- Bộ lọc loại thuốc -->
                <div class="filter-section">
                    <div class="drug">
                        <input type="radio" id="html" name="fav_language" value="HTML" checked="">
                        <label for="html"><a href="ProductURL?service=listAllProducts" >Tất cả</a></label><br>
                    </div>
                    <div class="drug">
                        <input type="radio" id="css" name="fav_language" value="CSS">
                        <label for="css"><a href="ProductURL?service=isDrug">Thuốc kê đơn</a></label><br>
                    </div >
                    <div class="drug">
                        <input type="radio" id="javascript" name="fav_language" value="JavaScript">
                        <label for="javascript"><a href="ProductURL?service=notIsDrug">Thuốc không kê đơn</a></label>
                    </div>
                </div>




                <!-- Bộ lọc nước sản xuất -->
                <div class="filter-section">
                    <h4>Nước sản xuất</h4>

                    <select name="BrandID">
                        <%for (Brand b : vectorB){%>
                        <option value="<%=b.getBrandID()%>" ><%=b.getCountry()%></option>
                        <%}%>
                    </select>
                </div>

            </div>

            <!-- Danh sách sản phẩm -->
            <div class="main-content">
                <div class="header">
                    <h2>Danh sách sản phẩm</h2>
                    <div class="sort-filter">

                        <span><a href="ProductURL">Bán chạy</a></span>
                        <span><a href="ProductURL?service=listAllProductsLowPrice">Giá thấp</a></span>
                        <span><a href="ProductURL?service=listAllProductsHighPrice">Giá cao</a></span>

                    </div>

                </div>

                <div class="product-grid">
                    <%for (Products pro : vector) {%>
                    <!-- Sản phẩm 1 -->
                    <div class="product-card">
                        <a href="ProductDetailURL?service=detailProduct&pid=<%=pro.getProductID()%>"><img src="https://via.placeholder.com/150" alt="Product 1"></a>
                        <h3><%=pro.getProductName()%></h3>
                        <p class="price"><%=pro.getPrice()%>/ Túyp</p>
                        <div class="buttons">

                            <a class="no-buy-btn" href="ProductDetailURL?service=detailProduct&pid=<%=pro.getProductID()%>"><button >Chọn mua </button></a>
                            <button class="pack-btn">Túyp</button>
                        </div>
                    </div>

                    <%}%>
                </div>
            </div>
        </div>

        <!-- Start -->
        <footer style="margin-top: 30px" class="bg-footer">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-4 mb-0 mb-md-4 pb-0 pb-md-2">
                        <a href="#" class="logo-footer">
                            <img src="images/logo-light.png" height="22" alt="">
                        </a>
                        <p class="mt-4 me-xl-5">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                    </div><!--end col-->

                    <div class="col-xl-7 col-lg-8 col-md-12">
                        <div class="row">
                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Company</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> About us</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Services</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Team</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Project</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Blog</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Login</a></li>
                                </ul>
                            </div><!--end col-->

                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Departments</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Eye Care</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Psychotherapy</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Dental Care</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Orthopedic</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Cardiology</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Gynecology</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Neurology</a></li>
                                </ul>
                            </div><!--end col-->

                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Contact us</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li class="d-flex align-items-center">
                                        <i data-feather="mail" class="fea icon-sm text-foot align-middle"></i>
                                        <a href="mailto:contact@example.com" class="text-foot ms-2">contact@example.com</a>
                                    </li>

                                    <li class="d-flex align-items-center">
                                        <i data-feather="phone" class="fea icon-sm text-foot align-middle"></i>
                                        <a href="tel:+152534-468-854" class="text-foot ms-2">+152 534-468-854</a>
                                    </li>

                                    <li class="d-flex align-items-center">
                                        <i data-feather="map-pin" class="fea icon-sm text-foot align-middle"></i>
                                        <a href="javascript:void(0)" class="video-play-icon text-foot ms-2">View on Google map</a>
                                    </li>
                                </ul>

                                <ul class="list-unstyled social-icon footer-social mb-0 mt-4">
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
                                </ul><!--end icon-->
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->

            <div class="container mt-5">
                <div class="pt-4 footer-bar">
                    <div class="row align-items-center">
                        <div class="col-sm-6">
                            <div class="text-sm-start text-center">
                                <p class="mb-0"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.html" target="_blank" class="text-reset">Shreethemes</a>.</p>
                            </div>
                        </div><!--end col-->

                        <div class="col-sm-6 mt-4 mt-sm-0">
                            <ul class="list-unstyled footer-list text-sm-end text-center mb-0">
                                <li class="list-inline-item"><a href="terms.html" class="text-foot me-2">Terms</a></li>
                                <li class="list-inline-item"><a href="privacy.html" class="text-foot me-2">Privacy</a></li>
                                <li class="list-inline-item"><a href="aboutus.html" class="text-foot me-2">About</a></li>
                                <li class="list-inline-item"><a href="contact.html" class="text-foot me-2">Contact</a></li>
                            </ul>
                        </div><!--end col-->
                    </div><!--end row-->
                </div>
            </div><!--end container-->
        </footer><!--end footer-->
        <!-- End -->

        <!-- Back to top -->
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
        <!-- Back to top -->

        <!-- Offcanvas Start -->
        <div class="offcanvas bg-white offcanvas-top" tabindex="-1" id="offcanvasTop">
            <div class="offcanvas-body d-flex align-items-center align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="text-center">
                                <h4>Search now.....</h4>
                                <div class="subcribe-form mt-4">
                                    <form action="ProductURL">
                                        <div class="mb-0">
                                            <input type="text" id="help" name="ProductName" class="border bg-white rounded-pill" required="" placeholder="Search">
                                            <button type="submit" name="submit" class="btn btn-pills btn-primary">Search</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </div>
        </div>
        <!-- Offcanvas End -->

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
                                    <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="images/layouts/landing-light-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="images/layouts/landing-dark-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                                    <li class="d-grid"><a href="../admin/index.html" target="_blank" class="mt-4"><img src="images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Admin Dashboard</span></a></li>
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
                    <li class="list-inline-item mb-0"><a href="../../../index.html" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
                </ul><!--end icon-->
            </div>
        </div>
        <!-- Offcanvas End -->

        <!-- javascript -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="js/app.js"></script>
    </body>

</html>
