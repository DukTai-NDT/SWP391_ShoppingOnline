/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author quang
 */
public class Transports {
    private int TransportID;
    private int OrderID;

    public Transports(int TransportID, int OrderID) {
        this.TransportID = TransportID;
        this.OrderID = OrderID;
    }

    public int getTransportID() {
        return TransportID;
    }

    public void setTransportID(int TransportID) {
        this.TransportID = TransportID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    @Override
    public String toString() {
        return "Transports{" + "TransportID=" + TransportID + ", OrderID=" + OrderID + '}';
    }
    
    
}
