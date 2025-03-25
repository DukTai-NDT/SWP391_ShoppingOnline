<%-- 
    Document   : product-detail
    Created on : Mar 3, 2025, 9:57:25 PM
    Author     : whyth
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Products, java.util.Vector" %>
<%@page import="entity.Products,java.util.Vector, entity.Categories, entity.CartItems, entity.Customers,entity.Account" %>

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
                gap: 10px; /* Tăng khoảng cách để dễ click hơn */
            }

            .action-icons a {
                width: 36px;  /* Tăng kích thước vùng click */
                height: 36px;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #396cf2; /* Màu nền */
                color: white;
                border-radius: 50%; /* Bo tròn */
                text-decoration: none;
                font-size: 16px; /* Tăng kích thước icon */
                transition: background 0.3s ease, transform 0.2s ease;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Thêm bóng nhẹ */
            }

            .action-icons a:hover {
                background-color: #f64747; /* Đổi màu khi hover */
                transform: scale(1.1); /* Hiệu ứng phóng to nhẹ */
            }

            .action-icons i {
                pointer-events: none; /* Đảm bảo click vào được icon */
            }

            .ms-md-4 {
                max-width: 70%;  /* Giới hạn độ rộng, có thể chỉnh % hoặc px */
                overflow: hidden; /* Tránh tràn nội dung */
                white-space: normal; /* Đảm bảo chữ xuống dòng khi cần */
            }

        </style>
    </head>
    <%
        Account account = (Account) session.getAttribute("dataUser");
        Customers currentCustomer = (Customers) session.getAttribute("dataCustomer");


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

        <div class="page-wrapper doctris-theme toggled">
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <div class="sidebar-brand">
                        <a href="Dashboard">
                            <!--<a href="index.jsp">-->
                            <img src="images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                            <img src="images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                        </a>
                    </div>

                    <ul class="sidebar-menu pt-3">
                        <li class="sidebar-dropdown">
                            <a href="Dashboard"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a>
                        </li>
                        <br>

                        <%   if (account.getRoleID() != 4) {
                                if (account.getRoleID() == 3) {%>
                        <li class="sidebar-dropdown">
                            <a href="AdminAccounts"><i class="uil uil-user me-2 d-inline-block"></i>Accounts Management</a>
                        </li>
                        <%}%>
                        <br>

                        <li class="sidebar-dropdown">
                            <a href="ProductManager"><i class="uil uil-capsule me-2 d-inline-block"></i>Products Management</a>
                        </li>
                        <br>

                        <li class="sidebar-dropdown">

                            <a href="AdminCategories"><i class="uil uil-flip-h me-2 d-inline-block"></i>Categories Management</a>
                        </li>
                        <br>

                        <li class="sidebar-dropdown">
                            <a href="AdminBrands">
                                <i class="uil uil-store me-2 d-inline-block"></i> Brand Management
                            </a>
                        </li>
                        <br>

                        <li class="sidebar-dropdown">
                            <a href="BlogManagement"><i class="uil uil-flip-h me-2 d-inline-block"></i>Blogs Management</a>
                        </li>
                        <br>

                        <li class="sidebar-dropdown">
                            <a href="OrderManager"><i class="uil uil-file me-2 d-inline-block"></i>Orders Management</a>
                        </li>
                        <%} else {%>

                        <li class="sidebar-dropdown">
                            <a href="AdminRepInboxURL?service=show"><i class="uil uil-comment me-2 d-inline-block"></i>Reply Customer</a>
                        </li>
                        <%}%>
                    </ul>
                    <!-- sidebar-menu  -->
                </div>
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
                            <div class="search-bar p-0 d-none d-md-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <!--                                    <form role="search" method="get" id="searchform" class="searchform">
                                                                            <div>
                                                                                <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search Keywords...">
                                                                                <input type="submit" id="searchsubmit" value="Search">
                                                                            </div>
                                                                        </form>-->
                                </div>
                            </div>
                        </div>

                        <ul class="list-unstyled mb-0">


                            <%
                                if (currentCustomer != null) {
                            %>

                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">

                                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <img src="<%= (currentCustomer.getProfileImg() != null && !currentCustomer.getProfileImg().isEmpty()) ? currentCustomer.getProfileImg() : "${pageContext.request.contextPath}/images/client/09.jpg"%>" class="avatar avatar-ex-small rounded-circle" alt="Profile">
                                    </button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                                            <img src="<%= (currentCustomer.getProfileImg() != null && !currentCustomer.getProfileImg().isEmpty()) ? currentCustomer.getProfileImg() : "${pageContext.request.contextPath}/images/client/09.jpg"%>" class="avatar avatar-md-sm rounded-circle border shadow" alt="Profile">

                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1"><%= currentCustomer.getFirstName() + " " + currentCustomer.getLastName()%></span>
                                            </div>
                                        </a>

                                        <a class="dropdown-item text-dark" href="CustomerURL"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="LogOutURL"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>

                                    </div>
                                </div>
                            </li>
                            <%} else {%>
                            <div class="auth-links">
                                <a href="SignUpURL?service=signup">Sign up</a>
                                <span>|</span>
                                <a href="LoginURL?service=login">Log in</a>
                            </div>
                            <%}%>
                        </ul>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Product Detail:</h5>
                        </div>

                        <div class="card border-0 rounded shadow p-4 mt-4">
                            <div class="action-icons">
                                <a href="LoadDetail?pid=${pDetail.productID}" id="edit-product-btn" class="edit-icon" data-bs-toggle="modal" data-bs-target="#edit-product">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="DeleteProduct?pid=${pDetail.productID}" class="setting-icon"
                                   onclick="return confirm('Are you sure you want to change status this product?');">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </div>

                            <div class="row align-items-center">
                                <div class="col-lg-4 col-md-5">
                                    <div class="slider slider-for">
                                        <div><img src="images/products/${pDetail.image}" class="img-fluid rounded" alt=""></div>
                                    </div>
                                </div><!--end col-->

                                <div class="col-lg-7 col-md-6 mt-0 pt-0">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Brand</th>
                                            <td><a href="#">${bDetail != null ? bDetail.brandName : "Unknown Brand"}</a></td>
                                        </tr>
                                        <tr>
                                            <th>Product Name</th>
                                            <td>${pDetail.productName}</td>
                                        </tr>
                                        <tr>
                                            <th>Price</th>
                                            <td>${pDetail.price}</td>
                                        </tr>
                                        <tr>
                                            <th>Unit</th>
                                            <td>${pDetail.unitPrice}</td>
                                        </tr>
                                        <tr>
                                            <th>Quantity</th>
                                            <td>${pDetail.quantity}</td>
                                        </tr>
                                        <tr>
                                            <th>Category</th>
                                            <td><a href="#">${cDetail != null ? cDetail.categoryName : "Unknown Category"}</a></td>
                                        </tr>
                                        <tr>
                                            <th>Description</th>
                                            <td>${pDetail.description}</td>
                                        </tr>
                                        <tr>
                                            <th>Status</th>
                                            <td>${pDetail.isAvailable ? "In Stock" : "Out of Stock"}</td>
                                        </tr>
                                    </table>
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
                                        <form action="EditProduct" method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <!-- Trường nhập ảnh -->
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label">Image URL:</label>
                                                        <input  type="file" name="image" id="image" class="form-control" value="${pDetail.image} placeholder=" image file">
                                                    </div>
                                                    <div class="preview-box d-flex justify-content-center align-items-center rounded shadow overflow-hidden bg-light p-1"
                                                         style="width: 200px; height: 200px; margin-left: 70px;">
                                                        <img id="preview-img" src="" alt="Preview Image" class="img-fluid d-none">
                                                    </div>
                                                </div>

                                                <div class="col-md-6 mt-4 mt-sm-0">                                     
                                                    <div class="row">
                                                        <div class="col-6" style="display: none;">
                                                            <div class="mb-3">
                                                                <label class="form-label">ID: <span class="text-danger">*</span></label>
                                                                <input value="${pDetail.productID}" name="loadProductID" id="loadProductID" type="text" class="form-control" readonly placeholder="Product Name" required>
                                                            </div>
                                                        </div>

                                                        <div class="col-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Product Name: <span class="text-danger">*</span></label>
                                                                <input value="${pDetail.productName}" name="loadProductName" id="loadProductName" type="text" class="form-control" placeholder="Product Name" required>
                                                            </div>
                                                        </div><!--end col-->

                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Price:</label>
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text border bg-transparent">$</span>
                                                                    <input value="${pDetail.price}" name="loadPrice" id="loadPrice" type="number" min="0" step="1000" class="form-control" placeholder="Price" required>
                                                                </div>
                                                            </div>
                                                        </div><!--end col-->

                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Brand:</label>
                                                                <select name="loadBrandID" id="loadBrandID" class="form-control">
                                                                    <c:forEach var="b" items="${bLoadDetail}">
                                                                        <option value="${b.brandID}" ${b.brandID == pDetail.brandID ? 'selected' : ''}>
                                                                            ${b.brandName}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Category:</label>
                                                                <select name="loadCategoryID" id="loadCategoryID" class="form-control">
                                                                    <c:forEach var="c" items="${cLoadDetail}">
                                                                        <option value="${c.categoryID}" ${c.categoryID == pDetail.categoryID ? 'selected' : ''}>
                                                                            ${c.categoryName}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Unit:</label>
                                                                <input value="${pDetail.unitPrice}" name="loadUnitPrice" id="loadUnitPrice" type="text" class="form-control" placeholder="Unit" required>

                                                            </div>
                                                        </div><!--end col-->

                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Quantity:</label>
                                                                <input value="${pDetail.quantity}" name="loadQuantity" id="loadQuantity" type="number" min="0" step="1" class="form-control" placeholder="Quantity" required>
                                                            </div>
                                                        </div><!--end col-->

                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label class="form-label">Description:</label>
                                                                <input value="${pDetail.description}" name="loadDescription" id="loadDescription" type="text" class="form-control" placeholder="Description" required>
                                                            </div>
                                                        </div><!--end col-->

                                                        <!-- Checkbox isPrescriptionDrug -->
                                                        <div class="col-md-6">
                                                            <div class="mb-3 form-check">
                                                                <input name="loadIsPrescriptionDrug" id="loadIsPrescriptionDrug" type="checkbox" class="form-check-input"
                                                                       value="true" ${pDetail.isPrescriptionDrug ? 'checked' : ''}>
                                                                <label class="form-check-label" for="isPrescriptionDrug">Prescription Drug</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="mb-3 form-check">
                                                                <input name="loadIsAvailable" id="loadIsAvailable" type="checkbox" class="form-check-input"
                                                                       value="true" ${pDetail.isAvailable ? 'checked' : ''}>
                                                                <label class="form-check-label" for="loadIsAvailable">Is Available</label>
                                                            </div>
                                                        </div>

                                                        <!-- Button Add -->
                                                        <div class="col-md-6 text-end">
                                                            <button type="submit" class="btn btn-primary">Edit</button>
                                                        </div><!--end col-->
                                                    </div>
                                                    </form>
                                                    <!-- Script hiển thị ảnh xem trước -->
                                                    <script>
                                                        document.getElementById("loadImage").addEventListener("input", function () {
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

                                                        document.addEventListener("DOMContentLoaded", function () {
                                                            const imgElement = document.getElementById("preview-img");
                                                            const imageInput = document.getElementById("loadImage");

                                                            function updatePreview() {
                                                                const imageUrl = imageInput.value.trim();
                                                                if (imageUrl) {
                                                                    imgElement.src = imageUrl;
                                                                    imgElement.classList.remove("d-none");
                                                                } else {
                                                                    imgElement.src = "";
                                                                    imgElement.classList.add("d-none");
                                                                }
                                                            }

                                                            imageInput.addEventListener("input", updatePreview);
                                                            updatePreview(); // Gọi ngay khi modal mở để hiển thị ảnh có sẵn
                                                        });
                                                    </script>
                                                </div><!--end col-->
                                            </div><!--end row-->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--                        <div class="row mt-4">
                                                    <div class="col-12">
                                                        <h5 class="mb-0">Related Products:</h5>
                                                    </div>end col
                                                </div>end row-->

                        <!--                        <div class="row">
                                                    <div class="col-lg-12 mt-4">
                                                        <div class="slider-range-four">
                                                            <div class="tiny-slide">
                                                                <div class="card shop-list border-0 overflow-hidden rounded shadow m-1">
                                                                    <div class="shop-image position-relative overflow-hidden">
                                                                        <a href="https://shreethemes.in/doctris/layouts/admin/pharmacy-product-detail.html"><img src="images/pharmacy/shop/thermometer.jpg" class="img-fluid" alt=""></a>                               
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
                                                            </div>end col
                        
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
                                                            </div>end col
                        
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
                                                            </div>end col
                        
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
                                                            </div>end col
                        
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
                                                            </div>end col
                        
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
                                                            </div>end col
                        
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
                                                            </div>end col
                        
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
                                                    </div>end col
                                                </div>end row-->
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
