/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Staff;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author quang
 */
public class DAOStaff extends DBConnection {

    public int addStaff(Staff other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Staff]\n"
                + "           ([FirstName]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[AccountID])\n"
                + "     VALUES\n"
                + "           (?,\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        PreparedStatement preState;
        try {
            preState = conn.prepareStatement(sql);
            preState.setString(1, other.getFirstName());
            preState.setString(2, other.getPhone());
            preState.setString(3, other.getEmail());
            preState.setInt(4, other.getAccountID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStaff.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteStaff(int StaffID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Staff]\n"
                + "      WHERE StaffID = " + StaffID + "";
        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(DAOStaff.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateStaff(Staff staff) {
        int n = 0;
        String sql = "UPDATE [dbo].[Staff]\n"
                + "   SET [FirstName] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[AccountID] = ?\n"
                + " WHERE StaffID = ?";
        PreparedStatement preState;
        
        try {
            preState = conn.prepareStatement(sql);
            preState.setString(1, staff.getFirstName());
            preState.setString(2, staff.getPhone());
            preState.setString(3, staff.getEmail());
            preState.setInt(4, staff.getAccountID());
            preState.setInt(5, staff.getStaffID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStaff.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return n;
    }
    
    public Vector<Staff> getStaff (String sql) {
        Vector<Staff> vector = new Vector<Staff>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while(rs.next()){
                int StaffID = rs.getInt("StaffID");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");
                String Phone = rs.getString("Phone");
                String Email = rs.getString("Email");
                int AccountID = rs.getInt("AccountID");
                
                Staff staff = new Staff(StaffID, FirstName, LastName, Phone, Email, AccountID);
                vector.add(staff);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOStaff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
