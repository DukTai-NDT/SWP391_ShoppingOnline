/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author quang
 */
public class Payments {
    private int PaymentID;
    private String Method;
    private float Amount;
    private int StatusID;

    public Payments(int PaymentID, String Method, float Amount, int StatusID) {
        this.PaymentID = PaymentID;
        this.Method = Method;
        this.Amount = Amount;
        this.StatusID = StatusID;
    }

    public Payments(String Method, float Amount, int StatusID) {
        this.Method = Method;
        this.Amount = Amount;
        this.StatusID = StatusID;
    }

    public int getPaymentID() {
        return PaymentID;
    }

    public void setPaymentID(int PaymentID) {
        this.PaymentID = PaymentID;
    }

    public String getMethod() {
        return Method;
    }

    public void setMethod(String Method) {
        this.Method = Method;
    }

    public float getAmount() {
        return Amount;
    }

    public void setAmount(float Amount) {
        this.Amount = Amount;
    }

    public int getStatusID() {
        return StatusID;
    }

    public void setStatusID(int StatusID) {
        this.StatusID = StatusID;
    }

    @Override
    public String toString() {
        return "Payments{" + "PaymentID=" + PaymentID + ", Method=" + Method + ", Amount=" + Amount + ", StatusID=" + StatusID + '}';
    }
    
    
}
