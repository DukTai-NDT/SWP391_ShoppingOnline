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

import entity.Categories;
import entity.Products;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import java.sql.ResultSet;
import model.DAOBrand;
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
        HttpSession session = request.getSession();
        DAOProducts dao = new DAOProducts();
        DAOBrand daoB = new DAOBrand();
        Vector<Products> vector = new Vector<Products>();
        String submit = request.getParameter("submit");
        String pname = request.getParameter("ProductName");
        String sql = "";
        DAOCategories daoCat = new DAOCategories();
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
            if(submit != null){
                sql = "select * from Products p where p.ProductName like '%"+pname+"%'";
            }
            if(service.equals("isDrug")){
                sql = "select * from Products p where p.isPrescriptionDrug = 1";
            }
            if(service.equals("notIsDrug")){
                sql = "select * from Products p where p.isPrescriptionDrug = 0";
            }
            if(service.equals("categories")){
                String cid = request.getParameter("cid");
                sql = "select * from Products P where CategoryID = " + cid;
            }
            if(service.equals("brand")){
                String bid = request.getParameter("bid");
                sql = "select * from Products where BrandID = " + bid;    
            }
            if(service.equals("ingredient")){
                String ingreid = request.getParameter("ingreid");
                sql = "select * from Products p join Ingredient i on p.ProductID = i.ProductID where i.IngredientID = " + ingreid;
            }
            Vector<Brand> vectorB = daoB.getBrand("select * from Brand");
            Vector<Categories> vectorCat = daoCat.getCategories("select * from Categories");
            vector = dao.getProducts(sql);
            session.setAttribute("vectorB", vectorB);
            session.setAttribute("vector", vector);
            session.setAttribute("vectorCat", vectorCat);
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



