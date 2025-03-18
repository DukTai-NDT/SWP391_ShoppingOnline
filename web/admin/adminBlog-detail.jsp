<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Products,java.util.Vector, entity.Categories, entity.CartItems, entity.Customers,entity.Account,entity.Blogs" %>

<html lang="en">

    <head>
        <meta charset="utf-8">
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
        <!-- Select2 -->
        <link href="css/select2.min.css" rel="stylesheet" />
        <!-- Date picker -->
        <link rel="stylesheet" href="css/flatpickr.min.css">
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

        Dưới đây là phiên bản cải tiến của đoạn mã JSP mà bạn cung cấp, với việc sử dụng HTML và CSS được tối ưu hóa để làm cho giao diện đẹp hơn, hiện đại hơn và dễ đọc hơn. Tôi sẽ thay thế scriptlet bằng JSTL để giữ mã sạch sẽ, thêm các yếu tố thiết kế như bóng đổ, khoảng cách hợp lý, và định dạng văn bản rõ ràng hơn.

        Mã JSP cải tiến
        jsp

        Réduire

        Envelopper

        Copier
        <%@ page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Blog Detail</title>
            <!-- Bootstrap CSS -->
            <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <!-- Bootstrap Icons -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
            <!-- Custom CSS -->
            <style>
                /* Định dạng section tiêu đề */
                .bg-half-150 {
                    padding: 100px 0;
                    background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
                    position: relative;
                    overflow: hidden;
                }
                .section-title h3 {
                    font-size: 2.5rem;
                    font-weight: 700;
                    color: #2c3e50;
                    line-height: 1.3;
                    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
                }
                .section-title ul {
                    margin-top: 1.5rem;
                    padding: 0;
                }
                .section-title ul li {
                    font-size: 1rem;
                    color: #7f8c8d;
                    display: inline-flex;
                    align-items: center;
                    margin-right: 1.5rem;
                }
                .section-title ul li i {
                    margin-right: 0.5rem;
                    color: #3498db;
                    font-size: 1.2rem;
                }

                /* Định dạng hình ảnh blog */
                .blog-image {
                    max-width: 100%;
                    height: auto;
                    border-radius: 15px;
                    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
                    margin: 2rem 0;
                    transition: transform 0.3s ease;
                }
                .blog-image:hover {
                    transform: scale(1.02);
                }

                /* Định dạng nội dung blog */
                .blog-content {
                    font-size: 1.1rem;
                    line-height: 1.8;
                    color: #5f6a6a;
                    background: #fff;
                    padding: 2rem;
                    border-radius: 10px;
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                    margin-top: 2rem;
                }
                .blog-content p {
                    margin: 0;
                }

                /* Hiệu ứng shape ở dưới section */
                .shape {
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 100%;
                    height: 48px;
                    overflow: hidden;
                    z-index: 1;
                }
            </style>
        </head>
        <%
                    Account account = (Account)session.getAttribute("dataUser");
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
                            <img src="images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                            <img src="images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                        </a>
                    </div>

                    <ul class="sidebar-menu pt-3">

                        <li class="sidebar-dropdown">
                            <a href="Dashboard"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a>
                        </li>
                        <br>
                        <%if(account.getRoleID()  == 3){%>
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
                            <div class="sidebar-submenu">
                            </div>
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
                        <br>
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
                        </ul>
                    </div>
                </div>

                <section class="bg-half-150 d-table w-100 bg-light">
                        <div class="container">
                            <div class="row mt-5 justify-content-center">
                                <div class="col-12">
                                    <div class="section-title text-center">
                                        <h3 class="sub-title mb-4">${sessionScope.blog.title}</h3>
                                        <ul class="list-unstyled mt-4">
                                            <li class="list-inline-item date text-muted">
                                                <i class="bi bi-calendar-check"></i>
                                                <span class="post-time">${sessionScope.blog.postTime}</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="shape text-white">
                            <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
                            </svg>
                        </div>
                    </section>

                     Blog Image and Content 
                    <section class="section">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-10">
                                    <img src="${pageContext.request.contextPath}/images/blogs/${sessionScope.blog.image}" class="blog-image img-fluid" alt="${sessionScope.blog.title}">
                                    <div class="blog-content">
                                        <p class="text-muted">${sessionScope.blog.content}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

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
<!---->
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

            <!-- View Appintment Start -->
            <div class="modal fade" id="viewappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header border-bottom p-3">
                            <h5 class="modal-title" id="exampleModalLabel">Appointment Detail</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body p-3 pt-4">
                            <div class="d-flex align-items-center">
                                <img src="images/client/01.jpg" class="avatar avatar-small rounded-pill" alt="">
                                <h5 class="mb-0 ms-3">Howard Tanner</h5>
                            </div>
                            <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                                <li>
                                    <ul class="list-unstyled mb-0">
                                        <li class="d-flex">
                                            <h6>Age:</h6>
                                            <p class="text-muted ms-2">25 year old</p>
                                        </li>

                                        <li class="d-flex">
                                            <h6>Gender:</h6>
                                            <p class="text-muted ms-2">Male</p>
                                        </li>

                                        <li class="d-flex">
                                            <h6 class="mb-0">Department:</h6>
                                            <p class="text-muted ms-2 mb-0">Cardiology</p>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="list-unstyled mb-0">
                                        <li class="d-flex">
                                            <h6>Date:</h6>
                                            <p class="text-muted ms-2">20th Dec 2020</p>
                                        </li>

                                        <li class="d-flex">
                                            <h6>Time:</h6>
                                            <p class="text-muted ms-2">11:00 AM</p>
                                        </li>

                                        <li class="d-flex">
                                            <h6 class="mb-0">Doctor:</h6>
                                            <p class="text-muted ms-2 mb-0">Dr. Calvin Carlo</p>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- View Appintment End -->

            <!-- Accept Appointment Start -->
            <div class="modal fade" id="acceptappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body py-5">
                            <div class="text-center">
                                <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                    <i class="uil uil-check-circle h1 mb-0"></i>
                                </div>
                                <div class="mt-4">
                                    <h4>Accept Appointment</h4>
                                    <p class="para-desc mx-auto text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment.</p>
                                    <div class="mt-4">
                                        <a href="#" class="btn btn-soft-success">Accept</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Accept Appointment End -->

            <!-- Cancel Appointment Start -->
            <div class="modal fade" id="cancelappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body py-5">
                            <div class="text-center">
                                <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                    <i class="uil uil-times-circle h1 mb-0"></i>
                                </div>
                                <div class="mt-4">
                                    <h4>Cancel Appointment</h4>
                                    <p class="para-desc mx-auto text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment.</p>
                                    <div class="mt-4">
                                        <a href="#" class="btn btn-soft-danger">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Cancel Appointment End -->
            <!-- Modal end -->

            <!-- javascript -->
            <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.bundle.min.js"></script>
            <!-- simplebar -->
            <script src="js/simplebar.min.js"></script>
            <!-- Select2 -->
            <script src="js/select2.min.js"></script>
            <script src="js/select2.init.js"></script>
            <!-- Datepicker -->
            <script src="js/flatpickr.min.js"></script>
            <script src="js/flatpickr.init.js"></script>
            <!-- Icons -->
            <script src="js/feather.min.js"></script>
            <!-- Main Js -->
            <script src="js/app.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
            <script>
                                            function previewImage() {
                                                var imageUrl = document.getElementById("loadImage").value;
                                                var imagePreview = document.getElementById("imagePreview");

                                                if (imageUrl) {
                                                    imagePreview.src = imageUrl;
                                                } else {
                                                    imagePreview.src = "";
                                                }
                                            }
            </script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const postTimeElements = document.querySelectorAll(".post-time");
                    postTimeElements.forEach(element => {
                        const localDate = element.textContent; // Lấy giá trị dạng "2025-03-04"
                        const date = new Date(localDate);
                        const options = {year: 'numeric', month: 'long', day: '2-digit'};
                        element.textContent = date.toLocaleDateString('en-US', options); // Định dạng thành "March 04, 2025"
                    });
                });
            </script>

        </body>

    </html>