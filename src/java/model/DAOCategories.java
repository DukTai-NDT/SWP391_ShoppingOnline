/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Categories;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOCategories extends DBConnection {

    public int addCategories(Categories other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Categories] ([Name])\n"
                + "VALUES(?)";

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getName());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategories.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteCategories(String name) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Categories]\n"
                + "      WHERE Categories.Name like '" + name + "'";

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategories.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCategories(Categories other) {
        int n = 0;
        String sql = "UPDATE [dbo].[Categories]\n"
                + "   SET [Name] = ?\n"
                + " WHERE Categories.CategoriesID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getName());
            preState.setInt(2, other.getCategoriesID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategories.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Categories> getCategories(String sql) {
        Vector<Categories> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int CategoriesID = rs.getInt("CategoriesID");
                String Name = rs.getString("Name");
                Categories categories = new Categories(CategoriesID, Name);
                vector.add(categories);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategories.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOCategories dao = new DAOCategories();

//        Categories cateAdd = new Categories("Thuoc");
//        int n = dao.addCategories(cateAdd);

//        Categories cateUpdate = new Categories(1, "DungCuYTe");
//        int n = dao.updateCategories(cateUpdate);

//        int n = dao.deleteCategories("thuoc");
//        System.out.println(n);

        Vector<Categories> vector = dao.getCategories("select * from Categories");
        for (Categories categories : vector) {
            System.out.println(categories);
            
        }
    }
}
