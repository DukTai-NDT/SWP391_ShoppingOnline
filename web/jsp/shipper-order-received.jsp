<%-- 
    Document   : admin-blog
    Created on : Mar 3, 2025, 4:39:21 PM
    Author     : Admin
--%>

<!DOCTYPE html>
<%@ page import=" entity.Account , entity.Customers,entity.OrderDetails,model.DAOProducts,model.DAOOrderDetails,java.util.Vector" %>
<%@page import="entity.Products,java.util.Vector, entity.Categories, entity.CartItems, entity.Orders, model.DAOOrders, model.DAOProvinces, model.DAODistricts,  model.DAODeliveryAddress, model.DAOPayments, model.DAOCustomer" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi  ">

    <head>
        <meta charset="utf-8" />
        <title>Doctris - Shipper System</title>
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
            /* Đảm bảo bảng có thể cuộn nếu nội dung quá dài */
            .table-responsive {
                overflow-x: auto;
            }

            /* Giữ nội dung trong ô không bị tràn ra ngoài */
            .table td, .table th {
                white-space: nowrap; /* Ngăn nội dung xuống dòng */
                overflow: hidden;
                text-overflow: ellipsis; /* Thêm dấu "..." nếu nội dung quá dài */
                max-width: 180px; /* Giới hạn chiều rộng của ô */
            }

            /* Điều chỉnh cột địa chỉ rộng hơn để hiển thị đủ nội dung */
            .table td:nth-child(3) { /* Cột Address */
                max-width: 250px;
            }

            /* Căn giữa nội dung và đảm bảo nút vừa vặn */
            .order-actions {
                display: flex;
                justify-content: center;
            }

            .order-actions a {
                width: 160px; /* Cố định chiều rộng để đồng bộ */
                text-align: center;
                padding: 8px 12px;
                font-size: 14px;
                font-weight: 600;
                border-radius: 6px;
                text-decoration: none;
                transition: all 0.3s ease-in-out;
            }

            /* Nút "Transported" */
            .order-actions .btn-success {
                background-color: #28a745;
                border: none;
                color: white;
            }

            .order-actions .btn-success:hover {
                background-color: #218838;
            }

            /* Nút "Choose" */
            .order-actions .btn-danger {
                background-color: #dc3545;
                border: none;
                color: white;
            }

            .order-actions .btn-danger:hover {
                background-color: #c82333;
            }

            /* Đảm bảo badge trạng thái không bị tràn */
            .badge {
                display: inline-block;
                padding: 6px 10px;
                font-size: 12px;
                font-weight: 600;
                text-align: center;
                border-radius: 6px;
            }
             .filter-button {
                padding: 8px 16px;
                border: none;
                background-color: #007bff;
                color: white;
                font-size: 14px;
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s;
            }

            .table th:nth-child(5), .table td:nth-child(5) {
                text-align: center;
            }

        </style>

    </head>
    <%
       Vector<Orders> vectorOrder =  (Vector<Orders>) request.getAttribute("vectorOrder");
      DAOProducts daoProduct = new DAOProducts();
      DAOOrders daoOrder = new DAOOrders();
    %>
    <% String message = (String)request.getAttribute("message"); 
    %>
    <%Vector<Categories> vcategories = (Vector<Categories>)session.getAttribute("vcategories");%>
    <%Vector<Products> vproduct = (Vector<Products>)session.getAttribute("vproduct");%>
    <% Vector<Products> vproductspecial= (Vector<Products>)session.getAttribute("vproductspecial");%>
    <%
           Account account = (Account)session.getAttribute("dataUser");
           Customers currentCustomer = (Customers) session.getAttribute("dataCustomer");
           Customers shipper = (Customers) session.getAttribute("shipper");
           Vector<CartItems> vectorCartItems = (Vector<CartItems>)session.getAttribute("dataCartItem"); 
           DAOProvinces pro = new DAOProvinces();
           DAODistricts dis = new DAODistricts();
           DAODeliveryAddress deli = new DAODeliveryAddress();
           DAOPayments daoPay = new DAOPayments();
           DAOCustomer daoCus = new DAOCustomer();
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
                        <a href="ShipperPageURL">
                            <!--<a href="index.jsp">-->
                            <img src="images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                            <img src="images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                        </a>
                    </div>

                    <ul class="sidebar-menu pt-3">
                        <li class="sidebar-dropdown">
                            <a href="ShipperPageURL"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a>
                        </li>
                        <br>
                        <li class="sidebar-dropdown">
                            <a href="OrderShipperURL"><i class="uil uil-capsule me-2 d-inline-block"></i>All Order</a>
                        </li>
                        <br>
                        <li class="sidebar-dropdown">
                            <a href="OrderReceivedURL"><i class="uil uil-coins me-2 d-inline-block"></i>Order received</a>
                        </li>
                        <br>
                        <li class="sidebar-dropdown">
                            <a href="OrderFinishedURL"><i class="uil uil-coins me-2 d-inline-block"></i>Order finished</a>
                        </li>

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
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form action="adminsearchblog" role="search" method="get" id="searchform" class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="txt" id="s" placeholder="Search Keywords...">
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%
                                                     if(currentCustomer != null){
                        %>

                        <li class="list-inline-item mb-0 ms-1">
                            <div class="dropdown dropdown-primary">

                                <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="<%= (currentCustomer.getProfileImg() != null && !currentCustomer.getProfileImg().isEmpty()) ? currentCustomer.getProfileImg() : "${pageContext.request.contextPath}/images/client/09.jpg" %>" class="avatar avatar-ex-small rounded-circle" alt="Profile">
                                </button>
                                <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                    <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                                        <img src="<%= (currentCustomer.getProfileImg() != null && !currentCustomer.getProfileImg().isEmpty()) ? currentCustomer.getProfileImg() : "${pageContext.request.contextPath}/images/client/09.jpg" %>" class="avatar avatar-md-sm rounded-circle border shadow" alt="Profile">

                                        <div class="flex-1 ms-2">
                                            <span class="d-block mb-1"><%= currentCustomer.getFirstName() + " " + currentCustomer.getLastName() %></span>
                                        </div>
                                    </a>

                                    <a class="dropdown-item text-dark" href="CustomerURL"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="LogOutURL"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>

                                </div>
                            </div>
                        </li>
                        <%} else{%>
                        <div class="auth-links">
                            <a href="SignUpURL?service=signup">Sign up</a>
                            <span>|</span>
                            <a href="LoginURL?service=login">Log in</a>
                        </div>
                        <%}%>

                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between align-items-center pb-3">
                            <div>
                                <h5 class="mb-0">Shipper</h5>
                                <nav aria-label="breadcrumb" class="d-inline-block mt-1">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="ShipperPageURL">Shipper</a></li>
                                        <li class="breadcrumb-item active" aria-current="page"><a href="OrderShipperURL">Order Received</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="d-flex align-items-center gap-2 mt-4 mt-sm-0">

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 100px;">OrderID</th>
                                                <th class="border-bottom p-3" style="max-width: 60px;">Total</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;">Address</th> 
                                                <th class="border-bottom p-3" style="min-width: 100px;">Status</th> 
                                                <th class="border-bottom p-3" style="min-width: 100px;">Action</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;">Detail</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% 
                                                for (Orders order : vectorOrder) { 
                                                    String status = daoOrder.getStatus(order.getOrderID()); // Lưu trạng thái vào biến
                                                    String statusClass = ""; // Biến để lưu data-status

                                                    if(status.equals("Done")) {
                                                        statusClass = "completed";
                                                    } else if(status.equals("Delivering")) {
                                                        statusClass = "shipping";
                                                    } else if(status.equals("On-prepared")) {
                                                        statusClass = "pending";
                                                    }
                                            %>
                                            <tr>

                                                <td class="p-3"><a href="OrderDetailURL?service=orderdetail&id=<%=order.getOrderID()%>"><%=order.getOrderID()%></a></td>
                                                <td class="p-3"><%if(daoPay.getPaymentByOrderID(order.getOrderID()).isStatus()){%>
                                                    ₫ 0 (Paid)
                                                    <%}else {%>
                                                    ₫ <%=daoOrder.getTotalByOrderID(order.getOrderID())%>
                                                    <%}%>
                                                </td>

                                                <td class="p-3"><%=pro.getProvinceByOrderID(order.getOrderID()).getProvinceName()%>, <%=dis.getDistrictByOrderID(order.getOrderID()).getDistrictName()%>, <%=deli.getDeliveryAddress("select * from DeliveryAddress where OrderID = " + order.getOrderID()).get(0).getAddressDetail()%></td>
                                                <td class="p-3"> 
                                                    <% if(status.equals("Done") || status.equals("Delivering")) { %>
                                                    <span class="badge bg-success"><%=status%></span>
                                                    <% } else if(status.equals("Prepared")) { %>
                                                    <span class="badge bg-info"><%=status%></span>
                                                    <% } else if(status.equals("On-prepared")) { %>
                                                    <span class="badg e bg-warning"><%=status%></span>
                                                    <% } %>


                                                </td>
                                                <td class="p-3">

                                                    <a href="OrderFinishedURL?service=finshedTranspoted&orderid=<%=order.getOrderID()%>" class="btn btn-sm btn-success">Finished</a>             
                                                </td>
                                                <td class="p-3" > <a href="OrderDetailURL?service=orderdetail&id=<%=order.getOrderID()%>" class="filter-button"> Detail Info </a> </td>


                                            </tr>
                                            <%}%>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--end row-->


                        <div class="row">
                            <div class="col-12 mt-4">
                                <ul class="pagination justify-content-end mb-0 list-unstyled">
                                    <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Previous">Prev</a></li>
                                    <li class="page-item active"><a class="page-link" href="javascript:void(0)">1</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Next">Next</a></li>
                                </ul><!--end pagination-->
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

        <!-- Start Modal -->
        <div class="modal fade" id="newblogadd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <form action="adminaddblog" method="post"  enctype="multipart/form-data">
                <div class="modal-dialog modal-lg modal-dialog-centered">

                    <div class="modal-content">
                        <div class="modal-header border-bottom p-3">
                            <h5 class="modal-title" id="exampleModalLabel">Add Blog</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body p-3 pt-4">

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label class="form-label">Image URL:</label>
                                        <input type="file" name="image" id="images" class="form-control" placeholder="Upload blog image" oninput="previewImage()"required>

                                    </div>
                                </div><!--end col-->

                                <div class="col-md-8 mt-4 mt-sm-0">
                                    <div class="ms-md-4">
                                        <form>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="col-md-6">

                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label"> Date : </label>

                                                            <p><input type="date" name="date" value="" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Blog Title <span class="text-danger">*</span></label>
                                                            <input name="title" id="title" type="text" class="form-control" placeholder="Title :" required>
                                                        </div>

                                                    </div><!--end col-->


                                                </div><!--end col-->
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Description: <span class="text-danger">*</span></label>

                                                        <textarea name="description:" id="description:" rows="4" class="form-control" placeholder="Blog description :"required></textarea>
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-lg-12 text-end">
                                                    <button type="submit" class="btn btn-primary">Add Blog</button>
                                                </div><!--end col-->
                                            </div>

                                    </div>
                                </div><!--end col-->
                            </div>
                            <!--end row-->

                        </div>
                    </div>


                </div>
            </form>
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
    <script>
        function confirmDelete(event, blogID) {
            event.preventDefault(); // Ngăn trang chuyển hướng ngay lập tức
            let confirmation = confirm("Are you sure you want to delete this blog post?");
            if (confirmation) {
                window.location.href = "AdminDeleteBlog?bid=" + blogID; // Chuyển hướng nếu xác nhận
            }
        }
    </script>
    <script>
        function previewImage() {
            var imageUrl = document.getElementById("images").value; // Lấy giá trị URL từ input
            var imgPreview = document.getElementById("imagePreview"); // Lấy thẻ img

            if (imageUrl.trim() !== "") {
                imgPreview.src = imageUrl; // Gán URL vào src của img
                imgPreview.style.display = "block"; // Hiển thị ảnh
            } else {
                imgPreview.style.display = "none"; // Ẩn ảnh nếu không có URL
            }
        }
    </script>

</body>

</html>
