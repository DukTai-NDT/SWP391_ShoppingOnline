package controller;

import entity.Account;
import entity.Cart;
import entity.CartItems;
import entity.Customers;
import entity.Products;
import entity.Categories;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Vector;
import model.DAOCart;
import model.DAOCartItem;
import model.DAOCategories;
import model.DAOCustomer;
import model.DAOProducts;

@WebServlet(name = "CartController", urlPatterns = {"/CartURL"})
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        DAOCustomer daoCus = new DAOCustomer();
        DAOCart daoCart = new DAOCart();
        DAOProducts daoPro = new DAOProducts();
        DAOCartItem daoCartItem = new DAOCartItem();
        DAOCategories daoCat = new DAOCategories();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            Account acc = (Account) session.getAttribute("dataUser");
            if (service == null) {
                service = "showCart";
            }

            if (service.equals("showCart")) {
                Customers cus = (Customers) session.getAttribute("dataCustomer");
                Vector<CartItems> vectorCartItems = daoCartItem.getProductIsntBuy(
                    "SELECT ci.CartItemID, ci.CartID, ci.ProductID, ci.ProductName, ci.Price, ci.Quantity, ci.IsBuy " +
                    "FROM CartItem ci JOIN Cart c ON ci.CartID = c.CartID " +
                    "WHERE c.CustomerID = " + cus.getCustomerID() + " " +
                    "ORDER BY ci.CartItemID DESC"
                );
                Vector<Categories> vcategories = daoCat.getCategories("select * from Categories");

                session.setAttribute("dataCartItem", vectorCartItems);
                session.setAttribute("vcategories", vcategories);
                request.getRequestDispatcher("/jsp/shop-cart.jsp").forward(request, response);
            }

            if (service.equals("add2cart")) {
                int pid = Integer.parseInt(request.getParameter("pid"));
                Customers cus = daoCus.getCustomer(
                    "select c.CustomerID,c.FirstName,c.LastName,c.Email,c.Address,c.Gender,c.Phone,c.AccountID,c.ProfileImg " +
                    "from Customers c join Accounts a on c.AccountID = a.AccountID where c.AccountID = " + acc.getAccountID()
                ).get(0);
                session.setAttribute("dataCustomer", cus);
                LocalDate now = LocalDate.now();
                Cart cart = null;
                Vector<Cart> carts = daoCart.getCart("select * from Cart where CreateDate like '" + now + "' and CustomerID = " + cus.getCustomerID());
                if (carts.isEmpty()) {
                    daoCart.addCart(new Cart(cus.getCustomerID(), true, now));
                    cart = daoCart.getCart("select * from Cart where CreateDate like '" + now + "' and CustomerID = " + cus.getCustomerID()).get(0);
                } else {
                    cart = carts.get(0);
                }

                Products pro = daoPro.getProducts("select * from Products where ProductID = " + pid).get(0);
                CartItems cartItem = new CartItems(cart.getCartID(), pid, pro.getProductName(), pro.getPrice(), 1, false);
                Vector<CartItems> vectorCartItem = daoCartItem.getCartItem("select * from CartItem where CartID = " + cart.getCartID());
                boolean itemExists = false;
                for (CartItems ci : vectorCartItem) {
                    if (ci.getProductID() == pid && !ci.isIsBuy()) {
                        daoCartItem.updateQuantityCartItem(ci.getQuantity() + 1, ci.getCartItemID());
                        itemExists = true;
                        break;
                    }
                }
                if (!itemExists) {
                    daoCartItem.addCartItem(cartItem);
                }
                response.sendRedirect("CartURL?service=showCart");
            }

            if (service.equals("updateCart")) {
                Vector<CartItems> vectorCartItems = (Vector<CartItems>) session.getAttribute("dataCartItem");
                for (CartItems item : vectorCartItems) {
                    String quantityParam = request.getParameter("quantity_" + item.getCartItemID());
                    if (quantityParam != null) {
                        int newQuantity = Integer.parseInt(quantityParam);
                        daoCartItem.updateQuantityCartItem(newQuantity, item.getCartItemID());
                    }
                }
                response.sendRedirect("CartURL?service=showCart");
            }

            if (service.equals("deleteCart")) {
                int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
                daoCartItem.deleteCartItem(cartItemID);
                response.sendRedirect("CartURL?service=showCart");
            }

            if (service.equals("checkout")) {
                String[] selectedItems = request.getParameterValues("selectedItems");
                Vector<CartItems> vectorCartItems = (Vector<CartItems>) session.getAttribute("dataCartItem");

                if (selectedItems != null && selectedItems.length > 0) {
                    Vector<CartItems> selectedCartItems = new Vector<>();
                    for (String cartItemID : selectedItems) {
                        for (CartItems item : vectorCartItems) {
                            if (item.getCartItemID() == Integer.parseInt(cartItemID)) {
                                selectedCartItems.add(item);
                            }
                        }
                    }
                    Vector<String> overFlow = new Vector<>();
                    for (CartItems selectedCartItem : selectedCartItems) {
                        Products pro = daoPro.getProductByID(selectedCartItem.getProductID());
                        if (pro.getQuantity() < selectedCartItem.getQuantity()) {
                            overFlow.add(selectedCartItem.getProductName());
                        }
                    }
                    if (!overFlow.isEmpty()) {
                        request.setAttribute("message", "We are out of stock of the following products:");
                        request.setAttribute("dataProductHight", overFlow);
                        request.getRequestDispatcher("/jsp/shop-cart.jsp").forward(request, response);
                    } else {
                        session.setAttribute("selectedCartItems", selectedCartItems);
                        response.sendRedirect("CheckoutURL?service=theFirst");
                    }
                } else {
                    request.setAttribute("message", "Please select at least one item to checkout.");
                    request.getRequestDispatcher("/jsp/shop-cart.jsp").forward(request, response);
                }
            }
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}