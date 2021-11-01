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
public class Building {
    private int buildID;
    private String name;
    private int numberOfFloors;
    private int numberOfPeople;
    private int numberOfF1F2;

    public int getNumberOfF1F2() {
        return numberOfF1F2;
    }

    public void setNumberOfF1F2(int numberOfF1F2) {
        this.numberOfF1F2 = numberOfF1F2;
    }
    

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }
    private ArrayList<Apartment> aparts=new ArrayList<>();

    public ArrayList<Apartment> getAparts() {
        return aparts;
    }

    public void setAparts(ArrayList<Apartment> aparts) {
        this.aparts = aparts;
    }

    public int getBuildID() {
        return buildID;
    }

    public void setBuildID(int buildID) {
        this.buildID = buildID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }
    
}
