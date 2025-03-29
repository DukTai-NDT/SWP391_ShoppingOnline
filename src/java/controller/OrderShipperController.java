package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import entity.Account;
import entity.Customers;
import entity.Orders;
import entity.DeliveryAddress;
import entity.Provinces;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOCustomer;
import model.DAODeliveryAddress;
import model.DAOOrders;
import model.DAOProvinces;

/**
 *
 * @author quang
 */
@WebServlet(urlPatterns = {"/OrderShipperURL"})
public class OrderShipperController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            DAOOrders daoOrder = new DAOOrders();
            Account account = (Account) session.getAttribute("dataUser");
            DAODeliveryAddress daoDeli = new DAODeliveryAddress();
            DAOCustomer daoCustomer = new DAOCustomer();
            String service = request.getParameter("service");
            DAOProvinces daoProvinces = new DAOProvinces();
            String submit = request.getParameter("submit");
            if (service == null) {
                service = "show";
            }

            if (service.equals("show")) {
                String sql = "select * from Orders where Status = 'Prepared'";
                Customers customer = (Customers) session.getAttribute("dataCustomer");
                
                Vector<Provinces> provinces = daoProvinces.getProvinces("select * from Provinces");
                String message = request.getParameter("message");
                if (submit != null) {
                    Vector<Provinces> vectorProvinces = new Vector<Provinces>();
                    String time = request.getParameter("time");
                    String provinceName = request.getParameter("provinceName");
                    sql = "SELECT * FROM Orders o "
                            + "JOIN DeliveryAddress d ON o.OrderID = d.OrderID ";

                    if (provinceName == null || provinceName.isEmpty() || provinceName.equals("All")) {
                        sql += "WHERE Status = 'Prepared'";
                    } else {
                        sql += "WHERE d.ProvinceID = " + provinceName + " and o.Status = 'Prepared'";
                    }

                    if ("Newest".equals(time)) {
                        sql += "ORDER BY o.OrderTime DESC";
                    } else if ("Oldest".equals(time)) {
                        sql += "ORDER BY o.OrderTime ASC";
                    }

                    vectorProvinces = daoProvinces.getProvinces(sql);

                    request.setAttribute("vectorProvinces", vectorProvinces);

                }
                Vector<Orders> vectorOrder = daoOrder.getOrders(sql);
                request.setAttribute("message", message);
                request.setAttribute("vectorOrder", vectorOrder);
                request.setAttribute("provinces", provinces);
                request.getRequestDispatcher("/jsp/shipper-order.jsp").forward(request, response);
            }

            if (service.equals("pickOrder")) {
                String aid = request.getParameter("aid");
                System.out.println(aid);
                String oid = request.getParameter("oid");
                DeliveryAddress deli = daoDeli.getDeliveryAddress("select * from DeliveryAddress where OrderID = " + oid).get(0);
                deli.setAccountID(Integer.parseInt(aid));
                daoDeli.updateDeliveryAddress(deli);
                daoOrder.updateIsReceived(Integer.parseInt(oid));
                daoOrder.updateStatusOrder("Delivering", Integer.parseInt(oid));
                response.sendRedirect("OrderShipperURL");
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
        return "Short description";
    }// </editor-fold>

}
