/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class TokenForgetPassword {

    private int TokenForgetPasswordID;
    private String Token;
    private LocalDateTime ExpiryTime;
    private boolean isUsed;
    private int AccountID;

    public TokenForgetPassword(int TokenForgetPasswordID, String Token, LocalDateTime ExpiryTime, boolean isUsed, int AccountID) {
        this.TokenForgetPasswordID = TokenForgetPasswordID;
        this.Token = Token;
        this.ExpiryTime = ExpiryTime;
        this.isUsed = isUsed;
        this.AccountID = AccountID;
    }

    public TokenForgetPassword(String Token, LocalDateTime ExpiryTime, boolean isUsed, int AccountID) {
        this.Token = Token;
        this.ExpiryTime = ExpiryTime;
        this.isUsed = isUsed;
        this.AccountID = AccountID;
    }

    public TokenForgetPassword() {
    }

    public int getTokenForgetPasswordID() {
        return TokenForgetPasswordID;
    }

    public void setTokenForgetPasswordID(int TokenForgetPasswordID) {
        this.TokenForgetPasswordID = TokenForgetPasswordID;
    }

    public String getToken() {
        return Token;
    }

    public void setToken(String Token) {
        this.Token = Token;
    }

    public LocalDateTime getExpiryTime() {
        return ExpiryTime;
    }

    public void setExpiryTime(LocalDateTime ExpiryTime) {
        this.ExpiryTime = ExpiryTime;
    }

    public boolean getisUsed() {
        return isUsed;
    }

    public void setisUsed(boolean isUsed) {
        this.isUsed = isUsed;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    @Override
    public String toString() {
        return "TokenForgetPassword{" + "TokenForgetPasswordID=" + TokenForgetPasswordID + ", Token=" + Token + ", ExpiryTime=" + ExpiryTime + ", isUsed=" + isUsed + ", AccountID=" + AccountID + '}';
    }
    
    
}