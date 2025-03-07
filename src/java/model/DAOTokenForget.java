/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Account;
import entity.TokenForgetPassword;
import java.security.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.TokenForgetPassword;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Admin
 */
public class DAOTokenForget extends DBConnection {

    public String getFormatDate(LocalDateTime myDateObj) {
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
    }

    public int insertTokenForget(TokenForgetPassword tokenForget) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[TokenForgetPasswords]\n"
                + "           ([Token]\n"
                + "           ,[ExpiryTime]\n"
                + "           ,[IsUsed]\n"
                + "           ,[AccountID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tokenForget.getToken());
            ps.setTimestamp(2, java.sql.Timestamp.valueOf(getFormatDate(tokenForget.getExpiryTime())));
            ps.setBoolean(3, tokenForget.getisUsed());
            ps.setInt(4, tokenForget.getAccountID());

            n = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTokenForget.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public TokenForgetPassword getTokenPassword(String token) {
        TokenForgetPassword tokenForget = null;
        String sql = "Select * from [TokenForgetPasswords] where Token = ?";
        try {
            PreparedStatement preState = conn.prepareStatement(sql);
            preState.setString(1, token);

            ResultSet rs = preState.executeQuery();
            while (rs.next()) {
                tokenForget = new TokenForgetPassword(rs.getInt("TokenForgetPasswordID"), rs.getString("Token"),
                        rs.getTimestamp("ExpiryTime").toLocalDateTime(), rs.getBoolean("IsUsed"), rs.getInt("AccountID"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTokenForget.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tokenForget;
    }

    public int updateStatus(TokenForgetPassword token) {
        System.out.println("token = " + token);
        int n = 0;
        // Đúng cú pháp SQL Server
        String sql = "UPDATE [dbo].[TokenForgetPasswords] "
                + "SET [IsUsed] = ? "
                + "WHERE [Token] = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);

            st.setBoolean(1, token.getisUsed());
            st.setString(2, token.getToken());
            n = st.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(DAOTokenForget.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public static void main(String[] args) {
        DAOTokenForget dao = new DAOTokenForget();
        System.out.println(dao.getTokenPassword("http://localhost:8080/SWP391/ResetPasswordURL?token=7b001205-4dcd-4ce0-b47e-1a47fec4984a"));
        LocalDateTime expiryTime = LocalDateTime.of(2022, 2, 19, 14, 30, 0);

        TokenForgetPassword tfp = new TokenForgetPassword("xyz789", expiryTime, false, 2015);
        int n = dao.updateStatus(tfp);
        System.out.println(n);
    }
}
