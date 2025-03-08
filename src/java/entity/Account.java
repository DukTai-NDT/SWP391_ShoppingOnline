/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Account {

    private int AccountID;
    private String UserName;
    private int RoleID;
    private String Password;
    private String Email;

    private boolean active;

    public Account(int AccountID, String UserName, int RoleID, String Password,String Email,boolean active) {

        this.AccountID = AccountID;
        this.UserName = UserName;
        this.RoleID = RoleID;
        this.Password = Password;
        this.Email = Email;

        this.active=active;
    }

    public Account(String UserName, int RoleID, String Password,String Email,boolean active) {

 
        this.UserName = UserName;
        this.RoleID = RoleID;
        this.Password = Password;
        this.Email = Email;

        this.active=active;

    }

    public Account() {
    }


    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
    


    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

   

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(int RoleID) {
        this.RoleID = RoleID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    @Override
    public String toString() {
        return "Account{" + "AccountID=" + AccountID + ", UserName=" + UserName + ", RoleID=" + RoleID + ", Password=" + Password + ", Email=" + Email + '}';
    }
    
    

   

}
