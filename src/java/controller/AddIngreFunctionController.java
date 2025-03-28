/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Function;
import entity.Ingredient;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOFunction;
import model.DAOIngredient;

/**
 *
 * @author whyth
 */
@WebServlet(name = "AddIngreFunctionController", urlPatterns = {"/AddIngreAndFunction"})
public class AddIngreFunctionController extends HttpServlet {

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

        int productID;
        try {
            productID = Integer.parseInt(request.getParameter("productID"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid or missing Product ID.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        String ingredients = request.getParameter("ingredients");
        String functions = request.getParameter("functions");

        DAOIngredient daoIngredient = new DAOIngredient();
        DAOFunction daoFunction = new DAOFunction();

        if (ingredients != null && !ingredients.trim().isEmpty()) {
            for (String ing : ingredients.split("\\n")) {
                daoIngredient.addIngredient(new Ingredient(ing.trim(), productID));
            }
        }

        if (functions != null && !functions.trim().isEmpty()) {
            for (String func : functions.split("\\n")) {
                daoFunction.addFunction(new Function(func.trim(), productID));
            }
        }

        request.setAttribute("message", "Ingredients and functions added successfully.");
        response.sendRedirect("ProductManagerDetail?pid=" + productID);
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
