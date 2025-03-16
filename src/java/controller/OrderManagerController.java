/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import entity.OrderDetails;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;
import model.DAOCustomer;
import model.DAOOrderDetails;
import model.DAOOrders;
import model.DAOPayments;

/**
 *
 * @author whyth
 */
@WebServlet(name = "OrderManagerController", urlPatterns = {"/OrderManager"})
public class OrderManagerController extends HttpServlet {

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
    DAOOrders oDAO = new DAOOrders();
    DAOOrderDetails odDAO = new DAOOrderDetails();
    DAOCustomer cDAO = new DAOCustomer();
    DAOPayments pDAO = new DAOPayments(); // Add DAOPayments
    
    // Lấy danh sách tất cả orders & order details
    Vector<Orders> oList = oDAO.getOrders("SELECT * FROM Orders");
    Vector<OrderDetails> odList = odDAO.getOrderDetails("SELECT * FROM dbo.OrderDetails");
    
    // Tạo Map để lưu customerID -> username
    Map<Integer, String> customerUsernames = new HashMap<>();
    // Tạo Map để lưu paymentID -> method
    Map<Integer, String> paymentMethods = new HashMap<>();
    
    for (Orders order : oList) {
        int customerID = order.getCustomerID();
        if (!customerUsernames.containsKey(customerID)) {
            customerUsernames.put(customerID, cDAO.getUsernameByCustomerID(customerID));
        }
        
        int paymentID = order.getPaymentID();
        if (!paymentMethods.containsKey(paymentID)) {
            paymentMethods.put(paymentID, pDAO.getMethodByPaymentID(paymentID));
        }
    }
    
    request.setAttribute("oList", oList);
    request.setAttribute("customerUsernames", customerUsernames);
    request.setAttribute("paymentMethods", paymentMethods);
    request.setAttribute("odList", odList);
    request.getRequestDispatcher("admin/orders-management.jsp").forward(request, response);
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
