/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Brand;

import entity.Categories;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOBrand extends DBConnection {

    public int addBrand(Brand other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Brand]\n"
                + "           ([BrandName]\n"
                + "           ,[Country])\n"
                + "     VALUES\n"
                + "           (?,?)";

        try {
            PreparedStatement preSate = conn.prepareStatement(sql);
            preSate.setString(1, other.getBrandName());
            preSate.setString(2, other.getCountry());
            n = preSate.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBrand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteBrand(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Brand]\n"
                + "      WHERE BrandID = " + id;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOBrand.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateBrand(Brand other) {
        int n = 0;
        String sql = "UPDATE [dbo].[Brand]\n"
                + "   SET [BrandName] = ?\n"
                + "      ,[Country] = ?\n"
                + " WHERE BrandID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getBrandName());
            preState.setString(2, other.getCountry());
            preState.setInt(3, other.getBrandID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBrand.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public Vector<Brand> getBrand(String sql) {
        Vector<Brand> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int BrandID = rs.getInt("BrandID");
                String BrandName = rs.getString("BrandName");
                String Country = rs.getString("Country");
                Brand brand = new Brand(BrandID, BrandName, Country);
                vector.add(brand);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBrand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }


    public static void main(String[] args) {
        DAOBrand dao = new DAOBrand();
        Vector<Brand> vector = dao.getBrand("SELECT * FROM dbo.Brand");
        for (Brand brand : vector) {
            System.out.println(brand);
        }
    }

}
