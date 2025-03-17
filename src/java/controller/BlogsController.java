/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Blogs;
import entity.CartItems;
import entity.Comment;
import entity.Customers;
import entity.Categories;
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
import java.util.Vector;
import model.DAOBlogs;
import model.DAOCartItem;
import model.DAOCategories;
import model.DAOComment;
import model.DAOCustomer;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BlogsController", urlPatterns = {"/BlogsURL"})
public class BlogsController extends HttpServlet {

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
        DAOBlogs dao = new DAOBlogs();
        DAOCustomer daoCus = new DAOCustomer();
        DAOComment daoComments = new DAOComment();
        DAOCartItem daoCartItem = new DAOCartItem(); 
        HttpSession session = request.getSession();
        DAOCategories daoCat = new DAOCategories();
        Customers currentCustomer = (Customers) session.getAttribute("dataCustomer");

        if (currentCustomer != null) {
             Vector<CartItems> vectorCartItems = daoCartItem.getProductIsntBuy(
        "select ci.CartItemID,ci.CartID,ci.ProductID,ci.ProductName,ci.Price,ci.Quantity, ci.IsBuy " +
        "from CartItem ci join Cart c on ci.CartID = c.CartID where c.CustomerID = " + currentCustomer.getCustomerID()
   );
    session.setAttribute("dataCartItem", vectorCartItems);
    

        }
        
   try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllBlogs";
            }
           
      
        if (service.equals("deleteBlog") || service.equals("updateBlog") || service.equals("insertBlog")) {
            if (currentCustomer == null) {
                response.sendRedirect("LoginURL?service=login");
                return;
            }
        }

            if (service.equals("deleteBlog")) {
                int blogId = Integer.parseInt(request.getParameter("blogId"));

                // Lấy thông tin blog để kiểm tra CustomerID
                Vector<Blogs> blogVector = dao.getBlogs("SELECT * FROM Blogs WHERE BlogID = ?");
                if (!blogVector.isEmpty()) {
                    Blogs blog = blogVector.get(0);
                    if (blog.getCustomerID() == currentCustomer.getCustomerID()) {
                        // Chỉ xóa nếu blog thuộc về người dùng hiện tại
                        dao.deleteBlog(blogId);
                    } else {
                        out.print("You are not authorized to delete this blog!");
                        return;
                    }
                } else {
                    out.print("Blog not found!");
                    return;
                }
                response.sendRedirect("BlogsURL");
            }

            if (service.equals("updateBlog")) {
                String submit = request.getParameter("submit");

                if (submit == null) {
                    int blogId = Integer.parseInt(request.getParameter("blogId"));
                    Vector<Blogs> vector = dao.getBlogs("SELECT * FROM Blogs WHERE BlogID = ?");
                    // Kiểm tra quyền truy cập trước khi hiển thị form update
                    if (!vector.isEmpty() && vector.get(0).getCustomerID() == currentCustomer.getCustomerID()) {
                        request.setAttribute("vector", vector);
                        request.getRequestDispatcher("/jsp/updateBlog.jsp").forward(request, response);
                    } else {
                        out.print("You are not authorized to update this blog!");
                        return;
                    }
                } else {
                    // Get values from the form
                    String blogId = request.getParameter("blogId");
                    String postTime = request.getParameter("postTime");
                    String title = request.getParameter("title");
                    String content = request.getParameter("content");
                    String image = request.getParameter("image");
                    String status = request.getParameter("status");

                    if (title.equals("") || content.equals("")) {
                        out.print("Title and Content must not be empty");
                        return;
                    }

                    int blogIdInt = Integer.parseInt(blogId);
                    boolean statusBool = Boolean.parseBoolean(status);

                    // Sử dụng CustomerID từ session (đã kiểm tra ở trên)
                    Blogs blog = new Blogs(blogIdInt, currentCustomer.getCustomerID(), LocalDate.parse(postTime), title, content, image, statusBool);
                    int n = dao.updateBlog(blog);

                    response.sendRedirect("BlogsURL");
                }
            }

            if (service.equals("insertBlog")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/jsp/insertBlog.jsp").forward(request, response);
                } else {
                    // Get values from the form
                    String postTime = request.getParameter("postTime");
                    String title = request.getParameter("title");
                    String content = request.getParameter("content");
                    String image = request.getParameter("image");
                    String status = request.getParameter("status");

                    if (title.equals("") || content.equals("")) {
                        out.print("Title and Content must not be empty");
                        return;
                    }

                    boolean statusBool = Boolean.parseBoolean(status);

                    // Sử dụng CustomerID từ session
                    Blogs blog = new Blogs(currentCustomer.getCustomerID(), LocalDate.parse(postTime), title, content, image, statusBool);
                    int n = dao.addBlog(blog);

                    response.sendRedirect("BlogsURL");
                }
            }

            if (service.equals("listAllBlogs")) {
                String sql = "SELECT * FROM Blogs";
                String submit = request.getParameter("submit");
                
                int page = request.getParameter("page")!= null ? Integer.parseInt(request.getParameter("page")) :1;
                int limit = 6;
                int offset = (page -1) * limit;
                
                Vector<Blogs> vectorBlogs;
                int totalBlogs;
                int totalPages;
                
                if (submit != null) {
                    String title = request.getParameter("title");
                    sql="SELECT * FROM Blogs WHERE Title LIKE N'%" + title + "%'" ;
                    Vector<Blogs> allBlog = dao.getBlogs(sql);
                    totalBlogs = allBlog.size();
                    totalPages = (int) Math.ceil((double) totalBlogs /limit);
                    
                    
                    vectorBlogs = new Vector<>();
                    int start = offset;
                    int end= Math.min(offset +limit, totalBlogs);
                    for (int i = start; i < end; i++) {
                        vectorBlogs.add(allBlog.get(i));
                        
                    }
                    
                  
                }
                else{
               
                
                vectorBlogs = dao.getBlogsByPage(offset, limit);
                totalBlogs = dao.countTotalBlogs();
                totalPages = (int)Math.ceil((double)totalBlogs /limit);
                
                
                }
                 
                 Vector<Categories> vectorCat = daoCat.getCategories("select * from Categories");
                session.setAttribute("vectorBlogs", vectorBlogs);
                session.setAttribute("vectorCat", vectorCat);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
              
                RequestDispatcher dispatch = request.getRequestDispatcher("blog.jsp");
                dispatch.forward(request, response);
            }

            
         
         if (service.equals("detailBlog")) {
         String blogIdParam = request.getParameter("blog");
         Vector<Blogs> vectorBlogs = dao.getBlogs("select * from Blogs where BlogID = " + blogIdParam);
         Blogs blog = vectorBlogs.get(0);
         session.setAttribute("blog", blog);
         Vector<Categories> vectorCat = daoCat.getCategories("select * from Categories");
         Vector<Comment> comments = daoComments.getCommentsByBlogId(blog.getBlogID());
         session.setAttribute("comments" + blog.getBlogID(), comments);
         session.setAttribute("vectorCat", vectorCat);
         request.getRequestDispatcher("blogDetail.jsp").forward(request, response);
}

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
        return "BlogsController handles CRUD operations for blogs";
    }// </editor-fold>
}