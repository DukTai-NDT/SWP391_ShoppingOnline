<%-- 
    Document   : admin-blog
    Created on : Mar 3, 2025, 4:39:21 PM
    Author     : Admin
--%>

<%@page import="entity.Products,entity.ChatHistory,java.util.Vector, entity.Categories, entity.CartItems, entity.Customers,entity.Account,model.DAOChatHistory,model.DAOCustomer" %>
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
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

        <style>
            /* Đảm bảo layout chính */
            .chat-section {
                display: flex;
                height: calc(100vh - 200px); /* Trừ đi chiều cao của header và footer */
                margin-top: 20px;
            }

            /* Thanh bên trái (danh sách customer) */
            .customer-list {
                width: 250px;
                background-color: #fff;
                border-right: 1px solid #e9ecef;
                padding: 15px;
                overflow-y: auto;
            }

            .customer-list a {
                display: flex;
                align-items: center;
                text-decoration: none;
                color: #495057;
                padding: 10px;
                margin-bottom: 5px;
                border-radius: 5px;
                transition: all 0.3s ease;
            }

            .customer-list a:hover {
                background-color: #f8f9fa;
            }

            .customer-list a.active {
                background-color: #e8f0fe;
                color: #1a73e8;
                font-weight: 500;
            }

            .customer-list a img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-right: 10px;
            }

            /* Phần chat chính */
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
                padding: 15px;
                border-bottom: 1px solid #e9ecef;
                display: flex;
                align-items: center;
                background-color: #f8f9fa;
            }

            .chat-header img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-right: 10px;
            }
            .chat-box {
                    flex: 1;
                    overflow-y: auto;
                    padding: 20px;
                    display: flex;
                    flex-direction: column;
                    scroll-behavior: smooth;
                }

            .chat-header h3 {
                font-size: 16px;
                margin: 0;
                color: #1a73e8;
            }

            .chat-body {
                flex: 1;
                padding: 20px;
                overflow-y: auto;
                background-color: #f0f2f5;
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

            .message div {
                max-width: 60%;
                padding: 10px 15px;
                border-radius: 15px;
                position: relative;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            }

            .message.received div {
                background-color: #fff;
                color: #333;
            }

            .message.sent div {
                background-color: #1a73e8;
                color: #fff;
            }

            .message.received div::before {
                content: '';
                position: absolute;
                left: -8px;
                top: 50%;
                transform: translateY(-50%);
                border-right: 8px solid #fff;
                border-top: 8px solid transparent;
                border-bottom: 8px solid transparent;
            }

            .message.sent div::after {
                content: '';
                position: absolute;
                right: -8px;
                top: 50%;
                transform: translateY(-50%);
                border-left: 8px solid #1a73e8;
                border-top: 8px solid transparent;
                border-bottom: 8px solid transparent;
            }

            .chat-footer {
                padding: 15px;
                border-top: 1px solid #e9ecef;
                background-color: #fff;
            }

            .chat-footer form {
                display: flex;
                align-items: center;
            }

            .chat-footer input[type="text"] {
                flex: 1;
                padding: 10px 15px;
                border: 1px solid #e9ecef;
                border-radius: 20px;
                outline: none;
                font-size: 14px;
            }

            .chat-footer input[type="hidden"] {
                display: none;
            }

            .chat-footer button {
                background-color: #1a73e8;
                color: #fff;
                border: none;
                padding: 10px 20px;
                margin-left: 10px;
                border-radius: 20px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .chat-footer button:hover {
                background-color: #1557b0;
            }
        </style>
    </head>

    <body>
        <%
            Account account = (Account) session.getAttribute("dataUser");
            Customers currentCustomer = (Customers) session.getAttribute("dataCustomer");
            Vector<Integer> dataCustomerInbox = (Vector<Integer>) session.getAttribute("dataCustomerInbox");
        %>

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


                    

                        <li class="sidebar-dropdown">
                            <a href="AdminRepInboxURL"><i class="uil uil-comment me-2 d-inline-block"></i>Reply Customer</a>

                        </li>
                       
                    </ul>
                    <!-- sidebar-menu  -->
                </div>
                <!-- sidebar-content  -->
                <ul class="sidebar-footer list-unstyled mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <a href="chat" class="btn btn-icon btn-pills btn-soft-primary">
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
                        </div>

                        <ul class="list-unstyled mb-0">
                            <%
                                if (currentCustomer != null) {
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
                            <% } else { %>
                            <div class="auth-links">
                                <a href="SignUpURL?service=signup">Sign up</a>
                                <span>|</span>
                                <a href="LoginURL?service=login">Log in</a>
                            </div>
                            <% } %>
                        </ul>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="mb-0">Reply Inbox Customer</h5>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="chat-section">
                                    <!-- Nhóm danh sách customer -->
                                    <div class="customer-list">
                                        <%
                                        DAOCustomer daoCustomer = new DAOCustomer();
                                        int index = 0;
                                        for (Integer integer : dataCustomerInbox) {
                                    
                                            if(index == 0){
                                        %>
                                        <a href="AdminRepInboxURL?service=listChat&cid=<%=integer%>"  class="active">
                                            <img src="<%=daoCustomer.getCustomerImgByID(integer)%>" alt="Avatar">
                                            <%=daoCustomer.getUsernameByCustomerID(integer)%>
                                        </a>
                                        <%
                                            index++;
                                            }else{
                                        %>
                                        <a href="AdminRepInboxURL?service=listChat&cid=<%=integer%>" >
                                            <img src="<%=daoCustomer.getCustomerImgByID(integer)%>" alt="Avatar">
                                            <%=daoCustomer.getUsernameByCustomerID(integer)%>
                                        </a>
                                        <%}}%>
                                    </div>
                                    <%
                                    String showMess = (String) request.getAttribute("showMess");
                                    if(!showMess.equals("none")){
                                    Vector<ChatHistory> dataChat=( Vector<ChatHistory>) request.getAttribute("dataChat");
                                    String cid = (String) request.getAttribute("cid");
                                    
                                    %>
                                    <!-- Phần chat chính -->
                                    <%
                                    if(!dataChat.isEmpty()){
                                    int customerID = Integer.parseInt(cid); 
                                        
                                    %>
                                    <div class="chat-container">
                                        <div class="chat-header">
                                            <img src="<%=daoCustomer.getCustomerImgByID(customerID)%>" alt="Avatar">
                                            <h3 id="chat-header-name"> <%=daoCustomer.getUsernameByCustomerID(customerID)%></h3>
                                        </div>
                                        <div class="chat-box">
                                            <%for (ChatHistory chatHistory : dataChat) {%>
                                            <%
                                            if(chatHistory.getCustomerID_1() == currentCustomer.getCustomerID()){
                                            %>
                                            <!-- Tin nhắn mẫu tĩnh -->
                                            <div class="message user">
                                                <%=chatHistory.getDescription()%>
                                                <small><%=chatHistory.getChatDateTime()%></small>
                                            </div>
                                            <%}else{%>
                                            <div class="message other">
                                                <%=chatHistory.getDescription()%>
                                                <small><%=chatHistory.getChatDateTime()%></small>
                                            </div>
                                            <%} }%>
                                        </div>
                                        <div class="chat-footer">
                                            <form action="AdminRepInboxURL"   method="POST">
                                                  <input type="hidden" name="service" value="sendMess">
                                                  <input type="hidden" name="cid" value="<%=cid%>">
                                                <input type="text" name="message" placeholder="Enter message" required>
                                                <button type="submit">Send</button>
                                            </form>
                                        </div>
                                    </div>
                                    <%}}%>
                                </div>
                            </div>
                        </div><!--end row-->
                    </div><!--end container-->
                </div>

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

        <!-- javascript -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="js/app.js"></script>

        <!-- JavaScript để xử lý highlight và cập nhật tên -->
        <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                            const customerLinks = document.querySelectorAll('.customer-list a');
                                            const chatHeaderName = document.querySelector('#chat-header-name');
                                            const selectedCustomerInput = document.querySelector('#selected-customer');

                                            customerLinks.forEach(link => {
                                                link.addEventListener('click', function (e) {
//                                                    e.preventDefault(); // Ngăn chặn hành vi mặc định của link

                                                    // Xóa class active khỏi tất cả các link
                                                    customerLinks.forEach(l => l.classList.remove('active'));

                                                    // Thêm class active cho link được nhấp
                                                    this.classList.add('active');

                                                    // Cập nhật tên trong chat-header
                                                    const customerName = this.getAttribute('data-customer');
                                                    chatHeaderName.textContent = customerName;

                                                    // Cập nhật giá trị của input hidden để gửi đúng customer khi submit form
                                                    selectedCustomerInput.value = customerName;
                                                });
                                            });
                                        });
        </script>
    </body>

</html>