/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Districts;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Admin
 */
public class DAODistricts extends DBConnection {

    public int addDistrict(Districts district) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Districts]\n"
                + "           ([DistrictName]\n"
                + "           ,[ProvinceID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, district.getDistrictName());
            pre.setInt(2, district.getProvinceID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAODistricts.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    // Xóa một district theo DistrictID
    public int deleteDistrict(int districtId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Districts]\n"
                + "		  WHERE DistrictID = " + districtId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAODistricts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Cập nhật thông tin district
    public int updateDistrict(Districts district) {
        int n = 0;
        String sql = "UPDATE [dbo].[Districts]\n"
                + "   SET [DistrictName] = ?\n"
                + "      ,[ProvinceID] = ?\n"
                + " WHERE DistrictID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, district.getDistrictName());
            pre.setInt(2, district.getProvinceID());
            pre.setInt(3, district.getDistrictID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAODistricts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Lấy danh sách districts theo câu lệnh SQL
    public Vector<Districts> getDistricts(String sql) {
        Vector<Districts> vector = new Vector<Districts>();

        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int districtID = rs.getInt("DistrictID");
                String districtName = rs.getString("DistrictName");
                int provinceID = rs.getInt("ProvinceID");

                Districts district = new Districts(districtID, districtName, provinceID);
                vector.add(district);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAODistricts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public String getDistrictName(int id) {
        String name = "";
        String sql = "select p.DistrictName from Districts p where p.DistrictID =" + id;
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {

                name = rs.getString("DistrictName");

            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOProvinces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }

    public Districts getDistrictByOrderID(int orderid) {
        DAODistricts dao = new DAODistricts();
        Districts dis = dao.getDistricts("select * from Districts di join DeliveryAddress d on di.DistrictID = d.DistrictID\n"
                + "where d.OrderID = " + orderid).get(0);
        return dis;
    }

    public static void main(String[] args) {
        DAODistricts dao = new DAODistricts();
//        Vector<Districts> vector = dao.getDistricts("select * from Districts");
//        for (Districts districts : vector) {
//            System.out.println(districts);
//
//        }
//        LocalDate orderDate = LocalDate.now();
//        LocalDate deliveryDate = orderDate.plusDays(2);
//        System.out.println("Order Date: " + orderDate);
//        System.out.println("Delivery Date: " + deliveryDate);
           Districts dis = dao.getDistrictByOrderID(5);
           System.out.println(dis);
           
    }
}
