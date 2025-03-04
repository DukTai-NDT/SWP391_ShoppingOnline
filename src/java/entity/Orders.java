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
    private double Amount;
    private double Total;
    private String Status;
    private int CustomerID;
    private LocalDate OrderTime;
    private int PaymentID;
 
    
    public Orders(){
        
    }
    public Orders(int OrderID, double Amount, double Total, String Status, int CustomerID, LocalDate OrderTime, int PaymentID) {
        this.OrderID = OrderID;
        this.Amount = Amount;
        this.Total = Total;
        this.Status = Status;
        this.CustomerID = CustomerID;
        this.OrderTime = OrderTime;
        this.PaymentID = PaymentID;
    }

    public Orders(double Amount, double Total, String Status, int CustomerID, LocalDate OrderTime, int PaymentID) {
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

    public double getAmount() {
        return Amount;
    }

    public void setAmount(double Amount) {
        this.Amount = Amount;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
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
