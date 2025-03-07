/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import entity.Provinces;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Admin
 */
public class DAOProvinces extends DBConnection{
    // Thêm một province mới
    public int addProvince(Provinces province) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Provinces]\n"
                + "           ([ProvinceName])\n"
                + "     VALUES\n"
                + "           (?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, province.getProvinceName());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProvinces.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    // Xóa một province theo ProvinceID
    public int deleteProvince(int provinceId) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Provinces]\n"
                + "		  WHERE ProvinceID = " + provinceId;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProvinces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Cập nhật thông tin province
    public int updateProvince(Provinces province) {
        int n = 0;
        String sql = "UPDATE [dbo].[Provinces]\n"
                + "   SET [ProvinceName] = ?\n"
                + " WHERE ProvinceID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, province.getProvinceName());
            pre.setInt(2, province.getProvinceID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProvinces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Lấy danh sách provinces theo câu lệnh SQL
    public Vector<Provinces> getProvinces(String sql) {
        Vector<Provinces> vector = new Vector<Provinces>();

        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int provinceID = rs.getInt("ProvinceID");
                String provinceName = rs.getString("ProvinceName");
                
                Provinces province = new Provinces(provinceID, provinceName);
                vector.add(province);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOProvinces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    public String getProvinceName(int id){
        String name = "";
        String sql = "select p.ProvinceName from Provinces p where p.ProvinceID = "+id;
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
               
                name = rs.getString("ProvinceName");
            
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOProvinces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }
    public static void main(String[] args) {
        DAOProvinces dao = new DAOProvinces();
        Vector<Provinces> vector = dao.getProvinces("Select * from Provinces");
//       ResultSet rs = dao.getData("SELECT [ProvinceID],[ProvinceName] FROM [dbo].[Provinces] ");
//        try {
//            while (rs.next()) {
//                System.out.println(rs.getInt(1)+","+rs.getString(2));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DAOProvinces.class.getName()).log(Level.SEVERE, null, ex);
//        }
        String name = dao.getProvinceName(15);
        System.out.println(name);
    }
}
