/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Feedbacks;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author quang
 */
public class DAOFeedbacks extends DBConnection {

    public int addFeedbacks(Feedbacks feedback) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Feedbacks]\n"
                + "           ([Comment]\n"
                + "           ,[Time]\n"
                + "           ,[Rating]\n"
                + "           ,[AccountID]\n"
                + "           ,[ProductID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, feedback.getComment());
            pre.setDate(2, java.sql.Date.valueOf(feedback.getTime()));
            pre.setInt(3, feedback.getRating());
            pre.setInt(4, feedback.getAccountID());
            pre.setInt(5, feedback.getProductID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteFeedback(int fid) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Feedbacks]\n"
                + "      WHERE FeedbackID = " + fid;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateFeedback(Feedbacks feedback) {
        int n = 0;
        String sql = "UPDATE [dbo].[Feedbacks]\n"
                + "   SET [Comment] = ?\n"
                + "      ,[Time] = ?\n"
                + "      ,[Rating] = ?\n"
                + "      ,[AccountID] = ?\n"
                + "      ,[ProductID] = ?\n"
                + " WHERE FeedbackID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, feedback.getComment());
            pre.setDate(2, java.sql.Date.valueOf(feedback.getTime()));
            pre.setInt(3, feedback.getRating());
            pre.setInt(4, feedback.getAccountID());
            pre.setInt(5, feedback.getProductID());
            pre.setInt(6, feedback.getFeedbackID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public Vector<Feedbacks> getFeedback(String sql) {
        Vector<Feedbacks> vector = new Vector<Feedbacks>();

        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int FeedbackID = rs.getInt("FeedbackID");
                String Comment = rs.getString("Comment");
                LocalDate Time = rs.getDate("Time").toLocalDate();
                int Rating = rs.getInt("Rating");
                int AccountID = rs.getInt("AccountID");
                int ProductID = rs.getInt("ProductID");

                Feedbacks feed = new Feedbacks(FeedbackID, Comment, Time, Rating, AccountID, ProductID);
                vector.add(feed);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public String getUserNameByFeedbackID(int feedbackID) {
        String userName = null;
        String sql = "SELECT a.UserName FROM dbo.Feedbacks f "
                + "JOIN dbo.Accounts a ON a.AccountID = f.AccountID "
                + "WHERE f.FeedbackID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, feedbackID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                userName = rs.getString("UserName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userName;
    }

    public String getProductNameByFeedbackID(int feedbackID) {
        String productName = null;
        String sql = "SELECT p.ProductName FROM dbo.Feedbacks f "
                + "JOIN dbo.Products p ON p.ProductID = f.ProductID "
                + "WHERE f.FeedbackID = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, feedbackID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                productName = rs.getString("ProductName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productName;
    }

    public Vector<Feedbacks> filterFeedbacks(String orderType) {
        Vector<Feedbacks> feedbackList = new Vector<>();
        String sql = "SELECT * FROM [dbo].[Feedbacks] ORDER BY FeedbackID "
                + (orderType.equalsIgnoreCase("newest") ? "DESC" : "ASC");

        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Feedbacks fb = new Feedbacks(
                        rs.getInt("FeedbackID"),
                        rs.getString("Comment"),
                        rs.getDate("Time").toLocalDate(),
                        rs.getInt("Rating"),
                        rs.getInt("AccountID"),
                        rs.getInt("ProductID")
                );
                feedbackList.add(fb);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }

        return feedbackList;
    }

    // Lấy tổng số feedback trong bảng Feedbacks
    public int getTotalFeedbacks() {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM Feedbacks";
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

// Lấy danh sách feedback theo trang (không có tìm kiếm)
    public Vector<Feedbacks> getFeedbacksByPage(int page, int pageSize) {
        Vector<Feedbacks> feedbackList = new Vector<>();
        int start = (page - 1) * pageSize;
        String sql = "SELECT * FROM Feedbacks ORDER BY FeedbackID DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Feedbacks fb = new Feedbacks(
                        rs.getInt("FeedbackID"),
                        rs.getString("Comment"),
                        rs.getTimestamp("Time").toLocalDateTime().toLocalDate(),
                        rs.getInt("Rating"),
                        rs.getInt("AccountID"),
                        rs.getInt("ProductID")
                );
                feedbackList.add(fb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public Vector<Feedbacks> getOneStarFeedbacks() {
        Vector<Feedbacks> oneStarFeedbacks = new Vector<>();
        String sql = "SELECT * FROM Feedbacks WHERE Rating = 1";

        try (Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); ResultSet rs = state.executeQuery(sql)) {

            while (rs.next()) {
                Feedbacks fb = new Feedbacks(
                        rs.getInt("FeedbackID"),
                        rs.getString("Comment"),
                        rs.getTimestamp("Time").toLocalDateTime().toLocalDate(),
                        rs.getInt("Rating"),
                        rs.getInt("AccountID"),
                        rs.getInt("ProductID")
                );
                oneStarFeedbacks.add(fb);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }

        return oneStarFeedbacks;
    }

    public Vector<Feedbacks> getTwoStarsFeedbacks() {
        Vector<Feedbacks> twoStarsFeedbacks = new Vector<>();
        String sql = "SELECT * FROM Feedbacks WHERE Rating = 2";

        try (Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); ResultSet rs = state.executeQuery(sql)) {

            while (rs.next()) {
                Feedbacks fb = new Feedbacks(
                        rs.getInt("FeedbackID"),
                        rs.getString("Comment"),
                        rs.getTimestamp("Time").toLocalDateTime().toLocalDate(),
                        rs.getInt("Rating"),
                        rs.getInt("AccountID"),
                        rs.getInt("ProductID")
                );
                twoStarsFeedbacks.add(fb);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }

        return twoStarsFeedbacks;
    }

    public Vector<Feedbacks> getThreeStarsFeedbacks() {
        Vector<Feedbacks> threeStarsFeedbacks = new Vector<>();
        String sql = "SELECT * FROM Feedbacks WHERE Rating = 3";

        try (Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); ResultSet rs = state.executeQuery(sql)) {

            while (rs.next()) {
                Feedbacks fb = new Feedbacks(
                        rs.getInt("FeedbackID"),
                        rs.getString("Comment"),
                        rs.getTimestamp("Time").toLocalDateTime().toLocalDate(),
                        rs.getInt("Rating"),
                        rs.getInt("AccountID"),
                        rs.getInt("ProductID")
                );
                threeStarsFeedbacks.add(fb);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }

        return threeStarsFeedbacks;
    }

    public Vector<Feedbacks> getFourStarsFeedbacks() {
        Vector<Feedbacks> fourStarsFeedbacks = new Vector<>();
        String sql = "SELECT * FROM Feedbacks WHERE Rating = 4";

        try (Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); ResultSet rs = state.executeQuery(sql)) {

            while (rs.next()) {
                Feedbacks fb = new Feedbacks(
                        rs.getInt("FeedbackID"),
                        rs.getString("Comment"),
                        rs.getTimestamp("Time").toLocalDateTime().toLocalDate(),
                        rs.getInt("Rating"),
                        rs.getInt("AccountID"),
                        rs.getInt("ProductID")
                );
                fourStarsFeedbacks.add(fb);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }

        return fourStarsFeedbacks;
    }

    public Vector<Feedbacks> getFiveStarsFeedbacks() {
        Vector<Feedbacks> fiveStarsFeedbacks = new Vector<>();
        String sql = "SELECT * FROM Feedbacks WHERE Rating = 5";

        try (Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); ResultSet rs = state.executeQuery(sql)) {

            while (rs.next()) {
                Feedbacks fb = new Feedbacks(
                        rs.getInt("FeedbackID"),
                        rs.getString("Comment"),
                        rs.getTimestamp("Time").toLocalDateTime().toLocalDate(),
                        rs.getInt("Rating"),
                        rs.getInt("AccountID"),
                        rs.getInt("ProductID")
                );
                fiveStarsFeedbacks.add(fb);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }

        return fiveStarsFeedbacks;
    }

    public static void main(String[] args) {
        DAOFeedbacks dao = new DAOFeedbacks();
        System.out.println(dao.getUserNameByFeedbackID(1));
    }
}
