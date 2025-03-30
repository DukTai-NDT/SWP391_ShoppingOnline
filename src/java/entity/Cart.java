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
public class Cart {

    private int CartID;
	private int CustomerID;

	private LocalDate CreateDate;

    public Cart(int CartID, int CustomerID, LocalDate CreateDate) {
        this.CartID = CartID;
        this.CustomerID = CustomerID;
       
        this.CreateDate = CreateDate;
    }

    public Cart(int CustomerID, LocalDate CreateDate) {
        this.CustomerID = CustomerID;
       
        this.CreateDate = CreateDate;
    }

    public int getCartID() {
        return CartID;
    }

    public void setCartID(int CartID) {
        this.CartID = CartID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

  
    public LocalDate getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(LocalDate CreateDate) {
        this.CreateDate = CreateDate;
    }

    @Override
    public String toString() {
        return "Cart{" + "CartID=" + CartID + ", CustomerID=" + CustomerID +  ", CreateDate=" + CreateDate + '}';
    }

    
}