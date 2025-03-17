/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Account;
import entity.TokenForgetPassword;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DAOAccount;
import model.DAOTokenForget;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ResetPassword", urlPatterns = {"/ResetPasswordURL"})
public class ResetPassword extends HttpServlet {

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
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String token = "http://localhost:8080/SWP391/ResetPasswordURL?token=" + request.getParameter("token");
            resetService resetservice = new resetService();
            DAOTokenForget dao = new DAOTokenForget();
            DAOAccount daoAcc = new DAOAccount();
            String submit = request.getParameter("submit");
            if (token != null && submit == null) {
                TokenForgetPassword tokenForget = dao.getTokenPassword(token);
                if (tokenForget == null) {
                    request.setAttribute("message", "Token invalid");
                    request.getRequestDispatcher("jsp/forgot-password.jsp").forward(request, response);
                    return;
                }
                if (tokenForget.getisUsed()) {
                    request.setAttribute("message", "Token is use");
                    request.getRequestDispatcher("jsp/forgot-password.jsp").forward(request, response);
                    return;

                }
                if (resetservice.isExpireTime(tokenForget.getExpiryTime())) {
                    request.setAttribute("mess", "token is expiry time");
                    request.getRequestDispatcher("jsp/forgot-password.jsp").forward(request, response);
                    return;
                }
                Account account = daoAcc.getAccount("Select * from Accounts where AccountID = " + tokenForget.getAccountID()).get(0);
                session.setAttribute("email", account.getEmail());
                session.setAttribute("token", tokenForget.getToken());
                request.getRequestDispatcher("jsp/reset-password.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("jsp/forgot-password.jsp").forward(request, response);
                return;

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
        String token = "http://localhost:8080/SWP391/ResetPasswordURL?token=" + request.getParameter("token");
            resetService resetservice = new resetService();
            DAOTokenForget dao = new DAOTokenForget();
            DAOAccount daoAcc = new DAOAccount();
            HttpSession session = request.getSession();
            String submit = request.getParameter("submit");
        
                String email = request.getParameter("Email");
                String password = request.getParameter("Password");
                String cfpassword = request.getParameter("CFPassword");
                if (!password.equals(cfpassword)) {
                    request.setAttribute("message", "comfim password must be same new password");
                    request.getRequestDispatcher("jsp//reset-password.jsp").forward(request, response);

                    return;
                }
                TokenForgetPassword tokenForgetPassword = new TokenForgetPassword();
                tokenForgetPassword.setToken((String) session.getAttribute("token"));
                tokenForgetPassword.setisUsed(true);
                daoAcc.changePassword(email, password);
                dao.updateStatus(tokenForgetPassword);
                 request.setAttribute("message", "Reset password successfully");
                request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
                return;

            
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
