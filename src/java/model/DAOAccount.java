/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Account;
import entity.Blogs;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
        String sql = "INSERT INTO [dbo].[Accounts]\n"
                + "           ([UserName]\n"
                + "           ,[RoleID]\n"
                + "           ,[Password]\n"
                + "           ,[Email]\n"
                + "           ,[Active])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getUserName());
            preState.setInt(2, other.getRoleID());
            preState.setString(3, other.getPassword());
            preState.setString(4, other.getEmail());
            preState.setInt(5, other.isActive() == true ? 1 : 0);
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteAccount(int AccountID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Accounts]\n"
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
        String sql = "UPDATE [dbo].[Accounts]\n"
                + "   SET [Username] = ?\n"
                + "      ,[RoleID] = ?\n"
                + "      ,[Password] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[Active]) = ?\n"
                + " WHERE Account.AccountID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getUserName());
            preState.setInt(2, other.getRoleID());
            preState.setString(3, other.getPassword());
            preState.setString(4, other.getEmail());
            preState.setInt(5, other.isActive() == true ? 1 : 0);
            preState.setInt(6, other.getAccountID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    public boolean checkPassword(String email, String oldPassword) {
        boolean isValid = false;
        String sql = "SELECT * FROM Accounts WHERE CustomerID = ? AND Password = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, oldPassword);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return isValid;
    }

    public int changePassword(String email, String password) {
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
                boolean Active = (rs.getInt("Active") == 1 ? true : false);

                Account account = new Account(AccountID, UserName, RoleID, Password, Email, Active);

                vector.add(account);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vector;
    }

    public Account getAAccount(String email) {

        Account account = null;
        String sql = "SELECT *  FROM [dbo].[Accounts] where Email = ? ";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, email);
            ResultSet rs = preState.executeQuery();
            while (rs.next()) {
                account = new Account(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getBoolean(6));

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
                account = new Account(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getBoolean(6));

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

    public List<Account> getAllAccounts() {
        List<Account> list = new ArrayList<>();
        String query = "select * from Accounts ";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(query);
            while (rs.next()) {
                int AccountID = rs.getInt("AccountID");
                String UserName = rs.getString("UserName");
                int RoleID = rs.getInt("RoleID");
                String Password = rs.getString("Password");
                String Email = rs.getString("Email");
                boolean active = rs.getBoolean("active");
                Account account = new Account(AccountID, UserName, RoleID, Password, Email, active);
                list.add(account);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Account> getAccountById(String id) {
        List<Account> list = new ArrayList<>();
        String query = "select * from Accounts\n"
                + "where AccountID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getBoolean(5)));
            }

        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void deleteAccount(String id) {
        String query = "delete from Accounts\n"
                + "where AccountID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Account getAccountID(String id) {
        try {
            String sql = "Select * from Accounts where AccountID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account accoount = new Account();
                accoount.setAccountID(rs.getInt(1));
                accoount.setUserName(rs.getString(2));
                accoount.setRoleID(rs.getInt(3));
                accoount.setEmail(rs.getString(4));
                accoount.setPassword(rs.getString(5));
                accoount.setActive(rs.getBoolean(6));
                return accoount;
            }

        } catch (SQLException e) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, e);

        }
        return null;
    }

    public void insertAccount(String username, String role, String password, String email, boolean active) {
        String sql = "INSERT INTO [dbo].[Accounts] (username, roleID, password, email, active) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, username);
            preState.setString(2, role);
            preState.setString(3, password);
            preState.setString(4, email);
            preState.setBoolean(5, true);
            preState.executeQuery();

        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<Account> getAccountByName(String txtSearch) {
        List<Account> list = new ArrayList<>();
        String query = "select * from Accounts where username like ?";
        try {
            PreparedStatement preState = conn.prepareStatement(query);
            preState.setString(1, "%" + txtSearch + "%");
            ResultSet rs = preState.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getBoolean(6)));
            }

        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public int EditAccount(Account account) {
        int n = 0;
        try {
            String sql = "UPDATE [dbo].[Accounts]\n"
                    + "   SET [RoleID] = ?\n"
                    + "      ,[Active] = ?\n"
                    + "WHERE AccountID = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, account.getRoleID());
            stm.setBoolean(2, account.isActive());
            stm.setInt(3, account.getAccountID());
            n = stm.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    public int countAccounts() {
        int count = 0;
        String query = "SELECT COUNT(*) FROM Accounts";

        try {
            Statement state = conn.createStatement();
            ResultSet rs = state.executeQuery(query);
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }

        return count;
    }

    public Account checkAccountExist(String username) {
        String sql = "SELECT * FROM accounts WHERE username = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Account(rs.getInt("id"), rs.getString("username"), rs.getInt("roleid"), rs.getString("password"), rs.getString("email"), rs.getBoolean("status"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        DAOAccount dao = new DAOAccount();
//        Account accountAdd = new Account("Tainguyenduc", 2, "abcd123");

//        int n = dao.addAccount(accountAdd);
//    int n = dao.deleteAccount(1);
//          Account accountUpdate = new Account(2, "TaiNguye", 1, "cde123");
//          int n = dao.updateAccount(accountUpdate);
//        System.out.println(n);
        Vector<Account> vector = dao.getAccount("SELECT *  FROM [dbo].[Accounts] ");
        for (Account account : vector) {
            System.out.println(account);
        }
        
        
        int n = dao.EditAccount(new Account(6007, "abc", 3, "abc", "abc@gmail.com", false));
        System.out.println(n);
    }
}
