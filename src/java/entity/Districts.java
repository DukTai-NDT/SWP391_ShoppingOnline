/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Districts {
   private int  DistrictID;
   private String  DistrictName;
   private int ProvinceID;

    public Districts(int DistrictID, String DistrictName, int ProvinceID) {
        this.DistrictID = DistrictID;
        this.DistrictName = DistrictName;
        this.ProvinceID = ProvinceID;
    }

    public Districts(String DistrictName, int ProvinceID) {
        this.DistrictName = DistrictName;
        this.ProvinceID = ProvinceID;
    }

    public Districts() {
    }

    public int getDistrictID() {
        return DistrictID;
    }

    public void setDistrictID(int DistrictID) {
        this.DistrictID = DistrictID;
    }

    public String getDistrictName() {
        return DistrictName;
    }

    public void setDistrictName(String DistrictName) {
        this.DistrictName = DistrictName;
    }

    public int getProvinceID() {
        return ProvinceID;
    }

    public void setProvinceID(int ProvinceID) {
        this.ProvinceID = ProvinceID;
    }

    @Override
    public String toString() {
        return "Districts{" + "DistrictID=" + DistrictID + ", DistrictName=" + DistrictName + ", ProvinceID=" + ProvinceID + '}';
    }
   
   
}
