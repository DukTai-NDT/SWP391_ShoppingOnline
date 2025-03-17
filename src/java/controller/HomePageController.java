/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Blogs;
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
import model.DAOBlogs;
import model.DAOCategories;
import model.DAOProducts;

/**
 *
 * @author quang
 */
@WebServlet(name = "HomePageController", urlPatterns = {"/HomePageURL"})
public class HomePageController extends HttpServlet {

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

            DAOCategories daocategories = new DAOCategories();
            DAOProducts daoproduct = new DAOProducts();
            DAOBlogs daoblog = new DAOBlogs();
            Vector<Categories> vcategories = daocategories.getCategories("select * from Categories");
            Vector<Products> vproduct = daoproduct.getProducts("select * from products");
            Vector<Blogs> vblog = daoblog.getBlogs("select * from blogs");
            Vector<Products> vproductspecial = daoproduct.getProducts("select * from Products\n"
                    + "where Quantity >100");
            request.setAttribute("vproductspecial", vproductspecial);
            request.setAttribute("vblog", vblog);
            request.setAttribute("vproduct", vproduct);
            request.setAttribute("vcategories", vcategories);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
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
