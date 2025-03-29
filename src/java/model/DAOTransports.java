/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Transports;
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
public class DAOTransports extends DBConnection {

    public int addTransports(Transports trans) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Transports]\n"
                + "           ([OrderID])\n"
                + "     VALUES\n"
                + "           (?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, trans.getOrderID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTransports.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteTransport(int trans) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Transports]\n"
                + "      WHERE TransportID = " + trans;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOTransports.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateTransport(Transports trans) {
        int n = 0;
        String sql = "UPDATE [dbo].[Transports]\n"
                + "   SET [OrderID] = ?\n"
                + " WHERE TransportID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, trans.getOrderID());
            pre.setInt(2, trans.getTransportID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTransports.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Transports> getTransport(String sql) {
        Vector<Transports> vector = new Vector<Transports>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int TransportID = rs.getInt("TransportID");
                int OrderID = rs.getInt("OrderID");
                
                Transports trans = new Transports(TransportID, OrderID);
                vector.add(trans);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTransports.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;
    }
}
