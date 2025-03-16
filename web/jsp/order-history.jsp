<!DOCTYPE html>
<%@ page import=" entity.Account , entity.Customers,entity.OrderDetails,model.DAOProducts,model.DAOOrderDetails,java.util.Vector" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <title>Doctris - Order History</title>
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
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <style>
            /* Custom Styles for Order History */
            .section-title h3 {
                color: #007bff;
                font-weight: 600;
            }

            .status-bar {
                display: flex;
                gap: 20px;
                border-bottom: 1px solid #e9ecef;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            .status-bar a {
                text-decoration: none;
                color: #6c757d;
                font-weight: 500;
                font-size: 16px;
                padding-bottom: 5px;
                transition: color 0.3s ease;
            }

            .status-bar a:hover {
                color: #007bff;
            }

            .status-bar a[aria-current="page"] {
                color: #007bff;
                border-bottom: 2px solid #007bff;
                font-weight: 600;
            }

            .table-container {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
                padding: 20px;
            }

            .table thead th {
                background-color: #007bff;
                color: white;
                border: none;
            }

            .table tbody tr {
                transition: background-color 0.3s ease;
            }

            .table tbody tr:hover {
                background-color: #f8f9fa;
            }

            .product-info {
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .product-image {
                width: 50px;
                height: 50px;
                object-fit: cover;
                border-radius: 50%;
                border: 2px solid #007bff;
            }

            .badge {
                font-size: 12px;
                padding: 6px 12px;
                border-radius: 12px;
            }

            .order-actions .btn {
                font-size: 14px;
                padding: 6px 12px;
                transition: transform 0.2s ease;
            }

            .order-actions .btn:hover {
                transform: translateY(-2px);
            }

            .view-more {
                text-align: center;
                margin-top: 20px;
            }

            .view-more .btn {
                padding: 10px 30px;
                font-size: 16px;
                font-weight: 500;
                border-radius: 25px;
            }
        </style>
    </head>
    <%
       Vector<OrderDetails> vectorOrderDetail =  (Vector<OrderDetails>) request.getAttribute("dataOrderHistory");
      DAOProducts daoProduct = new DAOProducts();
      DAOOrderDetails daoOrderDetail = new DAOOrderDetails();
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

        <!-- Navbar Start -->
        <header id="topnav" class="defaultscroll sticky">
            <div class="container">
                <!-- Logo container -->
                <a class="logo" href="index.jsp">
                    <img src="images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                    <img src="images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                </a>
                <!-- Logo End -->

                <!-- Start Mobile Toggle -->
                <div class="menu-extras">
                    <div class="menu-item">
                        <!-- Mobile menu toggle -->
                        <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                        <!-- End mobile menu toggle -->
                    </div>
                </div>
                <!-- End Mobile Toggle -->

                <!-- Start Dropdown --><%
            Account account = (Account)session.getAttribute("dataUser");
                %>
                <ul class="dropdowns list-inline mb-0">

                    <li class="list-inline-item mb-0 ms-1">
                        <div class="dropdown dropdown-primary">


                            <%if(account != null){%>
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/products/z5341925245712_e4a232314bec6b8096527cf5ad9a3d92.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                                    <img src="images/products/z5341925245712_e4a232314bec6b8096527cf5ad9a3d92.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1"><%=account.getUserName()%></span>

                                    </div>
                                </a>
                                <a class="dropdown-item text-dark" href="OrderHistoryURL"><span class="mb-0 d-inline-block me-1"><i class="uil uil-receipt align-middle h6"></i></span>Đơn mua</a>
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
                    <!-- Navigation Menu -->
                    <ul class="navigation-menu nav-left nav-light">
                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)">Pharmacy</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="pharmacy.html" class="sub-menu-item">Pharmacy</a></li>
                                <li><a href="ProductURL?service=listAllProducts" class="sub-menu-item">Shop</a></li>
                                <li><a href="pharmacy-product-detail.html" class="sub-menu-item">Medicine Detail</a></li>
                                <li><a href="CartURL?service=showCart" class="sub-menu-item">Shop Cart</a></li>
                                <li><a href="CheckoutURL" class="sub-menu-item">Checkout</a></li>
                                <li><a href="pharmacy-account.html" class="sub-menu-item">Account</a></li>
                            </ul>
                        </li>
                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Pages</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="aboutus.jsp" class="sub-menu-item">About Us</a></li>
                                <li><a href="DepartmentURL?service=listAllDepartment" class="sub-menu-item">Departments</a></li>
                                <li><a href="faqs.html" class="sub-menu-item">FAQs</a></li>
                                <li><a href="blogs.html" class="sub-menu-item">Blogs</a></li>
                            </ul>
                        </li>
                    </ul><!--end navigation menu-->
                </div><!--end navigation-->
            </div><!--end container-->
        </header><!--end header-->
        <!-- Navbar End -->

        <!-- Hero Start -->
        <section class="bg-half-170 d-table w-100 bg-light">
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center">
                            <h3 class="sub-title mb-4">Lịch Sử Đơn Hàng</h3>
                            <p class="para-desc mx-auto text-muted">Xem lại lịch sử mua hàng của bạn và theo dõi trạng thái đơn hàng một cách dễ dàng.</p>
                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                                <ul class="breadcrumb bg-light rounded mb-0 bg-transparent">
                                    <li class="breadcrumb-item"><a href="index.jsp">Doctris</a></li>
                                    <li class="breadcrumb-item"><a href="pharmacy.html">Pharmacy</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Lịch Sử Đơn Hàng</li>
                                </ul>
                            </nav>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <div class="position-relative">
            <div class="shape overflow-hidden text-white">
                <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
                </svg>
            </div>
        </div>
        <!-- Hero End -->

        <!-- Start -->
        <section class="section">
            <div class="container">

                <form action="CartURL" method="POST">
                    <div class="row">
                        <div class="col-12">
                            <div class="table-container">
                                <nav class="status-bar">
                                    <a href="#" class="status" data-status="all" aria-current="page">Tất cả đơn hàng</a>
                                    <a href="#" class="status" data-status="pending">Đang chờ duyệt</a>
                                    <a href="#" class="status" data-status="shipping">Đang vận chuyển</a>
                                    <a href="#" class="status" data-status="completed">Đã hoàn thành</a>
                                </nav>
                                <table class="table table-hover table-striped mb-0">
                                    <thead>
                                        <tr>
                                            <th>Sản Phẩm</th>
                                            <th>Giá</th>
                                            <th>Số Lượng</th>
                                            <th>Tổng Cộng</th>
                                            <th>Trạng Thái</th>
                                            <th>Hành Động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        for (OrderDetails orderDetails : vectorOrderDetail) {
                    
                                        if(daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID()).equals("Hoàn thành")){
                                        %>
                                        <tr data-status="completed">
                                            <%} else if(daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID()).equals("Đang vận chuyển")){%>
                                        <tr data-status="shipping">
                                            <%} else if(daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID()).equals("Đang chuẩn bị hàng")){%>
                                        <tr data-status="pending">
                                            <%}%>
                                            <td>
                                                <div class="product-info">
                                                    <img src="images/products/<%=daoProduct.getProductImg(orderDetails.getProductID())%>" alt="Keo ngậm thơm miệng Keliquo" class="product-image">
                                                    <span><%=daoProduct.getProductByID(orderDetails.getProductID()).getProductName()%></span>
                                                </div>
                                            </td>
                                            <td>₫<%=orderDetails.getPrice()%></td>
                                            <td><%=orderDetails.getQuantity()%></td>
                                            <td>₫<%=orderDetails.getPrice() * orderDetails.getQuantity()%></td>
                                            <% if(daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID()).equals("Hoàn thành")){
                                            %>
                                            <td><span class="badge bg-success"><%=daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID())%></span></td>
                                                <%} else if(daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID()).equals("Đang vận chuyển")){%>
                                            <td><span class="badge bg-info"><%=daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID())%></span></td>
                                                <%} else if(daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID()).equals("Đang chuẩn bị hàng")){%>
                                            <td><span class="badge bg-warning"><%=daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID())%></span></td>
                                                <%}%>

                                            <td>
                                                <% if(daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID()).equals("Hoàn thành")){
                                                %>
                                                <div class="order-actions">
                                                    <button class="btn btn-danger btn-sm me-2">Đánh Giá</button>
                                                    <button class="btn btn-primary btn-sm">Mua Lại</button>
                                                </div>
                                                <%} else if(daoOrderDetail.getStatusOrder(orderDetails.getOrderDetailID()).equals("Đang chuẩn bị hàng")){%>
                                                <div class="order-actions">
                                                    <button class="btn btn-danger btn-sm">Hủy Đơn</button>
                                                </div>

                                                <%}%>

                                            </td>
                                        </tr>
                                        <%}%>
                                        <!--                                        
                                                                                <tr data-status="pending">
                                                                                    <td>
                                                                                        <div class="product-info">
                                                                                            <img src="https://via.placeholder.com/50" alt="Áo thun nam cao cấp" class="product-image">
                                                                                            <span>Áo thun nam cao cấp</span>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>₫150,000</td>
                                                                                    <td>2</td>
                                                                                    <td>₫300,000</td>
                                                                                    <td><span class="badge bg-warning">Đang chờ duyệt</span></td>
                                                                                    <td>
                                                                                        <div class="order-actions">
                                                    <button class="btn btn-danger btn-sm">Hủy Đơn</button>
                                                </div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr data-status="shipping">
                                                                                    <td>
                                                                                        <div class="product-info">
                                                                                            <img src="https://via.placeholder.com/50" alt="Tai nghe Bluetooth 5.0" class="product-image">
                                                                                            <span>Tai nghe Bluetooth 5.0</span>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>₫200,000</td>
                                                                                    <td>1</td>
                                                                                    <td>₫200,000</td>
                                                                                    <td><span class="badge bg-info">Đang vận chuyển</span></td>
                                                                                    <td>
                                                                                        <div class="order-actions">
                                                                                            <button class="btn btn-primary btn-sm">Theo Dõi</button>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>-->
                                    </tbody>
                                </table>
                                
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </form>
            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->

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
                                <p class="mb-0"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="https://shreethemes.in" target="_blank" class="text-reset">Shreethemes</a>.</p>
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
                                <h4>Search now...</h4>
                                <div class="subcribe-form mt-4">
                                    <form>
                                        <div class="mb-0">
                                            <input type="text" id="help" name="name" class="border bg-white rounded-pill" required="" placeholder="Search">
                                            <button type="submit" class="btn btn-pills btn-primary">Search</button>
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
                    <li class="list-inline-item mb-0"><a href="https://shreethemes.in" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
                </ul><!--end icon-->
            </div>
        </div>
        <!-- Offcanvas End -->

        <!-- JavaScript -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="js/app.js"></script>
        <!-- View more Js -->
        <script src="js/viewMore.js"></script>
        <!-- Custom JavaScript -->
        <script>
                                        document.addEventListener('DOMContentLoaded', () => {
                                            // Lọc đơn hàng theo trạng thái
                                            const statusLinks = document.querySelectorAll('.status');
                                            const rows = document.querySelectorAll('.table tbody tr');

                                            statusLinks.forEach(link => {
                                                link.addEventListener('click', (e) => {
                                                    e.preventDefault();
                                                    const selectedStatus = link.getAttribute('data-status');

                                                    // Xóa trạng thái active khỏi tất cả các tab
                                                    statusLinks.forEach(s => s.removeAttribute('aria-current'));
                                                    link.setAttribute('aria-current', 'page');

                                                    rows.forEach(row => {
                                                        const rowStatus = row.getAttribute('data-status');
                                                        if (selectedStatus === 'all' || rowStatus === selectedStatus) {
                                                            row.style.display = '';
                                                        } else {
                                                            row.style.display = 'none';
                                                        }
                                                    });
                                                });
                                            });

                                            // Thêm sự kiện cho các nút
                                            document.querySelectorAll('.btn-rate').forEach(button => {
                                                button.addEventListener('click', () => {
                                                    alert('Đánh giá đơn hàng!');
                                                });
                                            });

                                            document.querySelectorAll('.btn-buy').forEach(button => {
                                                button.addEventListener('click', () => {
                                                    alert('Mua lại sản phẩm!');
                                                });
                                            });

                                            document.querySelectorAll('.btn-cancel').forEach(button => {
                                                button.addEventListener('click', () => {
                                                    if (confirm('Bạn có chắc muốn hủy đơn hàng này?')) {
                                                        alert('Đơn hàng đã được hủy!');
                                                    }
                                                });
                                            });

                                            document.querySelectorAll('.btn-track').forEach(button => {
                                                button.addEventListener('click', () => {
                                                    alert('Theo dõi đơn hàng!');
                                                });
                                            });

                                            document.getElementById('viewMoreBtn').addEventListener('click', () => {
                                                alert('Tải thêm đơn hàng!');
                                            });
                                        });
        </script>
    </body>
</html>