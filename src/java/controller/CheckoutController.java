/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import entity.Cart;
import entity.CartItems;
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
import java.time.LocalDate;
import java.util.Vector;
import model.DAOCart;
import model.DAOCartItem;
import model.DAOOrderDetails;
import model.DAOOrders;

/**
 *
 * @author quang
 */
@WebServlet(name="CheckoutController", urlPatterns={"/CheckoutURL"})
public class CheckoutController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
           Customers user = (Customers) request.getSession().getAttribute("user");
        
        if (user != null) {
            // Tạo đơn hàng
            Orders order = new Orders(0, 0, "Pending", user.getCustomerID(), LocalDate.now(), 1); // Ví dụ đơn hàng tạm thời
            DAOOrders daoOrders = new DAOOrders();
            daoOrders.addOrder(order);

            // Chuyển giỏ hàng thành lịch sử mua hàng
            DAOCart daoCart = new DAOCart();
            Vector<Cart> cartList = daoCart.getCart("SELECT * FROM Cart WHERE CustomerID = " + user.getCustomerID());
            for (Cart cart : cartList) {
                DAOCartItem daoCartItem = new DAOCartItem();
                Vector<CartItems> cartItems = daoCartItem.getCartItem("SELECT * FROM CartItem WHERE CartID = " + cart.getCartID());
                for (CartItems cartItem : cartItems) {
                    OrderDetails orderDetails = new OrderDetails((float)cartItem.getPrice(), cartItem.getQuantity(), cartItem.getProductID(), order.getOrderID());
                    DAOOrderDetails daoOrderDetails = new DAOOrderDetails();
                    daoOrderDetails.addOrderDetails(orderDetails);
                }
                // Sau khi thanh toán, xóa giỏ hàng
                daoCart.deleteCart(cart.getCartID());
            }

            response.sendRedirect("orderHistory.jsp");
        } else {
            response.sendRedirect("login.jsp?error=true");
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
