
import entity.Ingredient;
import entity.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DAOIngredient;
import model.DAOProducts;

@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
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
            String image = request.getParameter("image");

            // Lấy ingredient từ input
            String ingredientName = request.getParameter("ingredient");

            // Thêm sản phẩm vào cơ sở dữ liệu
            DAOProducts addDAO = new DAOProducts();
            int productID = addDAO.addProduct(new Products(productName, price, description, unitPrice, categoryID, brandID, isPrescriptionDrug, quantity, image));

            // Nếu thêm sản phẩm thành công, thêm ingredient
            if (productID > 0) {
                if (ingredientName != null && !ingredientName.trim().isEmpty()) {
                    DAOIngredient iDAO = new DAOIngredient();
                    iDAO.addIngredient(new Ingredient(ingredientName, productID));
                }
                response.sendRedirect("ProductManager"); // Chuyển hướng nếu thành công
            } else {
                request.setAttribute("errorMessage", "Failed to add product.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, e);
            request.setAttribute("errorMessage", "Invalid input format.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
