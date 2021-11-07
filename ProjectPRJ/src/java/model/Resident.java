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
public class Resident {

    private int ID;
    private Apartment apartment;
    private Building building;
    private String fullName;
    private Date dob;
    private String homeTown;
    private int phone;
    private boolean isF1F2;
    private Vaccination vaccine;   
    private F1F2 f1f2;

    public Resident() {
    }

    public Resident(int ID, Apartment apartment, String fullName, Date dob, String homeTown, int phone, Vaccination vaccine) {
        this.ID = ID;
        this.apartment = apartment;
        this.fullName = fullName;
        this.dob = dob;
        this.homeTown = homeTown;
        this.phone = phone;
        this.vaccine = vaccine;

    }

    public Vaccination getVaccine() {
        return vaccine;
    }

    public void setVaccine(Vaccination vaccine) {
        this.vaccine = vaccine;
    }

    public F1F2 getF1f2() {
        return f1f2;
    }

    public void setF1f2(F1F2 f1f2) {
        this.f1f2 = f1f2;
    }

    public Building getBuilding() {
        return building;
    }

    public void setBuilding(Building building) {
        this.building = building;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public Apartment getApartment() {
        return apartment;
    }

    public void setApartment(Apartment apartment) {
        this.apartment = apartment;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getHomeTown() {
        return homeTown;
    }

    public void setHomeTown(String homeTown) {
        this.homeTown = homeTown;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public boolean isIsF1F2() {
        return isF1F2;
    }

    public void setIsF1F2(boolean isF1F2) {
        this.isF1F2 = isF1F2;
    }

}
