/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DBConnection {

    public Connection conn = null;

    public DBConnection(String URL, String userName, String password) {
        try {
//        URL : String connection : Server, DB, socket
//                userName, password

//    call Driver

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

//    Call connection
            conn = DriverManager.getConnection(URL, userName, password);
            System.out.println("Connect Successfully");

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

   public DBConnection() {
    this("jdbc:sqlserver://localhost:1433;databaseName=ECommerceDB;"
            + "encrypt=true;trustServerCertificate=true;"
            + "useUnicode=true;characterEncoding=UTF-8",
         "sa", 
         "123456"); // Lấy mật khẩu từ biến môi trường
}


    public ResultSet getData(String sql) {
        ResultSet rs = null;
        Statement state;
        try {
            state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

    public static void main(String[] args) {
        new DBConnection();
    }
}
