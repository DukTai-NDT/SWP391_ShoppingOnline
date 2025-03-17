<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import=" entity.Account" %>
<%@page import="entity.Products,java.util.Vector, entity.Categories" %>
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
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link rel="stylesheet" href="css/tiny-slider.css"/>
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

        <style>
            .auth-links {

                padding: 10px 15px;
                text-align: center;
            }

            .auth-links a {
                color: white; /* Màu ch? tr?ng */
                opacity: 0.6; /* Gi?m ?? trong su?t */
                text-decoration: none;
                font-weight: bold;
                transition: opacity 0.3s ease-in-out;
            }

            .auth-links span {
                color: white;
                margin: 0 8px;
            }

            .auth-links a:hover {
                opacity: 1;
            }

            .swiper-pagination {
                position: relative !important;
                bottom: 0;
                margin-top: 15px; /* T?o kho?ng cách v?i slider */
            }

            /* Tùy ch?nh màu s?c và kích th??c pagination */
            .swiper-pagination-bullet {
                width: 10px;
                height: 10px;
                background: #007bff; /* Màu xanh d??ng */
                opacity: 0.6;
                transition: 0.3s;
            }

            .swiper-pagination-bullet-active {
                background: #0056b3; /* Màu xanh ??m khi active */
                opacity: 1;
            }
            /*
            /* Canh ch?nh nút ?i?u h??ng */
            .swiper-button-prev, .swiper-button-next {
                top: 50%;
                transform: translateY(-50%);
                width: 40px;
                height: 40px;
                background: rgba(0, 0, 0, 0.1);
                border-radius: 50%;
            }

            .swiper-button-prev::after, .swiper-button-next::after {
                font-size: 16px;
                color: #333;
            }

            /* C?n ch?nh pagination bên d??i */
            .swiper-pagination {
                margin-top: 20px;
                position: relative;
            }


            /**/
            /* T?o khung vi?n m?c ??nh cho s?n ph?m */
            .card {
                border: 2px solid #e0e0e0; /* Vi?n màu xám nh?t */
                border-radius: 10px; /* Bo tròn góc */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* ?? bóng nh? */
                transition: all 0.3s ease-in-out;
            }

            /* Hi?u ?ng khi di chu?t vào s?n ph?m */
            .card:hover {
                border-color: #007bff; /* Vi?n chuy?n sang màu xanh n??c bi?n */
                box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3); /* Hi?u ?ng ?? bóng màu xanh */
                transform: scale(1.05); /* Phóng to nh? */
            }


            .card1 {
                width: 220px; /* ?? r?ng c? ??nh */
                height: 450px; /* ?? cao c? ??nh ?? ??ng b? */
                border: 2px solid #e0e0e0; /* Vi?n màu xám nh?t */
                border-radius: 10px; /* Bo tròn góc */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* ?? bóng nh? */
                transition: all 0.3s ease-in-out;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-between;
                padding: 15px;
                text-align: center;
            }

            /* Khi di chu?t vào card, ??i vi?n sang màu xanh */
            .card1:hover {
                border-color: #007bff; /* Màu xanh n??c bi?n */
                box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3); /* ?? bóng xanh */
                transform: scale(1.05); /* Phóng to nh? */
            }

            /* ??m b?o ph?n n?i dung chính luôn ??y xu?ng d??i */
            .card-body1 {
                flex-grow: 1;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                align-items: center;
                width: 100%;
            }

            /* Ph?n ch?a nút Buy/Tuyp luôn ? d??i cùng */
            .buttons {
                margin-top: auto; /* ??y lên trên ?? luôn n?m ? d??i cùng */
                width: 100%;
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .buttons .btn {
                flex: 1; /* ?? nút ??u nhau */
                min-width: 80px;
            }


            .view-all {
                font-size: 16px;
                font-weight: bold;
                color: #6c757d; /* Màu xám */
                text-decoration: none;
                transition: color 0.3s ease-in-out;
                display: block;
                text-align: right; /* C?n ph?i */
                margin-right: 20px; /* T?o kho?ng cách v?i mép ph?i */
            }

            .view-all:hover {
                color: #000; /* Màu ??m h?n khi hover */
            }



        </style>
    </head>
    <%Vector<Categories> vcategories = (Vector<Categories>)session.getAttribute("vcategories");%>
    <%Vector<Products> vproduct = (Vector<Products>)session.getAttribute("vproduct");%>
    <% Vector<Products> vproductspecial= (Vector<Products>)session.getAttribute("vproductspecial");%>
    <%
        Account account = (Account)session.getAttribute("dataUser");
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
        <header id="topnav" class="navigation sticky">
            <div class="container">
                <!-- Logo container-->
                <div>
                    <a class="logo" href="index.jsp">
                        <span class="logo-light-mode">
                            <img src="images/logo-dark.png" class="l-dark" height="24" alt="">
                            <img src="images/logo-light.png" class="l-light" height="24" alt="">
                        </span>
                        <img src="images/logo-light.png" height="24" class="logo-dark-mode" alt=""style="color: black">
                    </a>
                </div>
                <!-- End Logo container-->

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
                <ul class="dropdowns list-inline mb-0">
                    <!--                                        <li class="list-inline-item mb-0">
                                                                <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                                                                    <div class="btn btn-icon btn-pills btn-primary"><i data-feather="shopping-cart" class="fea icon-sm"></i></div>
                                                                </a>
                                                            </li>-->

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
                <!-- Start Dropdown -->

                <div id="navigation">
                    <!-- Navigation Menu-->   
                    <ul class="navigation-menu nav-left nav-light">
                        <!--                        <li class="has-submenu parent-menu-item">
                                                    <a href="index.jsp">Home</a><span class="sub-menu-item"></span>
                        
                        
                                                </li>-->



                        <!--                        <li class="has-submenu parent-menu-item">
                                                    <a href="javascript:void(0)">Patients</a><span class="menu-arrow"></span>
                                                    <ul class="submenu">
                                                        <li><a href="patient-dashboard.html" class="sub-menu-item">Dashboard</a></li>
                                                        <li><a href="patient-profile.html" class="sub-menu-item">Profile</a></li>
                                                        <li><a href="booking-appointment.html" class="sub-menu-item">Book Appointment</a></li>
                                                        <li><a href="patient-invoice.html" class="sub-menu-item">Invoice</a></li>
                                                    </ul>
                                                </li>-->
                        <%if(account != null){%>
                        <li class="has-submenu parent-menu-item">
                            <a href="ProductURL?service=listAllProducts" class="sub-menu-item">Shop</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="pharmacy.html" class="sub-menu-item">Pharmacy</a></li>

                                <li><a href="ProductURL?service=listAllProducts" class="sub-menu-item">Shop</a></li>

                                <li><a href="pharmacy-product-detail.html" class="sub-menu-item">Medicine Detail</a></li>
                                <li><a href="CartURL?service=showCart" class="sub-menu-item">Shop Cart</a></li>
                                <li><a href="DeliveryAddressURL?service=first" class="sub-menu-item">Checkout</a></li>
                                <li><a href="CustomerURL" class="sub-menu-item">Account</a></li>
                            </ul>
                        </li>

                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Pages</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="aboutus.jsp" class="sub-menu-item"> About Us</a></li>
                                <li><a href="DepartmentURL?service=listAllDepartment" class="sub-menu-item">Departments</a></li>
                                <li><a href="faqs.html" class="sub-menu-item">FAQs</a></li>
                                <li><a href="BlogsURL" class="sub-menu-item">Blogs</a></li>


                            </ul>
                        </li>
                        <!--                           <li><a href="ProductManager" class="sub-menu-item">Manager</a></li>      -->
                        <%}else{%>

                        <li class="has-submenu parent-menu-item">
                            <a href="ProductURL?service=listAllProducts" class="sub-menu-item">Shop</a><span class="menu-arrow"></span>

                        </li>

                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Pages</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="aboutus.jsp" class="sub-menu-item"> About Us</a></li>
                                <li><a href="DepartmentURL?service=listAllDepartment" class="sub-menu-item">Departments</a></li>
                                <li><a href="faqs.html" class="sub-menu-item">FAQs</a></li>
                                <li><a href="blogs.html" class="sub-menu-item">Blogs</a></li>


                            </ul>
                        </li>

                        <%}%>

                        <!--                        <li><a href="indexAdmin.jsp" class="sub-menu-item" target="_blank">Admin</a></li>-->
                    </ul><!--end navigation menu-->
                </div><!--end navigation-->
            </div><!--end container-->
        </header><!--end header-->
        <!-- Navbar End -->

        <!-- Start Hero -->
        <section class="bg-half-260 d-table w-100" style="background: url('images/blog/pexels-artempodrez-4492065.jpg') center;">
            <div class="bg-overlay bg-overlay-dark"></div>
            <div class="container">
                <div class="row mt-5 mt-lg-0">
                    <div class="col-12">
                        <div class="heading-title">
                            <img src="images/logo-icon.png" height="50" alt="">
                            <h4 class="display-4 fw-bold text-white title-dark mt-3 mb-4">Online Medicine Selling</h4>
                            <h5 class="para-desc text-white-50 mb-0">Fast, Convenient, and Safe for Your Health!</h5>

                            <div class="mt-4 pt-2">
                                <a href="ProductURL" class="btn btn-primary">Shop Now</a>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End Hero -->

        <!-- Start -->
        <!--        <section class="section">
                    <div class="container mt-100 mt-60">
                        <div class="row justify-content-center">
                            <div class="col-12">
                                <div class="section-title mb-4 pb-2 text-center">
                                                                <span class="badge badge-pill badge-soft-primary mb-3">Departments</span>
                                    <h4 class="title mb-4">Categories</h4>
                                                                <p class="text-muted mx-auto para-desc mb-0">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                                </div>
                            </div>end col
                        </div>end row
        
                        <div class="row">
    </div>end row
</div>end container
</section>end section-->
        <section class="section">
            <div class="container mt-100 mt-60">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title mb-4 pb-2 text-center">
                            <h4 class="title mb-4">Categories</h4>
                        </div>
                    </div>
                </div>

                <!-- Swiper Container -->
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <%for (Categories c : vcategories){%>
                        <div class="swiper-slide">
                            <div class="card features feature-primary border-0">
                                <div class="icon text-center rounded-md">
                                    <img src="<%=c.getImage()%>" alt="Blog Image" style="width: 50px">
                                </div>
                                <div class="card-body p-0 mt-3">
                                    <a href="ProductURL?service=categories&cid=<%=c.getCategoryID()%>" class="title text-dark h5"><%=c.getCategoryName()%></a><br>
                                    <a href="departments.jsp" class="link">Shop Now <i class="ri-arrow-right-line align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </section>

        <!-- Swiper Initialization -->
        <script>
            var swiper = new Swiper(".mySwiper", {
                slidesPerView: 4,
                spaceBetween: 20,
                autoplay: {
                    delay: 3000, // Ch?y t? ??ng sau 3 giây
                    disableOnInteraction: false, // Không d?ng khi ng??i dùng t??ng tác
                },
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true, // Cho phép b?m vào pagination ?? chuy?n trang
                },
                breakpoints: {
                    1024: {slidesPerView: 4},
                    768: {slidesPerView: 2},
                    480: {slidesPerView: 1}
                }
            });

        </script>

        <!-- End -->

        <!-- Start -->
        <!--        <section class="section">
                    <div class="container mt-100 mt-60">
                        <div class="row justify-content-center">
                            <div class="col-12">
                                <div class="section-title mb-4 pb-2 text-center">
                                                                <span class="badge badge-pill badge-soft-primary mb-3">Departments</span>
                                    <h4 class="title mb-4">Products</h4>
                                    <p class="text-muted mx-auto para-desc mb-0">Quality Medicines, Trusted Care ? Your Health, Our Priority.</p>
                                </div>
                            </div>end col
                        </div>end row
        
                        <div class="row">
        <c:forEach items="${vproduct}" var="p">
            
            <div class="col-xl-3 col-md-4 col-12 mt-5">

                <div class="card features feature-primary border-0">


                    <img src="${p.image}" alt="Blog Image" style="max-width: 200px; height: auto;">

                    <div class="card-body p-0 mt-3">
                        <a href="departments.jsp" class="title text-dark h5">${p.productName}</a><br>
                                                            <p class="text-muted mt-3">There is now an abundance of readable dummy texts required purely to fill a space.</p>
                        <div class="buttons">

                            <a class="btn btn-primary" href="">Buy</a>

                            <button class="btn btn-primary">Tuyp</button>
                        </div>
                    </div>

                </div>

            </div>end col
        </c:forEach>
    </div>end row
    <div class="swiper-pagination"></div>
</div>end container
</section>end section-->
        <section class="section">
            <div class="container mt-100 mt-60">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title mb-4 pb-2 text-center">
                            <h4 class="title mb-4">Products</h4>
                            <p class="text-muted mx-auto para-desc mb-0">Quality Medicines, Trusted Care ? Your Health, Our Priority.</p>

                        </div>

                    </div>
                    <a href="ProductURL" class="view-all">View All Products --></a>
                </div>

                <!-- Swiper Container -->
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <%for (Products p : vproduct) {%>
                        <div class="swiper-slide">
                            <div class="card1 features feature-primary border-0">
                                <img src="<%=p.getImage()%>" alt="Product Image" style="max-width: 200px; height: auto;">
                                <div class="card-body1 p-0 mt-3 text-center">
                                    <a href="ProductDetailURL?service=detailProduct&pid=<%=p.getProductID()%>" class="title text-dark h5"><%=p.getProductName()%></a><br>
                                    <div class="buttons mt-2">
                                        <a class="btn btn-primary" href="ProductDetailURL?service=detailProduct&pid=<%=p.getProductID()%>">Buy</a>
                                        <button class="btn btn-primary">Tuyp</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>

                    <!-- Pagination (d?u ch?m) -->
                    <div class="swiper-pagination"></div>

                    <!-- Navigation Buttons -->
                    <!--                    <div class="swiper-button-prev"></div>
                                        <div class="swiper-button-next"></div>-->
                </div>
            </div>
        </section>

        <!-- End -->
        <script>
            var swiper = new Swiper(".mySwiper", {
                slidesPerView: 10, // Hi?n th? 4 s?n ph?m cùng lúc
                spaceBetween: 20,
                autoplay: {
                    delay: 3000, // T? ??ng ch?y sau 3 giây
                    disableOnInteraction: false, // Không d?ng khi ng??i dùng b?m vào
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
                breakpoints: {
                    1024: {slidesPerView: 4},
                    768: {slidesPerView: 2},
                    480: {slidesPerView: 1}
                }
            });


        </script>
        <!-- Start -->
        <section class="section">
            <div class="container mt-100 mt-60">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title mb-4 pb-2 text-center">
                            <!--                            <span class="badge badge-pill badge-soft-primary mb-3">Departments</span>-->
                            <h4 class="title mb-4">Best Selling Products</h4>
                            <p class="text-muted mx-auto para-desc mb-0">Quality Medicines, Trusted Care ? Your Health, Our Priority.</p>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <%for (Products p : vproductspecial) {%>
                    <div class="col-xl-3 col-md-4 col-12 mt-5">

                        <div class="card1 features feature-primary border-0">


                            <img src="<%=p.getImage()%>" alt="Blog Image" style="max-width: 200px; height: auto;">

                            <div class="card-body1 p-0 mt-3">
                                <a href="ProductDetailURL?service=detailProduct&pid=<%=p.getProductID()%>" class="title text-dark h5"><%=p.getProductName()%></a><br>
                                <!--                                    <p class="text-muted mt-3">There is now an abundance of readable dummy texts required purely to fill a space.</p>-->
                                <div class="buttons1">

                                    <a class="btn btn-primary" href="">Buy</a>

                                    <button class="btn btn-primary">Tuyp</button>
                                </div>
                            </div>

                        </div>

                    </div><!--end col-->
                    <%}%>
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->

        <!-- Start -->
        <!--        <section class="section pt-0">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-12 text-center">
                                <div class="video-solution-cta position-relative" style="z-index: 1;">
                                    <div class="position-relative">
                                        <img src="images/bg/01.jpg" class="img-fluid rounded-md shadow-lg" alt="">
                                        <div class="play-icon">
                                            <a href="#" data-bs-toggle="modal" data-bs-target="#watchvideomodal" class="play-btn video-play-icon">
                                                <i class="mdi mdi-play text-primary rounded-circle bg-white title-bg-dark shadow-lg"></i>
                                            </a>
                                        </div>
                                    </div>
        
                                    <div class="content">
                                        <div class="row" id="counter">
                                            <div class="col-md-4 mt-4 pt-2">
                                                <div class="counter-box text-center">
                                                    <h1 class="mt-3 text-white title-dark"><span class="counter-value" data-target="99">10</span>%</h1>
                                                    <h5 class="counter-head text-white title-dark mb-1">Positive feedback</h5>
                                                    <p class="text-white-50 mb-0">From Doctors</p>
                                                </div>end counter box
                                            </div>end col
        
                                            <div class="col-md-4 mt-4 pt-2">
                                                <div class="counter-box text-center">
                                                    <h1 class="mt-3 text-white title-dark"><span class="counter-value" data-target="25">2</span>+</h1>
                                                    <h5 class="counter-head text-white title-dark mb-1">Experienced Clinics</h5>
                                                    <p class="text-white-50 mb-0">High Qualified</p>
                                                </div>end counter box
                                            </div>end col
        
                                            <div class="col-md-4 mt-4 pt-2">
                                                <div class="counter-box text-center">
                                                    <h1 class="mt-3 text-white title-dark"><span class="counter-value" data-target="1251">95</span>+</h1>
                                                    <h5 class="counter-head text-white title-dark mb-1">Questions & Answers</h5>
                                                    <p class="text-white-50 mb-0">Your Questions</p>
                                                </div>end counter box
                                            </div>end col
                                        </div>end row
                                    </div>
                                </div>
                            </div>end col
                        </div>end row 
                        <div class="feature-posts-placeholder bg-primary"></div>
                    </div>end container
                </section>end section-->
        <!-- End -->

        <!-- Start -->
        <section class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center mb-4 pb-2">
                            <h4 class="title mb-4">Medical Blog</h4>
                            <h5 class="text-muted mx-auto para-desc mb-0">Health Knowledge, Sharing for the Community!</h5>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="container mt-100 mt-60">
                    <div class="row">
                        <div class="col-lg-12">
                            <!--                            <div class="section-title">
                                                            <h4 class="title mb-0">Related Post:</h4>
                                                        </div>-->
                        </div><!--end col-->
                    </div><!--end row-->

                    <div class="row">
                        <div class="col-lg-12 mt-4 pt-2">
                            <div class="slider-range-three">
                                <c:forEach items="${vblog}" var="b">
                                    <div class="tiny-slide">
                                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                            <img src="${b.image}" class="img-fluid" alt="">
                                            <div class="card-body p-4">
                                                <ul class="list-unstyled mb-2">
                                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>${b.postTime}</li>
                                                    <!--<li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>${b.blogID}</li>-->
                                                </ul>
<!--                                                <a href="AdminBlogsDetail?bid=${b.blogID}" class="text-dark title h5">${b.title}</a>-->
                                                <div class="post-meta d-flex justify-content-between mt-3">
                                                    <a href="AdminBlogsDetail?bid=${b.blogID}" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </div><!--end carousel-->
        </div><!--end col-->
    </div><!--end row-->
</div><!--end container-->
</section><!--end section-->
<!-- End -->

<!-- Partners start -->
<!--<section class="py-4 bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="images/client/amazon.png" class="avatar avatar-client" alt="">
            </div>end col

            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="images/client/google.png" class="avatar avatar-client" alt="">
            </div>end col

            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="images/client/lenovo.png" class="avatar avatar-client" alt="">
            </div>end col

            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="images/client/paypal.png" class="avatar avatar-client" alt="">
            </div>end col

            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="images/client/shopify.png" class="avatar avatar-client" alt="">
            </div>end col

            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="images/client/spotify.png" class="avatar avatar-client" alt="">
            </div>end col
        </div>end row
    </div>end container
</section>end section-->
<!-- Partners End -->

<!-- Start -->
<footer class="bg-footer">
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
                            <li><a href="aboutus.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> About us</a></li>
                            <li><a href="departments.jsp" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Services</a></li>
                            <li><a href="doctor-team-two.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Team</a></li>
                            <li><a href="blog-detail.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Project</a></li>
                            <li><a href="blogs.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Blog</a></li>
                            <li><a href="jsp/login.jsp" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Login</a></li>
                        </ul>
                    </div><!--end col-->

                    <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <h5 class="text-light title-dark footer-head">Departments</h5>
                        <ul class="list-unstyled footer-list mt-4">
                            <li><a href="departments.jsp" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Eye Care</a></li>
                            <li><a href="departments.jsp" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Psychotherapy</a></li>
                            <li><a href="departments.jsp" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Dental Care</a></li>
                            <li><a href="departments.jsp" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Orthopedic</a></li>
                            <li><a href="departments.jsp" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Cardiology</a></li>
                            <li><a href="departments.jsp" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Gynecology</a></li>
                            <li><a href="departments.jsp" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Neurology</a></li>
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
                        <p class="mb-0"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.jsp" target="_blank" class="text-reset">Shreethemes</a>.</p>
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
                                    <button type="submit" class="btn btn-pills btn-primary" name="submit">Search</button>
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
                            <li class="d-grid"><a href="indexAdmin.jsp" target="_blank" class="mt-4"><img src="images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Admin Dashboard</span></a></li>
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

<!-- MOdal Start -->
<div class="modal fade" id="watchvideomodal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content video-modal rounded overflow-hidden">
            <!-- <video class="w-100" controls autoplay muted loop>
                <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
            </video> -->
            <!--Browser does not support <video> tag -->
            <!--If you want to use your own video please set your files path-->

            <!-- <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/jNTZpfXYJa4?rel=0" title="YouTube video" allowfullscreen></iframe>
                </div> -->
            <!--If you want to use the youtube link please try the above code-->

            <div class="ratio ratio-16x9">
                <iframe src="https://player.vimeo.com/video/99025203" title="Vimeo video" allowfullscreen></iframe>
            </div>
            <!--If you want to use the Vimeo link please try the above code-->
        </div>
    </div>
</div>
<!-- MOdal End -->

<!-- javascript -->
<script src="js/bootstrap.bundle.min.js"></script>
<!-- SLIDER -->
<script src="js/tiny-slider.js"></script>
<script src="js/tiny-slider-init.js"></script>
<!-- Counter -->
<script src="js/counter.init.js"></script>
<!-- Icons -->
<script src="js/feather.min.js"></script>
<!-- Main Js -->
<script src="js/app.js"></script>
</body>
</html>

