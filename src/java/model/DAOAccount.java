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
        String sql = "INSERT INTO [dbo].[Account]([Username],[RoleID],[Password],[Email])\n"
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
        String sql = "DELETE FROM [dbo].[Account]\n"
                + "      WHERE Account.AccountID = " + AccountID;
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
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [Username] = ?\n"
                + "      ,[RoleID] = ?\n"
                + "      ,[Password] = ?\n"
                + "      ,[Email] = ?\n"
                + " WHERE Account.AccountID = ?";
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
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [Password] = ?\n"
                
                + " WHERE Account.Email = ?";
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
        String sql = "SELECT *  FROM [dbo].[Account] where Email = ? ";
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
        String sql = "select * from Account where Account.Username = ? and Account.Password = ?";
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
        String sql = "  SELECT top(1) * FROM Account ORDER BY AccountID DESC ";
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
        String sql = "select Email from Account";
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
//        Account accountAdd = new Account("Tainguyenduc", 2, "abcd123");
//        int n = dao.addAccount(accountAdd);

//    int n = dao.deleteAccount(1);
//          Account accountUpdate = new Account(2, "TaiNguye", 1, "cde123");
//          int n = dao.updateAccount(accountUpdate);
//        System.out.println(n);
        Vector<Account> vector = dao.getAccount("SELECT *  FROM [dbo].[Account] ");
        for (Account account : vector) {
            System.out.println(account);
        }
        System.out.println("-------------");
        Vector<String> stringVector = dao.getEmailAccount();
        String acc = "taindhe181162@fpt.edu.vn";
        String email = "";
        for (String string : stringVector) {
            if (acc.equals(string)) {
                System.out.println("ok");
                email = (String)string;
            }
        }
        System.out.println(email);
        
        dao.changePassword("taindhe181162@fpt.edu.vn", "123456");
        
         Vector<Account> vectorAcc = dao.getAccount("SELECT *  FROM [dbo].[Account] where Email like '"+acc+"' ");
        for (Account account : vectorAcc) {
            
            System.out.println(account);
        }
//        dao.deleteAccount(5010);
        System.out.println(dao.getAAccount("nguyenductai.12a2tqk@gmail.com"));
        
        
    }
}
