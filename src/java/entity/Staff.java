/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Staff {
    private int StaffID;
	private String FirstName;
        private String LastName;
	private String Phone;
	private String Email;
	private int AccountID;

    public Staff(int StaffID, String FirstName, String LastName, String Phone, String Email, int AccountID) {
        this.StaffID = StaffID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Phone = Phone;
        this.Email = Email;
        this.AccountID = AccountID;
    }

    public Staff(String FirstName, String LastName, String Phone, String Email, int AccountID) {
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Phone = Phone;
        this.Email = Email;
        this.AccountID = AccountID;
    }

    public Staff() {
    }

    public int getStaffID() {
        return StaffID;
    }

    public void setStaffID(int StaffID) {
        this.StaffID = StaffID;
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

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setRoleID(int AccountID) {
        this.AccountID = AccountID;
    }

    @Override
    public String toString() {
        return "Staff{" + "StaffID=" + StaffID + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Phone=" + Phone + ", Email=" + Email + ", RoleID=" + AccountID + '}';
    }
        
        
        
}
