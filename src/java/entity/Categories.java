/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Categories {
    private int CategoryID;
	private String CategoryName;

    public Categories(int CategoryID, String CategoryName) {
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
    }

//<<<<<<< HEAD
//=======
//    public Categories(String CategoryName) {
//        this.CategoryName = CategoryName;
//    }
//
//    public Categories() {
//    }
//
//>>>>>>> be7ef0e7f19e65985d5abcd66018942d0d434889
    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    @Override
    public String toString() {
        return "Categories{" + "CategoryID=" + CategoryID + ", CategoryName=" + CategoryName + '}';
    }
       
}

