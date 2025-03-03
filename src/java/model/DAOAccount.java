/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Account;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOAccount extends DBConnection {

    public int addAccount(Account other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Accounts]([Username],[RoleID],[Password],[Email])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getUserName());
            preState.setInt(2, other.getRoleID());
            preState.setString(3, other.getPassword());
            preState.setString(4, other.getEmail());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteAccount(int AccountID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Accounts]\n"
                + "      WHERE Accounts.AccountID = " + AccountID;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateAccount(Account other) {
        int n = 0;
        String sql = "UPDATE [dbo].[Accounts]\n"
                + "   SET [Username] = ?\n"
                + "      ,[RoleID] = ?\n"
                + "      ,[Password] = ?\n"
                + "      ,[Email] = ?\n"
                + " WHERE Accounts.AccountID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getUserName());
            preState.setInt(2, other.getRoleID());
            preState.setString(3, other.getPassword());
            preState.setString(4, other.getEmail());

            preState.setInt(5, other.getAccountID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    public int changePassword(String email, String password){
        int n = 0;
        String sql = "UPDATE [dbo].[Accounts]\n"
                + "   SET [Password] = ?\n"
                
                + " WHERE Accounts.Email = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, password);
            preState.setString(2, email);
            
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public Vector<Account> getAccount(String sql) {
        Vector<Account> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int AccountID = rs.getInt("AccountID");
                String UserName = rs.getString("UserName");
                int RoleID = rs.getInt("RoleID");
                String Password = rs.getString("Password");
                String Email = rs.getString("Email");
                Account account = new Account(AccountID, UserName, RoleID, Password,Email);
                vector.add(account);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vector;
    }
    public Account getAAccount(String email){
        Account account = null;
        String sql = "SELECT *  FROM [dbo].[Accounts] where Email = ? ";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, email);
          
            ResultSet rs = preState.executeQuery();
            while (rs.next()) {
                account = new Account(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),rs.getString(5));

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }
    public Account getLogin(String userName, String password) {
        Account account = null;
        String sql = "select * from Accounts where Accounts.UserName = ? and Accounts.Password = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, userName);
            preState.setString(2, password);
            ResultSet rs = preState.executeQuery();
            while (rs.next()) {
                account = new Account(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),rs.getString(5));

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }

    public int getLastAccountID() {
        int n = 0;
        String sql = "  SELECT top(1) * FROM Accounts ORDER BY AccountID DESC ";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                n = rs.getInt("AccountID");

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<String> getEmailAccount() {
        Vector<String> listEmail = new Vector<>();
        String sql = "select Email from Accounts";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                listEmail.add(rs.getString("Email"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listEmail;
    }

    public static void main(String[] args) {
        DAOAccount dao = new DAOAccount();
    Account acc = dao.getLogin("abc", "123");
        System.out.println(acc);
        
        
    }
}
