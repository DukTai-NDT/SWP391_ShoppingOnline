/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class ChatHistory {

    private int Chat_HistoryID;
    private int CustomerID_1;
    private int CustomerID_2;
    private LocalDateTime ChatDateTime;
    private String Description;
    private boolean IsDeleted;

    public ChatHistory(int Chat_HistoryID, int CustomerID_1, int CustomerID_2, LocalDateTime ChatDateTime, String Description, boolean IsDeleted) {
        this.Chat_HistoryID = Chat_HistoryID;
        this.CustomerID_1 = CustomerID_1;
        this.CustomerID_2 = CustomerID_2;
        this.ChatDateTime = ChatDateTime;
        this.Description = Description;
        this.IsDeleted = IsDeleted;
    }

    public ChatHistory(int CustomerID_1, int CustomerID_2, LocalDateTime ChatDateTime, String Description, boolean IsDeleted) {
        this.CustomerID_1 = CustomerID_1;
        this.CustomerID_2 = CustomerID_2;
        this.ChatDateTime = ChatDateTime;
        this.Description = Description;
        this.IsDeleted = IsDeleted;
    }

    public ChatHistory() {
    }

    public int getChat_HistoryID() {
        return Chat_HistoryID;
    }

    public void setChat_HistoryID(int Chat_HistoryID) {
        this.Chat_HistoryID = Chat_HistoryID;
    }

    public int getCustomerID_1() {
        return CustomerID_1;
    }

    public void setCustomerID_1(int CustomerID_1) {
        this.CustomerID_1 = CustomerID_1;
    }

    public int getCustomerID_2() {
        return CustomerID_2;
    }

    public void setCustomerID_2(int CustomerID_2) {
        this.CustomerID_2 = CustomerID_2;
    }

    public LocalDateTime getChatDateTime() {
        return ChatDateTime;
    }

    public void setChatDateTime(LocalDateTime ChatDateTime) {
        this.ChatDateTime = ChatDateTime;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public boolean isIsDeleted() {
        return IsDeleted;
    }

    public void setIsDeleted(boolean IsDeleted) {
        this.IsDeleted = IsDeleted;
    }

    @Override
    public String toString() {
        return "ChatHistory{" + "Chat_HistoryID=" + Chat_HistoryID + ", CustomerID_1=" + CustomerID_1 + ", CustomerID_2=" + CustomerID_2 + ", ChatDateTime=" + ChatDateTime + ", Description=" + Description + ", IsDeleted=" + IsDeleted + '}';
    }
    
    
}
