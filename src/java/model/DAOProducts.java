/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Brand;
import entity.Products;
import entity.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author quang
 */
public class DAOProducts extends DBConnection {

    public int addProduct(Products product) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([ProductName]\n"
                + "           ,[Price]\n"
                + "           ,[Description]\n"
                + "           ,[UnitPrice]\n"
                + "           ,[CategoryID]\n"
                + "           ,[BrandID]\n"
                + "           ,[isPrescriptionDrug]\n"
                + "           ,[Quantity]\n"
                + "           ,[Image])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getProductName());
            pre.setFloat(2, product.getPrice());
            pre.setString(3, product.getDescription());
            pre.setString(4, product.getUnitPrice());
            pre.setInt(5, product.getCategoryID());
            pre.setInt(6, product.getBrandID());
            pre.setInt(7, (product.isIsPrescriptionDrug() == true ? 1 : 0));
            pre.setInt(8, product.getQuantity());
            pre.setString(9, product.getImage());
            n = pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteProduct(int pid) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE ProductID = " + pid;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateProduct(Products product) {
        int n = 0;
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [ProductName] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[UnitPrice] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + "      ,[BrandID] = ?\n"
                + "      ,[isPrescriptionDrug] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[Image] = ?\n"
                + " WHERE ProductID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getProductName());
            pre.setFloat(2, product.getPrice());
            pre.setString(3, product.getDescription());
            pre.setString(4, product.getUnitPrice());
            pre.setInt(5, product.getCategoryID());
            pre.setInt(6, product.getBrandID());
            pre.setInt(7, (product.isIsPrescriptionDrug() == true ? 1 : 0));
            pre.setInt(8, product.getQuantity());
            pre.setString(9, product.getImage());
            pre.setInt(10, product.getProductID());
            n = pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Products> getProducts(String sql) {
        Vector<Products> vector = new Vector<Products>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                float Price = rs.getFloat("Price");
                String Description = rs.getString("Description");
                String UnitPrice = rs.getString("UnitPrice");
                int CategoryID = rs.getInt("CategoryID");
                int BrandID = rs.getInt("BrandID");
                boolean isPrescriptionDrug = (rs.getInt("isPrescriptionDrug") == 1 ? true : false);
                int Quantity = rs.getInt("Quantity");
                String Image = rs.getString("Image");

                Products pro = new Products(ProductID, ProductName, Price, Description, UnitPrice, CategoryID, BrandID, isPrescriptionDrug, Quantity, Image);
                vector.add(pro);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vector;
    }

    public Products getProductByID(int productID) {
        Products product = null;
        String sql = "SELECT * FROM dbo.Products WHERE ProductID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, productID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                product = new Products(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getFloat("Price"),
                        rs.getString("Description"),
                        rs.getString("UnitPrice"),
                        rs.getInt("CategoryID"),
                        rs.getInt("BrandID"),
                        rs.getBoolean("IsPrescriptionDrug"),
                        rs.getInt("Quantity"),
                        rs.getString("Image")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    
    public int countProducts() {
    int count = 0;
    String sql = "SELECT COUNT(*) FROM dbo.Products";
    try {
        Statement state = conn.createStatement();
        ResultSet rs = state.executeQuery(sql);
        if (rs.next()) {
            count = rs.getInt(1);
        }
    } catch (SQLException ex) {
        Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
    }
    return count;
}


}
