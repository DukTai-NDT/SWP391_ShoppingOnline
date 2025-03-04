/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import entity.Cart;
import entity.CartItems;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.Vector;
import model.DAOCartItem;

/**
 *
 * @author Admin
 */
@WebServlet(name="CartItemController", urlPatterns={"/CartItemURL"})
public class CartItemController extends HttpServlet {
   
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
        DAOCartItem daoCartItem= new DAOCartItem();
         HttpSession session = request.getSession();
           try (PrintWriter out = response.getWriter()) {
           
               String service = request.getParameter("service");
               String CustomerID = (String) session.getAttribute("CustomerID");
               
               if(service == null){
                   service ="showCart";
                   return;
               }
               
               if(service.equals("add2Cart")){
                 int pid = Integer.parseInt(request.getParameter("pid"));
                   CartItems newCartItems = daoCartItem.getCartItem(pid);
                   String keyCart =pid + "_" +CustomerID;
                   if (session.getAttribute(keyCart)== null){
                       newCartItems.setQuantity(1);
                       session.setAttribute(keyCart, newCartItems);
                   }
                   else{
                       CartItems oldItems = (CartItems) session.getAttribute(keyCart);
                       oldItems.setQuantity(oldItems.getQuantity() +1);
                       session.setAttribute(keyCart, oldItems);
                   }
                 response.sendRedirect("ProductURL");
                 
               }
               
               if(service.equals("showCart")){
                   Vector<CartItems> vector= new Vector<>();
                   Enumeration<String> enu = session.getAttributeNames();
                    while (enu.hasMoreElements()) {
                    String key = enu.nextElement();
                    Object obj = session.getAttribute(key);

             if (obj instanceof CartItems) {
                 CartItems cartItems = (CartItems) obj;
                vector.add(cartItems);
             }
               }
                session.setAttribute("vectorCart", vector);
                request.getRequestDispatcher("shop-cart.jsp").forward(request, response);    
      
           }
               
                    if (service.equals("removeCart")) {
                        
                    int pid = Integer.parseInt(request.getParameter("pid"));
                  
                   String keyCart =pid + "_" +CustomerID;
                   CartItems oldItemss= (CartItems) session.getAttribute(keyCart);
                   if(oldItemss.getQuantity() >1){
                    oldItemss.setQuantity(oldItemss.getQuantity() - 1);
                    session.setAttribute(keyCart, oldItemss);
                   }
                   else{
                        session.removeAttribute(keyCart);
                   }
                    response.sendRedirect("CartItemsURL");       
                    }
               if (service.equals("removeAllCart")) {
                
                Enumeration<String> enu = session.getAttributeNames();

                
                while (enu.hasMoreElements()) {
                    String key = enu.nextElement();

                   
                    Object obj = session.getAttribute(key);
                    if (obj instanceof Cart) {
                        session.removeAttribute(key);
                    }
                }

                
                response.sendRedirect("ProductURL");
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
