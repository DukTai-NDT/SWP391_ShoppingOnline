
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

@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String productName = request.getParameter("productName");
            float price = Float.parseFloat(request.getParameter("price"));
            String description = request.getParameter("description");
            String unitPrice = request.getParameter("unitPrice");
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            int brandID = Integer.parseInt(request.getParameter("brandID"));
            boolean isPrescriptionDrug = request.getParameter("isPrescriptionDrug") != null;
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Part part = request.getPart("image");
            String fileName = part.getSubmittedFileName();

            DAOProducts dao = new DAOProducts();

            if (dao.isProductNameExists(productName)) {
                request.setAttribute("errorMessage", "Add Failed! Product already exists.");
                request.getRequestDispatcher("ProductManager").forward(request, response);
                return;
            }

            // Đường dẫn lưu ảnh
            String uploadDir = "C:\\Users\\whyth\\Downloads\\Git\\SWP391_FinalPrj\\SWP391_ShoppingOnline\\web\\images\\products";
            File uploadFolder = new File(uploadDir);
            String path = uploadDir + File.separator + fileName;
            InputStream is = part.getInputStream();
            boolean test = uploadFile(is, path);

            // Gọi DAO để thêm sản phẩm vào DB
            int result = dao.addProduct(new Products(productName, price, description, unitPrice, categoryID, brandID, isPrescriptionDrug, quantity, fileName, true));

            if (result > 0) {
                response.sendRedirect("ProductManager"); // Chuyển hướng nếu thêm thành công
            } else {
                request.setAttribute("errorMessage", "Failed to add product.");
                request.getRequestDispatcher("admin/shop.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, e);
            request.setAttribute("errorMessage", "Invalid input format.");
            request.getRequestDispatcher("admin/shop.jsp").forward(request, response);
        }
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
