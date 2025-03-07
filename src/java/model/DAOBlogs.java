/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Blogs;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOBlogs extends DBConnection {

    public int addBlog(Blogs other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Blogs]\n"
                + "           ([CustomerID]\n"
                + "           ,[PostTime]\n"
                + "           ,[Title]\n"
                + "           ,[Content]\n"
                + "           ,[Image]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, other.getCustomerID());
            preState.setDate(2, java.sql.Date.valueOf(other.getPostTime()));

            preState.setString(3, other.getTitle());
            preState.setString(4, other.getContent());
            preState.setString(5, other.getImage());
            preState.setInt(6, other.isStatus() == true ? 1 : 0);

        } catch (SQLException ex) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteBlog(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Blogs]\n"
                + "      WHERE BlogID = " + id;

        try {
            Statement state = conn.createStatement();

            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateBlog(Blogs other) {
        int n = 0;
        String sql = "UPDATE [dbo].[Blogs]\n"
                + "   SET [CustomerID] = ?\n"
                + "      ,[PostTime] = ?\n"
                + "      ,[Title] = ?\n"
                + "      ,[Content] = ?\n"
                + "      ,[Image] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE BlogID = ?";

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, other.getCustomerID());
            preState.setDate(2, java.sql.Date.valueOf(other.getPostTime()));
            preState.setString(3, other.getTitle());
            preState.setString(4, other.getContent());
            preState.setString(5, other.getImage());
            preState.setInt(6, other.isStatus() == true ? 1 : 0);
            preState.setInt(7, other.getBlogID());
            n = preState.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Blogs> getBlogs(String sql) {
        Vector<Blogs> vector = new Vector<>();

        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int BlogID = rs.getInt("BlogID");
                int CustomerID = rs.getInt("CustomerID");
                LocalDate PostTime = rs.getDate("PostTime").toLocalDate();
                String Title = rs.getString("Title");
                String Content = rs.getString("Content");
                String Image = rs.getString("Image");
                boolean Status = (rs.getInt("Status") == 1 ? true : false);
                Blogs blog = new Blogs(BlogID, CustomerID, PostTime, Title, Content, Image, Status);
                vector.add(blog);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vector;
    }

    public List<Blogs> getAllBlogs() {
        List<Blogs> list = new ArrayList<>();
        String query = "select * from blogs";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(query);
            while (rs.next()) {
                int BlogID = rs.getInt("BlogID");
                int CustomerID = rs.getInt("CustomerID");
                LocalDate PostTime = rs.getDate("PostTime").toLocalDate();
                String Title = rs.getString("Title");
                String Content = rs.getString("Content");
                String Image = rs.getString("Image");
                boolean Status = (rs.getInt("Status") == 1 ? true : false);
                Blogs blog = new Blogs(BlogID, CustomerID, PostTime, Title, Content, Image, Status);
                list.add(blog);
            }

        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Blogs> getBlogsByName(String txtSearch) {
        List<Blogs> list = new ArrayList<>();
        String query = "select * from blogs where Title like ?";
        try {
            PreparedStatement preState = conn.prepareStatement(query);
            preState.setString(1, "%" + txtSearch + "%");
            ResultSet rs = preState.executeQuery();
            while (rs.next()) {
                list.add(new Blogs(rs.getInt(1), rs.getInt(2), rs.getDate(3).toLocalDate(), rs.getString(4), rs.getString(5), rs.getString(6), rs.getBoolean(7)));
            }

        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void insertBlog(String id, String name, String date, String description, String image, Boolean status) {
        String query = "INSERT INTO [dbo].[Blogs] (CustomerID, PostTime, Title, Content, Image, Status) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement preState = conn.prepareStatement(query);
            preState.setString(1, id);
            preState.setString(2, name);

            // Chuyển đổi String date thành LocalDate rồi sang java.sql.Date
            LocalDate localDate = LocalDate.parse(date); // Giả sử date có định dạng YYYY-MM-DD
            java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
            preState.setDate(3, sqlDate);

            preState.setString(4, description);
            preState.setString(5, (image != null && !image.isEmpty()) ? image : "default.jpg");
            preState.setBoolean(6, true); // Published (true = 1, false = 0)

            preState.executeUpdate();
            conn.commit();
        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deleteBlog(String id) {
        String query = "delete from Blogs \n"
                + "where BlogID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
    }

}
