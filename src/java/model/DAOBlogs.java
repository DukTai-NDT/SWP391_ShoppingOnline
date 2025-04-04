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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOBlogs extends DBConnection {

    public int countTotalBlogs() {
        int totalItems = 0;
        String sql = "Select COUNT(*) AS total From Blogs";
        try {
            Statement state = conn.createStatement();
            ResultSet rs = state.executeQuery(sql);
            if (rs.next()) {
                totalItems = rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalItems;
    }

    public Vector<Blogs> getBlogsByPage(int offset, int limit) {
        Vector<Blogs> vector = new Vector<>();
        String sql = "Select * from Blogs Order By BlogID OFFSET ? ROW FETCH NEXT ?  ROWS ONLY";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setInt(1, offset);
            pre.setInt(2, limit);
            ResultSet rs = pre.executeQuery();
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

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vector;
    }

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
        String query = "  select * from blogs\n"
                + "  order by BlogID desc";
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

    public void insertBlog(String postime, String title, String description, String image, Boolean status) {
        String query = "INSERT INTO [dbo].[Blogs] (PostTime, Title, Content, Image, Status) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement preState = conn.prepareStatement(query);
            preState.setString(1, postime);
            preState.setString(2, title);
            preState.setString(3, description);
            preState.setString(4, image);
            preState.setBoolean(5, true);
            preState.executeQuery();

        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Blogs getBlogsByID(String id) {
        String sql = "select * from Blogs\n"
                + "where BlogID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                return new Blogs(
                        rs.getInt("BlogID"),
                        rs.getInt("CustomerID"), // Thêm CustomerID nếu cần
                        rs.getDate("PostTime").toLocalDate(),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Image"),
                        rs.getBoolean("Status")
                );
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void editBlog(String blogID, String postime, String title, String description, String image, Boolean status) {
        String query = "UPDATE [dbo].[Blogs]\n"
                + "    SET \n"
                + "        [PostTime] =?,\n"
                + "        [Title] = ?,\n"
                + "        [Content] =?,\n"
                + "        [Image] = ?,\n"
                + "        [Status] =?\n"
                + "    WHERE [BlogID] = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(query);
            preState.setString(6, blogID);
            preState.setString(1, postime);
            preState.setString(2, title);
            preState.setString(3, description);
            preState.setString(4, image);
            preState.setBoolean(5, true);
            preState.executeQuery();

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

    public int countBlogs() {
        int count = 0;
        String query = "SELECT COUNT(*) FROM Blogs";

        try {
            Statement state = conn.createStatement();
            ResultSet rs = state.executeQuery(query);
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }

        return count;
    }

    public List<Blogs> sortDesc() {
        List<Blogs> list = new ArrayList<>();
        String query = "  select * from Blogs\n"
                + "order by PostTime desc ";
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

    public List<Blogs> sortAsc() {
        List<Blogs> list = new ArrayList<>();
        String query = "  select * from Blogs\n"
                + "order by PostTime asc ";
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

    public static void main(String[] args) {
        DAOBlogs dao = new DAOBlogs();
        Vector<Blogs> vector = dao.getBlogs("select * from blogs");
        for (Blogs blogs : vector) {
            System.out.println(blogs);
        }
    }

}
