/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Ingredient;
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
public class DAOIngredient extends DBConnection {

    public int addIngredient(Ingredient ingre) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Ingredient]\n"
                + "           ([IngredientName]\n"
                + "           ,[ProductID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, ingre.getIngredientName());
            pre.setInt(2, ingre.getProductID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOIngredient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteIngredient(int inid) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Ingredient]\n"
                + "      WHERE IngredientID = " + inid;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOIngredient.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateIngredient(Ingredient ingre) {
        int n = 0;
        String sql = "UPDATE [dbo].[Ingredient]\n"
                + "   SET [IngredientName] = ?\n"
                + "      ,[ProductID] = ?\n"
                + " WHERE IngredientID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, ingre.getIngredientName());
            pre.setInt(2, ingre.getProductID());
            pre.setInt(3, ingre.getIngredientID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOIngredient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Ingredient> getIngredient(String sql) {
        Vector<Ingredient> vector = new Vector<Ingredient>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int IngredientID = rs.getInt("IngredientID");
                String IngredientName = rs.getString("IngredientName");
                int ProductID = rs.getInt("ProductID");
                
                Ingredient ingre = new Ingredient(IngredientID, IngredientName, ProductID);
                vector.add(ingre);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOIngredient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<String> getIngredientsByProductID(int productID) {
        Vector<String> ingredients = new Vector<>();
        try {
            String sql = "SELECT IngredientName FROM Ingredient WHERE ProductID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ingredients.add(rs.getString("IngredientName"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOIngredient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ingredients;
    }
    
    public static void main(String[] args) {
        DAOIngredient dao = new DAOIngredient();

//        Categories cateAdd = new Categories("Thuoc");
//        int n = dao.addCategories(cateAdd);

//        Categories cateUpdate = new Categories(1, "DungCuYTe");
//        int n = dao.updateCategories(cateUpdate);

//        int n = dao.deleteCategories("thuoc");
//        System.out.println(n);

        Vector<Ingredient> vector = dao.getIngredient("SELECT * FROM dbo.Ingredient");
        for (Ingredient ingredient : vector) {
            System.out.println(vector);
        }
    }
}
