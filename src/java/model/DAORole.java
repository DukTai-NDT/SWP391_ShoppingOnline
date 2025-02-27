/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Role;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Statement;
import java.util.Vector;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class DAORole extends DBConnection {

    public int addRole(Role other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Role]\n"
                + "           ([RoleName])\n"
                + "     VALUES\n"
                + "           (?)";
        PreparedStatement preState;
        try {
            preState = conn.prepareStatement(sql);
            preState.setString(1, other.getRoleName());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAORole.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteRole(String RoleName) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Role]\n"
                + "      WHERE Role.RoleName like '" + RoleName + "'";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAORole.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateRole(Role other, String oldRoleName) {
        int n = 0;
        String sql = "UPDATE [dbo].[Role] SET [RoleName] = ?\n"
                + " WHERE Role.RoleName like ?";

        try {
            PreparedStatement preState = conn.prepareCall(sql);
            preState.setString(1, other.getRoleName());
            preState.setString(2, oldRoleName);
            n = preState.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAORole.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Role> getRole(String sql) {
        Vector<Role> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int RoleID = rs.getInt("RoleID");
                String RoleName = rs.getString("RoleName");
                Role role = new Role(RoleID, RoleName);
                vector.add(role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORole.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAORole dao = new DAORole();
//        Role roleAdd = new Role("Doctor");
//        int n = dao.addRole(roleAdd);
//        if(n != 0){
//            System.out.println("Success");
//        }
//        int n = dao.deleteRole("Staff");
//        if (n != 0) {
//            System.out.println("Success");
//        }
//        Role roleUpdate = new Role("Patient");
//        int n = dao.updateRole(roleUpdate, "Doctor");
//        if (n != 0) {
//            System.out.println("Success");
//        }

        Vector<Role> vector = dao.getRole("SELECT *  FROM [dbo].[Role] ");
        for (Role role : vector) {
            System.out.println(role);
        }
    }
}
