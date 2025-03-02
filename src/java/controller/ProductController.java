/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import entity.Categories;
import entity.Products;
import jakarta.servlet.RequestDispatcher;
import java.util.Vector;
import model.DAOCategories;
import model.DAOProducts;

/**
 *
 * @author quang
 */
@WebServlet(name = "ProductController", urlPatterns = {"/ProductURL"})
public class ProductController extends HttpServlet {

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
        DAOProducts dao = new DAOProducts();
        Vector<Products> vector = new Vector<Products>();
        String sql = "";
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            
            if(service == null) {
                service = "listAllProducts";
            }
            if(service.equals("listAllProducts")){
                sql = "select * from Products";
            }
            if(service.equals("duoi100")) {
                sql = "select * from Products p where  p.Price <= 100000";
            }
            if(service.equals("duoi300")){
                sql = "select * from Products p where  p.Price > 100000 and p.Price <= 300000";
            }
            if(service.equals("duoi500")){
                sql = "select * from Products p where  p.Price > 300000 and p.Price <= 500000";
            }
            if(service.equals("tren500")){
                sql = "select * from Products p where  p.Price > 500000";
            }
            if(service.equals("listAllProductsLowPrice")){
                sql = "SELECT * FROM Products p ORDER BY p.Price ASC;";
            }
            if(service.equals("listAllProductsHighPrice")){
                sql = "SELECT * FROM Products p ORDER BY p.Price DESC";
            }
            
            vector = dao.getProducts(sql);
            request.setAttribute("vector", vector);
            request.getRequestDispatcher("/jsp/shop.jsp").forward(request, response);
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


