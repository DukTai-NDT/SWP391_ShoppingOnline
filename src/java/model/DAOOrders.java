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
                + "           ([Status]\n"
                + "           ,[CustomerID]\n"
                + "           ,[OrderTime]\n"
                + "           ,[DeliveryETA]\n"
                + "           ,[PaymentID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setString(1, o.getStatus());
            pre.setInt(2, o.getCustomerID());
            pre.setDate(3, java.sql.Date.valueOf(o.getOrderTime()));
            pre.setDate(4, java.sql.Date.valueOf(o.getDeliveryETA()));
            pre.setInt(5, o.getPaymentID());
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
                + "   SET [Status] = ?\n"
                + "      ,[CustomerID] = ?\n"
                + "      ,[OrderTime] = ?\n"
                + "      ,[DeliveryETA] = ?\n"
                + "      ,[PaymentID] = ?\n"
                + " WHERE OrderID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setString(1, o.getStatus());
            pre.setInt(2, o.getCustomerID());
            pre.setDate(3, java.sql.Date.valueOf(o.getOrderTime()));
            pre.setDate(4, java.sql.Date.valueOf(o.getDeliveryETA()));
            pre.setInt(5, o.getPaymentID());
            pre.setInt(6, o.getOrderID());
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

                String Status = rs.getString("Status");
                int CustomerID = rs.getInt("CustomerID");
                LocalDate OrderTime = rs.getDate("OrderTime").toLocalDate();
                LocalDate DeliveryETA = rs.getDate("DeliveryETA").toLocalDate();
                int PaymentID = rs.getInt("PaymentID");

                Orders order = new Orders(OrderID, Status, CustomerID, OrderTime, DeliveryETA, PaymentID);
                vector.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vector;

    }

    public int getLastOrderID() {
        int n = 0;
        String sql = "SELECT top(1) * FROM Orders ORDER BY OrderID DESC ";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                n = rs.getInt("OrderID");

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateStatusOrder(String newStatus, int orderID) {
        int n = 0;
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [Status] = ?\n"
                + " WHERE OrderID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setString(1, newStatus);
            pre.setInt(2, orderID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        DAOOrders dao = new DAOOrders();

      int n = dao.updateStatusOrder("Hoàn thành", 1);
        System.out.println(n);
        Vector<Orders> vector = dao.getOrders("select * from Orders");
        for (Orders orders : vector) {
            System.out.println(orders);
        }
        
        

    }
}
