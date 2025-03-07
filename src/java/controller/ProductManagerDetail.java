/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Brand;
import entity.Categories;
import entity.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOBrand;
import model.DAOCategories;
import model.DAOProducts;

/**
 *
 * @author whyth
 */
@WebServlet(name = "ProductManagerDetail", urlPatterns = {"/ProductManagerDetail"})
public class ProductManagerDetail extends HttpServlet {

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

        String pidStr = request.getParameter("pid");
        if (pidStr == null || pidStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is missing");
            return;
        }

        try {
            int pid = Integer.parseInt(pidStr);
            DAOProducts pDAO = new DAOProducts();
            DAOBrand bDAO = new DAOBrand();
            DAOCategories cDAO = new DAOCategories();

            // Lấy sản phẩm từ database
            Vector<Products> productList = pDAO.getProducts("SELECT * FROM dbo.Products WHERE ProductID = " + pid);

            if (productList.isEmpty()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }

            Products product = productList.get(0); // Lấy sản phẩm đầu tiên

            // Lấy Brand theo BrandID
            Vector<Brand> brands = bDAO.getBrand("SELECT * FROM dbo.Brand WHERE BrandID = " + product.getBrandID());
            Brand brand = brands.isEmpty() ? null : brands.get(0);

            // Lấy Category theo CategoryID
            Vector<Categories> categories = cDAO.getCategories("SELECT * FROM dbo.Categories WHERE CategoriesID = " + product.getCategoryID());
            Categories category = categories.isEmpty() ? null : categories.get(0);

            // Gửi dữ liệu đến JSP
            request.setAttribute("pdetail", product);
            request.setAttribute("brandDetail", brand);
            request.setAttribute("categoryDetail", category);
            request.getRequestDispatcher("admin/product-detail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Product ID format");
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
