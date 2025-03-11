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

    public int addCustomer(Customers other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Customers]\n"
                + "           ([FirstName]\n"
                + "           ,[LastName]\n"
                + "           ,[Email]\n"
                + "           ,[Address]\n"
                + "           ,[Gender]\n"
                + "           ,[Phone]\n"
                + "           ,[AccountID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getFirstName());
            preState.setString(2, other.getLastName());
            preState.setString(3, other.getEmail());
            preState.setString(4, other.getAddress());
            preState.setString(5, other.getGender());
            preState.setString(6, other.getPhone());
            preState.setInt(7, other.getAccountID());
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
                + "      ,[AccountID] = ?\n"
                + " WHERE CustomerID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getFirstName());
            preState.setString(2, other.getLastName());
            preState.setString(3, other.getEmail());
            preState.setString(4, other.getAddress());
            preState.setString(5, other.getGender());
            preState.setString(6, other.getPhone());
            preState.setInt(7, other.getAccountID());
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
                Customers cus = new Customers(CustomerID, FirstName, LastName, Email, Address, Gender, Phone, AccountID);
                vector.add(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public static void main(String[] args) {
        DAOCustomer dao = new DAOCustomer();
        Vector<String> items = new Vector<>();
        for (int i = 1; i <= 10; i++) {
            items.add("Item " + i);
        }

        int index = 0; // Biến đếm
        for (String item : items) {
            if (index < 4) {
                System.out.println(item + " thuộc nhóm 1");
            } else {
                System.out.println(item + " thuộc nhóm 2");
            }
            index++; // Tăng index sau mỗi lần lặp
        }
    
    }
}
