/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customers;
import entity.OrderDetails;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAODeliveryAddress;
import model.DAOOrderDetails;
import model.DAOOrders;
import model.DAOPayments;
import model.DAOProducts;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderHistoryController", urlPatterns = {"/OrderHistoryURL"})
public class OrderHistoryController extends HttpServlet {

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
        HttpSession session = request.getSession();
        DAOOrderDetails daoOrderDetail = new DAOOrderDetails();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "show";
            }
            if (service.equals("show")) {
                Customers customer = (Customers) session.getAttribute("dataCustomer");
                Vector<OrderDetails> vectorOrderDetail = daoOrderDetail.getOrderDetails(" SELECT  MIN(od.OrderDetailID) AS OrderDetailID, \n"
                        + "       MIN(od.Price) AS Price,\n"
                        + "	   MIN(od.Quantity) AS Quantity, \n"
                        + "	   od.ProductID,\n"
                        + "       MIN(od.OrderID) AS OrderID\n"
                        + "FROM OrderDetails od JOIN Orders o ON od.OrderID = o.OrderID\n"
                        + "WHERE o.CustomerID = " + customer.getCustomerID() + "\n"
                        + "GROUP BY od.ProductID,o.Status;");
                String message = request.getParameter("message");
                request.setAttribute("message", message);
                request.setAttribute("dataOrderHistory", vectorOrderDetail);
                request.getRequestDispatcher("jsp/order-history.jsp").forward(request, response);

            }
            if (service.equals("cancerOrder")) {
                String odid = request.getParameter("orderDetaiID");
                OrderDetails o = daoOrderDetail.getOrderDetails("select * from OrderDetails where OrderDetailID=" + odid).get(0);
                int orderID = o.getOrderID();
                if (daoOrderDetail.deleteOrderDetails(Integer.parseInt(odid)) != 0) {//kiem tra xem co xoa duoc mat hang nay khong
                    Vector<OrderDetails> vectorOrderDetail = daoOrderDetail.getOrderDetails("Select * from OrderDetails where OrderID=" + orderID);
                    if (vectorOrderDetail.isEmpty()) {//Kiem tra xem don hang con mat hang nao khong. Khong ----> Xoa don hang do
                        DAODeliveryAddress daoDeliveryAddress = new DAODeliveryAddress();
                        DAOOrders daoOrders = new DAOOrders();
                        DAOPayments daoPayments = new DAOPayments();
                        daoDeliveryAddress.deleteDeliveryAddressByOrderID(orderID);//Xoa address
                        Vector<Orders> aOrder = daoOrders.getOrders("select * from Orders where OrderID =" + orderID);
                        int paymentID = aOrder.get(0).getPaymentID();
                        System.out.println(paymentID + "OK567");
                        daoOrders.deleteOrder(orderID);//xoa order
                        daoPayments.deletePayment(paymentID);//xoa Payment
                        response.sendRedirect("OrderHistoryURL?service=show&message=Cancel the order successfully.");
                    } else {
                        System.out.println("ok 12345");
                        response.sendRedirect("OrderHistoryURL?service=show&message=Cancel the order successfully.");
                    }
                } else {
                    response.sendRedirect("OrderHistoryURL?service=show&message=Failed to cancel the order.");
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
