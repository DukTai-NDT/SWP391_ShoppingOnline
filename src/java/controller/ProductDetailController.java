/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Account;
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
import entity.Feedbacks;
import entity.Function;
import entity.Ingredient;
import entity.Customers;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Vector;
import model.DAOBrand;
import model.DAOCategories;
import model.DAOCustomer;
import model.DAOFeedbacks;
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
        HttpSession session = request.getSession();
        DAOProducts dao = new DAOProducts();
        DAOBrand daobrand = new DAOBrand();
        DAOCategories daoCat = new DAOCategories();
        DAOFunction daof = new DAOFunction();
        DAOIngredient daoIngre = new DAOIngredient();
        DAOFeedbacks daoFeed = new DAOFeedbacks();
        DAOCustomer daoCus = new DAOCustomer();
        Vector<Brand> vectorBrand = new Vector<Brand>();
        Account account = (Account) session.getAttribute("dataUser");
        try (PrintWriter out = response.getWriter()) {

            /* TODO output your page here. You may use following sample code. */
            String sql = "";
            String pid = request.getParameter("pid");
            String service = request.getParameter("service");
            String submit = request.getParameter("submit");

            if (submit != null) {
                String rating = request.getParameter("rating");
                int rate = Integer.parseInt(rating);
                String content = request.getParameter("content");
                daoFeed.addFeedbacks(new Feedbacks(content, LocalDate.now(), rate, account.getAccountID(), Integer.parseInt(pid)));

                response.sendRedirect("ProductDetailURL?service=detailProduct&pid=" + pid);
                return;
            }

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
            Vector<Customers> vectorCus = daoCus.getCustomer("select * from Customers where AccountID =" + account.getAccountID());
            Customers customer = vectorCus.get(0);
            Vector<Function> vectorf = daof.getFunction("select * from [Function] where ProductID = " + pid);
            Vector<Ingredient> vectorIngre = daoIngre.getIngredient("select * from Ingredient where ProductID = " + pid);
            Vector<Feedbacks> vectorFeed = daoFeed.getFeedback("select * from Feedbacks where ProductID = " + pid);

            double averageStar = 0.0;
            int totalRating = 0;
            int star5 = 0, star4 = 0, star3 = 0, star2 = 0, star1 = 0;

            int size = vectorFeed.size(); // Số lượng đánh giá
            String formattedAverageStar = "";
            for (Feedbacks feed : vectorFeed) {
                int rating = feed.getRating();
                totalRating += rating;

                switch (rating) {
                    case 5 ->
                        star5++;
                    case 4 ->
                        star4++;
                    case 3 ->
                        star3++;
                    case 2 ->
                        star2++;
                    case 1 ->
                        star1++;
                }
            }

// Tính điểm trung bình
            if (size > 0) {
                averageStar = (double) totalRating / size;
                formattedAverageStar = String.format("%.1f", averageStar);
            }

// Tính tỷ lệ phần trăm số sao
            double with5 = (size > 0) ? (double) star5 / size * 100 : 0;
            double with4 = (size > 0) ? (double) star4 / size * 100 : 0;
            double with3 = (size > 0) ? (double) star3 / size * 100 : 0;
            double with2 = (size > 0) ? (double) star2 / size * 100 : 0;
            double with1 = (size > 0) ? (double) star1 / size * 100 : 0;

            session.setAttribute("total", size);
            session.setAttribute("with5", with5);
            session.setAttribute("with4", with4);
            session.setAttribute("with3", with3);
            session.setAttribute("with2", with2);
            session.setAttribute("with1", with1);
            session.setAttribute("star5", star5);
            session.setAttribute("star4", star4);
            session.setAttribute("star3", star3);
            session.setAttribute("star2", star2);
            session.setAttribute("star1", star1);
            session.setAttribute("averageStar", formattedAverageStar);

            session.setAttribute("vectorFeed", vectorFeed);
            session.setAttribute("product", product);
            session.setAttribute("brand", brand);
            session.setAttribute("cat", cat);
            session.setAttribute("vectorf", vectorf);
            session.setAttribute("vectorIngre", vectorIngre);
            session.setAttribute("customer", customer);
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
