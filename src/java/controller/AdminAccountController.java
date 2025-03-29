/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.DAOAccount;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminAccountController", urlPatterns = {"/AdminAccounts"})
public class AdminAccountController extends HttpServlet {

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
        DAOAccount dAccount = new DAOAccount();
        List<Account> lista;
        String accountTypeParam = request.getParameter("accountType");
        int accountType = 0;
        if (accountTypeParam != null && !accountTypeParam.trim().isEmpty()) {
            accountType = Integer.parseInt(accountTypeParam);
        }
        switch (accountType) {
            case 1:
                lista = dAccount.getOnStaff();
                break;
            case 1003:
                lista = dAccount.getOnCustomerCare();
                break;
            case 2:
                lista = dAccount.getOnCustomer();
                break;
            case 2003:
                lista = dAccount.getOnShipper();
                break;
            case 3:
                lista = dAccount.getOnAdmin();
                break;
            default:
                lista = dAccount.getAllAccounts();
                break;
        }

        request.setAttribute("lista", lista);
        request.setAttribute("accountType", accountType);
        request.getRequestDispatcher("/admin/adminAccounts.jsp").forward(request, response);
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
