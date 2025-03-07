/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Orders;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author quang
 */
public class DAOOrders extends DBConnection {

    public int addOrder(Orders o) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([Amount]\n"
                + "           ,[Total]\n"
                + "           ,[Status]\n"
                + "           ,[CustomerID]\n"
                + "           ,[OrderTime]\n"
                + "           ,[PaymentID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setFloat(1, o.getAmount());
            pre.setFloat(2, o.getTotal());
            pre.setString(3, o.getStatus());
            pre.setInt(4, o.getCustomerID());
            pre.setDate(5, java.sql.Date.valueOf(o.getOrderTime()));
            pre.setInt(6, o.getPaymentID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteOrder(int o) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Orders]\n"
                + "      WHERE OrderID = " + o;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateOrder(Orders o) {
        int n = 0;
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [Amount] = ?\n"
                + "      ,[Total] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[CustomerID] = ?\n"
                + "      ,[OrderTime] = ?\n"
                + "      ,[PaymentID] = ?\n"
                + " WHERE OrderID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setFloat(1, o.getAmount());
            pre.setFloat(2, o.getTotal());
            pre.setString(3, o.getStatus());
            pre.setInt(4, o.getCustomerID());
            pre.setDate(5, java.sql.Date.valueOf(o.getOrderTime()));
            pre.setInt(6, o.getPaymentID());
            pre.setInt(7, o.getOrderID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Orders> getOrders(String sql) {
        Vector<Orders> vector = new Vector<Orders>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                float Amount = rs.getFloat("Amount");
                float Total = rs.getFloat("Total");
                String Status = rs.getString("Status");
                int CustomerID = rs.getInt("CustomerID");
                LocalDate OrderTime = rs.getDate("OrderTime").toLocalDate();
                int PaymentID = rs.getInt("PaymentID");
                
                Orders order = new Orders(OrderID, Amount, Total, Status, CustomerID, OrderTime, PaymentID);
                vector.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;

    }
}
