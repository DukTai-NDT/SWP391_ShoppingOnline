/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author quang
 */
public class Products {
    private int ProductID;
    private String ProductName;
    private float Price;
    private String Description;
    private String UnitPrice;
    private int CategoryID;
    private int BrandID;
    private boolean isPrescriptionDrug;
    private int Quantity;
    private String Image;

    public Products(int ProductID, String ProductName, float Price, String Description, String UnitPrice, int CategoryID, int BrandID, boolean isPrescriptionDrug, int Quantity, String Image) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Price = Price;
        this.Description = Description;
        this.UnitPrice = UnitPrice;
        this.CategoryID = CategoryID;
        this.BrandID = BrandID;
        this.isPrescriptionDrug = isPrescriptionDrug;
        this.Quantity = Quantity;
        this.Image = Image;
    }

    public Products(String ProductName, float Price, String Description, String UnitPrice, int CategoryID, int BrandID, boolean isPrescriptionDrug, int Quantity, String Image) {
        this.ProductName = ProductName;
        this.Price = Price;
        this.Description = Description;
        this.UnitPrice = UnitPrice;
        this.CategoryID = CategoryID;
        this.BrandID = BrandID;
        this.isPrescriptionDrug = isPrescriptionDrug;
        this.Quantity = Quantity;
        this.Image = Image;
    }

    public Products() {
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(String UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public boolean isIsPrescriptionDrug() {
        return isPrescriptionDrug;
    }

    public void setIsPrescriptionDrug(boolean isPrescriptionDrug) {
        this.isPrescriptionDrug = isPrescriptionDrug;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    @Override
    public String toString() {
        return "Products{" + "ProductID=" + ProductID + ", ProductName=" + ProductName + ", Price=" + Price + ", Description=" + Description + ", UnitPrice=" + UnitPrice + ", CategoryID=" + CategoryID + ", BrandID=" + BrandID + ", isPrescriptionDrug=" + isPrescriptionDrug + ", Quantity=" + Quantity + ", Image=" + Image + '}';
    }
    
    
    
    
    
}
