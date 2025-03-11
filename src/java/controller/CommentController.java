/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Blogs;
import entity.Comment;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Vector;
import model.DAOBlogs;
import model.DAOComment;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CommentController", urlPatterns = {"/CommentURL"})
public class CommentController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            DAOBlogs daoBlog = new DAOBlogs();
            DAOComment daoComment = new DAOComment();
            Integer customerId = (Integer) session.getAttribute("customerId");

            if (customerId == null) {
                response.sendRedirect("LoginURL?service=login");
                return;
            }
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllBlogs";
            }

            if (service.equals("listAllComment")) {
                String sql = "SELECT * FROM Blogs";
                Vector<Blogs> vectorBlogs = daoBlog.getBlogs(sql);

                session.setAttribute("vectorBlogs", vectorBlogs);

                for (Blogs blog : vectorBlogs) {
                    System.out.println("BlogID: " + blog.getBlogID());
                    Vector<Comment> comments = daoComment.getCommentsByBlogId(blog.getBlogID());
                    System.out.println("ok1");
                    request.setAttribute("comments" + blog.getBlogID(), comments);
                }

                RequestDispatcher dispatch = request.getRequestDispatcher("blogDetail.jsp");
                dispatch.forward(request, response);
            }

            if (service.equals("addComment")) {
                String CommentText = request.getParameter("CommentText");
                String BlogID = request.getParameter("BlogID");

                if (CommentText == null || CommentText.trim().isEmpty() || BlogID == null) {
                    response.sendRedirect("blogDetail.jsp?error=Missing+parameters");
                    return;
                }

                int blogID = Integer.parseInt(BlogID);

                LocalDate postDate = LocalDate.now();

                Comment com = new Comment(0, blogID, customerId, CommentText, postDate);

                daoComment.addComment(com);

                Vector<Comment> comments = daoComment.getCommentsByBlogId(blogID);

                session.setAttribute("comments" + blogID, comments);

                response.sendRedirect("BlogsURL?service=detailBlog&blog=" + blogID);
            }

            if (service.equals("deleteComment")) {
                String commentIdStr = request.getParameter("commentId"); 
                String blogIdStr = request.getParameter("blogId");       

               
                if (commentIdStr == null || commentIdStr.trim().isEmpty()) {
                    response.sendRedirect("blogDetail.jsp?error=Missing+commentId");
                    return;
                }
                if (blogIdStr == null || blogIdStr.trim().isEmpty()) {
                    response.sendRedirect("blogDetail.jsp?error=Missing+blogId");
                    return;
                }

              
                int commentId = Integer.parseInt(commentIdStr);
                int blogId = Integer.parseInt(blogIdStr);

                
                Comment comment = daoComment.getCommentById(commentId);
                if (comment == null) {
                    response.sendRedirect("blogDetail.jsp?error=Comment+not+found");
                    return;
                }

               
                if (comment.getCustomerID() != customerId) {
                    response.sendRedirect("blogDetail.jsp?error=Unauthorized+to+delete+this+comment");
                    return;
                }

               
                daoComment.delete(commentId);

               
                Vector<Comment> updatedComments = daoComment.getCommentsByBlogId(blogId);

               
                session.setAttribute("comments" + blogId, updatedComments);

              
                response.sendRedirect("BlogsURL?service=detailBlog&blog=" + blogId);
            }
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