/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author quang
 */
public class OrderDetails {
    private int OrderDetailID;
    private float Price;
    private int Quantity;
    private int ProductID;
    private int OrderID;

    public OrderDetails(int OrderDetailID, float Price, int Quantity, int ProductID, int OrderID) {
        this.OrderDetailID = OrderDetailID;
        this.Price = Price;
        this.Quantity = Quantity;
        this.ProductID = ProductID;
        this.OrderID = OrderID;
    }

    public OrderDetails(float Price, int Quantity, int ProductID, int OrderID) {
        this.Price = Price;
        this.Quantity = Quantity;
        this.ProductID = ProductID;
        this.OrderID = OrderID;
    }
    
    public int getOrderDetailID() {
        return OrderDetailID;
    }

    public void setOrderDetailID(int OrderDetailID) {
        this.OrderDetailID = OrderDetailID;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "OrderDetailID=" + OrderDetailID + ", Price=" + Price + ", Quantity=" + Quantity + ", ProductID=" + ProductID + ", OrderID=" + OrderID + '}';
    }
    
}
