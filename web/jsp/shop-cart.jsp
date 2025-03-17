
<%@page import="entity.Account, entity.Products,entity.Customers, java.util.Vector,entity.Cart,entity.CartItems" %>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Shop Carts</title>
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
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
   
        

    </head>
    <%

        
 Account account = (Account)session.getAttribute("dataUser");
 Customers currentCustomer = (Customers) session.getAttribute("dataCustomer");
       
 Vector<CartItems> vectorCartItems = (Vector<CartItems>)session.getAttribute("dataCartItem"); 
 String message = (String)request.getAttribute("message"); 

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
                <%
                if(currentCustomer != null){
                %>
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
                <!-- Start Dropdown -->

                <div id="navigation">
                    <!-- Navigation Menu-->   
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
                                <li><a href="aboutus.jsp" class="sub-menu-item"> About Us</a></li>
                                <li><a href="DepartmentURL?service=listAllDepartment" class="sub-menu-item">Departments</a></li>
                                <li><a href="faqs.html" class="sub-menu-item">FAQs</a></li>
                                <li><a href="BlogsURL" class="sub-menu-item">Blogs</a></li>


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
                            <h3 class="sub-title mb-4">Shop Cart</h3>
                           
                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                                <ul class="breadcrumb bg-light rounded mb-0 bg-transparent">
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                    <li class="breadcrumb-item"><a href="pharmacy.html">Pharmacy</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Shop Cart</li>
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

       <!-- Start -->
<!-- Start -->
<!-- Start -->
<!-- Start -->
<!-- Start -->
<section class="section">
    <div class="container">
        <form action="CartURL" method="POST">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="bg-white shadow rounded">
                        <table class="table table-center table-padding mb-0">
                            <thead>
                                <tr>
                                    <th class="border-bottom p-3 text-center">
                                        <input type="checkbox" id="selectAll" onchange="toggleSelectAll(this)" checked>
                                    </th>
                                    <th class="border-bottom p-3">Product</th>
                                    <th class="border-bottom text-center p-3">Price</th>
                                    <th class="border-bottom text-center p-3">Quantity</th>
                                    <th class="border-bottom text-end p-3">Total</th>
                                    <th class="border-bottom p-3 text-center">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    float totalPriceCart = 0;
                                    int index = 0;
                                 
                                    Set<Integer> unselectedItems = (Set<Integer>) session.getAttribute("unselectedItems");
                                    if (unselectedItems == null) {
                                        unselectedItems = new HashSet<>();
                                    }


                                    for (CartItems vectorCartItem : vectorCartItems) {
                                        float totalPrice = vectorCartItem.getPrice() * vectorCartItem.getQuantity();
                                        boolean isChecked = !unselectedItems.contains(vectorCartItem.getCartItemID());
                                        if (isChecked) {
                                            totalPriceCart += totalPrice;
                                        }
                                %>
                                <tr>
                                    <td class="p-3 text-center">
                                        <input type="checkbox" name="selectedItems" value="<%=vectorCartItem.getCartItemID()%>" 
                                               class="item-checkbox" <%=isChecked ? "checked" : ""%>>
                                    </td>
                                    <td class="p-3">
                                        <div class="d-flex align-items-center">
                                            <img src="images/pharmacy/shop/ashwagandha.jpg" class="img-fluid avatar avatar-small rounded shadow" style="height: 50px; width: 50px;" alt="">
                                            <h6 class="mb-0 ms-3"><%=vectorCartItem.getProductName()%></h6>
                                        </div>
                                    </td>
                                    <td class="text-center p-3"><%=vectorCartItem.getPrice()%></td>
                                    <td class="text-center shop-list p-3">
                                        <div class="qty-icons">
                                            <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown(); updateTotal();" class="btn btn-icon btn-primary minus">-</button>
                                            <input min="1" name="quantity_<%=vectorCartItem.getCartItemID()%>" id="quantity_<%=vectorCartItem.getCartItemID()%>" value="<%=vectorCartItem.getQuantity()%>" type="number" class="btn btn-icon btn-primary qty-btn quantity" onchange="updateTotal()">
                                            <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp(); updateTotal();" class="btn btn-icon btn-primary plus">+</button>
                                        </div>
                                    </td>
                                    <td class="text-end font-weight-bold p-3 total-per-item"><%=totalPrice%></td>
                                    <td class="p-3 text-center">
                                        <a href="CartURL?service=deleteCart&cartItemID=<%=vectorCartItem.getCartItemID()%>" class="text-danger"><i class="uil uil-times"></i></a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8 col-md-6 mt-4 pt-2">
                    <a href="ProductURL?service=listAllProducts" class="btn btn-primary">Shop More</a>
                    <button type="submit" name="service" value="updateCart" class="btn btn-primary">Update Cart</button>
                </div>
                <div class="col-lg-4 col-md-6 ms-auto mt-4 pt-2">
                    <div class="table-responsive bg-white rounded shadow">
                        <table class="table table-center table-padding mb-0">
                            <tbody>
                                <tr class="bg-light">
                                    <td class="h6 p-3">Total</td>
                                    <td class="text-end font-weight-bold p-3" id="cart-total"><%=totalPriceCart%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p style="color: red;"><%=(request.getAttribute("message") != null ? request.getAttribute("message") : "")%></p>
                    <div class="mt-4 pt-2 text-end">
                        <button type="submit" name="service" value="checkout" class="btn btn-primary">Proceed to checkout</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- End -->
<!-- End -->
<!-- End --><!--end section-->
<!-- End --><!--end section-->
<!-- End --><!--end section-->
    <!-- End -->
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

   <!-- Offcanvas Start -->
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
<!-- Offcanvas End -->
    <!-- Offcanvas End -->

    <!-- javascript -->
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Icons -->
    <script src="js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="js/app.js"></script>
    <!-- View more Js -->
    <script src="js/viewMore.js"></script>
    <script src="js/cart.js"></script>
    <!-- JavaScript ?? x? lý "Ch?n t?t c?" -->
    <script>
                                    function toggleSelectAll(source) {
                                        const checkboxes = document.querySelectorAll('.item-checkbox');
                                        checkboxes.forEach(checkbox => {
                                            checkbox.checked = source.checked;
                                        });
                                    }


    </script>
   
    
</body>


</html>



