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
public class Vaccination {
    private int ID;   
     private Resident resident;
    private boolean firstInjection;
    private Date firstInjectionDate;
    private boolean secondInjection;
    private Date secondInjectionDate;

    public Vaccination() {
    }

    public Vaccination(int ID,boolean firstInjection, Date firstInjectionDate, boolean secondInjection, Date secondInjectionDate) {
        this.ID = ID;        
        this.firstInjection = firstInjection;
        this.firstInjectionDate = firstInjectionDate;
        this.secondInjection = secondInjection;
        this.secondInjectionDate = secondInjectionDate;
    }   
    public Resident getResident() {
        return resident;
    }

    public void setResident(Resident resident) {
        this.resident = resident;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public boolean isFirstInjection() {
        return firstInjection;
    }

    public void setFirstInjection(boolean firstInjection) {
        this.firstInjection = firstInjection;
    }

    public Date getFirstInjectionDate() {
        return firstInjectionDate;
    }

    public void setFirstInjectionDate(Date firstInjectionDate) {
        this.firstInjectionDate = firstInjectionDate;
    }

    public boolean isSecondInjection() {
        return secondInjection;
    }

    public void setSecondInjection(boolean secondInjection) {
        this.secondInjection = secondInjection;
    }

    public Date getSecondInjectionDate() {
        return secondInjectionDate;
    }

    public void setSecondInjectionDate(Date secondInjectionDate) {
        this.secondInjectionDate = secondInjectionDate;
    }
    
  
}
