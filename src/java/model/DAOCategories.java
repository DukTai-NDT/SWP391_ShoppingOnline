/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Blogs;
import entity.Categories;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
        String sql = "INSERT INTO [dbo].[Categories] ([CategoryName])\n"
                + "VALUES(?)";

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getCategoryName());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategories.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteCategories(String name) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Categories]\n"
                + "      WHERE Categories.CategoryName like '" + name + "'";

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
                + "   SET [CategoryName] = ?\n"
                + " WHERE Categories.CategoryID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, other.getCategoryName());
            preState.setInt(2, other.getCategoryID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategories.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Categories> getCategories(String sql) {
        Vector<Categories> vector = new Vector<Categories>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int CategoryID = rs.getInt("CategoryID");
                String CategoryName = rs.getString("CategoryName");
                String image = rs.getString("image");
                Categories categories = new Categories(CategoryID, CategoryName, image);
                vector.add(categories);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategories.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Categories getCategoryByID(String id) {
        String sql = "select * from Categories\n"
                + "where CategoryID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                return new Categories(rs.getInt("CategoryID"), rs.getString("CategoryName"), rs.getString("image"));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void deleteCategories1(String id) {
        String query = "delete from Categories \n"
                + "where CategoryID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void inserCategories(String name, String image) {
        String sql = "INSERT INTO [dbo].[Categories] (CategoryName,image) VALUES (?, ?)";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, name);
            preState.setString(2, image);
            preState.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategories.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public Categories getCategoryByID(int categoryID) {
        Categories category = null;
        String sql = "SELECT * FROM dbo.Categories WHERE CategoryID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, categoryID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                category = new Categories(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategories.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

    public List<Categories> getCategoriesesByName(String txtSearch) {
        List<Categories> list = new ArrayList<>();
        String query = "select * from blogs where Title like ?";
        try {
            PreparedStatement preState = conn.prepareStatement(query);
            preState.setString(1, "%" + txtSearch + "%");
            ResultSet rs = preState.executeQuery();
            while (rs.next()) {
              list.add(new Categories(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }

        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void editCategory(String id, String name, String image) {
        String sql = "Update Categories \n"
                + "Set CategoryName=?,\n"
                + "image=?\n"
                + "where CategoryID=?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(3, id);
            preState.setString(1, name);
            preState.setString(2, image);
            preState.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategories.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
