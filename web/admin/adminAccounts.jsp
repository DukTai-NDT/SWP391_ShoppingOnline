<%-- 
    Document   : adminAccounts
    Created on : Mar 5, 2025, 10:22:57 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <li class="sidebar-dropdown">
                            <a href="Dashboard"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a>
                        </li>
                        <br>
                        <li class="sidebar-dropdown">
                            <a href="AdminAccounts"><i class="uil uil-user me-2 d-inline-block"></i>Accounts Management</a>
                        </li>
                        <br>
                        <li class="sidebar-dropdown">
                            <a href="ProductManager"><i class="uil uil-capsule me-2 d-inline-block"></i>Products Management</a>
                        </li>
                        <br>
                        <li class="sidebar-dropdown">
                            <a href="admin"><i class="uil uil-flip-h me-2 d-inline-block"></i>Blogs Management</a>
                        </li>
                        <br>
                        <li class="sidebar-dropdown">
                            <a href="OrdersManagement"><i class="uil uil-file me-2 d-inline-block"></i>Orders Management</a>
<!--                            <div class="sidebar-submenu">
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
                            </div>-->
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
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form role="search" method="get" id="searchform" class="searchform" action="SearchAccount">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="txt" id="txt" placeholder="Search Keywords...">
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
                            <h5 class="mb-0">Account List</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <!--                                    <li class="breadcrumb-item"><a href="index.jsp">Doctris</a></li>
                                                                        <li class="breadcrumb-item active" aria-current="page">Patients</li>-->
                                </ul>
                            </nav>
                            <div class="mt-4 mt-sm-0">
                                <a href="" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newblogadd">Add Account</a>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 180px;">Username</th>
                                                <th class="border-bottom p-3">Role</th>
                                                <th class="border-bottom p-3">Password</th>
                                                <th class="border-bottom p-3">Email</th>
                                                <th class="border-bottom p-3">Status</th>

                                                <th class="border-bottom p-3" style="min-width: 100px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lista}" var="a">
                                                <tr>

                                                    <td class="p-3">${a.accountID}</td>
                                                    <td class="py-3">
                                                        <a href="#" class="text-dark">
                                                            <div class="d-flex align-items-center">
                                                                
                                                                <span class="ms-2">${a.userName}</span>
                                                            </div>
                                                        </a>
                                                    </td>
                                                    <td class="p-3">
                                                        ${a.roleID == 1 ? 'Admin' : (a.roleID == 2 ? 'Customer' : (a.roleID == 3 ? 'Editor' : 'Unknown'))}
                                                    </td>

                                                    <td class="p-3">${a.password}</td>
                                                    <td class="p-3">${a.email}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${!a.active}">
                                                                <p style="color: red">Block</p>
                                                            </c:when>    
                                                            <c:otherwise>
                                                                <p style="color: green">active</p>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    <td class="text-end p-3">



                                                        <a href="loadAccount?aid=${a.accountID}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>


                                                    </td>

                                                </tr>
                                            </c:forEach>
                                            <!--                                            <tr>
                                                                                            <th class="p-3">2</th>
                                                                                            <td class="py-3">
                                                                                                <a href="#" class="text-dark">
                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <img src="images/client/02.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                                        <span class="ms-2">Wendy Filson</span>
                                                                                                    </div>
                                                                                                </a>
                                                                                            </td>
                                                                                            <td class="p-3">28</td>
                                                                                            <td class="p-3">Female</td>
                                                                                            <td class="p-3">1451 - ABC Street, NY</td>
                                                                                            <td class="p-3">(+452) 8945 4568</td>
                                                                                            <td class="p-3">Gynecology</td>
                                                                                            <td class="p-3">20th Dec 2020</td>
                                                                                            <td class="p-3">11:00AM</td>
                                                                                            <td class="p-3"><span class="badge bg-soft-warning">Pending</span></td>
                                                                                            <td class="text-end p-3">
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewprofile"><i class="uil uil-eye"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                                                            </td>
                                                                                        </tr>
                                            
                                                                                        <tr>
                                                                                            <th class="p-3">3</th>
                                                                                            <td class="py-3">
                                                                                                <a href="#" class="text-dark">
                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <img src="images/client/03.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                                        <span class="ms-2">Faye Bridger</span>
                                                                                                    </div>
                                                                                                </a>
                                                                                            </td>
                                                                                            <td class="p-3">28</td>
                                                                                            <td class="p-3">Female</td>
                                                                                            <td class="p-3">1451 - ABC Street, NY</td>
                                                                                            <td class="p-3">(+452) 8945 4568</td>
                                                                                            <td class="p-3">Psychotherapy</td>
                                                                                            <td class="p-3">20th Dec 2020</td>
                                                                                            <td class="p-3">11:00AM</td>
                                                                                            <td class="p-3"><span class="badge bg-soft-success">Approved</span></td>
                                                                                            <td class="text-end p-3">
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewprofile"><i class="uil uil-eye"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                                                            </td>
                                                                                        </tr>
                                            
                                                                                        <tr>
                                                                                            <th class="p-3">4</th>
                                                                                            <td class="py-3">
                                                                                                <a href="#" class="text-dark">
                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <img src="images/client/04.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                                        <span class="ms-2">Ronald Curtis</span>
                                                                                                    </div>
                                                                                                </a>
                                                                                            </td>
                                                                                            <td class="p-3">25</td>
                                                                                            <td class="p-3">Male</td>
                                                                                            <td class="p-3">1451 - ABC Street, NY</td>
                                                                                            <td class="p-3">(+452) 8945 4568</td>
                                                                                            <td class="p-3">Orthopedic</td>
                                                                                            <td class="p-3">20th Dec 2020</td>
                                                                                            <td class="p-3">11:00AM</td>
                                                                                            <td class="p-3"><span class="badge bg-soft-success">Approved</span></td>
                                                                                            <td class="text-end p-3">
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewprofile"><i class="uil uil-eye"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                                                            </td>
                                                                                        </tr>
                                            
                                                                                        <tr>
                                                                                            <th class="p-3">5</th>
                                                                                            <td class="py-3">
                                                                                                <a href="#" class="text-dark">
                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <img src="images/client/05.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                                        <span class="ms-2">Melissa Hibner</span>
                                                                                                    </div>
                                                                                                </a>
                                                                                            </td>
                                                                                            <td class="p-3">28</td>
                                                                                            <td class="p-3">Female</td>
                                                                                            <td class="p-3">1451 - ABC Street, NY</td>
                                                                                            <td class="p-3">(+452) 8945 4568</td>
                                                                                            <td class="p-3">Dental</td>
                                                                                            <td class="p-3">20th Dec 2020</td>
                                                                                            <td class="p-3">11:00AM</td>
                                                                                            <td class="p-3"><span class="badge bg-soft-warning">Pending</span></td>
                                                                                            <td class="text-end p-3">
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewprofile"><i class="uil uil-eye"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                                                            </td>
                                                                                        </tr>
                                            
                                                                                        <tr>
                                                                                            <th class="p-3">6</th>
                                                                                            <td class="py-3">
                                                                                                <a href="#" class="text-dark">
                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <img src="images/client/06.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                                        <span class="ms-2">Randall Case</span>
                                                                                                    </div>
                                                                                                </a>
                                                                                            </td>
                                                                                            <td class="p-3">25</td>
                                                                                            <td class="p-3">Male</td>
                                                                                            <td class="p-3">1451 - ABC Street, NY</td>
                                                                                            <td class="p-3">(+452) 8945 4568</td>
                                                                                            <td class="p-3">Orthopedic</td>
                                                                                            <td class="p-3">20th Dec 2020</td>
                                                                                            <td class="p-3">11:00AM</td>
                                                                                            <td class="p-3"><span class="badge bg-soft-success">Approved</span></td>
                                                                                            <td class="text-end p-3">
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewprofile"><i class="uil uil-eye"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                                                            </td>
                                                                                        </tr>
                                            
                                                                                        <tr>
                                                                                            <th class="p-3">7</th>
                                                                                            <td class="py-3">
                                                                                                <a href="#" class="text-dark">
                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <img src="images/client/07.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                                        <span class="ms-2">Jerry Morena</span>
                                                                                                    </div>
                                                                                                </a>
                                                                                            </td>
                                                                                            <td class="p-3">25</td>
                                                                                            <td class="p-3">Male</td>
                                                                                            <td class="p-3">1451 - ABC Street, NY</td>
                                                                                            <td class="p-3">(+452) 8945 4568</td>
                                                                                            <td class="p-3">Dentist</td>
                                                                                            <td class="p-3">20th Dec 2020</td>
                                                                                            <td class="p-3">11:00AM</td>
                                                                                            <td class="p-3"><span class="badge bg-soft-warning">Pending</span></td>
                                                                                            <td class="text-end p-3">
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewprofile"><i class="uil uil-eye"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                                                            </td>
                                                                                        </tr>
                                            
                                                                                        <tr>
                                                                                            <th class="p-3">8</th>
                                                                                            <td class="py-3">
                                                                                                <a href="#" class="text-dark">
                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <img src="images/client/08.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                                        <span class="ms-2">Lester McNally</span>
                                                                                                    </div>
                                                                                                </a>
                                                                                            </td>
                                                                                            <td class="p-3">25</td>
                                                                                            <td class="p-3">Male</td>
                                                                                            <td class="p-3">1451 - ABC Street, NY</td>
                                                                                            <td class="p-3">(+452) 8945 4568</td>
                                                                                            <td class="p-3">Gastrology</td>
                                                                                            <td class="p-3">20th Dec 2020</td>
                                                                                            <td class="p-3">11:00AM</td>
                                                                                            <td class="p-3"><span class="badge bg-soft-success">Approved</span></td>
                                                                                            <td class="text-end p-3">
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewprofile"><i class="uil uil-eye"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                                                            </td>
                                                                                        </tr>
                                            
                                                                                        <tr>
                                                                                            <th class="p-3">9</th>
                                                                                            <td class="py-3">
                                                                                                <a href="#" class="text-dark">
                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <img src="images/client/09.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                                        <span class="ms-2">Christopher Burrell</span>
                                                                                                    </div>
                                                                                                </a>
                                                                                            </td>
                                                                                            <td class="p-3">28</td>
                                                                                            <td class="p-3">Female</td>
                                                                                            <td class="p-3">1451 - ABC Street, NY</td>
                                                                                            <td class="p-3">(+452) 8945 4568</td>
                                                                                            <td class="p-3">Urology</td>
                                                                                            <td class="p-3">20th Dec 2020</td>
                                                                                            <td class="p-3">11:00AM</td>
                                                                                            <td class="p-3"><span class="badge bg-soft-success">Approved</span></td>
                                                                                            <td class="text-end p-3">
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewprofile"><i class="uil uil-eye"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                                                            </td>
                                                                                        </tr>
                                            
                                                                                        <tr>
                                                                                            <th class="p-3">10</th>
                                                                                            <td class="py-3">
                                                                                                <a href="#" class="text-dark">
                                                                                                    <div class="d-flex align-items-center">
                                                                                                        <img src="images/client/10.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                                        <span class="ms-2">Mary Skeens</span>
                                                                                                    </div>
                                                                                                </a>
                                                                                            </td>
                                                                                            <td class="p-3">28</td>
                                                                                            <td class="p-3">Female</td>
                                                                                            <td class="p-3">1451 - ABC Street, NY</td>
                                                                                            <td class="p-3">(+452) 8945 4568</td>
                                                                                            <td class="p-3">Neurology</td>
                                                                                            <td class="p-3">20th Dec 2020</td>
                                                                                            <td class="p-3">11:00AM</td>
                                                                                            <td class="p-3"><span class="badge bg-soft-warning">Pending</span></td>
                                                                                            <td class="text-end p-3">
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewprofile"><i class="uil uil-eye"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                                                            </td>
                                                                                        </tr>-->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--end row-->

                        <div class="row text-center">
                            <!-- PAGINATION START -->
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <span class="text-muted me-3">Showing 1 - 10 out of 50</span>
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Previous">Prev</a></li>
                                        <li class="page-item active"><a class="page-link" href="javascript:void(0)">1</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Next">Next</a></li>
                                    </ul>
                                </div>
                            </div><!--end col-->
                            <!-- PAGINATION END -->
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

        <!-- Modal start -->
        <!-- Profile Settings Start -->
        <div class="modal fade" id="editprofile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Profile Settings</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <div class="row align-items-center">
                            <div class="col-lg-2 col-md-4">
                                <img src="images/doctors/01.jpg" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                            </div><!--end col-->

                            <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                <h6 class="">Upload your picture</h6>
                                <p class="text-muted mb-0">For best results, use an image at least 256px by 256px in either .jpg or .png format</p>
                            </div><!--end col-->

                            <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                <a href="#" class="btn btn-primary">Upload</a>
                                <a href="#" class="btn btn-soft-primary ms-2">Remove</a>
                            </div><!--end col-->
                        </div><!--end row-->

                        <form class="mt-4">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">First Name</label>
                                        <input name="name" id="name" type="text" class="form-control" placeholder="First Name :">
                                    </div>
                                </div><!--end col-->

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Last Name</label>
                                        <input name="name" id="name2" type="text" class="form-control" placeholder="Last Name :">
                                    </div>
                                </div><!--end col-->

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Your Email</label>
                                        <input name="email" id="email" type="email" class="form-control" placeholder="Your email :">
                                    </div> 
                                </div><!--end col-->

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Phone no.</label>
                                        <input name="number" id="number" type="text" class="form-control" placeholder="Phone no. :">
                                    </div>                                                                               
                                </div><!--end col-->

                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label">Your Bio Here</label>
                                        <textarea name="comments" id="comments" rows="4" class="form-control" placeholder="Bio :"></textarea>
                                    </div>
                                </div>
                            </div><!--end row-->

                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="submit" id="submit" name="send" class="btn btn-primary" value="Save changes">
                                </div><!--end col-->
                            </div><!--end row-->
                        </form><!--end form-->
                    </div>
                </div>
            </div>
        </div>
        <!-- Profile Settings End -->
        <div class="modal fade" id="newblogadd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <form action="AdminAddAccount" method="post">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header border-bottom p-3">
                            <h5 class="modal-title" id="exampleModalLabel">Add Account</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body p-3 pt-4">

                            <div class="row"><!--end col-->

                                <div class="col-md-8 mt-4 mt-sm-0">
                                    <div class="ms-md-4">
                                        <form>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="col-md-6">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label"> Username </label>
                                                            <p><input type="text" name="username" value="" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Password <span class="text-danger">*</span></label>
                                                            <input name="password" id="password" type="text" class="form-control" placeholder="Title :">
                                                        </div>
                                                          <div class="mb-3">
                                                            <label class="form-label">Email <span class="text-danger">*</span></label>
                                                            <input name="email" id="email" type="text" class="form-control" placeholder="Title :">
                                                        </div>

                                                    </div><!--end col-->

                                                </div><!--end col-->
              <!--end col-->
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
        <!-- Profile Start -->
        <div class="modal fade" id="viewprofile" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel1">Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body p-3 pt-4">
                        <div class="d-flex align-items-center">
                            <img src="images/client/01.jpg" class="avatar avatar-small rounded-pill" alt="">
                            <h5 class="mb-0 ms-3">${account.userName}</h5>
                        </div>
                        <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                            <li>
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex">
                                        <h6>ROLE:</h6>
                                        <p class="text-muted ms-2">${account.roleID}</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6>Password:</h6>
                                        <p class="text-muted ms-2">${account.Password}</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6 class="mb-0">EMAIL: </h6>
                                        <p class="text-muted ms-2 mb-0">${account.Email}</p>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <!-- Profile End -->
        <!-- Modal end -->

        <!-- javascript -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="js/app.js"></script>

    </body>

</html>
