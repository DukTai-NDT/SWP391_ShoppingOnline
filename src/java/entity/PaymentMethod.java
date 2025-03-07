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
public class PaymentMethod {
    private int MethodID;
    private String MethodName;

    public PaymentMethod(int MethodID, String MethodName) {
        this.MethodID = MethodID;
        this.MethodName = MethodName;
    }

    public PaymentMethod() {
    }

    public PaymentMethod(String MethodName) {
        this.MethodName = MethodName;
    }

    public int getMethodID() {
        return MethodID;
    }

    public void setMethodID(int MethodID) {
        this.MethodID = MethodID;
    }

    public String getMethodName() {
        return MethodName;
    }

    public void setMethodName(String MethodName) {
        this.MethodName = MethodName;
    }

    @Override
    public String toString() {
        return "PaymentMethod{" + "MethodID=" + MethodID + ", MethodName=" + MethodName + '}';
    }
   
    
}
