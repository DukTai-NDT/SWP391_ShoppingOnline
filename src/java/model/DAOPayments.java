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
                + "           ([MethodID]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, pay.getMethodID());
            pre.setInt(2, pay.isStatus() == true ? 1 : 0);
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
                + "   SET [MethodID] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE PaymentID = ??";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, pay.getMethodID());
            pre.setInt(2, pay.isStatus() == true ? 1 : 0);
            pre.setInt(3, pay.getPaymentID());
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
                int MethodID = rs.getInt("MethodID");

                boolean Status = (rs.getInt("Status")) == 1 ? true : false;

                Payments pay = new Payments(PaymentID, MethodID, Status);
                vector.add(pay);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOPayments.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    public int getLastPaymentID() {
       int n = 0;
        String sql = "SELECT top(1) * FROM Payments ORDER BY PaymentID DESC";
         try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {                
                n = rs.getInt("PaymentID");
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOPayments.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public static void main(String[] args) {
        DAOPayments dao = new DAOPayments();
        int n = dao.getLastPaymentID();
        System.out.println(n);
          Vector<Payments> vector = dao.getPayment("select * from Payments");
          for (Payments payments : vector) {
              System.out.println(payments);
        }
    }
}
