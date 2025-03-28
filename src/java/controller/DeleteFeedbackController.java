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
import model.DAOFeedbacks;

/**
 *
 * @author whyth
 */
@WebServlet(name="DeleteFeedbackController", urlPatterns={"/DeleteFeedback"})
public class DeleteFeedbackController extends HttpServlet {

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
    
    // Lấy ID phản hồi từ request
    String idParam = request.getParameter("id");
    if (idParam != null) {
        try {
            int feedbackID = Integer.parseInt(idParam);
            
            // Gọi DAO để xóa phản hồi
            DAOFeedbacks fbDAO = new DAOFeedbacks();
            int result = fbDAO.deleteFeedback(feedbackID);
            
            if (result > 0) {
                // Xóa thành công, chuyển hướng về trang quản lý phản hồi
                response.sendRedirect("FeedbackManager");
            } else {
                // Xóa thất bại, báo lỗi
                request.setAttribute("errorMessage", "Xóa phản hồi thất bại!");
                request.getRequestDispatcher("FeedbackManager").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "ID phản hồi không hợp lệ!");
            request.getRequestDispatcher("FeedbackManager").forward(request, response);
        }
    } else {
        request.setAttribute("errorMessage", "Không tìm thấy ID phản hồi!");
        request.getRequestDispatcher("FeedbackManager").forward(request, response);
    }
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
