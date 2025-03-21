/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.ChatHistory;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class DAOChatHistory extends DBConnection {

    public int addChatHistory(ChatHistory other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Chat_History]\n"
                + "           ([CustomerID_1]\n"
                + "           ,[CustomerID_2]\n"
                + "           ,[ChatDateTime]\n"
                + "           ,[Description]\n"
                + "           ,[IsDeleted])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {

            PreparedStatement preState = conn.prepareStatement(sql);
            LocalDateTime now = LocalDateTime.now();
            preState.setInt(1, other.getCustomerID_1());
            preState.setInt(2, other.getCustomerID_2());
            preState.setObject(3, now);
            preState.setString(4, other.getDescription());
            preState.setInt(5, (other.isIsDeleted()) == true ? 1 : 0);
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOChatHistory.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteChatHistory(int chatID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Chat_History]\n"
                + "      WHERE Chat_HistoryID = " + chatID;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOChatHistory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateChatHistory(ChatHistory other) {
        int n = 0;
        String sql = "UPDATE [dbo].[Chat_History]\n"
                + "   SET [CustomerID_1] = ?\n"
                + "      ,[CustomerID_2] = ?\n"
                + "      ,[ChatDateTime] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[IsDeleted] = ?\n"
                + " WHERE Chat_HistoryID = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            LocalDateTime now = LocalDateTime.now();
            preState.setInt(1, other.getCustomerID_1());
            preState.setInt(2, other.getCustomerID_2());
            preState.setObject(3, now);
            preState.setString(4, other.getDescription());
            preState.setInt(5, (other.isIsDeleted()) == true ? 1 : 0);
            preState.setInt(6, other.getChat_HistoryID());
            n = preState.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOChatHistory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<ChatHistory> getChatHistory(String sql) {
        Vector<ChatHistory> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int Chat_HistoryID = rs.getInt("Chat_HistoryID");
                int CustomerID_1 = rs.getInt("CustomerID_1");
                int CustomerID_2 = rs.getInt("CustomerID_2");
                Timestamp timestamp = rs.getTimestamp("ChatDateTime");
                LocalDateTime ChatDateTime = timestamp.toLocalDateTime();
                String Description = rs.getString("Description");
                boolean IsDeleted = (rs.getInt("IsDeleted") == 1 ? true : false);

                ChatHistory chat = new ChatHistory(Chat_HistoryID, CustomerID_1, CustomerID_2, ChatDateTime, Description, IsDeleted);
                vector.add(chat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOChatHistory.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vector;
    }

    public Vector<Integer> getCustomerIDInbox() {
        Vector<Integer> vector = new Vector<>();
        String sql = "SELECT DISTINCT CustomerID_1 \n"
                + "FROM Chat_History\n"
                + "WHERE CustomerID_1 <> 3006;";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int CustomerID_1 = rs.getInt("CustomerID_1");
                vector.add(CustomerID_1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOChatHistory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOChatHistory dao = new DAOChatHistory();
        String n = "1002";

        Vector<ChatHistory> vector = dao.getChatHistory("select * from Chat_History where CustomerID_1 = " + n + " or CustomerID_2 = " + n);
        for (ChatHistory chatHistory : vector) {
            System.out.println(chatHistory.getChatDateTime());
        }
        
        System.out.println("------------------");
        Vector<Integer> dataCustomerInbox = dao.getCustomerIDInbox();
        for (Integer integer : dataCustomerInbox) {
            System.out.println(integer);
        }
    }
}
