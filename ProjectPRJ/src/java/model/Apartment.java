/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Tung
 */
public class Apartment {
    private String apartmentID;
    private Building build;
    private int amountPeople;
    
    private ArrayList<Resident> residents= new ArrayList<>();

    public ArrayList<Resident> getResidents() {
        return residents;
    }

    public void setResidents(ArrayList<Resident> residents) {
        this.residents = residents;
    }
    

    public String getApartmentID() {
        return apartmentID;
    }

    public void setApartmentID(String apartmentID) {
        this.apartmentID = apartmentID;
    }

    public Building getBuild() {
        return build;
    }

    public void setBuild(Building build) {
        this.build = build;
    }

    public int getAmountPeople() {
        return amountPeople;
    }

    public void setAmountPeople(int amountPeople) {
        this.amountPeople = amountPeople;
    }
    
}
