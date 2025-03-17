/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.PaymentMethod;
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
public class DAOPaymentMethod extends DBConnection {

    public int addMethodPayment(PaymentMethod s) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[MethodPayment]\n"
                + "           ([MethodName]\n"
                + "     VALUES\n"
                + "           (?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, s.getMethodName());
         
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOPaymentMethod.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deletePaymentMethod(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[MethodPayment]\n"
                + "      WHERE MethodID = " + id;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOPaymentMethod.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updatePaymentMethod(PaymentMethod s) {
        int n = 0;
        String sql = "UPDATE [dbo].[MethodPayment]\n"
                + "   SET [MethodName] = ?\n"
                + " WHERE MethodID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, s.getMethodName());
           
            pre.setInt(2, s.getMethodID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOPaymentMethod.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<PaymentMethod> getPaymentMethod(String sql) {
        Vector<PaymentMethod> vector = new Vector<PaymentMethod>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int MethodID = rs.getInt("MethodID");
                String MethodName = rs.getString("MethodName");
               
                
                PaymentMethod status = new PaymentMethod(MethodID, MethodName);
                vector.add(status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOPaymentMethod.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    public int getMethodPaymentID(String methodName){
        int n = 0;
       String sql = "SELECT MethodID FROM MethodPayment WHERE MethodName = ?"; 

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, methodName); 
            ResultSet rs = pre.executeQuery();

            while (rs.next()) { 
                n = rs.getInt("MethodID");
        }} catch (SQLException ex) {
            Logger.getLogger(DAOPaymentMethod.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public static void main(String[] args) {
       DAOPaymentMethod dao = new DAOPaymentMethod();
          Vector<PaymentMethod> vector = dao.getPaymentMethod("select * from MethodPayment");
          for (PaymentMethod paymentMethod : vector) {
              System.out.println(paymentMethod);
        }
          int n = dao.getMethodPaymentID("VNPay");
          System.out.println(n);
    }
}
