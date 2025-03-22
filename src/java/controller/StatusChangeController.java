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
import model.DAOOrders;

/**
 *
 * @author whyth
 */
@WebServlet(name = "StatusChangeController", urlPatterns = {"/StatusChange"})
public class StatusChangeController extends HttpServlet {

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
        response.setContentType("text/plain;charset=UTF-8");

        String action = request.getParameter("action");
        if ("updateStatus".equals(action)) {
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            String currentStatus = request.getParameter("status");
            String newStatus = getNextStatus(currentStatus);

            DAOOrders dao = new DAOOrders();
            int n = dao.updateStatusOrder(newStatus, orderID);
            try (PrintWriter out = response.getWriter()) {
                if (n > 0) {
                    System.out.println("Cập nhật trạng thái thành công: " + newStatus);  // Log kiểm tra
                    out.write(newStatus);  // Trả về trạng thái mới
                } else {
                    System.out.println("Không thể cập nhật trạng thái: " + currentStatus);  // Log kiểm tra
                    out.write(currentStatus);  // Không thay đổi
                }
            }
        }
    }

    private String getNextStatus(String currentStatus) {
        switch (currentStatus) {
            case "On-prepared":
                return "Delivering";
            case "Delivering":
                return "Done";
            default:
                return currentStatus;
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
