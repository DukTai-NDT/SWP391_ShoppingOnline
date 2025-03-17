/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Customers;
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
public class DAOCustomer extends DBConnection {

    public Customers getCustomerByAccountId(int accountId) {
        Customers customer = null;
        String sql = "SELECT * FROM Customers WHERE AccountID = ?";

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, accountId);
            ResultSet rs = preState.executeQuery();

            if (rs.next()) {
                customer = new Customers(
                        rs.getInt("CustomerID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Email"),
                        rs.getString("Address"),
                        rs.getString("Gender"),
                        rs.getString("Phone"),
                        rs.getInt("AccountID"),
                        rs.getString("ProfileImg")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }

    public Customers getCustomerByUsername(String username) {
        Customers customer = null;
        String sql = "SELECT c.* FROM Customers c JOIN Accounts a ON c.AccountID = a.AccountID WHERE a.UserName = ?";

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, username);
            ResultSet rs = preState.executeQuery();

            if (rs.next()) {
                customer = new Customers(
                        rs.getInt("CustomerID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Email"),
                        rs.getString("Address"),
                        rs.getString("Gender"),
                        rs.getString("Phone"),
                        rs.getInt("AccountID"),
                        rs.getString("ProfileImg")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }

    public int addCustomer(Customers other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Customers]\n"
                + "           ([FirstName]\n"
                + "           ,[LastName]\n"
                + "           ,[Email]\n"
                + "           ,[Address]\n"
                + "           ,[Gender]\n"
                + "           ,[Phone]\n"
                + "           ,[AccountID]\n"
                + "           ,[ProfileImg])\n               "
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getFirstName());
            preState.setString(2, other.getLastName());
            preState.setString(3, other.getEmail());
            preState.setString(4, other.getAddress());
            preState.setString(5, other.getGender());
            preState.setString(6, other.getPhone());
            preState.setInt(7, other.getAccountID());
            preState.setString(8, other.getProfileImg());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteCustomer(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Customers]\n"
                + "      WHERE CustomerID = " + id;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCustomer(Customers other) {
        int n = 0;
        String sql = "UPDATE [dbo].[Customers]\n"
                + "   SET [FirstName] = ?\n"
                + "      ,[LastName] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Gender] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[ProfileImg]=?\n"
                + " WHERE CustomerID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getFirstName());
            preState.setString(2, other.getLastName());
            preState.setString(3, other.getEmail());
            preState.setString(4, other.getAddress());
            preState.setString(5, other.getGender());
            preState.setString(6, other.getPhone());
            preState.setString(7, other.getProfileImg());
            preState.setInt(8, other.getCustomerID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Customers> getCustomer(String sql) {
        Vector<Customers> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int CustomerID = rs.getInt("CustomerID");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");
                String Email = rs.getString("Email");
                String Address = rs.getString("Address");
                String Gender = rs.getString("Gender");
                String Phone = rs.getString("Phone");
                int AccountID = rs.getInt("AccountID");
                String ProfileImg = rs.getString("ProfileImg");
                Customers cus = new Customers(CustomerID, FirstName, LastName, Email, Address, Gender, Phone, AccountID, ProfileImg);
                vector.add(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public String[] getCustomerByID(int CustomerID) {
        String[] result = new String[3];
        result[0] = "";
        result[1] = "";
        result[2] = "";

        String sql = "SELECT FirstName, LastName, ProfileImg FROM Customers WHERE CustomerID =?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, CustomerID);
            ResultSet rs = preState.executeQuery();
            if (rs.next()) {
                result[0] = rs.getString("FirstName");
                result[1] = rs.getString("LastName");
                result[2] = rs.getString("ProfileImg");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public String getUsernameByCustomerID(int customerID) {
        String username = null;
        String sql = "SELECT a.UserName FROM Customers c JOIN Accounts a ON c.AccountID = a.AccountID WHERE c.CustomerID = ?";

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, customerID);
            ResultSet rs = preState.executeQuery();

            if (rs.next()) {
                username = rs.getString("UserName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return username;
    }

    public Customers getCustomerByFeedbackID(int fid) {
        String sql = "SELECT c.* FROM Customers c "
                + "JOIN Accounts a ON c.AccountID = a.AccountID "
                + "JOIN Feedbacks f ON a.AccountID = f.AccountID "
                + "WHERE f.FeedbackID = ?";
        Customers customer = null;

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, fid);
            ResultSet rs = preState.executeQuery();

            if (rs.next()) {
                customer = new Customers(
                        rs.getInt("CustomerID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Email"),
                        rs.getString("Address"),
                        rs.getString("Gender"),
                        rs.getString("Phone"),
                        rs.getInt("AccountID"),
                        rs.getString("ProfileImg")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }

        return customer;

    }
    
    

    public static void main(String[] args) {
        DAOCustomer dao = new DAOCustomer();
        Customers cus = dao.getCustomer("select c.CustomerID,c.FirstName,c.LastName,c.Email,c.Address,c.Gender,c.Phone,c.AccountID,c.ProfileImg from Customers c join Accounts a on c.AccountID = a.AccountID").get(0);
        System.out.println(cus);
    }

}
