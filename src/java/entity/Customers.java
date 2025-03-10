/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Customers {

    private int CustomerID;
	private String FirstName;
	private String LastName;
	private String Email;
	private String Address;
	private String Gender;
	private String Phone;
	private int AccountID;

    public Customers(int CustomerID, String FirstName, String LastName, String Email, String Address, String Gender, String Phone, int AccountID) {
        this.CustomerID = CustomerID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
        this.Address = Address;
        this.Gender = Gender;
        this.Phone = Phone;
        this.AccountID = AccountID;
    }

    public Customers(int CustomerID, String FirstName, String LastName, String Email, String Address, String Gender, String Phone) {
        this.CustomerID = CustomerID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
        this.Address = Address;
        this.Gender = Gender;
        this.Phone = Phone;
    }

    public Customers(String FirstName, String LastName, String Email, String Address, String Gender, String Phone, int AccountID) {
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
        this.Address = Address;
        this.Gender = Gender;
        this.Phone = Phone;
        this.AccountID = AccountID;
    }

    public Customers() {
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    @Override
    public String toString() {
        return "Customers{" + "CustomerID=" + CustomerID + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Email=" + Email + ", Address=" + Address + ", Gender=" + Gender + ", Phone=" + Phone + ", AccountID=" + AccountID + '}';
    }
        
}
