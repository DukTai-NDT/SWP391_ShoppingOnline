/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Comment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOComment extends DBConnection {

    public int addComment(Comment com) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Comments]\n"
                + "           ([BlogID]\n"
                + "           ,[CustomerID]\n"
                + "           ,[CommentText]\n"
                + "           ,[PostTime])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, com.getBlogID());
            pre.setInt(2, com.getCustomerID());

            pre.setString(3, com.getCommentText());
            pre.setDate(4, java.sql.Date.valueOf(com.getPostTime()));
            n = pre.executeUpdate();

        } catch (Exception e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }

        return n;
    }

    public int delete(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Comments] Where CommentID= ?";

        try {
            PreparedStatement state = conn.prepareStatement(sql);
            state.setInt(1, id);
            n = state.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);

        }

        return n;
    }

    public int update(Comment com) {
        int n = 0;
        String sql = "UPDATE [dbo].[Comments]\n"
                + "   SET [CommentText] = ?,\n"
                + "       [PostTime] = ?\n"
                + " WHERE CommentID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, com.getCommentText());
            pre.setDate(2, java.sql.Date.valueOf(com.getPostTime()));
            pre.setInt(3, com.getCommentID());
            n = pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOComment.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public Comment getCommentById(int commentId) {
        Comment comment = null;
        String sql = "SELECT * FROM Comments WHERE CommentID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, commentId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                comment = new Comment(
                        rs.getInt("CommentID"),
                        rs.getInt("BlogID"),
                        rs.getInt("CustomerID"),
                        rs.getString("CommentText"),
                        rs.getDate("PostTime").toLocalDate()
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comment;
    }

    public Vector<Comment> getCommentsByBlogId(int blogId) {
        Vector<Comment> vector = new Vector<>();

        String sql = "SELECT * FROM Comments WHERE BlogID = ?";

        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setInt(1, blogId);
            ResultSet rs = preState.executeQuery();

            while (rs.next()) {
                Comment comment = new Comment(
                        rs.getInt("CommentID"),
                        rs.getInt("BlogID"),
                        rs.getInt("CustomerID"),
                        rs.getString("CommentText"),
                        rs.getDate("PostTime").toLocalDate()
                );
                vector.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vector;

    }

    public static void main(String[] args) {
        DAOComment dao = new DAOComment();
        Vector<Comment> com = dao.getCommentsByBlogId(28);
        for (Comment comment : com) {
            System.out.println(comment);

        }

    }

}
