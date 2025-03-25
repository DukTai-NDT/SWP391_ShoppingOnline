<%-- 
    Document   : productManager
    Created on : Mar 3, 2025, 9:26:34 PM
    Author     : whyth
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

        <style>
            .table {
                background-color: #f8f9fa; /* Màu nền nhạt */
                border-radius: 10px; /* Bo góc */
            }

            .table thead {
                background-color: #215aee !important; /* Màu xanh cho header */
                color: white;
            }

            .table tbody tr:hover {
                background-color: #eef5ff; /* Hiệu ứng hover */
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
                                    <form role="search" method="get" id="searchform" class="searchform" action="ProductManager">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="keyword" id="s" 
                                                   placeholder="Search Keywords..." value="${keyword}">
                                            <input type="submit" id="searchsubmit" value="Search" class="btn btn-primary rounded-pill">
                                        </div>
                                    </form>
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
                        <div class="d-md-flex justify-content-between align-items-center">
                            <div class="d-flex align-items-center">
                                <h5 class="mb-0 me-3">Product List</h5>
                                <form action="ProductManager" method="GET" class="d-inline">
                                    <div class="input-group">
                                        <select class="form-select" name="orderType" id="orderType" onchange="this.form.submit()">
                                            <option value="newest" ${orderType == "newest" ? "selected" : ""}>Newest</option>
                                            <option value="oldest" ${orderType == "oldest" ? "selected" : ""}>Oldest</option>
                                        </select>
                                        <input type="hidden" name="page" value="${currentPage}">
                                    </div>
                                </form>
                            </div>

                            <div class="mt-4 mt-sm-0">
                                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-product">Add Product</a>                              
                            </div>
                        </div>
                        <br>

                        <table class="table align-middle shadow-lg rounded-4 overflow-hidden bg-white">
                            <thead class="bg-primary text-white rounded-top-4">
                                <tr class="fw-bold text-center">
                                    <th class="p-3">#</th>
                                    <th class="p-3 text-center">Image</th>

                                    <th class="p-3 text-start ps-4">Product Name</th>

                                    <th class="p-3">Price</th>
                                    <th class="p-3 text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${pList}" varStatus="status">
                                    <tr class="border-bottom">
                                        <td class="p-3 text-center">
                                            ${((currentPage - 1) * 10) + status.index + 1}
                                        </td>
                                        <td class="p-3 text-center">
                                            <img src="images/products/${p.image}" class="rounded-5 shadow" alt="${p.productName}" 
                                                 style="width: 90px; height: 90px; object-fit: cover;">
                                        </td>

                                        <td class="p-3 text-start fw-semibold text-dark ps-5">

                                            ${p.productName}
                                        </td>
                                        <td class="p-3 text-success fw-bold text-center">${p.price}</td>
                                        <td class="p-3 text-center">
                                            <a href="ProductManagerDetail?pid=${p.productID}" class="btn btn-outline-primary btn-sm">
                                                <i class="uil uil-eye"></i> Detail
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div><!--end row-->

                    <div class="row">
                        <div class="col-12 mt-4">
                            <ul class="pagination justify-content-end mb-0 list-unstyled">
                                <%
                                    int currentPage = (int) request.getAttribute("currentPage");
                                    int totalPages = (int) request.getAttribute("totalPages");
                                    String orderType = request.getParameter("orderType");
                                    if (orderType == null) {
                                        orderType = "newest"; // Mặc định là newest nếu không có orderType
                                    }
                                %>

                                <!-- Nút Prev -->
                                <li class="page-item <%= (currentPage == 1) ? "disabled" : ""%>">
                                    <a class="page-link" href="?page=<%= currentPage - 1%>&orderType=<%= orderType%>" aria-label="Previous">Prev</a>
                                </li>

                                <!-- Số trang -->
                                <% for (int i = 1; i <= totalPages; i++) {%>
                                <li class="page-item <%= (i == currentPage) ? "active" : ""%>">
                                    <a class="page-link" href="?page=<%= i%>&orderType=<%= orderType%>"><%= i%></a>
                                </li>
                                <% }%>

                                <!-- Nút Next -->
                                <li class="page-item <%= (currentPage == totalPages) ? "disabled" : ""%>">
                                    <a class="page-link" href="?page=<%= currentPage + 1%>&orderType=<%= orderType%>" aria-label="Next">Next</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--end row-->
                </div>
                <br>
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
        </div><!--end container-->


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
                <form action="AddProductController" method="post"  enctype="multipart/form-data">
                    <div class="row">
                        <!-- Trường nhập ảnh -->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Image URL:</label>
                                <input type="file" name="image" id="image" class="form-control" placeholder=" image file">
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


