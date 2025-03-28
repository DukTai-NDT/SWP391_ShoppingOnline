
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
            response.sendRedirect("ProductManagerDetail?msg=No Product ID Provided");
            return;
        }

        int productID;
        try {
            productID = Integer.parseInt(pid);
        } catch (NumberFormatException e) {
            response.sendRedirect("ProductManagerDetail?msg=Invalid Product ID");
            return;
        }

        DAOProducts dao = new DAOProducts();
        int result = dao.deleteProduct(productID);

        if (result > 0) {
            response.sendRedirect("ProductManager?msg=Deleted Successfully");
        } else {
            request.setAttribute("errorMessage", "Delete Failed");
            request.getRequestDispatcher("ProductManagerDetail?pid=" + productID).forward(request, response);
        }

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
