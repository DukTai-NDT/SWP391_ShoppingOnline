/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.DeliveryAddress;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAODeliveryAddress extends DBConnection {

    public int addDeliveryAddress(DeliveryAddress other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[DeliveryAddress]\n"
                + "           ([AddressDetail]\n"
                + "           ,[OrderID]\n"
                + "           ,[ProvinceID]\n"
                + "           ,[DistrictID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getAddressDetail());
            preState.setInt(2, other.getOrderID());
            preState.setInt(3, other.getProvinceID());
            preState.setInt(4, other.getDistrictID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAODeliveryAddress.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteDeliveryAddress(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[DeliveryAddress]\n"
                + "      WHERE DeliveryAddress.DeliveryAddressID = " + id;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAODeliveryAddress.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int deleteDeliveryAddressByOrderID(int oid) {
        int n = 0;
        String sql = "delete DeliveryAddress where OrderID =" + oid;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAODeliveryAddress.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateDeliveryAddress(DeliveryAddress other) {
        int n = 0;
        String sql = "UPDATE [dbo].[DeliveryAddress]\n"
                + "   SET [AddressDetail] = ?\n"
                + "      ,[OrderID] = ?\n"
                + "      ,[ProvinceID] = ?\n"
                + "      ,[DistrictID] = ?\n"
                + " WHERE DeliveryAddress.DeliveryAddressID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getAddressDetail());
            preState.setInt(2, other.getOrderID());
            preState.setInt(3, other.getProvinceID());
            preState.setInt(4, other.getDistrictID());
            preState.setInt(5, other.getDeliveryAddressID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAODeliveryAddress.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public Vector<DeliveryAddress> getDeliveryAddress(String sql){
        Vector<DeliveryAddress> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {                
                int DeliveryAddressID = rs.getInt("DeliveryAddressID");
	  String AddressDetail = rs.getString("AddressDetail");
	  int OrderID = rs.getInt("OrderID");
	  int ProvinceID = rs.getInt("ProvinceID");
	  int DistrictID = rs.getInt("DistrictID");
          vector.add(new DeliveryAddress(DeliveryAddressID, AddressDetail, OrderID, ProvinceID, DistrictID));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAODeliveryAddress.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;
    }
    
    public static void main(String[] args) {
        DAODeliveryAddress dao  = new DAODeliveryAddress();
        Vector<DeliveryAddress> vector = dao.getDeliveryAddress("Select * from DeliveryAddress");
        for (DeliveryAddress deliveryAddress : vector) {
            System.out.println("1"+deliveryAddress);
        }
        
    }
}
