/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import entity.OrderDetails;
import entity.Orders;
import entity.Products;
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
import model.DAOPaymentMethod;
import model.DAOPayments;
import model.DAOProducts;

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
        DAOPayments pDAO = new DAOPayments();
        DAOProducts prdDAO = new DAOProducts();
        DAOPaymentMethod pmDao = new DAOPaymentMethod();

        // Pagination setup
        int page = 1;
        int ordersPerPage = 10;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        String orderType = request.getParameter("orderType");
        if (orderType == null || (!orderType.equalsIgnoreCase("newest") && !orderType.equalsIgnoreCase("oldest"))) {
            orderType = "newest"; // Mặc định newest
        }

        Vector<Orders> oList = oDAO.filterOrders(orderType);

        int totalOrders = oList.size();
        int totalPages = (int) Math.ceil((double) totalOrders / ordersPerPage);

        int startIndex = (page - 1) * ordersPerPage;
        int endIndex = Math.min(startIndex + ordersPerPage, totalOrders);
        Vector<Orders> paginatedOrders = new Vector<>(oList.subList(startIndex, endIndex));

        Vector<OrderDetails> odList = odDAO.getOrderDetails("SELECT * FROM dbo.OrderDetails");

        // Tạo maps chứa thông tin bổ sung
        Map<Integer, String> customerUsernames = new HashMap<>();
        Map<Integer, String> customerNames = new HashMap<>();
        Map<Integer, String> paymentMethods = new HashMap<>();
        Map<Integer, Products> productDetails = new HashMap<>();

        // Lấy thông tin khách hàng & phương thức thanh toán
        for (Orders order : paginatedOrders) {
            int customerID = order.getCustomerID();
            customerUsernames.putIfAbsent(customerID, cDAO.getUsernameByCustomerID(customerID));
            customerNames.putIfAbsent(customerID, cDAO.getCustomerNameByID(customerID));

            int paymentID = order.getPaymentID();
            paymentMethods.putIfAbsent(paymentID, pmDao.getMethodPaymentName(pDAO.getMethodByPaymentID(paymentID)));
        }

        // Lấy thông tin sản phẩm
        for (OrderDetails od : odList) {
            int productID = od.getProductID();
            productDetails.putIfAbsent(productID, prdDAO.getProductByID(productID));
        }

        // Set attributes cho JSP
        request.setAttribute("oList", paginatedOrders);
        request.setAttribute("odList", odList);
        request.setAttribute("customerUsernames", customerUsernames);
        request.setAttribute("customerNames", customerNames);
        request.setAttribute("paymentMethods", paymentMethods);
        request.setAttribute("productDetails", productDetails);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("orderType", orderType);

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
