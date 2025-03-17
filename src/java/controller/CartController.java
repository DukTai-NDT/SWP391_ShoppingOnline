package controller;

import entity.Account;
import entity.Cart;
import entity.CartItems;
import entity.Customers;
import entity.Products;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import model.DAOCart;
import model.DAOCartItem;
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

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            Account acc = (Account) session.getAttribute("dataUser");
            if (service == null) {
                service = "showCart";
            }

            if (service.equals("showCart")) {
                Customers cus = (Customers) session.getAttribute("dataCustomer");
                Vector<CartItems> vectorCartItems = daoCartItem.getProductIsntBuy("select ci.CartItemID,ci.CartID,ci.ProductID,ci.ProductName,ci.Price,ci.Quantity, ci.IsBuy from CartItem ci join Cart c on ci.CartID = c.CartID where c.CustomerID = " + cus.getCustomerID());
                session.setAttribute("dataCartItem", vectorCartItems);

                // Khôi phục trạng thái checkbox từ session
                Set<Integer> unselectedItems = (Set<Integer>) session.getAttribute("unselectedItems");
                if (unselectedItems == null) {
                    unselectedItems = new HashSet<>();
                    session.setAttribute("unselectedItems", unselectedItems);
                }

                request.getRequestDispatcher("/jsp/shop-cart.jsp").forward(request, response);
            }

            if (service.equals("add2cart")) {
                int pid = Integer.parseInt(request.getParameter("pid"));
                Customers cus = daoCus.getCustomer("select c.CustomerID,c.FirstName,c.LastName,c.Email,c.Address,c.Gender,c.Phone,c.AccountID,c.ProfileImg from Customers c join Accounts a on c.AccountID = a.AccountID where c.AccountID = " + acc.getAccountID()).get(0);
                session.setAttribute("dataCustomer", cus);
                LocalDate now = LocalDate.now();
                Vector<Cart> vector = daoCart.getCart("select * from Cart");
                int cnt = 0;
                for (Cart cart : vector) {
                    if (now.equals(cart.getCreateDate()) && cart.getCustomerID() == cus.getCustomerID()) {
                        cnt++;
                    }
                }
                if (cnt == 0) {
                    daoCart.addCart(new Cart(cus.getCustomerID(), true, LocalDate.now()));
                }
                Cart cart = daoCart.getCart("select * from Cart where CreateDate like '" + now + "' and CustomerID = " + cus.getCustomerID()).get(0);
                Products pro = daoPro.getProducts("select * from Products where ProductID = " + pid).get(0);
                CartItems cartItem = new CartItems(cart.getCartID(), pid, pro.getProductName(), pro.getPrice(), 1, false);
                Vector<CartItems> vectorCartItem = daoCartItem.getCartItem("select * from CartItem");
                int isExist = 0;
                int isBuy = 0;
                for (CartItems cartItems : vectorCartItem) {
                    if (cartItems.getCartID() == cartItem.getCartID() && cartItem.getProductID() == cartItems.getProductID()&& cartItems.isIsBuy() == false) {
                        isExist++;
                        daoCartItem.updateQuantityCartItem(cartItems.getQuantity() + 1, cartItems.getCartItemID());
                    }
                    if (cartItems.getCartID() == cartItem.getCartID() && cartItem.getProductID() == cartItems.getProductID() && cartItems.isIsBuy() == true) {
                        isBuy ++;
                    }
                }

                if (isExist == 0) {
                    daoCartItem.addCartItem(cartItem);

                }
                response.sendRedirect("CartURL?service=showCart");
            }

            if (service.equals("updateCart")) {
                Map<String, String[]> parameterMap = request.getParameterMap();
                Vector<CartItems> vectorCartItems = (Vector<CartItems>) session.getAttribute("dataCartItem");
                Set<Integer> unselectedItems = new HashSet<>();

                // Xác định các mục không được chọn
                String[] selectedItems = request.getParameterValues("selectedItems");
                if (selectedItems != null) {
                    for (CartItems item : vectorCartItems) {
                        boolean isSelected = false;
                        for (String selectedId : selectedItems) {
                            if (Integer.parseInt(selectedId) == item.getCartItemID()) {
                                isSelected = true;
                                break;
                            }
                        }
                        if (!isSelected) {
                            unselectedItems.add(item.getCartItemID());
                        }
                    }
                } else {
                    for (CartItems item : vectorCartItems) {
                        unselectedItems.add(item.getCartItemID());
                    }
                }
                session.setAttribute("unselectedItems", unselectedItems);

                // Cập nhật số lượng
                for (String paramName : parameterMap.keySet()) {
                    if (paramName.startsWith("quantity_")) {
                        int cartItemID = Integer.parseInt(paramName.split("_")[1]);
                        int newQuantity = Integer.parseInt(request.getParameter(paramName));
                        daoCartItem.updateQuantityCartItem(newQuantity, cartItemID);
                    }
                }
                response.sendRedirect("CartURL?service=showCart");
            }

            if (service.equals("deleteCart")) {
                int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
                daoCartItem.deleteCartItem(cartItemID);
                Set<Integer> unselectedItems = (Set<Integer>) session.getAttribute("unselectedItems");
                if (unselectedItems != null) {
                    unselectedItems.remove(cartItemID);
                    session.setAttribute("unselectedItems", unselectedItems);
                }
                response.sendRedirect("CartURL?service=showCart");
            }

            if (service.equals("checkout")) {

                String[] selectedItems = request.getParameterValues("selectedItems");
                Vector<CartItems> vectorCartItems = (Vector<CartItems>) session.getAttribute("dataCartItem");
                Set<Integer> unselectedItems = new HashSet<>();

                if (selectedItems != null && selectedItems.length > 0) {
                    Vector<CartItems> selectedCartItems = new Vector<>();
                    for (String cartItemID : selectedItems) {
                        for (CartItems item : vectorCartItems) {
                            if (item.getCartItemID() == Integer.parseInt(cartItemID)) {
                                selectedCartItems.add(item);
                            }
                        }
                    }
                    for (CartItems item : vectorCartItems) {
                        boolean isSelected = false;
                        for (String selectedId : selectedItems) {
                            if (Integer.parseInt(selectedId) == item.getCartItemID()) {
                                isSelected = true;
                                break;
                            }
                        }
                        if (!isSelected) {
                            unselectedItems.add(item.getCartItemID());
                        }
                    }
                    session.setAttribute("unselectedItems", unselectedItems);
                    session.setAttribute("selectedCartItems", selectedCartItems);
                    response.sendRedirect("CheckoutURL?service=theFirst");
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

