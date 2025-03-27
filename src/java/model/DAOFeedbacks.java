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
                
                Feedbacks feed = new Feedbacks(FeedbackID,Comment, Time, Rating, AccountID, ProductID);
                vector.add(feed);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedbacks.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public static void main(String[] args) {
        DAOFeedbacks dao = new DAOFeedbacks();
//        Vector<Feedbacks> vector = dao.getFeedback("select * from Feedbacks");
//        for (Feedbacks feedbacks : vector) {
//            System.out.println(feedbacks);
//        }
        int n = dao.addFeedbacks(new Feedbacks("Sản phẩm tốt", LocalDate.now(), 5, 2003, 5));
        if(n > 0){
            System.out.println("oke");
        }
    }
}
