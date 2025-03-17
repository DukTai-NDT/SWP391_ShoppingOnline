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
    private String Status;
    private int CustomerID;
    private LocalDate OrderTime;
    private LocalDate DeliveryETA;
    private int PaymentID;

    public Orders(int OrderID, String Status, int CustomerID, LocalDate OrderTime, LocalDate DeliveryETA, int PaymentID) {
        this.OrderID = OrderID;
        this.Status = Status;
        this.CustomerID = CustomerID;
        this.OrderTime = OrderTime;
        this.DeliveryETA = DeliveryETA;
        this.PaymentID = PaymentID;
    }

    public Orders(String Status, int CustomerID, LocalDate OrderTime, LocalDate DeliveryETA, int PaymentID) {
        this.Status = Status;
        this.CustomerID = CustomerID;
        this.OrderTime = OrderTime;
        this.DeliveryETA = DeliveryETA;
        this.PaymentID = PaymentID;
    }

    public Orders() {
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
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

    public LocalDate getDeliveryETA() {
        return DeliveryETA;
    }

    public void setDeliveryETA(LocalDate DeliveryETA) {
        this.DeliveryETA = DeliveryETA;
    }

    public int getPaymentID() {
        return PaymentID;
    }

    public void setPaymentID(int PaymentID) {
        this.PaymentID = PaymentID;
    }

    @Override
    public String toString() {
        return "Orders{" + "OrderID=" + OrderID + ", Status=" + Status + ", CustomerID=" + CustomerID + ", OrderTime=" + OrderTime + ", DeliveryETA=" + DeliveryETA + ", PaymentID=" + PaymentID + '}';
    }
 
}
