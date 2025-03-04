/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Brand;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import entity.Products;
import entity.Categories;
import entity.Function;
import entity.Ingredient;
import java.util.Vector;
import model.DAOBrand;
import model.DAOCategories;
import model.DAOFunction;
import model.DAOIngredient;
import model.DAOProducts;

/**
 *
 * @author quang
 */
@WebServlet(name = "ProductDetailController", urlPatterns = {"/ProductDetailURL"})
public class ProductDetailController extends HttpServlet {

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
        DAOBrand daobrand = new DAOBrand();
        DAOCategories daoCat = new DAOCategories();
        DAOFunction daof = new DAOFunction();
        DAOIngredient daoIngre = new DAOIngredient();
        Vector<Brand> vectorBrand = new Vector<Brand>();
        try (PrintWriter out = response.getWriter()) {

            /* TODO output your page here. You may use following sample code. */
            String sql = "";
            String pid = request.getParameter("pid");
            String service = request.getParameter("service");
            if (service.equals("detailProduct")) {

                sql = "select * from Products where ProductID = " + pid;
            }
            vectorBrand = daobrand.getBrand("select * from Brand b join Products p on b.BrandID = p.BrandID\n"
                    + "where p.ProductID = " + pid);
            Brand brand = vectorBrand.get(0);
            Vector<Products> vector = dao.getProducts(sql);

            Products product = vector.get(0);
            Vector<Categories> category = daoCat.getCategories("select * from Categories c join Products p on c.CategoryID = p.CategoryID\n"
                    + "where p.ProductID = " + pid);
            Categories cat = category.get(0);
            Vector<Function> vectorf = daof.getFunction("select * from [Function] where ProductID = " + pid);
            Vector<Ingredient> vectorIngre = daoIngre.getIngredient("select * from Ingredient where ProductID = " + pid);
            request.setAttribute("product", product);
            request.setAttribute("brand", brand);
            request.setAttribute("cat", cat);
            request.setAttribute("vectorf", vectorf);
            request.setAttribute("vectorIngre", vectorIngre);
            request.getRequestDispatcher("/jsp/product-detail.jsp").forward(request, response);

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
