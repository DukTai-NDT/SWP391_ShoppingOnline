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
@WebServlet(name = "ProductManagerController", urlPatterns = {"/ProductManager"})
public class ProductManagerController extends HttpServlet {

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

        DAOProducts pDAO = new DAOProducts();
        DAOCategories cDAO = new DAOCategories();
        DAOBrand bDAO = new DAOBrand();

        String searchQuery = request.getParameter("search");
        int page = 1;
        int productsPerPage = 10;

        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        Vector<Products> pList;
        int totalProducts;

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            totalProducts = pDAO.getTotalSearchProducts(searchQuery);
            pList = pDAO.searchProductByPage(searchQuery, page, productsPerPage);
        } else {
            totalProducts = pDAO.getTotalProducts();
            pList = pDAO.getProductsByPage(page, productsPerPage);
        }

        int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

        Vector<Categories> cList = cDAO.getCategories("SELECT * FROM dbo.Categories");
        Vector<Brand> bList = bDAO.getBrand("SELECT * FROM dbo.Brand");

        request.setAttribute("pList", pList);
        request.setAttribute("cList", cList);
        request.setAttribute("bList", bList);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("admin/shop.jsp").forward(request, response);
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


