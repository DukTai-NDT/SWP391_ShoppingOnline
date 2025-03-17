/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import entity.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOProducts;

/**
 *
 * @author whyth
 */
@WebServlet(name="EditProductController", urlPatterns={"/EditProduct"})
public class EditProductController extends HttpServlet {

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
        
        int productID = Integer.parseInt(request.getParameter("loadProductID"));
        String productName = request.getParameter("loadProductName");
        float price = Float.parseFloat(request.getParameter("loadPrice"));
        String description = request.getParameter("loadDescription");
        String unitPrice = request.getParameter("loadUnitPrice");
        int categoryID = Integer.parseInt(request.getParameter("loadCategoryID"));
        int brandID = Integer.parseInt(request.getParameter("loadBrandID"));
        boolean isPrescriptionDrug = request.getParameter("loadIsPrescriptionDrug") != null;
        int quantity = Integer.parseInt(request.getParameter("loadQuantity"));
        String image = request.getParameter("loadImage");
        
        
        DAOProducts pDAO = new DAOProducts();
        pDAO.updateProduct(new Products(productID, productName, price, description, unitPrice, categoryID, brandID, isPrescriptionDrug, quantity, image));
        response.sendRedirect("ProductManagerDetail?pid=" + productID);
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
