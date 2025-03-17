/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.OrderDetails;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author quang
 */
public class DAOOrderDetails extends DBConnection {

    public int addOrderDetails(OrderDetails od) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([Price]\n"
                + "           ,[Quantity]\n"
                + "           ,[ProductID]\n"
                + "           ,[OrderID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setFloat(1, od.getPrice());
            pre.setInt(2, od.getQuantity());
            pre.setInt(3, od.getProductID());
            pre.setInt(4, od.getOrderID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetails.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteOrderDetails(int od) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[OrderDetails]\n"
                + "      WHERE OrderDetailID = " + od;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateOrderDetails(OrderDetails od) {
        int n = 0;
        String sql = "UPDATE [dbo].[OrderDetails]\n"
                + "   SET [Price] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[ProductID] = ?\n"
                + "      ,[OrderID] = ?\n"
                + " WHERE OrderDetailID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setFloat(1, od.getPrice());
            pre.setInt(2, od.getQuantity());
            pre.setInt(3, od.getProductID());
            pre.setInt(4, od.getOrderID());
            pre.setInt(5, od.getOrderDetailID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<OrderDetails> getOrderDetails(String sql) {
        Vector<OrderDetails> vector = new Vector<OrderDetails>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int OrderDetailID = rs.getInt("OrderDetailID");
                float Price = rs.getInt("Price");
                int Quantity = rs.getInt("Quantity");
                int ProductID = rs.getInt("ProductID");
                int OrderID = rs.getInt("OrderID");
                
                OrderDetails orderdetails = new OrderDetails(OrderDetailID, Price, Quantity, ProductID, OrderID);
                vector.add(orderdetails);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetails.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    public double getTotalPriceOrder(int orderId){
        double total = 0;
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery("select * from OrderDetails where OrderID ="+orderId);
            while (rs.next()) {
                
                float Price = rs.getFloat("Price");
                total += Price;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetails.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        
        return total;
    }
}
