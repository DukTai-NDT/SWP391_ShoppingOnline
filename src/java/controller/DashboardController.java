/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import entity.Blogs;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOProducts;
import model.DAOAccount;
import model.DAOBlogs;
import model.DAOOrderDetails;
import model.DAOOrders;

/**
 *
 * @author whyth
 */
@WebServlet(name="DashboardController", urlPatterns={"/Dashboard"})
public class DashboardController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet requests
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session =request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        
        DAOOrderDetails odDAO = new DAOOrderDetails();
        DAOProducts pDAO = new DAOProducts();
        DAOAccount aDAO = new DAOAccount();
        DAOBlogs bDAO = new DAOBlogs();
        DAOOrders oDao = new DAOOrders();
        
        Vector<Blogs> vectorAllBlogs = bDAO.getBlogs("select * from Blogs");
                session.setAttribute("vectorBlogs", vectorAllBlogs);
        int productCount = pDAO.countProducts();
        int accountCount = aDAO.countAccounts();
        int blogCount = bDAO.countBlogs();
        int orderCount = oDao.countAccounts();
        int orderOnPrepared = oDao.countOnPreparedOrders();
        int orderDelivering = oDao.countDeliveringOrders();
        int orderDone = oDao.countDoneOrders();
        float totalSales = odDAO.getTotalSales();
        
        request.setAttribute("totalSales", totalSales);
        request.setAttribute("productCount", productCount);
        request.setAttribute("accountCount", accountCount);
        request.setAttribute("blogCount", blogCount);
        request.setAttribute("orderCount", orderCount);
        request.setAttribute("orderOnPrepared", orderOnPrepared);
        request.setAttribute("orderDelivering", orderDelivering);
        request.setAttribute("orderDone", orderDone);
        
        request.getRequestDispatcher("admin/dashboard.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
