/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class Comment {
    private int CommentID;
    private int BlogID;
    private int CustomerID;
    private String CommentText;
    private LocalDate  PostTime;

    public Comment(int CommentID, int BlogID, int CustomerID, String CommentText, LocalDate PostTime) {
        this.CommentID = CommentID;
        this.BlogID = BlogID;
        this.CustomerID = CustomerID;
        this.CommentText = CommentText;
        this.PostTime = PostTime;
    }

    public Comment(int BlogID, int CustomerID, String CommentText, LocalDate PostTime) {
        this.BlogID = BlogID;
        this.CustomerID = CustomerID;
        this.CommentText = CommentText;
        this.PostTime = PostTime;
    }
    

    public Comment() {
    }

    public int getCommentID() {
        return CommentID;
    }

    public void setCommentID(int CommentID) {
        this.CommentID = CommentID;
    }

    public int getBlogID() {
        return BlogID;
    }

    public void setBlogID(int BlogID) {
        this.BlogID = BlogID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getCommentText() {
        return CommentText;
    }

    public void setCommentText(String CommentText) {
        this.CommentText = CommentText;
    }

    public LocalDate getPostTime() {
        return PostTime;
    }

    public void setPostTime(LocalDate PostTime) {
        this.PostTime = PostTime;
    }

    @Override
    public String toString() {
        return "Comment{" + "CommentID=" + CommentID + ", BlogID=" + BlogID + ", CustomerID=" + CustomerID + ", CommentText=" + CommentText + ", PostTime=" + PostTime + '}';
    }
    
    
    
    
}
