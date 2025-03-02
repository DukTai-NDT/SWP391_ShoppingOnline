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
public class Orders {

    private int OrderID;
    private float Amount;
    private float Total;
    private String Status;
    private int CustomerID;
    private LocalDate OrderTime;
    private int PaymentID;

    public Orders(int OrderID, float Amount, float Total, String Status, int CustomerID, LocalDate OrderTime, int PaymentID) {
        this.OrderID = OrderID;
        this.Amount = Amount;
        this.Total = Total;
        this.Status = Status;
        this.CustomerID = CustomerID;
        this.OrderTime = OrderTime;
        this.PaymentID = PaymentID;
    }

    public Orders(float Amount, float Total, String Status, int CustomerID, LocalDate OrderTime, int PaymentID) {
        this.Amount = Amount;
        this.Total = Total;
        this.Status = Status;
        this.CustomerID = CustomerID;
        this.OrderTime = OrderTime;
        this.PaymentID = PaymentID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public float getAmount() {
        return Amount;
    }

    public void setAmount(float Amount) {
        this.Amount = Amount;
    }

    public float getTotal() {
        return Total;
    }

    public void setTotal(float Total) {
        this.Total = Total;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public LocalDate getOrderTime() {
        return OrderTime;
    }

    public void setOrderTime(LocalDate OrderTime) {
        this.OrderTime = OrderTime;
    }

    public int getPaymentID() {
        return PaymentID;
    }

    public void setPaymentID(int PaymentID) {
        this.PaymentID = PaymentID;
    }

    @Override
    public String toString() {
        return "Orders{" + "OrderID=" + OrderID + ", Amount=" + Amount + ", Total=" + Total + ", Status=" + Status + ", CustomerID=" + CustomerID + ", OrderTime=" + OrderTime + ", PaymentID=" + PaymentID + '}';
    }
    
    
}
