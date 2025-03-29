/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.CartItems;
import entity.Products;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                + "           ,[ProductName]\n"
                + "           ,[Price]\n"
                + "           ,[Quantity]\n"
                + "           ,[IsBuy])\n"
                + "     VALUES\n"
                + "           (?,?,?,? ,?,?)";

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, other.getCartID());
            preState.setInt(2, other.getProductID());
            preState.setString(3, other.getProductName());
            preState.setFloat(4, other.getPrice());
            preState.setInt(5, other.getQuantity());
            preState.setInt(6, other.isIsBuy() == true ? 1 : 0);
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartItem.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int changeIsBuy(int newValue, int CartItemID) {
        int n = 0;
        String sql = "  update CartItem set IsBuy = " + newValue + " where CartItemID = " + CartItemID;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
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
                + "      ,[ProductName] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "     ,[IsBuy] = ?\n"
                + " WHERE CartItemID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, other.getCartID());
            preState.setInt(2, other.getProductID());
            preState.setString(3, other.getProductName());
            preState.setFloat(4, other.getPrice());
            preState.setInt(5, other.getQuantity());
            preState.setInt(6, other.isIsBuy() == true ? 1 : 0);
            preState.setInt(7, other.getCartID());
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateQuantityCartItem(int quantity, int CartItemID) {
        int n = 0;
        String sql = "  UPDATE CartItem\n"
                + "SET Quantity = ? \n"
                + "WHERE CartItemID = ?;";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);

            preState.setInt(1, quantity);
            preState.setInt(2, CartItemID);
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<CartItems> getCartItem(String sql) {
        Vector<CartItems> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int CartItemID = rs.getInt("CartItemID");
                int CartID = rs.getInt("CartID");
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                float Price = rs.getFloat("Price");
                int Quantity = rs.getInt("Quantity");
                boolean IsBuy = (rs.getInt("IsBuy")) == 1 ? true : false;
                CartItems cartItem = new CartItems(CartItemID, CartID, ProductID, ProductName, Price, Quantity, IsBuy);
                vector.add(cartItem);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<CartItems> getProductIsntBuy(String sql) {
        Vector<CartItems> vector = new Vector<>();
        Vector<CartItems> vectorCartItem = getCartItem(sql);

        for (int i = 0; i < vectorCartItem.size(); i++) {
            CartItems cartItems = vectorCartItem.get(i);
            if (!cartItems.isIsBuy()) {
                vector.add(cartItems); // ✅ Thêm vào danh sách mới
            }
        }
        return vector;
    }
    public Vector<CartItems> getProductIsBuy(String sql) {
        Vector<CartItems> vector = new Vector<>();
        Vector<CartItems> vectorCartItem = getCartItem(sql);

        for (int i = 0; i < vectorCartItem.size(); i++) {
            CartItems cartItems = vectorCartItem.get(i);
            if (cartItems.isIsBuy()) {
                vector.add(cartItems); // ✅ Thêm vào danh sách mới
            }
        }
        return vector;
    }
    public boolean checkQuantity(int quantity, int pid){
        DAOProducts dao = new DAOProducts();
        Products pro = dao.getProductByID(pid);
        if(pro.getQuantity() < quantity){
            return false;
        }
        return true;
        
    }
    public static void main(String[] args) {
        DAOCartItem dao = new DAOCartItem();
        boolean status = dao.checkQuantity(49, 8);
        System.out.println(status);
        Vector<CartItems> vectorCartItem = dao.getCartItem("select * from CartItem");
        
        Vector<CartItems> vector = dao.getProductIsntBuy("  select ci.CartItemID,ci.CartID,ci.ProductID,ci.ProductName,ci.Price,ci.Quantity, ci.IsBuy from CartItem ci join Cart c on ci.CartID = c.CartID where c.CustomerID = 3");
        for (CartItems cartItems : vectorCartItem) {
            System.out.println(cartItems.getProductID());
        }
    }

}