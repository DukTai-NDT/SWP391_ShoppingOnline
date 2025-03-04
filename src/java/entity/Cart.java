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
//    [CartID] [int] IDENTITY(1,1) NOT NULL,
//	[CustomerID] [int] NULL,
//	[CartStatus] [bit] NULL,
//	[TotalPrice] [float] NULL,
//	[CreateDate] [datetime] NULL,
    
    private int CartID;
	private int CustomerID;
	private boolean CartStatus;
	private LocalDate CreateDate;

    public Cart(int CartID, int CustomerID, boolean CartStatus, LocalDate CreateDate) {
        this.CartID = CartID;
        this.CustomerID = CustomerID;
        this.CartStatus = CartStatus;
        this.CreateDate = CreateDate;
    }

    public Cart(int CustomerID, boolean CartStatus, LocalDate CreateDate) {
        this.CustomerID = CustomerID;
        this.CartStatus = CartStatus;
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

    public boolean isCartStatus() {
        return CartStatus;
    }

    public void setCartStatus(boolean CartStatus) {
        this.CartStatus = CartStatus;
    }

    public LocalDate getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(LocalDate CreateDate) {
        this.CreateDate = CreateDate;
    }

    @Override
    public String toString() {
        return "Cart{" + "CartID=" + CartID + ", CustomerID=" + CustomerID + ", CartStatus=" + CartStatus + ", CreateDate=" + CreateDate + '}';
    }

    
}
