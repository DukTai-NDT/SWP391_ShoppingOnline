/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Account;
import entity.CartItems;

import entity.Customers;

import entity.GoogleAccount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import java.util.Vector;
import model.DAOAccount;

import model.DAOCustomer;

import model.DAOGoogleLogin;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginURL"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOAccount dao = new DAOAccount();

        DAOCustomer daoCus = new DAOCustomer();

        HttpSession session = request.getSession();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            String code = request.getParameter("code");
            if (service == null) {
                service = "google";

            }

            if ("google".equals(service) && code != null) {
                DAOGoogleLogin daoGoogle = new DAOGoogleLogin();

                String accessToken = daoGoogle.getToken(code);
                GoogleAccount acc = daoGoogle.getUserInfo(accessToken);
                Vector<Account> vectorAcc = dao.getAccount("Select * from Accounts");
                Account accountExists = new Account();
                boolean userExists = false;
                for (Account account : vectorAcc) {
                    System.out.println("123a");
                    if (acc.getEmail().equals(account.getEmail())) {
                        accountExists.setAccountID(account.getAccountID());
                        accountExists.setUserName(account.getUserName());
                        accountExists.setPassword(account.getPassword());
                        accountExists.setRoleID(account.getRoleID());
                        accountExists.setEmail(account.getEmail());
                        accountExists.setActive(account.isActive());
                        userExists = true;
                        System.out.println("123a" + account.getAccountID());

                        break; // Thoát vòng lặp sớm nếu người dùng tồn tại
                    }
                }

                if (userExists) {
                    session.setAttribute("dataUser", accountExists);

                    // Lấy danh sách khách hàng
                    Vector<Customers> customerList = daoCus.getCustomer(
                            "select c.CustomerID,c.FirstName,c.LastName,c.Email,c.Address,c.Gender,c.Phone,c.AccountID,c.ProfileImg from Customers c join Accounts a on c.AccountID = a.AccountID where c.AccountID = "
                            + accountExists.getAccountID());
                    System.out.println("null" + accountExists);
                    for (Customers customers : customerList) {
                        System.out.println("ok" + customers);
                    }
                    if (accountExists.isActive() == false) {
                        request.setAttribute("message", "Account is block can not login");
                        request.getRequestDispatcher("jsp/login.jsp").forward(request, response);

                    }
                    // Kiểm tra xem Vector có rỗng không
                    if (customerList != null && !customerList.isEmpty()) {
                        session.setAttribute("selectedCartItems", new Vector<CartItems>());
                        Customers cus = customerList.get(0);
                        session.setAttribute("dataCustomer", cus);
                        if (accountExists.getRoleID() == 2) {

                            request.getRequestDispatcher("index.jsp").forward(request, response);
                        } else {

                            response.sendRedirect("Dashboard");

                        }

                    } else {
                        // Xử lý trường hợp không tìm thấy khách hàng
                        request.setAttribute("message", "Không tìm thấy thông tin khách hàng cho tài khoản này.");
                        request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
                    }
                } else {
                    response.sendRedirect(
                            "https://accounts.google.com/o/oauth2/auth?scope=email profile openid"
                            + "&redirect_uri=http://localhost:8080/SWP391/SignUpURL"
                            + "&response_type=code"
                            + "&client_id=585107335180-i8g585qjpvmq8rvslrel6lkgqv39fjt5.apps.googleusercontent.com"
                            + "&approval_prompt=force"
                    );
                }
            }

            if (service.equals("login")) {
                String submit = request.getParameter("submit");
                session.setAttribute("selectedCartItems", new Vector<CartItems>());
                if (submit == null) {
                    request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
                } else {
                    Account account = dao.getLogin(request.getParameter("username"), request.getParameter("password"));
                    System.out.println("ok+" + account);
                    
                   if (account == null) {
                        System.out.println("OK12DA");
                        request.setAttribute("message", "Username or password is incorrect");
                        request.getRequestDispatcher("jsp/login.jsp").forward(request, response);

                    } else if (account != null) {
                        if (account.isActive() == false) {
                        request.setAttribute("message", "Account is block can not login");
                        request.getRequestDispatcher("jsp/login.jsp").forward(request, response);

                    }
                        else if (account.getRoleID() == 2) {
                            System.out.println("OK123456789");
                            Customers cus = daoCus.getCustomer("select c.CustomerID,c.FirstName,c.LastName,c.Email,c.Address,c.Gender,c.Phone,c.AccountID,c.ProfileImg from Customers c join Accounts a on c.AccountID = a.AccountID where c.AccountID = " + account.getAccountID()).get(0);
                            System.out.println(cus);
                            session.setAttribute("dataCustomer", cus);
                            session.setAttribute("dataUser", account);
                            request.getRequestDispatcher("HomePageURL").forward(request, response);
                        } else if (account.getRoleID() == 3 || account.getRoleID() == 1) {
                            Customers cus = daoCus.getCustomer("select c.CustomerID,c.FirstName,c.LastName,c.Email,c.Address,c.Gender,c.Phone,c.AccountID,c.ProfileImg from Customers c join Accounts a on c.AccountID = a.AccountID where c.AccountID = " + account.getAccountID()).get(0);
                            session.setAttribute("dataCustomer", cus);
                            session.setAttribute("dataUser", account);
                            response.sendRedirect("Dashboard");

                        } else if (account.getRoleID() == 1003) {
                            Customers cus = daoCus.getCustomer("select c.CustomerID,c.FirstName,c.LastName,c.Email,c.Address,c.Gender,c.Phone,c.AccountID,c.ProfileImg from Customers c join Accounts a on c.AccountID = a.AccountID where c.AccountID = " + account.getAccountID()).get(0);
                            session.setAttribute("dataCustomer", cus);
                            session.setAttribute("dataUser", account);
                            response.sendRedirect("AdminRepInboxURL?service=show");

                        } else if (account.getRoleID() == 2003) {
                            Customers cus = daoCus.getCustomer("select c.CustomerID,c.FirstName,c.LastName,c.Email,c.Address,c.Gender,c.Phone,c.AccountID,c.ProfileImg from Customers c join Accounts a on c.AccountID = a.AccountID where c.AccountID = " + account.getAccountID()).get(0);
                            session.setAttribute("dataCustomer", cus);
                            session.setAttribute("dataUser", account);
                            request.getRequestDispatcher("ShipperPageURL").forward(request, response);
                        }

                    }
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
