/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Cart;
import entity.CartItems;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOCartItem extends DBConnection {

    public int addCartItem(CartItems other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[CartItem]\n"
                + "           ([CartID]\n"
                + "           ,[ProductID]\n"
                + "           ,[Price]\n"
                + "           ,[Quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, other.getCartID());
            preState.setInt(2, other.getProductID());
            preState.setDouble(3, other.getPrice());
            preState.setInt(4, other.getQuantity());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartItem.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteCartItem(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[CartItem]\n"
                + "      WHERE CartItemID = " + id;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartItem.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateCartItem(CartItems other) {
        int n = 0;
        String sql = "UPDATE [dbo].[CartItem]\n"
                + "   SET [CartID] = ?\n"
                + "      ,[ProductID] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Quantity] = ?\n"
                + " WHERE CartItemID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, other.getCartID());
            preState.setInt(2, other.getProductID());
            preState.setDouble(3, other.getPrice());
            preState.setInt(4, other.getQuantity());
            preState.setInt(5, other.getCartID());
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
     // Lấy tất cả các sản phẩm trong giỏ hàng theo CartID
    public List<CartItems> getItemsByCartId(int cartId) {
        List<CartItems> items = new ArrayList<>();
        String query = "SELECT * FROM CartItem WHERE CartID = ?";
        
        try (
             PreparedStatement stmt = conn.prepareStatement(query)) {
             
            stmt.setInt(1, cartId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                CartItems item = new CartItems();
                item.setCartItemID(rs.getInt("CartItemID"));
                item.setCartID(rs.getInt("CartID"));
                item.setProductID(rs.getInt("ProductID"));
                item.setPrice(rs.getDouble("Price"));
                item.setQuantity(rs.getInt("Quantity"));
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return items;
    }
    
    public Vector<CartItems> getCartItem(String sql){
        Vector<CartItems> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
              ResultSet rs= state.executeQuery(sql);
              while (rs.next()) {                
                int CartItemID = rs.getInt("CartItemID");
	  int CartID = rs.getInt("CartID");
	  int ProductID= rs.getInt("ProductID");
	  double Price= rs.getDouble("Price");
	  int Quantity= rs.getInt("Quantity");
          CartItems cartItem = new CartItems(CartItemID, CartID, ProductID, Price, Quantity);
          vector.add(cartItem);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    public CartItems getCartItem(int pid){
        CartItems cartItems = null;
        String sql ="SELECT p.ProductID ,p.ProductName ,p.Price "
                + ",p.UnitPrice  ,p.BrandID,p.Quantity ,p.Image FROM Products p WHERE p.ProductID="+pid;
        
        try {
             Statement state = conn.createStatement();
            ResultSet rs = state.executeQuery(sql);
            if(rs.next()){
                cartItems = new CartItems(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), 0);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItems;
        
    }
    
    
   
}
