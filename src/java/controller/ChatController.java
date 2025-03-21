/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import entity.ChatHistory;
import entity.Customers;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.Vector;
import model.DAOChatHistory;

/**
 *
 * @author Admin
 */
@WebServlet(name="ChatController", urlPatterns={"/ChatURL"})
public class ChatController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAOChatHistory daoChat = new DAOChatHistory();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Customers customerNow = (Customers) session.getAttribute("dataCustomer");
            String service = request.getParameter("service");
            if(service == null){
                service = "show";
            }
            if(service.equals("show")){
                Vector<ChatHistory> vectorChat = daoChat.getChatHistory("select * from Chat_History where CustomerID_1 = "+customerNow.getCustomerID()+" or CustomerID_2 = "+ +customerNow.getCustomerID());
                request.setAttribute("dataChat", vectorChat);
                request.getRequestDispatcher("jsp/customer-chat.jsp").forward(request, response);
            }
            if(service.equals("sendMess")){
                String messageChat = request.getParameter("message");
                
                daoChat.addChatHistory(new ChatHistory(customerNow.getCustomerID(), 3006, LocalDateTime.now(), messageChat, false));
                response.sendRedirect("ChatURL?service=show");
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
