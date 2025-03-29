/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Provinces {
   private int  ProvinceID ;
   private String ProvinceName;

    public Provinces(int ProvinceID, String ProvinceName) {
        this.ProvinceID = ProvinceID;
        this.ProvinceName = ProvinceName;
    }

    public Provinces(String ProvinceName) {
        this.ProvinceName = ProvinceName;
    }

    public Provinces() {
    }

    @Override
    public String toString() {
        return "Provinces{" + "ProvinceID=" + ProvinceID + ", ProvinceName=" + ProvinceName + '}';
    }

    public int getProvinceID() {
        return ProvinceID;
    }

    public void setProvinceID(int ProvinceID) {
        this.ProvinceID = ProvinceID;
    }

    public String getProvinceName() {
        return ProvinceName;
    }

    public void setProvinceName(String ProvinceName) {
        this.ProvinceName = ProvinceName;
    }
   
   
}
