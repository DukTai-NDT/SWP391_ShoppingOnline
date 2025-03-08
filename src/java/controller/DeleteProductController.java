import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOProducts;

@WebServlet("/DeleteProduct")  // Xác định URL của servlet
public class DeleteProductController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String pid = request.getParameter("pid");
        if (pid == null || pid.trim().isEmpty()) {
            response.sendRedirect("ProductManager?msg=No Product ID Provided");
            return;
        }

        int productID;
        try {
            productID = Integer.parseInt(pid);
        } catch (NumberFormatException e) {
            response.sendRedirect("ProductManager?msg=Invalid Product ID");
            return;
        }

        DAOProducts dao = new DAOProducts();
        int result = dao.deleteProduct(productID);

        String msg = (result > 0) ? "Deleted Successfully" : "Delete Failed";
        response.sendRedirect("ProductManager?msg=" + msg);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
