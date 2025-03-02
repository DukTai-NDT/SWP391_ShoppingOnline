///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controller;
//
//import entity.Cart;
//import entity.MedicalProducts;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.util.ArrayList;
//import java.util.Enumeration;
//import java.util.List;
//import java.util.Vector;
//import model.DAOCart;
//import model.DAOMedicalProducts;
//
///**
// *
// * @author quang
// */
//@WebServlet(name = "CartController", urlPatterns = {"/CartURL"})
//public class CartController extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        response.setContentType("text/html;charset=UTF-8");
//        DAOCart dao = new DAOCart();
//        DAOMedicalProducts daoP = new DAOMedicalProducts();
//        HttpSession session = request.getSession(true);
//
//        try (PrintWriter out = response.getWriter()) {
//            String service = request.getParameter("service");
//            if (service == null) {
//                service = "showCart";
//            }
//            if (service.equals("add2cart")) {
//                int pid = Integer.parseInt(request.getParameter("proid"));
//                Cart newCart = dao.getCart(pid);
//
//                if (session.getAttribute(pid + "") == null) {
//                    newCart.setQuantity(1);
//                    session.setAttribute(pid + "", newCart);
//
//                } else {
//                    Cart oldCart = (Cart) session.getAttribute(pid + "");
//                    oldCart.setQuantity(oldCart.getQuantity() + 1);
//                    session.setAttribute(pid + "", oldCart);
//
//                }
//
//                response.sendRedirect("CartURL");
//
//            }
//            if (service.equals("showCart")) {
//                Vector<Cart> cartList = new Vector<Cart>();
//                Enumeration<String> enu = (Enumeration<String>) session.getAttributeNames(); // Lấy lại các khóa
//                double totalPrice = 0;
//                Vector<MedicalProducts> vectorP = new Vector<MedicalProducts>();
//
//                while (enu.hasMoreElements()) {
//                    String key = (String) enu.nextElement();
//                    Object obj = session.getAttribute(key);
//                    if (obj instanceof Cart) {
//                        Cart cart = (Cart) obj;
//                        cartList.add(cart);// Thêm vào danh sách nếu không phải null
//                        totalPrice += cart.getUnitPrice() * cart.getQuantity();
//                        Vector<MedicalProducts> tempVector = daoP.getMedicalProducts("select * from MedicalProducts where MedicationID = " + cart.getProductID());
//                        if (!tempVector.isEmpty()) {
//                            vectorP.add(tempVector.get(0)); // Lấy sản phẩm đầu tiên tìm thấy
//                        }
//                    }
//                }
//                session.setAttribute("vectorP", vectorP);
//                session.setAttribute("vectorCart", cartList); // Thay đổi vector thành cartList
//                request.setAttribute("totalPrice", totalPrice);
//                request.getRequestDispatcher("/jsp/displayCart.jsp").forward(request, response);
//            }
//
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
