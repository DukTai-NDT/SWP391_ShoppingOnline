<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Products,entity.Brand, java.util.Vector, entity.Categories, entity.Function, entity.Ingredient" %>
<!DOCTYPE html>
<html lang="vi">
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
        <!-- SLIDER -->
        <link rel="stylesheet" href="css/tiny-slider.css"/>
        <link rel="stylesheet" href="css/slick.css"/> 
        <link rel="stylesheet" href="css/slick-theme.css"/>
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <style>
            /* CSS cho giao diện sản phẩm */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            .product-container {
                background-color: #fff;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                padding: 30px; /* Tăng padding để giao diện rộng rãi hơn */
                max-width: 1200px; /* Tăng chiều rộng tối đa */
                margin: 0 auto;
            }

            .product-content {
                display: flex;
                gap: 30px; /* Tăng khoảng cách giữa hình ảnh và thông tin */
            }

            .product-images {
                flex: 1;
            }

            .main-image img {
                width: 100%;
                max-width: 300px; /* Tăng kích thước hình ảnh chính */
                height: auto;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-bottom: 15px; /* Tăng khoảng cách dưới hình ảnh */
            }

            .thumbnail-gallery {
                display: flex;
                gap: 8px; /* Tăng khoảng cách giữa các hình thumbnail */
            }

            .thumbnail-gallery img {
                width: 85px; /* Tăng kích thước hình thumbnail */
                height: auto;
                border: 1px solid #ddd;
                border-radius: 5px;
                cursor: pointer;
            }

            .thumbnail-gallery img:hover {
                border-color: #007bff;
            }

            .product-info {
                flex: 2;
            }

            .product-header .brand {
                font-size: 16px; /* Tăng kích thước phông chữ */
                color: #666;
            }

            .product-header .brand span {
                color: #007bff;
            }

            .product-header h1 {
                font-size: 22px; /* Tăng kích thước tiêu đề */
                font-weight: 600;
                color: #333;
                margin: 15px 0; /* Tăng khoảng cách trên dưới */
                line-height: 1.4;
            }

            .rating {
                font-size: 16px; /* Tăng kích thước chữ đánh giá */
                color: #666;
                margin-bottom: 20px; /* Tăng khoảng cách dưới */
            }

            .rating .code {
                color: #333;
                font-weight: 600;
            }

            .rating .reviews {
                color: #007bff;
            }

            .price {
                display: flex;
                align-items: baseline;
                gap: 15px; /* Tăng khoảng cách giữa giá */
                margin-bottom: 20px; /* Tăng khoảng cách dưới */
            }

            .price .current-price {
                font-size: 34px; /* Tăng kích thước giá hiện tại */
                font-weight: 700;
                color: #e74c3c;
            }

            .price .unit {
                font-size: 18px; /* Tăng kích thước đơn vị */
                color: #333;
            }

            .price .original-price {
                font-size: 18px; /* Tăng kích thước giá gốc */
                color: #999;
                text-decoration: line-through;
            }

            .variant-buttons {
                display: flex;
                gap: 15px; /* Tăng khoảng cách giữa các nút */
                margin-bottom: 25px; /* Tăng khoảng cách dưới */
            }

            .select-option, .add-to-cart {
                padding: 10px 20px; /* Tăng padding để nút lớn hơn */
                font-size: 16px; /* Tăng kích thước chữ trong nút */
                border: 1px solid #ddd;
                border-radius: 5px;
                cursor: pointer;
            }

            .select-option {
                background-color: #fff;
                color: #333;
            }

            .add-to-cart {
                background-color: #007bff;
                color: #fff;
                border: none;
            }

            .product-details {
                font-size: 16px; /* Tăng kích thước chữ chi tiết sản phẩm */
                color: #333;
            }

            .product-details p {
                margin-bottom: 15px; /* Tăng khoảng cách giữa các dòng */
            }

            .product-details strong {
                color: #666;
                display: inline-block;
                min-width: 180px; /* Tăng chiều rộng tối thiểu của nhãn */
            }

            /* CSS cho các phần bổ sung */
            .additional-info-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 30px;
                background-color: #fff;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                margin-top: 30px;
            }

            .description-section, .additional-info-section, .reviews-section, .related-products-section {
                margin-bottom: 40px;
            }

            .description-section h2, .additional-info-section h2, .reviews-section h2, .related-products-section h2 {
                font-size: 24px;
                font-weight: 600;
                color: #333;
                margin-bottom: 20px;
            }

            .description-section p {
                font-size: 16px;
                color: #666;
                line-height: 1.6;
                margin-bottom: 15px;
            }

            .additional-info-section h3 {
                font-size: 18px;
                font-weight: 600;
                color: #333;
                margin-top: 20px;
                margin-bottom: 10px;
            }

            .additional-info-section ul {
                list-style-type: disc;
                margin-left: 20px;
                font-size: 16px;
                color: #666;
            }

            .additional-info-section ul li {
                margin-bottom: 10px;
            }

            .additional-info-section p {
                font-size: 16px;
                color: #666;
                line-height: 1.6;
            }

            .reviews-section .review {
                border-bottom: 1px solid #e0e0e0;
                padding: 20px 0;
            }

            .reviews-section .review-header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }

            .reviews-section .reviewer-name {
                font-size: 16px;
                font-weight: 600;
                color: #333;
            }

            .reviews-section .review-rating {
                font-size: 16px;
                color: #ffcc00;
            }

            .reviews-section .review-content {
                font-size: 16px;
                color: #666;
                margin-bottom: 10px;
            }

            .reviews-section .review-date {
                font-size: 14px;
                color: #999;
            }

            .reviews-section .load-more-reviews {
                display: block;
                margin: 20px auto;
                padding: 10px 20px;
                font-size: 16px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .reviews-section .load-more-reviews:hover {
                background-color: #0056b3;
            }

            .related-products-section .related-products {
                display: flex;
                gap: 20px;
            }

            .related-products-section .related-product {
                flex: 1;
                text-align: center;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                padding: 20px;
            }

            .related-products-section .related-product img {
                width: 100%;
                max-width: 150px;
                height: auto;
                margin-bottom: 15px;
            }

            .related-products-section .related-product h3 {
                font-size: 16px;
                font-weight: 600;
                color: #333;
                margin-bottom: 10px;
            }

            .related-products-section .related-product .price {
                font-size: 16px;
                font-weight: 600;
                color: #e74c3c;
                margin-bottom: 15px;
            }

            .related-products-section .related-product .add-to-cart {
                padding: 10px 20px;
                font-size: 14px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .related-products-section .related-product .add-to-cart:hover {
                background-color: #0056b3;
            }
            /* CSS cho phần đánh giá */
            .rating-summary {
                margin-bottom: 30px;
            }

            .rating-summary h3 {
                font-size: 20px;
                font-weight: 600;
                color: #333;
                margin-bottom: 15px;
            }

            .rating-overview {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 15px;
            }

            .rating-overview .average-rating {
                font-size: 36px;
                font-weight: 700;
                color: #333;
            }

            .rating-overview .stars {
                font-size: 24px;
                color: #ffcc00;
            }

            .rating-bars {
                margin-bottom: 20px;
            }

            .rating-bar {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 10px;
            }

            .rating-bar .stars {
                font-size: 16px;
                color: #ffcc00;
            }

            .rating-bar .bar {
                flex: 1;
                height: 8px;
                background-color: #e0e0e0;
                border-radius: 4px;
                overflow: hidden;
            }

            .rating-bar .filled {
                height: 100%;
                background-color: #ffcc00;
            }

            .rating-bar .count {
                font-size: 14px;
                color: #333;
            }

            .submit-review-btn {
                padding: 10px 20px;
                font-size: 16px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-bottom: 20px;
            }

            .submit-review-btn:hover {
                background-color: #0056b3;
            }

            .filter-buttons {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .filter-buttons h4 {
                font-size: 16px;
                font-weight: 600;
                color: #333;
            }

            .filter-buttons .filter-btn {
                padding: 5px 15px;
                font-size: 14px;
                background-color: #f5f5f5;
                border: 1px solid #ddd;
                border-radius: 20px;
                cursor: pointer;
            }

            .filter-buttons .filter-btn.active {
                background-color: #007bff;
                color: #fff;
                border-color: #007bff;
            }

            /* CSS cho form gửi đánh giá */
            .submit-review-form {
                margin-top: 30px;
                padding: 20px;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
            }

            .submit-review-form h3 {
                font-size: 20px;
                font-weight: 600;
                color: #333;
                margin-bottom: 20px;
            }

            .submit-review-form form {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .rating-input {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .rating-input label {
                font-size: 16px;
                color: #333;
            }

            .star-rating {
                display: flex;
                gap: 5px;
                direction: rtl; /* Để sao được chọn từ phải sang trái */
            }

            .star-rating input {
                display: none;
            }

            .star-rating label {
                font-size: 24px;
                color: #ddd;
                cursor: pointer;
            }

            .star-rating input:checked ~ label,
            .star-rating label:hover,
            .star-rating label:hover ~ label {
                color: #ffcc00;
            }

            .review-text {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .review-text label {
                font-size: 16px;
                color: #333;
            }

            .review-text textarea {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ddd;
                border-radius: 5px;
                resize: vertical;
            }

            .submit-review-form .submit-btn, .submit-review-form .cancel-btn {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .submit-review-form .submit-btn {
                background-color: #007bff;
                color: #fff;
            }

            .submit-review-form .submit-btn:hover {
                background-color: #0056b3;
            }

            .submit-review-form .cancel-btn {
                background-color: #f5f5f5;
                color: #333;
                margin-left: 10px;
            }

            .submit-review-form .cancel-btn:hover {
                background-color: #e0e0e0;
            }
        </style>
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

        <!-- Navbar Start -->
        <header id="topnav" class="defaultscroll sticky">
            <div class="container">
                <!-- Logo container-->
                <a class="logo" href="index.jsp">
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
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                                    <img src="images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1">Calvin Carlo</span>
                                        <small class="text-muted">Orthopedic</small>
                                    </div>
                                </a>
                                <a class="dropdown-item text-dark" href="doctor-dashboard.jsp"><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a>
                                <a class="dropdown-item text-dark" href="doctor-profile-setting.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                <div class="dropdown-divider border-top"></div>
                                <a class="dropdown-item text-dark" href="jsp/login.jsp"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
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
                                <li><a href="pharmacy-shop-cart.html" class="sub-menu-item">Shop Cart</a></li>
                                <li><a href="pharmacy-checkout.html" class="sub-menu-item">Checkout</a></li>
                                <li><a href="pharmacy-account.html" class="sub-menu-item">Account</a></li>
                            </ul>
                        </li>

                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Pages</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="aboutus.html" class="sub-menu-item"> About Us</a></li>
                                <li><a href="departments.html" class="sub-menu-item">Departments</a></li>
                                <li><a href="faqs.html" class="sub-menu-item">FAQs</a></li>
                                <li class="has-submenu parent-menu-item">
                                    <a href="javascript:void(0)" class="menu-item"> Blogs </a><span class="submenu-arrow"></span>
                                    <ul class="submenu">
                                        <li><a href="blogs.html" class="sub-menu-item">Blogs</a></li>
                                        <li><a href="blog-detail.html" class="sub-menu-item">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="terms.html" class="sub-menu-item">Terms & Policy</a></li>
                                <li><a href="privacy.html" class="sub-menu-item">Privacy Policy</a></li>
                                <li><a href="error.html" class="sub-menu-item">404 !</a></li>
                                <li><a href="contact.html" class="sub-menu-item">Contact</a></li>
                            </ul>
                        </li>
                        <li><a href="indexAdmin.jsp" class="sub-menu-item" target="_blank">Admin</a></li>
                    </ul><!--end navigation menu-->
                </div><!--end navigation-->
            </div><!--end container-->
        </header><!--end header-->
        <!-- Navbar End -->

        <!-- Hero Start -->
        <div class="position-relative">
            <div class="shape overflow-hidden text-white">
                <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
                </svg>
            </div>
        </div>
        <!-- Hero End -->

        <%Brand brand = (Brand)request.getAttribute("brand");%>
        <%Products product = (Products)request.getAttribute("product");%>
        <%Categories cat = (Categories)request.getAttribute("cat");%>
        <%Vector<Function> vectorf = (Vector<Function>)request.getAttribute("vectorf");%>
        <%Vector<Ingredient> vectorIngre = (Vector<Ingredient>)request.getAttribute("vectorIngre");%>
        <section class="section">
            <div class="product-container">
                <div class="product-content">
                    <!-- Phần hình ảnh -->
                    <div class="product-images">
                        <div class="main-image">
                            <img src="images/product-image.jpg" alt="Ultra Brain Lab Well">
                        </div>
                        <div class="thumbnail-gallery">
                            <img src="images/thumbnail1.jpg" alt="Thumbnail 1">
                            <img src="images/thumbnail2.jpg" alt="Thumbnail 2">
                            <img src="images/thumbnail3.jpg" alt="Thumbnail 3">
                        </div>
                    </div>

                    <!-- Phần thông tin -->
                    <div class="product-info">
                        <div class="product-header">
                            <div class="brand">Thương hiệu: <span><%=brand.getBrandName()%></span></div>
                            <h1><%=product.getProductName()%></h1>
                            <div class="rating">
                                <span class="code">00345415</span> • 
                                <span class="rating">4.8 ★</span> • 
                                <span class="reviews">43 đánh giá</span> • 
                                <span class="sold">359 bình luận</span>
                            </div>
                            <div class="price">
                                <span class="current-price"><%=product.getPrice()%></span>
                                <span class="unit">/ <%=product.getUnitPrice()%></span>
                            </div>
                            <div class="variant-buttons">
                                <button class="select-option">Shop More</button>
                                <button class="add-to-cart">Add to cart</button>
                            </div>
                        </div>

                        <div class="product-details">
                            <p><strong>Category: </strong> <a> <%=cat.getCategoryName()%></a></p>
                            <p><strong>Country: </strong> <%=brand.getCountry()%></p>
                            <p><strong>Ingredient: </strong> <%for (Ingredient ingre : vectorIngre){%><a> <%=ingre.getIngredientName()%> </a><%}%></p> 
                        </div>
                    </div>
                </div>
            </div>

            <!-- Phần bổ sung bên dưới -->
            <div class="additional-info-container">
                <!-- Mô tả sản phẩm -->
                <div class="description-section">
                    <h2>Mô tả sản phẩm</h2>
                    <p><%=product.getDescription()%></p>  
                </div>

                <!-- Thông tin bổ sung -->
                <div class="additional-info-section">
                    <h2>Thông tin bổ sung</h2>
                    <h3>Công dụng:</h3>
                    
                    <ul>
                        <%for(Function f : vectorf){%>
                        <li><%=f.getFunctionDescription()%></li>
                        <%}%>
                    </ul>
                    
                    <h3>Lưu ý:</h3>
                    <p>- Không sử dụng cho người dị ứng với cá hoặc các thành phần của sản phẩm.<br>
                        - Phụ nữ mang thai và cho con bú nên tham khảo ý kiến bác sĩ trước khi dùng.<br>
                        - Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.</p>
                </div>

                <!-- Đánh giá khách hàng -->
                <div class="reviews-section">
                    <h2>Đánh giá khách hàng</h2>
                    <div class="rating-summary">
                        <h3>Đánh giá sản phẩm (43 đánh giá)</h3>
                        <div class="rating-overview">
                            <span class="average-rating">4.8</span>
                            <span class="stars">★</span>
                        </div>
                        <div class="rating-bars">
                            <div class="rating-bar">
                                <span class="stars">★★★★★</span>
                                <div class="bar">
                                    <div class="filled" style="width: 93%"></div>
                                </div>
                                <span class="count">40</span>
                            </div>
                            <div class="rating-bar">
                                <span class="stars">★★★★</span>
                                <div class="bar">
                                    <div class="filled" style="width: 5%"></div>
                                </div>
                                <span class="count">1</span>
                            </div>
                            <div class="rating-bar">
                                <span class="stars">★★★</span>
                                <div class="bar">
                                    <div class="filled" style="width: 10%"></div>
                                </div>
                                <span class="count">2</span>
                            </div>
                            <div class="rating-bar">
                                <span class="stars">★★</span>
                                <div class="bar">
                                    <div class="filled" style="width: 0%"></div>
                                </div>
                                <span class="count">0</span>
                            </div>
                            <div class="rating-bar">
                                <span class="stars">★</span>
                                <div class="bar">
                                    <div class="filled" style="width: 0%"></div>
                                </div>
                                <span class="count">0</span>
                            </div>
                        </div>
                        <button class="submit-review-btn">Gửi đánh giá</button>
                        <div class="filter-buttons">
                            <h4>Lọc theo:</h4>
                            <button class="filter-btn active">5 sao</button>
                            <button class="filter-btn">4 sao</button>
                            <button class="filter-btn">3 sao</button>
                            <button class="filter-btn">2 sao</button>
                            <button class="filter-btn">1 sao</button>
                        </div>
                    </div>

                    <!-- Danh sách đánh giá -->
                    <div class="review">
                        <div class="review-header">
                            <span class="reviewer-name">Nguyễn Văn A</span>
                            <span class="review-rating">★★★★★ 5/5</span>
                        </div>
                        <p class="review-content">Sản phẩm rất tốt, tôi dùng được 1 tháng và cảm thấy đầu óc minh mẫn hơn, mắt cũng đỡ mỏi. Sẽ tiếp tục ủng hộ!</p>
                        <span class="review-date">Ngày 15/02/2025</span>
                    </div>
                    <div class="review">
                        <div class="review-header">
                            <span class="reviewer-name">Trần Thị B</span>
                            <span class="review-rating">★★★★☆ 4/5</span>
                        </div>
                        <p class="review-content">Hiệu quả khá tốt nhưng giá hơi cao so với thu nhập của tôi. Tuy nhiên, chất lượng thì không có gì để chê.</p>
                        <span class="review-date">Ngày 10/02/2025</span>
                    </div>
                    <button class="load-more-reviews">Xem thêm đánh giá</button>

                    <!-- Phần gửi đánh giá -->
                    <div class="submit-review-form" style="display: none;">
                        <h3>Gửi đánh giá của bạn</h3>
                        <form>
                            <div class="rating-input">
                                <label>Đánh giá của bạn:</label>
                                <div class="star-rating">
                                    <input type="radio" name="rating" value="5" id="star5"><label for="star5">★</label>
                                    <input type="radio" name="rating" value="4" id="star4"><label for="star4">★</label>
                                    <input type="radio" name="rating" value="3" id="star3"><label for="star3">★</label>
                                    <input type="radio" name="rating" value="2" id="star2"><label for="star2">★</label>
                                    <input type="radio" name="rating" value="1" id="star1"><label for="star1">★</label>
                                </div>
                            </div>
                            <div class="review-text">
                                <label for="review-content">Nội dung đánh giá:</label>
                                <textarea id="review-content" name="content" rows="5" placeholder="Viết đánh giá của bạn..." required></textarea>
                            </div>
                            <button type="submit" class="submit-btn">Gửi</button>
                            <button type="button" class="cancel-btn">Hủy</button>
                        </form>
                    </div>
                </div>

                <!-- Sản phẩm liên quan -->
                <div class="related-products-section">
                    <h2>Sản phẩm liên quan</h2>
                    <div class="related-products">
                        <div class="related-product">
                            <img src="images/related-product1.jpg" alt="Sản phẩm liên quan 1">
                            <h3>Viên uống Omega-3 Fish Oil</h3>
                            <p class="price">220.000đ</p>
                            <button class="add-to-cart">Thêm vào giỏ hàng</button>
                        </div>
                        <div class="related-product">
                            <img src="images/related-product2.jpg" alt="Sản phẩm liên quan 2">
                            <h3>Viên uống bổ mắt Bright Eyes</h3>
                            <p class="price">180.000đ</p>
                            <button class="add-to-cart">Thêm vào giỏ hàng</button>
                        </div>
                        <div class="related-product">
                            <img src="images/related-product3.jpg" alt="Sản phẩm liên quan 3">
                            <h3>Viên uống hỗ trợ tim mạch Cardio Plus</h3>
                            <p class="price">250.000đ</p>
                            <button class="add-to-cart">Thêm vào giỏ hàng</button>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--end section-->


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
                    <li class="list-inline-item mb-0"><a href="../../../index.jsp" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
                </ul><!--end icon-->
            </div>
        </div>
        <!-- Offcanvas End -->

        <!-- javascript -->
        <script>
            document.querySelector('.submit-review-btn').addEventListener('click', function () {
                document.querySelector('.submit-review-form').style.display = 'block';
                this.style.display = 'none'; // Ẩn nút "Gửi đánh giá" khi form hiện lên
            });

            document.querySelector('.cancel-btn').addEventListener('click', function () {
                document.querySelector('.submit-review-form').style.display = 'none';
                document.querySelector('.submit-review-btn').style.display = 'block'; // Hiển thị lại nút "Gửi đánh giá"
            });
        </script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- SLIDER -->
        <script src="js/tiny-slider.js"></script>
        <script src="js/tiny-slider-init.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/slick.init.js"></script>
        <!-- Icons -->
        <script src="js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="js/app.js"></script>
    </body>
</html>