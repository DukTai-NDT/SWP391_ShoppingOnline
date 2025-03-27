<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="entity.Account, entity.Customers, entity.OrderDetails, model.DAOProducts, model.DAOOrderDetails, java.util.Vector"%>
<%@ page import="entity.Products, entity.Categories, entity.CartItems,entity.ChatHistory" %>

<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="utf-8" />
        <title>Doctris - Live Chat Support</title>
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
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <style>
            /* Chat Styles */
            .chat-container {
                width: 100%;
                max-width: 800px;
                height: 70vh;
                /* Giảm chiều cao để phù hợp với layout có navbar */
                display: flex;
                flex-direction: column;
                background: white;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
                margin: 0 auto;
                /* Căn giữa */
            }

            .chat-header {
                background: #007bff;
                color: white;
                text-align: center;
                padding: 15px;
                font-size: 18px;
                font-weight: bold;
            }

            .chat-box {
                flex: 1;
                overflow-y: auto;
                padding: 20px;
                display: flex;
                flex-direction: column;
                scroll-behavior: smooth;
            }

            .message {
                max-width: 70%;
                padding: 10px 15px;
                border-radius: 15px;
                margin-bottom: 10px;
                word-wrap: break-word;
                position: relative;
            }

            .message.user {
                background: #007bff;
                color: white;
                align-self: flex-end;
            }

            .message.other {
                background: #e9ecef;
                color: #333;
                align-self: flex-start;
            }

            .message small {
                display: block;
                opacity: 0.7;
                font-size: 0.8em;
                margin-top: 5px;
            }

            .chat-input {
                display: flex;
                padding: 10px;
                background: #f1f1f1;
            }

            .chat-input input {
                flex: 1;
                padding: 10px;
                border: none;
                border-radius: 20px;
                outline: none;
            }

            .chat-input button {
                margin-left: 10px;
                padding: 10px 20px;
                background: #007bff;
                color: white;
                border: none;
                border-radius: 20px;
                cursor: pointer;
            }

            .chat-input button:hover {
                background: #0056b3;
            }
            .delete-btn {
                text-decoration: none;
                color: #ff4444;
                padding: 5px;
                margin-left: 5px;
                font-size: 14px;
            }

            .delete-btn:hover {
                color: #cc0000;
            }
        </style>
    </head>
    <% 
            DAOProducts daoProduct = new DAOProducts();
            DAOOrderDetails daoOrderDetail = new DAOOrderDetails();
    %>
    <% String message=(String)request.getAttribute("message"); %>
    <% Vector<Categories> vcategories = (Vector<Categories>) session.getAttribute("vcategories"); %>
    <% Vector<Products> vproduct = (Vector<Products>) session.getAttribute("vproduct"); %>
    <% Vector<Products> vproductspecial = (Vector<Products>) session.getAttribute("vproductspecial"); %>
    <% Account account=(Account)session.getAttribute("dataUser");
        Customers currentCustomer=(Customers) session.getAttribute("dataCustomer"); 
        Vector<CartItems> vectorCartItems = (Vector<CartItems>)session.getAttribute("dataCartItem");
       
      Vector<ChatHistory> dataChat=( Vector<ChatHistory>) request.getAttribute("dataChat");
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

        <!-- Navbar Start -->
        <header id="topnav" class="defaultscroll sticky">
            <div class="container">
                <!-- Logo container -->
                <a class="logo" href="index.jsp">
                    <img src="images/logo-dark.png"
                         height="24" class="logo-light-mode"
                         alt="">
                    <img src="images/logo-light.png"
                         height="24" class="logo-dark-mode"
                         alt="">
                </a>
                <!-- Logo End -->

                <!-- Start Mobile Toggle -->
                <div class="menu-extras">
                    <div class="menu-item">
                        <!-- Mobile menu toggle -->
                        <a class="navbar-toggle"
                           id="isToggle"
                           onclick="toggleMenu()">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                        <!-- End mobile menu toggle -->
                    </div>
                </div>
                <!-- End Mobile Toggle -->

                <!-- Start Dropdown -->
                <ul class="dropdowns list-inline mb-0">
                    <% if(currentCustomer !=null){ %>
                    <li class="list-inline-item mb-0">
                        <a href="javascript:void(0)"
                           data-bs-toggle="offcanvas"
                           data-bs-target="#offcanvasRight"
                           aria-controls="offcanvasRight">
                            <div
                                class="btn btn-icon btn-pills btn-primary">
                                <i data-feather="shopping-cart"
                                   class="fea icon-sm"></i>
                            </div>
                        </a>
                    </li>
                    <li
                        class="list-inline-item mb-0 ms-1">
                        <a href="javascript:void(0)"
                           class="btn btn-icon btn-pills btn-primary"
                           data-bs-toggle="offcanvas"
                           data-bs-target="#offcanvasTop"
                           aria-controls="offcanvasTop">
                            <i
                                class="uil uil-search"></i>
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
                                <a class="dropdown-item text-dark" href="OrderHistoryURL?service=show"><span class="mb-0 d-inline-block me-1"><i class="uil uil-receipt align-middle h6"></i></span>Order History</a>
                                <a class="dropdown-item text-dark" href="ChatURL">
                                    <span class="mb-0 d-inline-block me-1">
                                        <i class="uil uil-comment-dots align-middle h6"></i>
                                    </span>Chat
                                </a>
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
                        <a
                            href="SignUpURL?service=signup">Sign
                            up</a>
                        <span>|</span>
                        <a
                            href="LoginURL?service=login">Log
                            in</a>
                    </div>
                    <%}%>
                </ul>
                <!-- End Dropdown -->

                <div id="navigation">
                    <!-- Navigation Menu-->
                    <ul
                        class="navigation-menu nav-left nav-light">
                        <li class="parent-menu-item">
                            <a href="ProductURL?service=listAllProducts"
                               class="sub-menu-item">Shop</a><span
                               class="menu-arrow"></span>
                        </li>
                        <li
                            class="has-submenu parent-parent-menu-item">
                            <a
                                href="javascript:void(0)">Categories</a><span
                                class="menu-arrow"></span>
                            <ul class="submenu">
                                <%for (Categories cat : vcategories){%>
                                <li><a href="ProductURL?service=categories&cid=<%=cat.getCategoryID()%>"
                                       class="sub-menu-item">
                                        <%=cat.getCategoryName()%>
                                    </a></li>
                                    <%}%>
                            </ul>
                        </li>
                        <li><a href="BlogsURL">Blog </a>
                        </li>
                    </ul><!--end navigation menu-->
                </div><!--end navigation-->
            </div><!--end container-->
        </header><!--end header-->
        <!-- Navbar End -->
        <section class="bg-half-170 d-table w-100 bg-light">
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center">
                            <h3 class="sub-title mb-4">Customer Chat</h3>
                            <p class="para-desc mx-auto text-muted">The chat system allows users to communicate online with each other or with the support team.</p>
                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">

                            </nav>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- Start Chat Section -->
        <section class="section">
            <div class="container">
                <div class="chat-container">
                    <div class="chat-header">Live Chat
                        Support</div>
                    <div class="chat-box">
                        <%for (ChatHistory chatHistory : dataChat) {%>
                        <%
                        if (!chatHistory.isIsDeleted()) { // Tin nhắn chưa bị xóa
                            if (chatHistory.getCustomerID_1() == currentCustomer.getCustomerID()) {
                        %>
                        <!-- Tin nhắn của người dùng -->
                        <div class="message user">
                            <%=chatHistory.getDescription()%>
                            <small><%=chatHistory.getChatDateTime()%></small>
                            <a href="ChatURL?service=deleteChat&chatid=<%=chatHistory.getChat_HistoryID()%>" 
                               class="delete-btn" 
                               onclick="return confirm('Bạn có chắc muốn xóa tin nhắn này?')">
                                <i class="fas fa-trash-alt">Xoa</i>
                            </a>
                        </div>
                        <%  } else { %>
                        <!-- Tin nhắn của người khác -->
                        <div class="message other">
                            <%=chatHistory.getDescription()%>
                            <small><%=chatHistory.getChatDateTime()%></small>
                        </div>
                        <%  }
                        } else { // Tin nhắn đã bị xóa
                            if (chatHistory.getCustomerID_1() == currentCustomer.getCustomerID()) {
                        %>
                        <!-- Tin nhắn đã xóa (user) -->
                        <div class="message user">
                            The chat is delete
                        </div>
                        <%  } else { %>
                        <!-- Tin nhắn đã xóa (other) -->
                        <div class="message other">
                            The chat is delete
                        </div>
                        <%  }
    } %>
                        <%}%>
                    </div>
                    <div class="chat-input">
                        <!-- Form gửi tin nhắn tới Servlet -->
                        <form action="ChatURL" method="POST" style="display: flex; width: 100%;">
                            <input type="hidden" name="service" value="sendMess">
                            <input type="text" name="message" placeholder="Nhập tin nhắn..." required>
                            <button type="submit">Send</button>
                        </form>
                    </div>
               
            </div>
        </div>
    </section><!--end section-->
    <!-- End Chat Section -->

    <!-- Back to top -->
    <a href="#" onclick="topFunction()" id="back-to-top"
       class="btn btn-icon btn-pills btn-primary back-to-top"><i
            data-feather="arrow-up"
            class="icons"></i></a>
    <!-- Back to top -->

    <!-- JavaScript -->
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Icons -->
    <script src="js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="js/app.js"></script>
</body>

</html>