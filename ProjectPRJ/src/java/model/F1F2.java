/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Tung
 */
public class F1F2 {
    private int ID;
    private Date quarantineStartDate;
    private int numberOfDays;
    private Resident resident;
    private Building building;
    private Apartment apartment;

    public int getNumberOfDays() {
        return numberOfDays;
    }

    public void setNumberOfDays(int numberOfDays) {
        this.numberOfDays = numberOfDays;
    }

    public Date getQuarantineStartDate() {
        return quarantineStartDate;
    }

    public void setQuarantineStartDate(Date quarantineStartDate) {
        this.quarantineStartDate = quarantineStartDate;
    }
    

    public Resident getResident() {
        return resident;
    }

    public void setResident(Resident resident) {
        this.resident = resident;
    }

    public Building getBuilding() {
        return building;
    }

    public void setBuilding(Building building) {
        this.building = building;
    }

    public Apartment getApartment() {
        return apartment;
    }

    public void setApartment(Apartment apartment) {
        this.apartment = apartment;
    }
    

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

   
    
}
