/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Cart;
import entity.CartItems;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.PreparedStatement;
import java.util.Vector;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
/**
 *
 * @author Admin
 */
public class DAOCart extends DBConnection {
    
    public Cart getCartByCustomerId(int customerId){
        Cart cart = null;
        
        String sql="Select * from Cart Where CustomerID=? AND CartStatus= true";
        
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, customerId);
            ResultSet rs =pre.executeQuery();
            if(rs.next()){
                cart = new Cart();
                cart.setCartID(customerId);
                cart.setCustomerID(rs.getInt("CustomerID"));
                cart.setCartStatus(rs.getBoolean("CartStatus"));
                cart.setTotalPrice(rs.getDouble("TotalPrice"));
                cart.setCreateDate(rs.getDate("CreateDate").toLocalDate());
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
            
        }
        
        
        
        
        
        
        return cart;
    }
    
    

    public int addCart(Cart other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([CustomerID]\n"
                + "           ,[CartStatus]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[CreateDate])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try {
            PreparedStatement preState = conn.prepareCall(sql);
            preState.setInt(1, other.getCustomerID());
            preState.setInt(2, other.isCartStatus() == true ? 1 : 0);
            preState.setDouble(3, other.getTotalPrice());
            preState.setDate(4, java.sql.Date.valueOf(other.getCreateDate()));
;
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteCart(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Cart]\n"
                + "      WHERE CartID = " + id;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCart(Cart other) {
        int n = 0;
        String sql = "UPDATE [dbo].[Cart]\n"
                + "   SET [CustomerID] = ?\n"
                + "      ,[CartStatus] = ?\n"
                + "      ,[TotalPrice] = ?\n"
                + "      ,[CreateDate] = ?\n"
                + " WHERE CartID = ?";
        
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, other.getCustomerID());
            preState.setInt(2, other.isCartStatus() == true ? 1 : 0);
            preState.setDouble(3, other.getTotalPrice());
            preState.setDate(4, java.sql.Date.valueOf(other.getCreateDate()));
            preState.setInt(5, other.getCartID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public Vector<Cart> getCart(String sql){
        Vector<Cart> vector = new Vector<>();
        try { 
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
               ResultSet rs = state.executeQuery(sql);
               while (rs.next()) {                
                int CartID = rs.getInt("CartID");
	  int CustomerID = rs.getInt("CustomerID");
	  boolean CartStatus = (rs.getInt("CartStatus")) == 1 ? true : false;
	  double TotalPrice = rs.getDouble("TotalPrice");
	  LocalDate CreateDate = rs.getDate("CreateDate").toLocalDate();
          Cart cart = new Cart(CartID, CustomerID, CartStatus, TotalPrice, CreateDate);
          vector.add(cart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    public Map<Integer, CartItems> getCartItems(int cartId) {
        Map<Integer, CartItems> items = new HashMap<>();
        DAOCartItem cartItemDAO = new DAOCartItem();
        for (CartItems item : cartItemDAO.getItemsByCartId(cartId)) {
            items.put(item.getProductID(), item);
        }
        return items;
    }

    public Cart getCartWithItems(int customerId) {
        Cart cart = getCartByCustomerId(customerId);
        if (cart != null) {
            // Lấy danh sách các mục từ CartItem dựa trên CartID
            Map<Integer, CartItems> items = getCartItems(cart.getCartID());
            // Cập nhật TotalPrice từ các mục
            double total = items.values().stream()
                    .mapToDouble(item -> item.getPrice() * item.getQuantity())
                    .sum();
            cart.setTotalPrice(total);
        }
        return cart; // Trả về Cart, danh sách items sẽ được quản lý riêng trong session
    }

    // Các phương thức khác giữ nguyên (addCart, deleteCart, updateCart, getCart)
}
    
  

