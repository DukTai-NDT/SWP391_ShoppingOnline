/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Account;
import entity.Blogs;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.time.LocalDate;
import model.DAOBlogs;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AminAddBlogController", urlPatterns = {"/adminaddblog"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)

public class AminAddBlogController extends HttpServlet {

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

         String title = request.getParameter("title");
        String date = request.getParameter("date");
//        String customerIDStr = request.getParameter("customerID");
        String description = request.getParameter("description:");
        Part part = request.getPart("image");
        String fileName = part.getSubmittedFileName();

        String uploadDir = "D:\\FU_Learning\\SUM2024\\CSD201\\Code\\SWP391\\web\\images\\blogs";
        File uploadFolder = new File(uploadDir);

        String path = uploadDir + File.separator + fileName;
        InputStream is = part.getInputStream();
        boolean test = uploadFile(is, path);

        DAOBlogs dblogs = new DAOBlogs();
        dblogs.insertBlog(date, title, description, fileName, true);
        response.sendRedirect("BlogManagement");

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
        
        String title = request.getParameter("title");
        String date = request.getParameter("date");
//        String customerIDStr = request.getParameter("customerID");
        String description = request.getParameter("description:");
        Part part = request.getPart("image");
        String fileName = part.getSubmittedFileName();

        String uploadDir = "D:\\FU_Learning\\SUM2024\\CSD201\\Code\\SWP391\\web\\images\\blogs";
        File uploadFolder = new File(uploadDir);

        String path = uploadDir + File.separator + fileName;
        InputStream is = part.getInputStream();
        boolean test = uploadFile(is, path);

        DAOBlogs dblogs = new DAOBlogs();
        dblogs.insertBlog(date, title, description, fileName, true);
        response.sendRedirect("BlogManagement");
    }

    public boolean uploadFile(InputStream is, String path) {
        boolean test = false;
        try (FileOutputStream fops = new FileOutputStream(path)) {
            byte[] buffer = new byte[1024]; // Đọc từng khối 1KB
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                fops.write(buffer, 0, bytesRead);
            }
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
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
