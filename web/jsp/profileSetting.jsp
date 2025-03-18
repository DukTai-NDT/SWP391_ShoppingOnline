<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,entity.Customers,entity.Cart,entity.CartItems, jakarta.servlet.http.HttpSession, entity.Categories"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Profile Setting</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="https://shreethemes.in" />
        <meta name="Version" content="v1.2.0" />
        <!-- Favicon -->
        <link rel="shortcut icon" href="images/favicon.ico.png" />
        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <!-- Select2 CSS -->
        <link href="css/select2.min.css" rel="stylesheet" />
        <!-- Date Picker CSS -->
        <link rel="stylesheet" href="css/flatpickr.min.css" />
        <link href="css/jquery.timepicker.min.css" rel="stylesheet" />
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" />
        <link href="css/remixicon.css" rel="stylesheet" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet" />
        <!-- Custom CSS -->
        <link href="css/style.min.css" rel="stylesheet" id="theme-opt" />
        <link href="css/style.css" rel="stylesheet" />
        <!-- Custom CSS to Remove White Space -->
        <style>
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }
            .bg-hero {
                flex: 1 0 auto; /* Allows the section to grow and fill available space */
            }
            footer.bg-footer {
                flex-shrink: 0; /* Prevents footer from shrinking */
                margin-top: auto; /* Pushes footer to the bottom */
            }
            .container:last-child {
                margin-bottom: 0; /* Remove any default margin on the last container */
            }
            .footer-bar {
                padding-bottom: 0; /* Remove extra padding at the bottom of footer-bar */
            }
        </style>
    </head>
    <body>
        <!-- Preloader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>

        <% 
            Customers currentCustomer = (Customers) session.getAttribute("dataCustomer");
            Vector<Categories> vectorCat = (Vector<Categories>)session.getAttribute("vectorCat");
            Vector<CartItems> vectorCartItems = (Vector<CartItems>)session.getAttribute("dataCartItem"); 
        %>

        <!-- Navbar -->
        <header id="topnav" class="defaultscroll sticky">
            <div class="container">
                <a class="logo" href="index.jsp">
                    <img src="images/logo-dark.png" height="24" class="logo-light-mode" alt="Logo" />
                    <img src="images/logo-light.png" height="24" class="logo-dark-mode" alt="Logo" />
                </a>
                <div class="menu-extras">
                    <div class="menu-item">
                        <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                    </div>
                </div>
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
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="<%= (currentCustomer.getProfileImg() != null && !currentCustomer.getProfileImg().isEmpty()) ? currentCustomer.getProfileImg() : "${pageContext.request.contextPath}/images/client/09.jpg" %>" class="avatar avatar-ex-small rounded-circle" alt="Profile" />
                            </button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px">
                                <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                                    <img src="<%= (currentCustomer.getProfileImg() != null && !currentCustomer.getProfileImg().isEmpty()) ? currentCustomer.getProfileImg() : "${pageContext.request.contextPath}/images/client/09.jpg" %>" class="avatar avatar-md-sm rounded-circle border shadow" alt="Profile" />
                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1"><%=currentCustomer.getFirstName() + " " +  currentCustomer.getLastName()  %></span>
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
                </ul>
                <div id="navigation">
                    <ul class="navigation-menu nav-left">
                        <li class="parent-menu-item">
                            <a href="ProductURL?service=listAllProducts">Shop</a><span class="menu-arrow"></span>
                        </li>
                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Categories</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <%for (Categories cate : vectorCat){%>
                                <li><a href="ProductURL?service=categories&cid=<%=cate.getCategoryID()%>" class="sub-menu-item"> <%=cate.getCategoryName()%></a></li>
                                    <%}%>
                            </ul>
                        </li>

                        <li><a href="BlogsURL" class="menu-item">Blogs</a></li>
                    </ul>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <section class="bg-hero">
            <div class="container">
                <div class="row mt-lg-5">
                    <div class="col-md-6 col-lg-4">
                        <div class="rounded shadow overflow-hidden sticky-bar">
                            <div class="card border-0">
                                <img src="images/bg/bg-profile.jpg" class="img-fluid" alt="Profile Background" />
                            </div>
                            <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                <img src="<%= (currentCustomer.getProfileImg() != null && !currentCustomer.getProfileImg().isEmpty()) ? currentCustomer.getProfileImg() : "${pageContext.request.contextPath}/images/client/09.jpg" %>" class="rounded-circle shadow-md avatar avatar-md-md" alt="Profile" />
                                <h5 class="mt-3 mb-1"><%=currentCustomer.getFirstName() + " " + currentCustomer.getLastName()%></h5>
                            </div>
                            <div class="list-unstyled p-4">
                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-user align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Gender</h6>
                                    <p class="text-muted mb-0 ms-2"><%=currentCustomer.getGender() != null ? currentCustomer.getGender() : "N/A"%></p>
                                </div>
                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-book-open align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Phone No.</h6>
                                    <p class="text-muted mb-0 ms-2"><%=currentCustomer.getPhone() != null ? currentCustomer.getPhone() : "N/A"%></p>
                                </div>
                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-italic align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Address</h6>
                                    <p class="text-muted mb-0 ms-2"><%=currentCustomer.getAddress() != null ? currentCustomer.getAddress() : "N/A"%></p>
                                </div>
                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-envelope align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Email</h6>
                                    <p class="text-muted mb-0 ms-2"><%=currentCustomer.getEmail() != null ? currentCustomer.getEmail() : "N/A"%></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-6 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <div class="card border-0 shadow overflow-hidden">
                            <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded-0 shadow overflow-hidden bg-light mb-0" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link rounded-0 active" id="overview-tab" data-bs-toggle="pill" href="#pills-overview" role="tab" aria-controls="pills-overview" aria-selected="true">
                                        <div class="text-center pt-1 pb-1">
                                            <h4 class="title fw-normal mb-0">Profile Settings</h4>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content p-4" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                                    <h5 class="mb-0">Personal Information :</h5>
                                    <div class="row align-items-center mt-4">
                                        <div class="col-lg-2 col-md-4">
                                            <img src="<%= (currentCustomer.getProfileImg() != null && !currentCustomer.getProfileImg().isEmpty()) ? currentCustomer.getProfileImg() : "${pageContext.request.contextPath}/images/client/09.jpg" %>" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="Profile" />
                                        </div>
                                        <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h6>Upload your picture</h6>
                                            <p class="text-muted mb-0">For best results, use an image at least 256px by 256px in either .jpg or .png format</p>
                                        </div>
                                        <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                            <form action="CustomerURL" method="post" enctype="multipart/form-data" id="uploadForm" class="d-inline-block">
                                                <input type="hidden" name="service" value="uploadProfileImg" />
                                                <input type="hidden" name="CustomerID" value="<%=currentCustomer.getCustomerID()%>" />
                                                <input type="file" name="profileImg" id="profileImgInput" accept=".jpg,.png" style="display: none;" onchange="this.form.submit();" />
                                                <button type="button" class="btn btn-primary" onclick="document.getElementById('profileImgInput').click()">Upload</button>
                                            </form>
                                            <form action="CustomerURL" method="post" class="d-inline-block ms-2">
                                                <input type="hidden" name="service" value="removeProfileImg" />
                                                <input type="hidden" name="CustomerID" value="<%=currentCustomer.getCustomerID()%>" />
                                                <button type="submit" class="btn btn-soft-primary">Remove</button>
                                            </form>
                                        </div>
                                    </div>
                                    <form class="mt-4" action="CustomerURL" method="post">
                                        <input type="hidden" name="service" value="updateCustomer" />
                                        <input type="hidden" name="CustomerID" value="<%=currentCustomer.getCustomerID()%>" />
                                        <input type="hidden" name="profileImg" value="<%=currentCustomer.getProfileImg() != null ? currentCustomer.getProfileImg() : ""%>" />
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">First Name</label>
                                                    <input name="FirstName" type="text" class="form-control" value="<%=currentCustomer.getFirstName() != null ? currentCustomer.getFirstName() : ""%>" placeholder="First Name" />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Last Name</label>
                                                    <input name="LastName" type="text" class="form-control" value="<%=currentCustomer.getLastName() != null ? currentCustomer.getLastName() : ""%>" placeholder="Last Name" />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Your Email</label>
                                                    <input name="Email" type="email" class="form-control" value="<%=currentCustomer.getEmail() != null ? currentCustomer.getEmail() : ""%>" placeholder="Your email"  readonly/>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Gender</label>
                                                    <select name="Gender" class="form-control">
                                                        <option value="Male" <%= ("Male".equals(currentCustomer.getGender())) ? "selected" : "" %>>Male</option>
                                                        <option value="Female" <%= ("Female".equals(currentCustomer.getGender())) ? "selected" : "" %>>Female</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Phone no.</label>
                                                    <input name="Phone" type="text" class="form-control" value="<%=currentCustomer.getPhone() != null ? currentCustomer.getPhone() : ""%>" placeholder="Phone no." />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Address</label>
                                                    <input name="Address" type="text" class="form-control" value="<%=currentCustomer.getAddress() != null ? currentCustomer.getAddress() : ""%>" placeholder="Address" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input type="submit" name="submit" class="btn btn-primary" value="Save Changes" />
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

        <!-- Footer -->
        <footer class="bg-footer">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-4 mb-0 mb-md-4 pb-0 pb-md-2">
                        <a href="#" class="logo-footer">
                            <img src="images/logo-light.png" height="22" alt="Logo" />
                        </a>
                        <p class="mt-4 me-xl-5">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                    </div>
                    <div class="col-xl-7 col-lg-8 col-md-12">
                        <div class="row">
                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Contact us</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li class="d-flex align-items-center"><i data-feather="mail" class="fea icon-sm text-foot align-middle"></i><a href="mailto:contact@example.com" class="text-foot ms-2">contact@example.com</a></li>
                                    <li class="d-flex align-items-center"><i data-feather="phone" class="fea icon-sm text-foot align-middle"></i><a href="tel:+152534-468-854" class="text-foot ms-2">+152 534-468-854</a></li>
                                    <li class="d-flex align-items-center"><i data-feather="map-pin" class="fea icon-sm text-foot align-middle"></i><a href="javascript:void(0)" class="text-foot ms-2">View on Google map</a></li>
                                </ul>
                                <ul class="list-unstyled social-icon footer-social mb-0 mt-4">
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container mt-5">
                    <div class="pt-4 footer-bar">
                        <div class="row align-items-center">
                            <div class="col-sm-6">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0">© <script>document.write(new Date().getFullYear());</script> Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="https://shreethemes.in" target="_blank" class="text-reset">Shreethemes</a>.</p>
                                </div>
                            </div>
                            <div class="col-sm-6 mt-4 mt-sm-0">
                                <ul class="list-unstyled footer-list text-sm-end text-center mb-0">
                                    <li class="list-inline-item"><a href="terms.html" class="text-foot me-2">Terms</a></li>
                                    <li class="list-inline-item"><a href="privacy.html" class="text-foot me-2">Privacy</a></li>
                                    <li class="list-inline-item"><a href="aboutus.html" class="text-foot me-2">About</a></li>
                                    <li class="list-inline-item"><a href="contact.html" class="text-foot me-2">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Back to Top -->
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>

        <!-- Offcanvas Search -->
        <div class="offcanvas bg-white offcanvas-top" tabindex="-1" id="offcanvasTop">
            <div class="offcanvas-body d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="text-center">
                                <h4>Search now.....</h4>
                                <div class="subcribe-form mt-4">
                                    <form>
                                        <div class="mb-0">
                                            <input type="text" id="help" name="name" class="border bg-white rounded-pill" required="" placeholder="Search" />
                                            <button type="submit" class="btn btn-pills btn-primary">Search</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Offcanvas Settings -->
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
        <!-- JavaScript -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/select2.min.js"></script>
        <script src="js/select2.init.js"></script>
        <script src="js/flatpickr.min.js"></script>
        <script src="js/flatpickr.init.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/timepicker.init.js"></script>
        <script src="js/feather.min.js"></script>
        <script src="js/app.js"></script>
        <script>
            feather.replace(); // Initialize feather icons
            function toggleMenu() {
                document.getElementById('navigation').classList.toggle('open');
            }
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
    </body>
</html>