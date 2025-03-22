/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Brand {

    private int BrandID;
    private String BrandName;
    private String Country;

    public Brand(int BrandID, String BrandName, String Country) {
        this.BrandID = BrandID;
        this.BrandName = BrandName;
        this.Country = Country;
    }

    public Brand(String BrandName, String Country) {
        this.BrandName = BrandName;
        this.Country = Country;
    }
    
    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public String getBrandName() {
        return BrandName;
    }

    public void setBrandName(String BrandName) {
        this.BrandName = BrandName;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String Country) {
        this.Country = Country;
    }

    @Override
    public String toString() {
        return "Brand{" + "BrandID=" + BrandID + ", BrandName=" + BrandName + ", Country=" + Country + '}';
    }
    
    
}
