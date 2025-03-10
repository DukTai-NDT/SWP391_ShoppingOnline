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
    private int MethodID;
    
    private boolean Status;

    public Payments(int PaymentID, int MethodID, boolean Status) {
        this.PaymentID = PaymentID;
        this.MethodID = MethodID;
        this.Status = Status;
    }

    public Payments(int MethodID, boolean Status) {
        this.MethodID = MethodID;
        this.Status = Status;
    }

    public Payments() {
    }

    public int getPaymentID() {
        return PaymentID;
    }

    public void setPaymentID(int PaymentID) {
        this.PaymentID = PaymentID;
    }

    public int getMethodID() {
        return MethodID;
    }

    public void setMethodID(int MethodID) {
        this.MethodID = MethodID;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Payments{" + "PaymentID=" + PaymentID + ", MethodID=" + MethodID + ", Status=" + Status + '}';
    }
    
    
}


