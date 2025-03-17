package controller;

import entity.CartItems;
import entity.Customers;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.Vector;
import model.DAOAccount;
import model.DAOCustomer;
import java.io.File;
import model.DAOCart;
import model.DAOCartItem;

@WebServlet(name = "CustomerController", urlPatterns = {"/CustomerURL"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CustomerController extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOAccount daoAcc = new DAOAccount();
        DAOCustomer daoCus = new DAOCustomer();
        DAOCartItem daoCartItem = new DAOCartItem();
        HttpSession session = request.getSession();

        // Lấy đối tượng Customers từ session với key "dataCustomer"
        Customers currentCustomer = (Customers) session.getAttribute("dataCustomer");
       
        if (currentCustomer != null) {
             Vector<CartItems> vectorCartItems = daoCartItem.getProductIsntBuy(
        "select ci.CartItemID,ci.CartID,ci.ProductID,ci.ProductName,ci.Price,ci.Quantity, ci.IsBuy " +
        "from CartItem ci join Cart c on ci.CartID = c.CartID where c.CustomerID = " + currentCustomer.getCustomerID()
             );
          session.setAttribute("dataCartItem", vectorCartItems);
    
        }
        

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listAllCustomer";
            }

            if (service.equals("updateCustomer")) {
                String submit = request.getParameter("submit");
                if (submit == null) { // Hiển thị form cập nhật
                    // Dữ liệu khách hàng đã có trong session (dataCustomer), không cần truy vấn lại
                    request.getRequestDispatcher("/jsp/profileSetting.jsp").forward(request, response);
                } else { // Xử lý cập nhật
                    String customerID = request.getParameter("CustomerID");
                    String firstName = request.getParameter("FirstName");
                    String lastName = request.getParameter("LastName");
                    String email = request.getParameter("Email");
                    String address = request.getParameter("Address");
                    String gender = request.getParameter("Gender");
                    String phone = request.getParameter("Phone");

                    int cusId = Integer.parseInt(customerID);

                    // Kiểm tra quyền truy cập
                    if (cusId != currentCustomer.getCustomerID()) {
                        response.sendRedirect("CustomerURL?error=unauthorized");
                        return;
                    }

                    // Tạo đối tượng Customers mới với các giá trị từ form, nhưng giữ nguyên profileImg
                    Customers updatedCustomer = new Customers(cusId, firstName, lastName, email, address, gender, phone);
                    updatedCustomer.setProfileImg(currentCustomer.getProfileImg()); // Bảo toàn giá trị profileImg

                    // Cập nhật thông tin vào cơ sở dữ liệu
                    int n = daoCus.updateCustomer(updatedCustomer);

                    // Cập nhật lại dataCustomer trong session
                    Vector<Customers> vectorCustomer = daoCus.getCustomer("SELECT * FROM Customers WHERE CustomerID=" + cusId);
                    session.setAttribute("dataCustomer", vectorCustomer.get(0));

                    response.sendRedirect("CustomerURL");
                }
            }

            if (service.equals("uploadProfileImg")) {
                Part filePart = request.getPart("profileImg");
                String fileName = extractFileName(filePart);
                String customerID = request.getParameter("CustomerID");
                int cusId = Integer.parseInt(customerID);

                // Kiểm tra quyền truy cập
                if (cusId != currentCustomer.getCustomerID()) {
                    response.sendRedirect("CustomerURL?error=unauthorized");
                    return;
                }

                // Xác thực loại tệp
                if (!fileName.toLowerCase().endsWith(".jpg") && !fileName.toLowerCase().endsWith(".png")) {
                    request.setAttribute("error", "Chỉ cho phép tệp .jpg hoặc .png");
                    request.getRequestDispatcher("/jsp/profileSetting.jsp").forward(request, response);
                    return;
                }

                // Xác thực kích thước tệp
                if (filePart.getSize() > 1024 * 1024 * 2) {
                    request.setAttribute("error", "Tệp quá lớn. Kích thước tối đa là 2MB.");
                    request.getRequestDispatcher("/jsp/profileSetting.jsp").forward(request, response);
                    return;
                }

                // Định nghĩa thư mục tải lên
                String applicationPath = request.getServletContext().getRealPath("");
                String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

                File uploadDir = new File(uploadFilePath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String newFileName = "customer_" + customerID + "_" + fileName;
                String filePath = uploadFilePath + File.separator + newFileName;
                filePart.write(filePath);

                String relativePath = UPLOAD_DIR + "/" + newFileName;
                currentCustomer.setProfileImg(relativePath);
                daoCus.updateCustomer(currentCustomer);

                // Cập nhật lại dataCustomer trong session
                Vector<Customers> vectorCustomer = daoCus.getCustomer("SELECT * FROM Customers WHERE CustomerID=" + cusId);
                session.setAttribute("dataCustomer", vectorCustomer.get(0));

                response.sendRedirect("CustomerURL?service=listAllCustomer");
            }

            if (service.equals("removeProfileImg")) {
                String customerID = request.getParameter("CustomerID");
                int cusId = Integer.parseInt(customerID);

                // Kiểm tra quyền truy cập
                if (cusId != currentCustomer.getCustomerID()) {
                    response.sendRedirect("CustomerURL?error=unauthorized");
                    return;
                }

                // Xóa tệp khỏi máy chủ
                String applicationPath = request.getServletContext().getRealPath("");
                String filePath = applicationPath + File.separator + currentCustomer.getProfileImg();
                File file = new File(filePath);
                if (file.exists()) {
                    file.delete();
                }

                // Cập nhật cơ sở dữ liệu để xóa đường dẫn ảnh hồ sơ
                currentCustomer.setProfileImg(null);
                daoCus.updateCustomer(currentCustomer);

                // Cập nhật lại dataCustomer trong session
                Vector<Customers> vectorCustomer = daoCus.getCustomer("SELECT * FROM Customers WHERE CustomerID=" + cusId);
                session.setAttribute("dataCustomer", vectorCustomer.get(0));

                response.sendRedirect("CustomerURL?service=listAllCustomer");
            }

            if (service.equals("listAllCustomer")) {
                // Không cần truy vấn lại cơ sở dữ liệu vì thông tin đã có trong dataCustomer
                request.getRequestDispatcher("/jsp/profileSetting.jsp").forward(request, response);
            }

            if (service.equals("changePassword")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.getRequestDispatcher("/jsp/profileSetting.jsp").forward(request, response);
                } else {
                    String oldPassword = request.getParameter("OldPassword");
                    String newPassword = request.getParameter("NewPassword");
                    String retypePassword = request.getParameter("RetypeNewPassword");
                    String email = request.getParameter("Email");

                    if (newPassword.equals(retypePassword)) {
                        if (daoAcc.checkPassword(email, oldPassword)) {
                            daoAcc.changePassword(email, newPassword);
                            response.sendRedirect("CustomerURL?service=listAllCustomer");
                        } else {
                            request.setAttribute("error", "Old password is incorrect.");
                            request.getRequestDispatcher("/jsp/profileSetting.jsp").forward(request, response);
                        }
                    } else {
                        request.setAttribute("error", "New password and retype password do not match.");
                        request.getRequestDispatcher("/jsp/profileSetting.jsp").forward(request, response);
                    }
                }
            }
        }
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}