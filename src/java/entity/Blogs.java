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
public class Blogs {
//    [BlogID] [int] IDENTITY(1,1) NOT NULL,
//	[CustomerID] [int] NULL,
//	[PostTime] [date] NULL,
//	[Title] [nvarchar](50) NULL,
//	[Content] [nvarchar](255) NULL,
//	[Image] [nvarchar](255) NULL,
//	[Status] [bit] NULL,
    private int BlogID;
	private int CustomerID;
	private LocalDate PostTime;
	private String Title;
	private String Content;
	private String Image;
	private boolean Status;

    public Blogs(int BlogID, int CustomerID, LocalDate PostTime, String Title, String Content, String Image, boolean Status) {
        this.BlogID = BlogID;
        this.CustomerID = CustomerID;
        this.PostTime = PostTime;
        this.Title = Title;
        this.Content = Content;
        this.Image = Image;
        this.Status = Status;
    }

    public Blogs() {
    }

    public Blogs(int CustomerID, LocalDate PostTime, String Title, String Content, String Image, boolean Status) {
        this.CustomerID = CustomerID;
        this.PostTime = PostTime;
        this.Title = Title;
        this.Content = Content;
        this.Image = Image;
        this.Status = Status;
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

    public LocalDate getPostTime() {
        return PostTime;
    }

    public void setPostTime(LocalDate PostTime) {
        this.PostTime = PostTime;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Blogs{" + "BlogID=" + BlogID + ", CustomerID=" + CustomerID + ", PostTime=" + PostTime + ", Title=" + Title + ", Content=" + Content + ", Image=" + Image + ", Status=" + Status + '}';
    }
        
        
        
}
