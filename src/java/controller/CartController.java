
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Account;
import entity.Cart;
import entity.CartItems;
import entity.Customers;
import entity.Products;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import model.DAOCart;
import model.DAOCartItem;
import model.DAOCustomer;
import model.DAOProducts;

/**
 *
 * @author quang
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartURL"})
public class CartController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        DAOCustomer daoCus = new DAOCustomer();
        DAOCart daoCart = new DAOCart();
        DAOProducts daoPro = new DAOProducts();
        DAOCartItem daoCartItem = new DAOCartItem();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            Account acc = (Account) session.getAttribute("dataUser");
            System.out.println(acc);
            if (service == null) {
                service = "showCart";
            }
            if (service.equals("showCart")) {
                Customers cus = (Customers) session.getAttribute("dataCustomer");
                Vector<CartItems> vectorCartItems = daoCartItem.getCartItem("  select ci.CartItemID,ci.CartID,ci.ProductID,ci.ProductName,ci.Price,ci.Quantity from CartItem ci join Cart c on ci.CartID = c.CartID where c.CustomerID = " + cus.getCustomerID());
                request.setAttribute("dataCartItem", vectorCartItems);
                for (CartItems vectorCartItem : vectorCartItems) {
                    System.out.println(vectorCartItem.getQuantity());
                }
                request.getRequestDispatcher("/jsp/shop-cart.jsp").forward(request, response);
            }
            if (service.equals("add2cart")) {
                int pid = Integer.parseInt(request.getParameter("pid"));

                Customers cus = daoCus.getCustomer("select c.CustomerID,c.FirstName,c.LastName,c.Email,c.Address,c.Gender,c.Phone,c.AccountID from Customers c join Accounts a on c.AccountID = a.AccountID where c.AccountID = " + acc.getAccountID()).get(0);
                session.setAttribute("dataCustomer", cus);
                LocalDate now = LocalDate.now();
                Vector<Cart> vector = daoCart.getCart("select * from Cart");
                int cnt = 0;
                for (Cart cart : vector) {
                    if (now.equals(cart.getCreateDate())) {
                        if (cart.getCustomerID() == cus.getCustomerID()) {
                            cnt++;
                        }
                    }
                }
                if (cnt == 0) {
                    int n = daoCart.addCart(new Cart(cus.getCustomerID(), true, LocalDate.now()));
                }
                Cart cart = daoCart.getCart("  select * from Cart where CreateDate like '" + now + "' and CustomerID = " + cus.getCustomerID()).get(0);
                request.setAttribute("dataCart", cart);
                Products pro = daoPro.getProducts("select * from Products where ProductID = " + pid).get(0);
                CartItems cartItem = new CartItems(cart.getCartID(), pid, pro.getProductName(), pro.getPrice(), 1);
                Vector<CartItems> vectorCartItem = daoCartItem.getCartItem("select * from CartItem");
                int isExist = 0;
                for (CartItems cartItems : vectorCartItem) {
                    if (cartItems.getCartID() == cartItem.getCartID() && cartItem.getProductID() == cartItems.getProductID()) {
                        isExist++;
                        int cartItemnumber = daoCartItem.updateQuantityCartItem(cartItems.getQuantity() + 1, cartItems.getCartItemID());
                        System.out.println("ok" + isExist);
                    }
                }
                if (isExist == 0) {
                    int cartItemnumber = daoCartItem.addCartItem(cartItem);
                }
                response.sendRedirect("CartURL?service=showCart");
            }
            if (service.equals("updateCart")) {
                Map<String, String[]> parameterMap = request.getParameterMap();

                for (String paramName : parameterMap.keySet()) {
                    if (paramName.startsWith("quantity_")) {
                        
                        int cartItemID = Integer.parseInt(paramName.split("_")[1]);

                        
                        int newQuantity = Integer.parseInt(request.getParameter(paramName));

                       
                        daoCartItem.updateQuantityCartItem(newQuantity, cartItemID);
                    }
                }

              
                response.sendRedirect("CartURL?service=showCart");
            }
            if(service.equals("deleteCart")){
                int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
                int n = daoCartItem.deleteCartItem(cartItemID);
                 response.sendRedirect("CartURL?service=showCart");
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



