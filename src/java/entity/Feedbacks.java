/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDate;

/**
 *
 * @author quang
 */
public class Feedbacks {
    private int FeedbackID;
    private String Comment;
    private LocalDate Time;
    private int OrderID;
    private int AccountID;
    private int ProductID;

    public Feedbacks(int FeedbackID, String Comment, LocalDate Time, int OrderID, int AccountID, int ProductID) {
        this.FeedbackID = FeedbackID;
        this.Comment = Comment;
        this.Time = Time;
        this.OrderID = OrderID;
        this.AccountID = AccountID;
        this.ProductID = ProductID;
    }

    public Feedbacks(String Comment, LocalDate Time, int OrderID, int AccountID, int ProductID) {
        this.Comment = Comment;
        this.Time = Time;
        this.OrderID = OrderID;
        this.AccountID = AccountID;
        this.ProductID = ProductID;
    }

    public int getFeedbackID() {
        return FeedbackID;
    }

    public void setFeedbackID(int FeedbackID) {
        this.FeedbackID = FeedbackID;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String Comment) {
        this.Comment = Comment;
    }

    public LocalDate getTime() {
        return Time;
    }

    public void setTime(LocalDate Time) {
        this.Time = Time;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    @Override
    public String toString() {
        return "Feedbacks{" + "FeedbackID=" + FeedbackID + ", Comment=" + Comment + ", Time=" + Time + ", OrderID=" + OrderID + ", AccountID=" + AccountID + ", ProductID=" + ProductID + '}';
    }
    
    
}
