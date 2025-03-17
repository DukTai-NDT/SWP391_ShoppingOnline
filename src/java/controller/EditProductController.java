/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import entity.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DAOProducts;


/**
 *
 * @author whyth
 */
@WebServlet(name = "EditProductController", urlPatterns = {"/EditProduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class EditProductController extends HttpServlet {

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

        int productID = Integer.parseInt(request.getParameter("loadProductID"));
        String productName = request.getParameter("loadProductName");
        float price = Float.parseFloat(request.getParameter("loadPrice"));
        String description = request.getParameter("loadDescription");
        String unitPrice = request.getParameter("loadUnitPrice");
        int categoryID = Integer.parseInt(request.getParameter("loadCategoryID"));
        int brandID = Integer.parseInt(request.getParameter("loadBrandID"));
        boolean isPrescriptionDrug = request.getParameter("loadIsPrescriptionDrug") != null;
        int quantity = Integer.parseInt(request.getParameter("loadQuantity"));
        Part part = request.getPart("image");
        String fileName = part.getSubmittedFileName();

//            String uploadDir = "D:\\FU_Learning\\SUM2024\\CSD201\\Code\\UploadFile\\web\\uploads";
        String uploadDir = "D:\\FU_Learning\\SUM2024\\CSD201\\Code\\SWP391\\web\\images\\products";
        File uploadFolder = new File(uploadDir);

        String path = uploadDir + File.separator + fileName;
        InputStream is = part.getInputStream();
        boolean test = uploadFile(is, path);

        DAOProducts pDAO = new DAOProducts();
        pDAO.updateProduct(new Products(productID, productName, price, description, unitPrice, categoryID, brandID, isPrescriptionDrug, quantity, fileName));
        response.sendRedirect("ProductManagerDetail?pid=" + productID);
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
