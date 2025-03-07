/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customers;
import entity.DeliveryAddress;
import entity.Orders;
import entity.Payments;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import model.DAODeliveryAddress;
import model.DAOOrders;
import model.DAOPaymentMethod;
import model.DAOPayments;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutURL"})
public class CheckoutController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            DAOPaymentMethod daoPaymentMethod = new DAOPaymentMethod();
            DAOPayments daoPayment = new DAOPayments();
            DAOOrders daoOrder = new DAOOrders();
            DAODeliveryAddress daoDeliAddress = new DAODeliveryAddress();
            Customers customer = (Customers) session.getAttribute("dataCustomer");
            String service = request.getParameter("service");
            if (service == null) {
                response.sendRedirect("DeliveryAddressURL?service=first");
            }
            if (service.equals("theFirst")) {
                response.sendRedirect("DeliveryAddressURL?service=first");
            }
            if (service.equals("checkout")) {
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String paymentMethod = request.getParameter("paymentMethod");
                String provinceId = request.getParameter("provinceID");
                String districtId = request.getParameter("districtID");
                LocalDate orderDate = LocalDate.now();
                LocalDate deliveryDate = orderDate.plusDays(2);
                System.out.println(firstName);
                System.out.println(lastName);
                System.out.println(phone);
                System.out.println(address);
                System.out.println(paymentMethod);
                System.out.println(provinceId);
                System.out.println(districtId);
                System.out.println(orderDate);
                System.out.println(deliveryDate);
               
                
                try {
                    int paymentMethodID = 0;
                    if (paymentMethod.equals("COD")) {
                        paymentMethodID = daoPaymentMethod.getMethodPaymentID("Cash on Delivery (COD)");
                    } else {
                        paymentMethodID = daoPaymentMethod.getMethodPaymentID("VNPay");
                    }
                    // Add Payment
                    int paymentID = daoPayment.addPayment(new Payments(paymentMethodID, false));
                    if (paymentID == 0) {
                        request.setAttribute("message", "Payment saving failed");
                        request.getRequestDispatcher("jsp/checkout.jsp").forward(request, response);
                        return;
                    }

                    // Add Order
                    int orderID = daoOrder.addOrder(new Orders("Pending Confirmation", customer.getCustomerID(), orderDate, deliveryDate, paymentMethodID));
                    if (orderID == 0) {
                          request.setAttribute("message", "Order processing failed");
                        request.getRequestDispatcher("jsp/checkout.jsp").forward(request, response);
                        return;
                      
                    }

                    // Add Delivery Address
                    int addressID = daoDeliAddress.addDeliveryAddress(new DeliveryAddress(address, daoOrder.getLastOrderID(), Integer.parseInt(provinceId), Integer.parseInt(districtId)));
                    if (addressID == 0) {
                          request.setAttribute("message", "Address saving failed");
                        request.getRequestDispatcher("jsp/checkout.jsp").forward(request, response);
                        return;
                      
                    }

                    request.getRequestDispatcher("index.jsp").forward(request, response);

                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Checkout Failler");
                        request.getRequestDispatcher("jsp/checkout.jsp").forward(request, response);
                }
            }
        }
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
