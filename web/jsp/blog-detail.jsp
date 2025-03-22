<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,entity.Cart,entity.CartItems, entity.Customers, entity.Comment,entity.Blogs, jakarta.servlet.http.HttpSession, model.DAOCustomer"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Blog Detail</title>
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
    <link href="https://cdn.materialdesignicons.com/5.9.55/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Thêm Bootstrap Icons để thay thế nếu MDI không hoạt động -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
    <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
    <!-- SLIDER -->
    <link rel="stylesheet" href="css/tiny-slider.css"/>
    <!-- Css -->
    <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

    <!-- Thêm CSS tùy chỉnh để đảm bảo giao diện -->
    <style>
        .dropdown {
            display: block !important;
            width: 30px !important;
            height: 30px !important;
        }
        .dropdown a {
            display: flex !important;
            align-items: center;
            justify-content: center;
            padding: 5px;
        }
        .mdi, .bi {
            font-size: 20px !important;
            color: #000 !important;
            display: inline-block !important;
        }
        .dropdown-menu {
            z-index: 1000;
            min-width: 100px;
        }
    </style>
</head>

<%  
    Customers currentCustomer = (Customers) session.getAttribute("dataCustomer");
    Vector<CartItems> vectorCartItems = (Vector<CartItems>)session.getAttribute("dataCartItem"); 
    Blogs blog = (Blogs) session.getAttribute("blog");
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
            <a class="logo" href="index.html">
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
                <% if (currentCustomer != null) { %>
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
                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="<%=currentCustomer.getProfileImg()%>" class="avatar avatar-ex-small rounded-circle" alt="">
                    </button>
                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                        <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                            <img src="<%=currentCustomer.getProfileImg()%>" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                            <div class="flex-1 ms-2">
                                <span class="d-block mb-1"><%=currentCustomer.getFirstName()+" "+  currentCustomer.getLastName()%></span>
                            </div>
                        </a>
   
                      <a class="dropdown-item text-dark" href="OrderHistoryURL?service=show"><span class="mb-0 d-inline-block me-1"><i class="uil uil-receipt align-middle h6"></i></span>Order History</a>
                               
                                <a class="dropdown-item text-dark" href="CustomerURL"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                <%if(account.getRoleID() != 2){%> 
                                <a class="dropdown-item text-dark" href="Dashboard"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span>Manager Dashboard</a>
                                <%}%>
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
            <!-- Start Dropdown -->
    
            <div id="navigation">
                <!-- Navigation Menu-->   
                <ul class="navigation-menu nav-left">
                    <li class="has-submenu parent-menu-item">
                        <a href="javascript:void(0)">Home</a><span class="menu-arrow"></span>
                        <ul class="submenu">
                            <li><a href="index.html" class="sub-menu-item">Index One</a></li>
                            <li><a href="index-two.html" class="sub-menu-item">Index Two</a></li>
                            <li><a href="index-three.html" class="sub-menu-item">Index Three</a></li>
                        </ul>
                    </li>

                    <li class="has-submenu parent-menu-item">
                        <a href="javascript:void(0)">Pharmacy</a><span class="menu-arrow"></span>
                        <ul class="submenu">
                            <li><a href="pharmacy.html" class="sub-menu-item">Pharmacy</a></li>
                            <li><a href="pharmacy-shop.html" class="sub-menu-item">Shop</a></li>
                            <li><a href="pharmacy-product-detail.html" class="sub-menu-item">Medicine Detail</a></li>
                            <li><a href="pharmacy-shop-cart.html" class="sub-menu-item">Shop Cart</a></li>
                            <li><a href="pharmacy-checkout.html" class="sub-menu-item">Checkout</a></li>
                            <li><a href="pharmacy-account.html" class="sub-menu-item">Account</a></li>
                        </ul>
                    </li>
    
                    <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Pages</a><span class="menu-arrow"></span>
                        <ul class="submenu">
                            <li><a href="aboutus.html" class="sub-menu-item"> About Us</a></li>
                            <li><a href="faqs.html" class="sub-menu-item">FAQs</a></li>
                            <li class="has-submenu parent-menu-item">
                                <a href="javascript:void(0)" class="menu-item"> Blogs </a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="../admin/index.html" class="sub-menu-item" target="_blank">Admin</a></li>
                </ul><!--end navigation menu-->
            </div><!--end navigation-->
        </div><!--end container-->
    </header><!--end header-->
    <!-- Navbar End -->

    <!-- Start Hero -->
    <section class="bg-half-150 d-table w-100 bg-light">
        <div class="container">
            <div class="row mt-5 justify-content-center">
                <div class="col-12">
                    <div class="section-title text-center">
                        <h3 class="sub-title mb-4"><%=blog.getTitle()%></h3>
                        <ul class="list-unstyled mt-4">
                            <li class="list-inline-item date text-muted"><i class="mdi mdi-calendar-check"></i><%=blog.getPostTime()%></li>
                        </ul>
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
    <!-- End Hero -->

    <!-- Start -->
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-7">
                    <img src="images/blog/single.jpg" class="img-fluid rounded shadow" alt="">
                    <p class="text-muted mt-4"><%=blog.getContent()%></p>
                
                    <h5 class="card-title mt-4 mb-0">Comments:</h5>

                    <%
                    Vector<Comment> comments = (Vector<Comment>) session.getAttribute("comments" + blog.getBlogID());
                    DAOCustomer daoCus = new DAOCustomer();
                    if (comments == null) {
                        comments = new Vector<>(); 
                    }

                    int displayLimit = 3; 
                    int totalComments = comments.size();
                    boolean showAll = "true".equals(request.getParameter("showAll")); 

                    if (!comments.isEmpty()) { 
                        int limit = showAll ? totalComments : Math.min(displayLimit, totalComments); 
                        for (int i = 0; i < limit; i++) { 
                            Comment comment = comments.get(i);
                            String[] customerInfo = daoCus.getCustomerByID(comment.getCustomerID());
                            String customerName = customerInfo[0] + " " + customerInfo[1];
                            String profileImg = (customerInfo[2] != null && !customerInfo[2].isEmpty())
                                ? customerInfo[2] : "images/client/09.jpg";
                    %>
                    <ul class="media-list list-unstyled mb-0">
                        <li class="mt-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <a class="pe-3" href="#">
                                        <img src="<%=profileImg%>" class="img-fluid avatar avatar-md-sm rounded-circle shadow" alt="img">
                                    </a>
                                    <div class="commentor-detail">
                                        <h6 class="mb-0"><a href="javascript:void(0)" class="text-dark media-heading"><%=customerName%></a></h6>
                                        <small class="text-muted"><%=comment.getPostTime()%></small>
                                    </div>
                                </div>
                                <% if (currentCustomer != null && comment.getCustomerID() == currentCustomer.getCustomerID()) { %>
                                <div class="dropdown">
                                    <a href="#" class="text-muted" data-bs-toggle="dropdown" aria-expanded="false">
                                        <!-- Thay thế biểu tượng MDI bằng Bootstrap Icons nếu MDI không hoạt động -->
                                        <i class="bi bi-three-dots-vertical"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li><a class="dropdown-item" href="CommentURL?service=deleteComment&commentId=<%=comment.getCommentID()%>&blogId=<%=blog.getBlogID()%>">Delete</a></li>
                                    </ul>
                                </div>
                                <% } %>
                            </div>
                            <div class="mt-3">
                                <p class="text-muted font-italic p-3 bg-light rounded"><%=comment.getCommentText()%></p>
                            </div>
                        </li>
                    </ul>
                    <%
                        }
                    } else {
                    %>
                    <p class="text-muted">No comments yet. Be the first to comment!</p>
                    <% } %>

                    <% 
                    if (totalComments > displayLimit && !showAll) { 
                    %>
                    <div class="mt-3">
                        <a href="BlogsURL?service=detailBlog&blog=<%=blog.getBlogID()%>&showAll=true" class="btn btn-primary">All Comments (<%=totalComments%>)</a>
                    </div>
                    <% } %>

                    <h5 class="card-title mt-4 mb-0">Leave A Comment:</h5>
                    <% if (currentCustomer != null) { %>
                    <form class="mt-3" action="CommentURL" method="post">
                        <input type="hidden" name="service" value="addComment">
                        <input type="hidden" name="BlogID" value="<%= blog.getBlogID() %>">
                        <input type="hidden" name="CommentID" value="0">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Your Comment</label>
                                    <textarea id="message" name="CommentText" placeholder="Your Comment" rows="5" class="form-control" required=""></textarea>
                                </div>
                            </div><!--end col-->
                            <div class="col-md-12">
                                <div class="send d-grid">
                                    <button name="submit" type="submit" class="btn btn-primary">Send Message</button>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </form><!--end form-->
                    <% } else { %>
                    <p class="mt-3">Please <a href="LoginURL?service=login">Login</a> to leave a comment.</p>
                    <% } %>
                </div><!--end col-->

                <div class="col-lg-4 col-md-5 mt-4 mt-sm-0 pt-2 pt-sm-0">
                    <div class="card border-0 sidebar sticky-bar rounded shadow">
                        <div class="card-body">
                            <!-- SEARCH -->
                            <div class="widget mb-4 pb-2">
                                <h5 class="widget-title">Search</h5>
                                <div id="search2" class="widget-search mt-4 mb-0">
                                    <form role="search" method="get" action="BlogsURL" class="searchform">
                                        <div>
                                            <input type="hidden" name="service" value="listAllBlogs">
                                            <input type="text" class="border rounded" name="title" placeholder="Search Keywords...">
                                            <input type="submit" name="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- SEARCH -->
                            <!-- SOCIAL -->
                            <div class="widget">
                                <h5 class="widget-title">Follow us</h5>
                                <ul class="list-unstyled social-icon mb-0 mt-4">
                                    <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="github" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="youtube" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="gitlab" class="fea icon-sm fea-social"></i></a></li>
                                </ul><!--end icon-->
                            </div>
                            <!-- SOCIAL -->
                        </div>
                    </div>
                </div>
            </div><!--end row-->
        </div><!--end container-->

        <div class="container mt-100 mt-60">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h4 class="title mb-0">Related Post:</h4>
                    </div>
                </div><!--end col-->
            </div><!--end row-->

            <div class="row">
                <div class="col-lg-12 mt-4 pt-2">
                    <div class="slider-range-three">
                        <%
                        Vector<Blogs> blogs = (Vector<Blogs>) session.getAttribute("vectorBlogs");
                        for (Blogs currentBlog : blogs) {
                        %>
                        <div class="tiny-slide">
                            <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                <img src="images/blog/03.jpg" class="img-fluid" alt="">
                                <div class="card-body p-4">
                                    <ul class="list-unstyled mb-2">
                                        <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i><%=currentBlog.getPostTime()%></li>
                                        <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                    </ul>
                                    <a href="BlogsURL?service=detailBlog&blog=<%=currentBlog.getBlogID()%>" class="text-dark title h5"><%=currentBlog.getTitle()%></a>
                                    <div class="post-meta d-flex justify-content-between mt-3">
                                        <ul class="list-unstyled mb-0">
                                            <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                            <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                        </ul>
                                        <a href="BlogsURL?service=detailBlog&blog=<%=currentBlog.getBlogID()%>" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div><!--end col-->
            </div><!--end row-->
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
                                <form action="BlogsURL" method="get">
                                    <div class="mb-0">
                                        <input type="hidden" name="service" value="listAllBlogs">
                                        <input type="text" id="help" name="title" class="border bg-white rounded-pill" required="" placeholder="Search">
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
     <% if (currentCustomer != null) { %>
<div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header p-4 border-bottom">
        <h5 class="mb-0" id="offcanvasRightLabel">New Products Added</h5>
        <button type="button" class="btn-close d-flex align-items-center" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body p-4">
        <% 
           
            if(vectorCartItems != null && !vectorCartItems.isEmpty()) {
               
               
              for(CartItems vectorCartItem : vectorCartItems) {
        %>
        <div class="cart-item">
            <div class="d-flex align-items-center mb-3">
                <img src="images/pharmacy/shop/ashwagandha.jpg" class="img-fluid rounded shadow" style="width: 60px; height: 60px;" alt="">
                <div class="ms-3 flex-1">
                    <h6 class="mb-1"><%=vectorCartItem.getProductName()%></h6>
                    <div class="d-flex justify-content-between">
                        <p class="text-muted mb-0">Quantity: <%=vectorCartItem.getQuantity()%></p>
                        <p class="text-muted mb-0">Price: <%=vectorCartItem.getPrice()%> VND</p>

                    </div>
                </div>
            </div>
        </div>
        <%
            } }else {
        %>
        <p class="text-muted text-center " >No Products In Cart...</p>
        <%
            }
        %>
        <div class="mt-4 text-center">
            <a href="CartURL?service=showCart" class="btn btn-primary btn-sm">View cart</a>
        </div>
    </div>
</div>
        <% }%>
    <!-- Offcanvas End -->
    
    <!-- javascript -->
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- SLIDER -->
    <script src="js/tiny-slider.js"></script>
    <script src="js/tiny-slider-init.js"></script>
    <!-- Icons -->
    <script src="js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="js/app.js"></script>
    <script src="js/comment.js"></script>
</body>

</html>


