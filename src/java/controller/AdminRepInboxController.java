/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import entity.ChatHistory;
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
@WebServlet(name="AdminRepInboxController", urlPatterns={"/AdminRepInboxURL"})
public class AdminRepInboxController extends HttpServlet {
   
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
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            DAOChatHistory daoChatHistory = new DAOChatHistory();
            if(service == null){
                service = "show";
            }
            if(service.equals("show")){
                Vector<Integer> vectorCustomerID = daoChatHistory.getCustomerIDInbox();
                session.setAttribute("dataCustomerInbox", vectorCustomerID);
                 request.setAttribute("showMess", "none");
                 
                request.getRequestDispatcher("admin/repinbox-admin.jsp").forward(request, response);

            }
            if(service.equals("listChat")){
                String cid = request.getParameter("cid");
                Vector<ChatHistory> vectorChat = daoChatHistory.getChatHistory("select * from Chat_History where CustomerID_1 = "+cid+" or CustomerID_2 = "+ cid);
                request.setAttribute("dataChat", vectorChat);
                request.setAttribute("cid", cid);
                request.setAttribute("showMess", "show");
                System.out.println("abcasda1234");
                request.getRequestDispatcher("admin/repinbox-admin.jsp").forward(request, response);
            }
            if(service.equals("sendMess")){
                 String messageChat = request.getParameter("message");
                String cid = request.getParameter("cid");
                request.setAttribute("cid", cid);
                daoChatHistory.addChatHistory(new ChatHistory(3006, Integer.parseInt(cid), LocalDateTime.now(), messageChat, false));
                response.sendRedirect("AdminRepInboxURL?service=listChat&cid="+cid);
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
