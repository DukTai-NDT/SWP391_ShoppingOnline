/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


import entity.Function;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author quang
 */
public class DAOFunction extends DBConnection {

    public int addFunction(Function function) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Function]\n"
                + "           ([FunctionDescription]\n"
                + "           ,[ProductID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, function.getFunctionDescription());
            pre.setInt(2, function.getProductID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFunction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteFunction(int funcid) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Function]\n"
                + "      WHERE FunctionID = " + funcid;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOFunction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateFunction(Function function) {
        int n = 0;
        String sql = "UPDATE [dbo].[Function]\n"
                + "   SET [FunctionDescription] = ?\n"
                + "      ,[ProductID] = ?\n"
                + " WHERE FunctionID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, function.getFunctionDescription());
            pre.setInt(2, function.getProductID());
            pre.setInt(3, function.getFunctionID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFunction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Function> getFunction(String sql) {
        Vector<Function> vector = new Vector<Function>();

        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int FunctionID = rs.getInt("FunctionID");
                String FunctionDescription = rs.getString("FunctionDescription");
                int ProductID = rs.getInt("ProductID");
                
                Function fun = new Function(FunctionID, FunctionDescription, ProductID);
               vector.add(fun);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFunction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
