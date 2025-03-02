/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Payments;
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
public class DAOPayments extends DBConnection {

    public int addPayment(Payments pay) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Payments]\n"
                + "           ([Method]\n"
                + "           ,[Amount]\n"
                + "           ,[StatusID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, pay.getMethod());
            pre.setFloat(2, pay.getAmount());
            pre.setInt(3, pay.getStatusID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOPayments.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deletePayment(int pay) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Payments]\n"
                + "      WHERE PaymentID = " + pay;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOPayments.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    public int updatePayment(Payments pay) {
        int n = 0;
        String sql = "UPDATE [dbo].[Payments]\n"
                + "   SET [Method] = ?\n"
                + "      ,[Amount] = ?\n"
                + "      ,[StatusID] = ?\n"
                + " WHERE PaymentID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, pay.getMethod());
            pre.setFloat(2, pay.getAmount());
            pre.setInt(3, pay.getStatusID());
            pre.setInt(4, pay.getPaymentID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOPayments.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public Vector<Payments> getPayment(String sql) {
        Vector<Payments> vector = new Vector<Payments>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int PaymentID = rs.getInt("PaymentID");
                String Method = rs.getString("Method");
                float Amount = rs.getFloat("Amount");
                int StatusID = rs.getInt("StatusID");
                
                Payments pay = new Payments(PaymentID, Method, Amount, StatusID);
                vector.add(pay);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOPayments.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
