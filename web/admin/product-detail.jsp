<%-- 
    Document   : product-detail
    Created on : Mar 3, 2025, 9:57:25 PM
    Author     : whyth
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Products, java.util.Vector" %>

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
        <!-- SLIDER -->
        <link href="css/tiny-slider.css" rel="stylesheet" />
        <link href="css/slick.css" rel="stylesheet" /> 
        <link href="css/slick-theme.css" rel="stylesheet" />
        <!-- Icons -->
        <!-- Font Awesome CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

        <style>
            .ms-md-4 {
                margin-top: -10px;
            }

            .action-icons {
                position: absolute;
                top: 10px;
                right: 10px;
                display: flex;
                gap: 8px; /* Khoảng cách giữa các icon */
            }

            .action-icons a {
                width: 30px;  /* Kích thước nhỏ hơn */
                height: 30px;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #396cf2; /* Màu nền */
                color: white;
                border-radius: 50%; /* Làm tròn */
                text-decoration: none;
                font-size: 14px; /* Giảm kích thước icon */
                transition: 0.3s;
            }

            .action-icons a:hover {
                background-color: #f64747; /* Màu nổi bật khi hover */
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
                        <!--                        <li><a href="index.jsp"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                                                <li><a href="appointment.html"><i class="uil uil-stethoscope me-2 d-inline-block"></i>Appointment</a></li>-->

                        <!--                        <li class="sidebar-dropdown">
                                                    <a href="javascript:void(0)"><i class="uil uil-user me-2 d-inline-block"></i>Doctors</a>
                                                    <div class="sidebar-submenu">
                                                        <ul>
                                                            <li><a href="doctors.html">Doctors</a></li>
                                                            <li><a href="add-doctor.html">Add Doctor</a></li>
                                                            <li><a href="dr-profile.html">Profile</a></li>
                                                        </ul>
                                                    </div>
                                                </li>
                        
                                                <li class="sidebar-dropdown">
                                                    <a href="javascript:void(0)"><i class="uil uil-wheelchair me-2 d-inline-block"></i>Patients</a>
                                                    <div class="sidebar-submenu">
                                                        <ul>
                                                            <li><a href="patients.html">All Patients</a></li>
                                                            <li><a href="add-patient.html">Add Patients</a></li>
                                                            <li><a href="patient-profile.html">Profile</a></li>
                                                        </ul>
                                                    </div>
                                                </li>
                        
                                                <li class="sidebar-dropdown">
                                                    <a href="javascript:void(0)"><i class="uil uil-apps me-2 d-inline-block"></i>Apps</a>
                                                    <div class="sidebar-submenu">
                                                        <ul>
                                                            <li><a href="chat.html">Chat</a></li>
                                                            <li><a href="email.html">Email</a></li>
                                                            <li><a href="calendar.html">Calendar</a></li>
                                                        </ul>
                                                    </div>
                                                </li>-->

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-shopping-cart me-2 d-inline-block"></i>Pharmacy</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="ProductManager" class="active">Product Manager</a></li>
                                    <!--                                    <li><a href="product-detail.html">Shop Detail</a></li>
                                                                        <li><a href="shopcart.html">Shopcart</a></li>
                                                                        <li><a href="checkout.html">Checkout</a></li>-->
                                </ul>
                            </div>
                        </li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-flip-h me-2 d-inline-block"></i>Blogs</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="blogs.html">Blogs</a></li>
                                    <li><a href="blog-detail.html">Blog Detail</a></li>
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
                                                </li>-->

                        <!--                        <li><a href="components.html"><i class="uil uil-cube me-2 d-inline-block"></i>Components</a></li>
                        
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
                            <h5 class="mb-0">Product Detail:</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="#">Pharmacy</a></li>
                                    <li class="breadcrumb-item"><a href="ProductManager">Product Manager</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Product Detail</li>
                                </ul>
                            </nav>
                        </div>

                        <div class="card border-0 rounded shadow p-4 mt-4">
                            <div class="action-icons">
                                <a href="#" id="edit-product-btn" class="edit-icon" data-bs-toggle="modal" data-bs-target="#edit-product">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="DeleteProduct?pid=${pDetail.productID}" class="delete-icon"
                                   onclick="return confirm('Are you sure you want to delete this product?');">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </div>

                            <div class="row align-items-center">
                                <div class="col-lg-4 col-md-5">
                                    <div class="slider slider-for">
                                        <div><img src="${pDetail.image}" class="img-fluid rounded" alt=""></div>
                                    </div>
                                </div><!--end col-->

                                <div class="col-lg-8 col-md-7 mt-0 pt-0">
                                    <div class="ms-md-4">
                                        <h6 class="brand">Brand:
                                            <a href="#">
                                                ${bDetail != null ? bDetail.brandName : "Unknown Brand"}
                                            </a>
                                        </h6>
                                        <h4 class="title">${pDetail.productName}</h4>
                                        <h5 class="text-muted">${pDetail.price}</h5>

                                        <div class="d-flex align-items-center">
                                            <h5 class="py-2 mb-0">Unit :</h5>
                                            <p class="text-muted mb-0 ms-2">${pDetail.unitPrice}</p>
                                        </div>

                                        <div class="d-flex align-items-center">
                                            <h5 class="py-2 mb-0">Quantity :</h5>
                                            <p class="text-muted mb-0 ms-2">${pDetail.quantity}</p>
                                        </div>

                                        <div class="d-flex align-items-center">
                                            <h5 class="py-2 mb-0">Category :</h5>
                                            <p class="text-muted mb-0 ms-2">
                                                <a href="#">${cDetail != null ? cDetail.categoryName : "Unknown Category"}</a>
                                            </p>
                                        </div>

                                        <div class="d-flex align-items-center">
                                            <h5 class="py-2 mb-0">Ingredient :</h5>
                                            <p class="text-muted mb-0 ms-2">
                                                <c:forEach var="i" items="${iList}">
                                                    ${i}<br/>
                                                </c:forEach>
                                            </p>
                                        </div>

                                        <div class="d-flex align-items-center">
                                            <h5 class="py-2 mb-0">Description :</h5>
                                            <p class="text-muted mb-0 ms-2">${pDetail.description}</p>
                                        </div>
                                    </div>
                                </div><!--end col-->
                            </div><!--end row-->
                        </div>

                        <div class="modal fade" id="edit-product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header border-bottom p-3">
                                        <h5 class="modal-title" id="editProduct">Edit Product</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                    <div class="modal-body p-3 pt-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="d-grid me-md-4">
                                                    <p class="text-muted">Upload your shop image here, Please click "Upload Image" Button.</p>

                                                    <div class="preview-box d-flex justify-content-center align-items-center rounded shadow overflow-hidden bg-light p-1"
                                                         style="width: 200px; height: 200px; margin-left: 70px;">
                                                        <img id="preview-img" src="" alt="Preview Image" class="img-fluid d-none">
                                                    </div>

                                                    <!-- Input file để chọn ảnh -->
                                                    <input type="file" id="image" name="image" accept="image/*" hidden>

                                                    <!-- Nút chọn ảnh -->
                                                    <label class="btn-upload btn btn-primary mt-4" for="image">Upload Image</label>
                                                </div>
                                            </div>

                                            <script>
                                                document.getElementById("image").addEventListener("change", function (event) {
                                                    const file = event.target.files[0];
                                                    if (file) {
                                                        const reader = new FileReader();
                                                        reader.onload = function (e) {
                                                            const imgElement = document.getElementById("preview-img");
                                                            imgElement.src = e.target.result;
                                                            imgElement.classList.remove("d-none");
                                                        };
                                                        reader.readAsDataURL(file);
                                                    }
                                                });
                                            </script>

                                            <div class="col-md-6 mt-4 mt-sm-0"> 
                                                <form action="AddProductController" method="post">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="mb-3">
                                                                <label class="form-label">Product Name: <span class="text-danger">*</span></label>
                                                                <input name="productName" id="productName" type="text" class="form-control" placeholder="Product Name" required>
                                                            </div>
                                                        </div><!--end col-->

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
                                                        </div><!--end col-->

                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Price:</label>
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text border bg-transparent">$</span>
                                                                    <input name="price" id="price" type="number" min="0" step="1000" class="form-control" placeholder="Price" required>
                                                                </div>
                                                            </div>
                                                        </div><!--end col-->

                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Quantity:</label>
                                                                <input name="quantity" id="quantity" type="number" min="0" step="1" class="form-control" placeholder="Quantity" required>
                                                            </div>
                                                        </div><!--end col-->

                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Unit:</label>
                                                                <input name="unitPrice" id="unitPrice" type="text" class="form-control" placeholder="Unit" required>
                                                            </div>
                                                        </div><!--end col-->

                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Ingredient</label>
                                                                <input name="ingredient" id="ingredient" type="text" class="form-control" placeholder="Ingredient" required>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label class="form-label">Description:</label>
                                                                <input name="description" id="description" type="text" class="form-control" placeholder="Description" required>
                                                            </div>
                                                        </div><!--end col-->

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
                                                        </div><!--end col-->
                                                    </div>
                                                </form>
                                            </div><!--end col-->
                                        </div><!--end row-->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-12">
                                <h5 class="mb-0">Related Products:</h5>
                            </div><!--end col-->
                        </div><!--end row-->

                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="slider-range-four">
                                    <div class="tiny-slide">
                                        <div class="card shop-list border-0 overflow-hidden rounded shadow m-1">
                                            <ul class="label list-unstyled mb-0">
                                                <li><a href="javascript:void(0)" class="badge badge-pill badge-success">Featured</a></li>
                                            </ul>
                                            <div class="shop-image position-relative overflow-hidden">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html"><img src="images/pharmacy/shop/thermometer.jpg" class="img-fluid" alt=""></a>
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
                                            <div class="card-body content pt-4 border-top">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html" class="text-dark product-name h6">Thermometer</a>
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
                                    </div><!--end col-->

                                    <div class="tiny-slide">
                                        <div class="card shop-list border-0 overflow-hidden rounded shadow m-1">
                                            <div class="shop-image position-relative overflow-hidden">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html"><img src="images/pharmacy/shop/stethoscope.jpg" class="img-fluid" alt=""></a>
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
                                            <div class="card-body content pt-4 border-top">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html" class="text-dark product-name h6">Stethoscope</a>
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
                                    </div><!--end col-->

                                    <div class="tiny-slide">
                                        <div class="card shop-list border-0 overflow-hidden rounded shadow m-1">
                                            <div class="shop-image position-relative overflow-hidden">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html"><img src="images/pharmacy/shop/pulse-oximeter.jpg" class="img-fluid" alt=""></a>
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
                                            <div class="card-body content pt-4 border-top">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html" class="text-dark product-name h6">Pulse oximeter</a>
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
                                    </div><!--end col-->

                                    <div class="tiny-slide">
                                        <div class="card shop-list border-0 overflow-hidden rounded shadow m-1">
                                            <div class="shop-image position-relative overflow-hidden">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html"><img src="images/pharmacy/shop/medicine.jpg" class="img-fluid" alt=""></a>
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
                                            <div class="card-body content pt-4 border-top">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html" class="text-dark product-name h6">Medicine pills</a>
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
                                    </div><!--end col-->

                                    <div class="tiny-slide">
                                        <div class="card shop-list border-0 overflow-hidden rounded shadow m-1">
                                            <div class="shop-image position-relative overflow-hidden">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html"><img src="images/pharmacy/shop/smoking-habit.jpg" class="img-fluid" alt=""></a>
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
                                            <div class="card-body content pt-4 border-top">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html" class="text-dark product-name h6">Smokill smoking habit</a>
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
                                    </div><!--end col-->

                                    <div class="tiny-slide">
                                        <div class="card shop-list border-0 overflow-hidden rounded shadow m-1">
                                            <div class="shop-image position-relative overflow-hidden">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html"><img src="images/pharmacy/shop/sanitizer.jpg" class="img-fluid" alt=""></a>
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
                                            <div class="card-body content pt-4 border-top">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html" class="text-dark product-name h6">Sanitizer</a>
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
                                    </div><!--end col-->

                                    <div class="tiny-slide">
                                        <div class="card shop-list border-0 overflow-hidden rounded shadow m-1">
                                            <div class="shop-image position-relative overflow-hidden">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html"><img src="images/pharmacy/shop/nicotex.jpg" class="img-fluid" alt=""></a>
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
                                            <div class="card-body content pt-4 border-top">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html" class="text-dark product-name h6">Nicotex</a>
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
                                    </div><!--end col-->

                                    <div class="tiny-slide">
                                        <div class="card shop-list border-0 overflow-hidden rounded shadow m-1">
                                            <div class="shop-image position-relative overflow-hidden">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html"><img src="images/pharmacy/shop/medigrip.jpg" class="img-fluid" alt=""></a>
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
                                            <div class="card-body content pt-4 border-top">
                                                <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html" class="text-dark product-name h6">Medigrip</a>
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
                                    </div>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div>
                </div><!--end container-->

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.jsp" target="_blank" class="text-reset">Shreethemes</a>.</p>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end container-->
                </footer><!--end footer-->
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

        <!-- javascript -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="js/simplebar.min.js"></script>
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


