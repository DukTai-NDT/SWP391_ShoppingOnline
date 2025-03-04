/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class CartItems {

    private int CartItemID;
	private int CartID;
	private int ProductID;
	private double Price;
	private int Quantity;

    public CartItems(int CartItemID, int CartID, int ProductID, double Price, int Quantity) {
        this.CartItemID = CartItemID;
        this.CartID = CartID;
        this.ProductID = ProductID;
        this.Price = Price;
        this.Quantity = Quantity;
    }

    public CartItems(int CartID, int ProductID, double Price, int Quantity) {
        this.CartID = CartID;
        this.ProductID = ProductID;
        this.Price = Price;
        this.Quantity = Quantity;
    }

    public CartItems() {
    }

    public int getCartItemID() {
        return CartItemID;
    }

    public void setCartItemID(int CartItemID) {
        this.CartItemID = CartItemID;
    }

    public int getCartID() {
        return CartID;
    }

    public void setCartID(int CartID) {
        this.CartID = CartID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    @Override
    public String toString() {
        return "CartItems{" + "CartItemID=" + CartItemID + ", CartID=" + CartID + ", ProductID=" + ProductID + ", Price=" + Price + ", Quantity=" + Quantity + '}';
    }
        
        
                
}
