/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDate;

/**
 *
 * @author quang
 */
public class Status {
    private int StatusID;
    private String Name;
    private LocalDate UpdateTime;

    public Status(int StatusID, String Name, LocalDate UpdateTime) {
        this.StatusID = StatusID;
        this.Name = Name;
        this.UpdateTime = UpdateTime;
    }

    public Status(String Name, LocalDate UpdateTime) {
        this.Name = Name;
        this.UpdateTime = UpdateTime;
    }

    public int getStatusID() {
        return StatusID;
    }

    public void setStatusID(int StatusID) {
        this.StatusID = StatusID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public LocalDate getUpdateTime() {
        return UpdateTime;
    }

    public void setUpdateTime(LocalDate UpdateTime) {
        this.UpdateTime = UpdateTime;
    }

    @Override
    public String toString() {
        return "Status{" + "StatusID=" + StatusID + ", Name=" + Name + ", UpdateTime=" + UpdateTime + '}';
    }
    
}
