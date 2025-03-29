/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Image;
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
public class DAOImage extends DBConnection {

    public int addImage(Image image) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Image]\n"
                + "           ([ProductID]\n"
                + "           ,[ImageName])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, image.getProductID());
            pre.setString(2, image.getImageName());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOImage.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteImage(int imageid) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Image]\n"
                + "		  WHERE ImageID = " + imageid;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOImage.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateImage(Image image) {
        int n = 0;
        String sql = "UPDATE [dbo].[Image]\n"
                + "   SET [ProductID] = ?\n"
                + "      ,[ImageName] = ?\n"
                + " WHERE ImageID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, image.getProductID());
            pre.setString(2, image.getImageName());
            pre.setInt(3, image.getImageID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOImage.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Image> getImage(String sql) {
        Vector<Image> vector = new Vector<Image>();

        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int ImageID = rs.getInt("ImageID");
                int ProductID = rs.getInt("ProductID");
                String ImageName = rs.getString("ImageName");
                
                Image ima = new Image(ImageID, ProductID, ImageName);
                vector.add(ima);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOImage.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
