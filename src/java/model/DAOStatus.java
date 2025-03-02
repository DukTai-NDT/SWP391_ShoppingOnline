/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Status;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author quang
 */
public class DAOStatus extends DBConnection {

    public int addStatus(Status s) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Status]\n"
                + "           ([Name]\n"
                + "           ,[UpdateTime])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, s.getName());
            pre.setDate(2, java.sql.Date.valueOf(s.getUpdateTime()));
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStatus.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteStatus(int status) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Status]\n"
                + "      WHERE StatusID = " + status;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOStatus.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateStatus(Status s) {
        int n = 0;
        String sql = "UPDATE [dbo].[Status]\n"
                + "   SET [Name] = ?\n"
                + "      ,[UpdateTime] = ?\n"
                + " WHERE StatusID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, s.getName());
            pre.setDate(2, java.sql.Date.valueOf(s.getUpdateTime()));
            pre.setInt(3, s.getStatusID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Status> getStatus(String sql) {
        Vector<Status> vector = new Vector<Status>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int StatusID = rs.getInt("StatusID");
                String Name = rs.getString("Name");
                LocalDate UpdateTime = rs.getDate("UpdateTime").toLocalDate();
                
                Status status = new Status(StatusID, Name, UpdateTime);
                vector.add(status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
