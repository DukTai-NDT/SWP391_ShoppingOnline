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


    public int getTotalSearchOrders(String searchQuery) {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM Orders WHERE OrderID LIKE ? OR CustomerID LIKE ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchQuery + "%");
            ps.setString(2, "%" + searchQuery + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // Lấy danh sách đơn hàng theo trang + từ khóa tìm kiếm
    public Vector<Orders> searchOrdersByPage(String searchQuery, int page, int pageSize) {
        Vector<Orders> ordersList = new Vector<>();
        int start = (page - 1) * pageSize;
        String sql = "SELECT * FROM Orders WHERE OrderID LIKE ? OR CustomerID LIKE ? ORDER BY OrderTime DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchQuery + "%");
            ps.setString(2, "%" + searchQuery + "%");
            ps.setInt(3, start);
            ps.setInt(4, pageSize);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Orders order = new Orders(
                        rs.getInt("OrderID"),
                        rs.getString("Status"),
                        rs.getInt("CustomerID"),
                        rs.getTimestamp("OrderTime").toLocalDateTime().toLocalDate(),
                        rs.getTimestamp("DeliveryETA") != null ? rs.getTimestamp("DeliveryETA").toLocalDateTime().toLocalDate() : null,
                        rs.getInt("PaymentID")
                );
                ;
                ordersList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ordersList;
    }

    // Lấy tổng số đơn hàng trong bảng Orders
    public int getTotalOrders() {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM Orders";
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // Lấy danh sách đơn hàng theo trang (không có tìm kiếm)
    public Vector<Orders> getOrdersByPage(int page, int pageSize) {
        Vector<Orders> ordersList = new Vector<>();
        int start = (page - 1) * pageSize;
        String sql = "SELECT * FROM Orders ORDER BY OrderTime DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Orders order = new Orders(
                        rs.getInt("OrderID"),
                        rs.getString("Status"),
                        rs.getInt("CustomerID"),
                        rs.getTimestamp("OrderTime").toLocalDateTime().toLocalDate(),
                        rs.getTimestamp("DeliveryETA") != null ? rs.getTimestamp("DeliveryETA").toLocalDateTime().toLocalDate() : null,
                        rs.getInt("PaymentID")
                );
                ordersList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ordersList;
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

     
        Vector<Orders> vector = dao.getOrders("select * from Orders where OrderID = 3018");
        System.out.println(vector.get(0).getPaymentID());
        
        

    }
}
