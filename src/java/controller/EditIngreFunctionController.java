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
@WebServlet(name = "EditIngreFunctionController", urlPatterns = {"/EditIngreFunction"})
public class EditIngreFunctionController extends HttpServlet {

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
        String[] ingredientIDs = request.getParameterValues("ingredientID");
        String[] functionIDs = request.getParameterValues("functionID");

        DAOIngredient daoIngredient = new DAOIngredient();
        DAOFunction daoFunction = new DAOFunction();

// Cập nhật nguyên liệu
        if (ingredients != null && ingredientIDs != null) {
            String[] ingList = ingredients.split("\\n");
            int minLength = Math.min(ingList.length, ingredientIDs.length); // Đảm bảo không vượt quá mảng

            for (int i = 0; i < minLength; i++) {
                daoIngredient.updateIngredient(new Ingredient(
                        Integer.parseInt(ingredientIDs[i].trim()), ingList[i].trim(), productID));
            }
        }

// Cập nhật chức năng
        if (functions != null && functionIDs != null) {
            String[] funcList = functions.split("\\n");
            int minLength = Math.min(funcList.length, functionIDs.length);

            for (int i = 0; i < minLength; i++) {
                daoFunction.updateFunction(new Function(
                        Integer.parseInt(functionIDs[i].trim()), funcList[i].trim(), productID));
            }
        }

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
