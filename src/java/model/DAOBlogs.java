/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Blogs;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
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
        String sql = "INSERT INTO [dbo].[Blogs] ([CustomerID], [PostTime], [Title], [Content], [Image], [Status]) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, other.getCustomerID());
            preState.setDate(2, java.sql.Date.valueOf(other.getPostTime()));
            preState.setString(3, other.getTitle());
            preState.setString(4, other.getContent());
            preState.setString(5, other.getImage());
            preState.setInt(6, other.isStatus() ? 1 : 0);
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteBlog(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Blogs] WHERE BlogID = ?";
        
        try {
            PreparedStatement state = conn.prepareStatement(sql);
            state.setInt(1, id);
            n = state.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateBlog(Blogs other) {
        int n = 0;
        String sql = "UPDATE [dbo].[Blogs] SET [CustomerID] = ?, [PostTime] = ?, [Title] = ?, [Content] = ?, [Image] = ?, [Status] = ? WHERE BlogID = ?";
        
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, other.getCustomerID());
            preState.setDate(2, java.sql.Date.valueOf(other.getPostTime()));
            preState.setString(3, other.getTitle());
            preState.setString(4, other.getContent());
            preState.setString(5, other.getImage());
            preState.setInt(6, other.isStatus() ? 1 : 0);
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
            PreparedStatement preState = conn.prepareStatement(sql);
            ResultSet rs = preState.executeQuery();
            
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
    
    

    public Vector<Blogs> getBlogsByCustomerAndTitle(int customerId, String title) {
        Vector<Blogs> vector = new Vector<>();
        String sql = "SELECT * FROM [dbo].[Blogs] WHERE CustomerID = ? AND Title LIKE ?";
        
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, customerId);
            preState.setString(2, "%" + title + "%");
            ResultSet rs = preState.executeQuery();
            
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

    
  

    
    
    public static void main(String[] args) {
        DAOBlogs dao = new DAOBlogs();
        Vector<Blogs> blog = dao.getBlogs("SELECT * FROM Blogs");
        for (Blogs blogs : blog) {
            System.out.println(blog);
            
        }
    }
}