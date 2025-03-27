/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Districts;
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
import model.DAODistricts;
import model.DAOProvinces;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DeliveryAddressController", urlPatterns = {"/DeliveryAddressURL"})
public class DeliveryAddressController extends HttpServlet {

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
        HttpSession session = request.getSession();
        DAOProvinces daoProvince = new DAOProvinces();
        DAODistricts daoDistricts = new DAODistricts();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
//            if(service.equals("display")){
//                request.getRequestDispatcher("jsp/checkout.jsp").forward(request, response);
//            }
           // Lấy danh sách tất cả tỉnh/thành phố
           if(service == null || service.equals("first")){
        Vector<Provinces> provinces = daoProvince.getProvinces("SELECT * FROM Provinces");
               
        session.setAttribute("provinces", provinces);
          session.setAttribute("provinceName","" );
          session.setAttribute("districtsName","" );
           session.setAttribute("districtIdStr", "");
           session.setAttribute("provinceId", "");
          
          Vector<Districts> districts = daoDistricts.getDistricts(
                "SELECT * FROM Districts ");
            session.setAttribute("districts", districts);
           }
           if(service.equals("province")){
      
        String provinceIdStr = request.getParameter("provinceId");
        session.setAttribute("provinceId", provinceIdStr);

        if (provinceIdStr != null && !provinceIdStr.isEmpty()) {
            int provinceId = Integer.parseInt(provinceIdStr);
           session.setAttribute("selectedProvinceId", provinceId);
            
            Vector<Districts> districts = daoDistricts.getDistricts(
                "SELECT * FROM Districts WHERE ProvinceID = " + provinceId);
            System.out.println("123");
            session.setAttribute("districts", districts);
            session.setAttribute("provinceName",daoProvince.getProvinceName(provinceId) );
        }     
          
        }
           if(service.equals("district")){
               System.out.println("1234");
                String districtIdStr = request.getParameter("districtId");
                
                int districtId = Integer.parseInt(districtIdStr);
                session.setAttribute("districtIdStr", districtIdStr);
                session.setAttribute("districtId", districtId);
               session.setAttribute("districtsName",daoDistricts.getDistrictName(districtId) );
               
           }
        
        // Forward đến JSP
        request.getRequestDispatcher("/jsp/checkout.jsp").forward(request, response);
    

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
