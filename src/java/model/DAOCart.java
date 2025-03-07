/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Cart;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.PreparedStatement;
import java.util.Vector;
import java.sql.ResultSet;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class DAOCart extends DBConnection {

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
            preState.setFloat(3, other.getTotalPrice());
            preState.setDate(4, java.sql.Date.valueOf(other.getCreateDate()));
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
            preState.setFloat(3, other.getTotalPrice());
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
	  float TotalPrice = rs.getFloat("TotalPrice");
	  LocalDate CreateDate = rs.getDate("CreateDate").toLocalDate();
          Cart cart = new Cart(CartID, CustomerID, CartStatus, TotalPrice, CreateDate);
          vector.add(cart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
