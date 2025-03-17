/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import entity.Account;
import entity.Customers;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOAccount;
import model.DAOCustomer;

/**
 *
 * @author Admin
 */
@WebServlet(name="CustomerController", urlPatterns={"/CustomerURL"})
public class CustomerController extends HttpServlet {
   
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
         
        DAOCustomer daoCus = new DAOCustomer();
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customerId");
        if (customerId == null) {
            response.sendRedirect("LoginURL?service=login");
            return;
        }
        try (PrintWriter out = response.getWriter()) {
         
         String service = request.getParameter("service");
         if (service == null) {
                service = "listAllCustomer";
            }
      if (service.equals("updateCustomer")) {
            String submit = request.getParameter("submit");
            if (submit == null) { // Hiển thị form cập nhật
                int cusId = Integer.parseInt(request.getParameter("CusID"));
                Vector<Customers> vectorCustomer = daoCus.getCustomer("SELECT * FROM Customers WHERE CustomerID=" + cusId);
                request.setAttribute("vectorCustomer", vectorCustomer);
                request.getRequestDispatcher("ProfileSetting.jsp").forward(request, response);
            } else { // Xử lý cập nhật
                String customerID = request.getParameter("CustomerID");
                String firstName = request.getParameter("FirstName");
                String lastName = request.getParameter("LastName");
                String email = request.getParameter("Email");
                String address = request.getParameter("Address");
                String gender = request.getParameter("Gender");
                String phone = request.getParameter("Phone");

                int cusId = Integer.parseInt(customerID);
                // Đảm bảo chỉ cập nhật hồ sơ của chính người dùng
                if (cusId != customerId) {
                    response.sendRedirect("CustomerURL?error=unauthorized");
                    return;
                }
                Account account =  (Account)session.getAttribute("dataUser");
                Customers cus = new Customers(cusId, firstName, lastName, email, address, gender, phone,account.getAccountID());
                int n = daoCus.updateCustomer(cus);
                response.sendRedirect("CustomerURL");
            }
        } 
      if (service.equals("listAllCustomer")) {
            String sql = "SELECT * FROM Customers WHERE CustomerID=" + customerId;
            Vector<Customers> vectorCustomer = daoCus.getCustomer(sql);
            request.setAttribute("vectorCustomer", vectorCustomer);
            request.getRequestDispatcher("ProfileSetting.jsp").forward(request, response);
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
