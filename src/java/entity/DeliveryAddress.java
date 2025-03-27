/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class DeliveryAddress {

    
    private int DeliveryAddressID;
	private String AddressDetail;
	private int OrderID;
	private int ProvinceID;
	private int DistrictID;
        private String Phone;

    public DeliveryAddress(int DeliveryAddressID, String AddressDetail, int OrderID, int ProvinceID, int DistrictID, String Phone) {
        this.DeliveryAddressID = DeliveryAddressID;
        this.AddressDetail = AddressDetail;
        this.OrderID = OrderID;
        this.ProvinceID = ProvinceID;
        this.DistrictID = DistrictID;
        this.Phone = Phone;
    }

    public DeliveryAddress(String AddressDetail, int OrderID, int ProvinceID, int DistrictID, String Phone) {
        this.AddressDetail = AddressDetail;
        this.OrderID = OrderID;
        this.ProvinceID = ProvinceID;
        this.DistrictID = DistrictID;
        this.Phone = Phone;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    

    public DeliveryAddress() {
    }

    public int getDeliveryAddressID() {
        return DeliveryAddressID;
    }

    public void setDeliveryAddressID(int DeliveryAddressID) {
        this.DeliveryAddressID = DeliveryAddressID;
    }

    public String getAddressDetail() {
        return AddressDetail;
    }

    public void setAddressDetail(String AddressDetail) {
        this.AddressDetail = AddressDetail;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getProvinceID() {
        return ProvinceID;
    }

    public void setProvinceID(int ProvinceID) {
        this.ProvinceID = ProvinceID;
    }

    public int getDistrictID() {
        return DistrictID;
    }

    public void setDistrictID(int DistrictID) {
        this.DistrictID = DistrictID;
    }

    @Override
    public String toString() {
        return "DeliveryAddress{" + "DeliveryAddressID=" + DeliveryAddressID + ", AddressDetail=" + AddressDetail + ", OrderID=" + OrderID + ", ProvinceID=" + ProvinceID + ", DistrictID=" + DistrictID + ", Phone=" + Phone + '}';
    }

   
        
}
