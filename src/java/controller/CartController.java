/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import entity.Account;
import entity.Cart;
import entity.CartItems;
import entity.Customers;
import entity.Orders;
import entity.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.DAOAccount;
import model.DAOCart;
import java.time.LocalDate;
import java.time.LocalDateTime;
import model.DAOCartItem;
import model.DAOOrderDetails;
import model.DAOOrders;

/**
 *
 * @author Admin
 */
@WebServlet(name="CartController", urlPatterns={"/CartURL"})
public class CartController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       DAOCart daoCart = new DAOCart();
        DAOCartItem daoCartItem = new DAOCartItem();
        DAOOrders daoOrders = new DAOOrders();
        DAOOrderDetails daoOrderDetails = new DAOOrderDetails();
        HttpSession session = request.getSession();
       
       String service = request.getParameter("service");
        if (service == null) {
            service = "showCart";
        }
        
        // Lấy thông tin người dùng từ session
        Account account = (Account) session.getAttribute("dataUser");
        if (account == null && !service.equals("showCart")) {
            request.setAttribute("message", "Please login to manage your cart!");
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
            return;
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
