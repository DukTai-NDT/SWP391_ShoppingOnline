/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author quang
 */
public class Ingredient {

    private int IngredientID;
    private String IngredientName;
    private int ProductID;

    public Ingredient(int IngredientID, String IngredientName, int ProductID) {
        this.IngredientID = IngredientID;
        this.IngredientName = IngredientName;
        this.ProductID = ProductID;
    }

    public Ingredient(String IngredientName, int ProductID) {
        this.IngredientName = IngredientName;
        this.ProductID = ProductID;
    }
    

    public int getIngredientID() {
        return IngredientID;
    }

    public void setIngredientID(int IngredientID) {
        this.IngredientID = IngredientID;
    }

    public String getIngredientName() {
        return IngredientName;
    }

    public void setIngredientName(String IngredientName) {
        this.IngredientName = IngredientName;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    @Override
    public String toString() {
        return "Ingredient{" + "IngredientID=" + IngredientID + ", IngredientName=" + IngredientName + ", ProductID=" + ProductID + '}';
    }
    
    
}
