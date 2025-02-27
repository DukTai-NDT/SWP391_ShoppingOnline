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
import java.time.LocalDateTime;
import java.util.Vector;
import model.DAOAccount;
import model.DAOTokenForget;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ForgotPassword", urlPatterns = {"/ForgotPasswordURL"})
public class ForgotPassword extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "forgot";
            }
            if (service.equals("forgot")) {
                String email = request.getParameter("email");

                Account acc = dao.getAAccount(email);

                if (acc == null) {
                    //request.setAttribute("message", "Account invalid !!!");
                    request.getRequestDispatcher("jsp/forgot-password.jsp").forward(request, response);
                    return;
                }
                resetService resetservice = new resetService();
                String token = "http://localhost:8080/SWP391/ResetPasswordURL?token=" + resetservice.generateToken();
                TokenForgetPassword newTokenForget = new TokenForgetPassword(token,
                        resetservice.expireDateTime(), false,
                        acc.getAccountID());

                //send link 
                DAOTokenForget daoforget = new DAOTokenForget();

                int n = daoforget.insertTokenForget(newTokenForget);
                boolean ok = resetservice.sendEmail(email, token, acc.getUserName());
               if(n == 0 || !ok){
                request.setAttribute("message", "send request not success");
                request.getRequestDispatcher("jsp/forgot-password.jsp").forward(request, response);

            }
               request.setAttribute("message", "Send request success. Check your email");
                request.getRequestDispatcher("jsp/forgot-password.jsp").forward(request, response);

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
