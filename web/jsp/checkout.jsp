
<%@page import="model.DAODistricts,model.DAOProvinces,entity.Account, entity.Products,entity.Customers ,java.util.Vector,entity.Cart,entity.CartItems,entity.Provinces,entity.Districts, entity.Categories,entity.DeliveryAddress" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

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
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

    </head>
    <%
                Account account = (Account)session.getAttribute("dataUser");
                
                Customers customer = (Customers)session.getAttribute("dataCustomer");
                Vector<CartItems> vectorCartItems = (Vector<CartItems>)session.getAttribute("selectedCartItems"); 
                
                Vector<Categories> vcategories = (Vector<Categories>) session.getAttribute("vcategories");
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
                    if(customer != null){
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
                                <img src="<%= (customer.getProfileImg() != null && !customer.getProfileImg().isEmpty()) ? customer.getProfileImg() : "${pageContext.request.contextPath}/images/client/09.jpg" %>" class="avatar avatar-ex-small rounded-circle" alt="Profile">
                            </button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                <a class="dropdown-item d-flex align-items-center text-dark" href="#">
                                    <img src="<%= (customer.getProfileImg() != null && !customer.getProfileImg().isEmpty()) ? customer.getProfileImg() : "${pageContext.request.contextPath}/images/client/09.jpg" %>" class="avatar avatar-md-sm rounded-circle border shadow" alt="Profile">
                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1"><%= customer.getFirstName() + " " + customer.getLastName() %></span>
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
                    <ul class="navigation-menu nav-left nav-light">

                        <li class="parent-menu-item">
                            <a href="ProductURL?service=listAllProducts">Shop</a><span class="menu-arrow"></span>
                        </li>
                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Categories</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <%for (Categories cate : vcategories){%>
                                <li><a href="ProductURL?service=categories&cid=<%=cate.getCategoryID()%>" class="sub-menu-item"> <%=cate.getCategoryName()%></a></li>
                                    <%}%>
                            </ul>
                        </li>

                        <li><a href="BlogsURL">Blog</a></li>       





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
                            <h3 class="sub-title mb-4">Checkout</h3>
                            <p class="para-desc mx-auto text-muted">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                                <ul class="breadcrumb bg-light rounded mb-0 bg-transparent">
                                    <li class="breadcrumb-item"><a href="index.jsp">Doctris</a></li>
                                    <li class="breadcrumb-item"><a href="pharmacy.html">Pharmacy</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
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
                <div class="row">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <div class="card rounded shadow p-4 border-0">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="h5 mb-0">Your cart</span>

                            </div>
                            <ul class="list-group mb-3 border">


                                <%  if (vectorCartItems != null && !vectorCartItems.isEmpty()) {
                                           float totalPriceCart = 0;
                                            
                                           for (CartItems vectorCartItem : vectorCartItems) {
                                             float total = vectorCartItem.getQuantity() * vectorCartItem.getPrice();
                                             totalPriceCart += total;
                                %>
                                <li class="d-flex justify-content-between lh-sm p-3 border-bottom">
                                    <div>
                                        <h6 class="my-0"><%=vectorCartItem.getProductName()%></h6>
                                        <small class="text-muted">Quantity:<%=vectorCartItem.getQuantity()%></small>
                                    </div>
                                    <span class="text-muted">VND:<%=total%></span>
                                </li>
                                <%}%>
                                <li class="d-flex justify-content-between p-3">
                                    <span>Total (VND)</span>
                                    <strong>VND:<%=totalPriceCart%></strong>
                                    <input type="hidden" name="totalprice" value="<%= totalPriceCart %>">
                                </li>
                                <%}else{%>
                                <h5 style="color: red;">

                                    You haven't selected any products, so you can't checkout. Please return to  
                                    <a href="ProductURL?service=listAllProducts" style="color: blue; text-decoration: underline;">shop</a>.

                                </h5>

                                <%}%>
                            </ul>


                        </div>
                    </div><!--end col-->

                    <div class="col-md-7 col-lg-8">
                        <div class="card rounded shadow p-4 border-0">
                            <h5 class="mb-3">Billing address</h5>
                            <p style="color: red;"><%=(message!=null?message:"")%></p>

                            <!-- Danh sách địa chỉ cũ -->
                            <div class="col-12">
                                <label for="savedAddress" class="form-label">Choose address</label>
                                <% Vector<DeliveryAddress> savedAddresses = (Vector<DeliveryAddress>) session.getAttribute("savedAddresses"); 
                                DAODistricts daoDistricts = new DAODistricts();
                                DAOProvinces daoProvinces = new DAOProvinces();
                                %>
                                <select class="form-select form-control" id="savedAddress" name="savedAddress">
                                    <option value="">Choose saver address</option>
                                    <%if(savedAddresses != null){%>
                                    <% for (DeliveryAddress deliveryAddress : savedAddresses) {%>
                                    <option value="<%= deliveryAddress.getDeliveryAddressID() %>" data-province="<%= deliveryAddress.getProvinceID()%>" 
                                            data-district="<%= deliveryAddress.getDistrictID() %>" data-address="<%= deliveryAddress.getAddressDetail() %>">
                                        <%= deliveryAddress.getAddressDetail() %> - <%= daoDistricts.getDistrictName(deliveryAddress.getDistrictID()) %> - <%= daoProvinces.getProvinceName(deliveryAddress.getProvinceID()) %>
                                    </option>
                                    <% } %>
                                    <option value="new">Add new address</option>
                                    <%}else{%>
                                     <option value="new">Add new address</option>
                                    <% } %>
                                </select>
                            </div>

                            <form action="DeliveryAddressURL" method="get">
                                <input type="hidden" name="service" value="province" />
                                <div class="col-md-5">
                                    <label for="country" class="form-label">Provinces</label>
                                    <%Vector<Provinces> provinces = (Vector<Provinces>) session.getAttribute("provinces");
                                    String provinceName = (String) session.getAttribute("provinceName");%>
                                    <select class="form-select form-control" id="provinceId" name="provinceId" onchange="this.form.submit()" required>
                                        <%if(provinceName.isEmpty()){%>
                                        <option value="">Choose one....</option>
                                        <%}else{%>
                                        <option value=""><%=provinceName%></option>
                                        <%}%>
                                        <%for (Provinces province : provinces) { %>
                                        <option value="<%= province.getProvinceID()%>"><%= province.getProvinceName() %></option>
                                        <% } %>

                                    </select>
                                    <div class="invalid-feedback">
                                        Please select a valid country.
                                    </div>
                                </div>

                            </form>
                            <form action="DeliveryAddressURL" method="get">
                                <input type="hidden" name="service" value="district" />
                                <div class="col-md-4">
                                    <label for="state" class="form-label">District</label>
                                    <%Vector<Districts> districts = (Vector<Districts>) session.getAttribute("districts");
                                    String districtsName = (String) session.getAttribute("districtsName");%>
                                    <select class="form-select form-control" id="districtId" name="districtId" onchange="this.form.submit()" required>
                                        <%if(districtsName.isEmpty()){%>
                                        <option value="">Choose one....</option>
                                        <%}else{%>
                                        <option value=""><%=districtsName%></option>
                                        <%}%>
                                        <%for (Districts district : districts) { %>
                                        <option value="<%= district.getDistrictID()%>"><%= district.getDistrictName() %></option>
                                        <% } %>

                                    </select>
                                    <div class="invalid-feedback">
                                        Please provide a valid state.
                                    </div>
                                </div>
                            </form>
                            <%
                            String provinceID = (String) session.getAttribute("provinceId");
                            String districtID = (String)session.getAttribute("districtIdStr") ;
                            %>
                            <form action="CheckoutURL" method="post" class="needs-validation" novalidate>
                                <input type="hidden" name="provinceID" value="<%=provinceID%>" />
                                <input type="hidden" name="districtID" value="<%=districtID%>" />   
                                <input type="hidden" name="service" value="checkout" />   

                                <div class="row g-3">
                                    <div class="col-sm-6">
                                        <label for="firstName" class="form-label">First name</label>
                                        <input type="text" class="form-control" id="firstName" placeholder="First Name" value=""
                                               name="firstName" required>
                                        <div class="invalid-feedback">
                                            Valid first name is required.
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <label for="lastName" class="form-label">Last name</label>
                                        <input type="text" class="form-control" id="lastName" placeholder="Last Name" value=""
                                               name="lastName"  required>
                                        <div class="invalid-feedback">
                                            Valid last name is required.
                                        </div>
                                    </div>
                                    <%if(customer.getPhone() != null){%>
                                    <div class="col-12">
                                        <label for="phone" class="form-label">Phone number</label>
                                        <div class="input-group has-validation">

                                            <input type="text" class="form-control" id="phone" placeholder="Phone number"
                                                   name="phone" value="<%=customer.getPhone()%>"  >
                                        </div>
                                    </div>
                                    <%}else{%>
                                    <div class="col-12">
                                        <label  for="phone" class="form-label" style="color: red" >Bạn chưa cập nhật số điện thoại. Ấn vào đây để cập nhật trang cá nhân <a href="#">Cập nhật tài khoản</a></label>
                                        <label for="phone" class="form-label" >Phone number</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control" id="phone" placeholder="Phone number"
                                                   name="phone" value="<%=customer.getPhone()%>"  >
                                        </div>
                                    </div>
                                    <%}%>

                                    <div class="col-12">
                                        <label for="email" class="form-label">Email <span
                                                class="text-muted">(Optional)</span></label>
                                        <input type="email" class="form-control" id="email" placeholder="you@example.com"
                                               name="email" value="<%=account.getEmail()%>" readonly>
                                        <div class="invalid-feedback">
                                            Please enter a valid email address for shipping updates.
                                        </div>
                                    </div>



                                    <div class="col-12">
                                        <label for="address" class="form-label">Address Detail</label>
                                        <input type="text" class="form-control" id="address" placeholder="1234 Main St"
                                               name="address"  required>
                                        <div class="invalid-feedback">
                                            Please enter your shipping address.
                                        </div>
                                    </div>
                                </div>




                                <h5 class="mb-3 mt-4 pt-4 border-top">Payment</h5>

                                <div class="my-3">
                                    <div class="form-check">
                                        <input id="credit" value="COD" type="radio" class="form-check-input"
                                               name="paymentMethod"  checked required>
                                        <label class="form-check-label" for="credit">Thanh toán khi nhận hàng(COD)</label>
                                    </div>
                                    <div class="form-check">
                                        <input id="debit" value="VNPAY"  type="radio" class="form-check-input"
                                               name="paymentMethod"  required>
                                        <label class="form-check-label" for="debit">VNPay</label>
                                    </div>

                                </div>


                                <%  if(!vectorCartItems.isEmpty()){%>
                                <button class="w-100 btn btn-primary" type="submit">Continue to checkout</button>
                                <%}%>
                            </form>
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
                                    <form action="ProductURL">
                                        <div class="mb-0">
                                            <input type="text" id="help" name="ProductName" class="border bg-white rounded-pill" required="" placeholder="Search">
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
        <% if (customer != null) { %>
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
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="js/app.js"></script>
        <script>
                                        document.addEventListener("DOMContentLoaded", function () {
                                            let savedAddressSelect = document.getElementById("savedAddress");

                                            if (savedAddressSelect) {
                                                savedAddressSelect.addEventListener("change", function () {
                                                    let selectedOption = this.options[this.selectedIndex];

                                                    if (selectedOption.value !== "new" && selectedOption.value !== "") {
                                                        // Lấy dữ liệu từ thuộc tính data-*
                                                        let provinceId = selectedOption.getAttribute("data-province");
                                                        let districtId = selectedOption.getAttribute("data-district");
                                                        let addressDetail = selectedOption.getAttribute("data-address");

                                                        // Gán giá trị vào các ô input
                                                        document.getElementById("provinceId").value = provinceId;
                                                        document.getElementById("districtId").value = districtId;
                                                        document.getElementById("address").value = addressDetail;
                                                        document.querySelector("input[name='provinceID']").value = provinceId;
                                                        document.querySelector("input[name='districtID']").value = districtId;

                                                    } else {
                                                        document.getElementById("provinceId").value = "";
                                                        document.getElementById("districtId").value = "";
                                                        document.getElementById("address").value = ""; // Xóa input hidden
                                                        document.querySelector("input[name='provinceID']").value = "";
                                                        document.querySelector("input[name='districtID']").value =  "";
                                                    }
                                                });
                                            }
                                        });


        </script>
    </body>

</html>