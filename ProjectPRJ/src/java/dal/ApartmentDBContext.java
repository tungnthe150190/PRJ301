/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Apartment;
import model.Building;

/**
 *
 * @author Tung
 */
public class ApartmentDBContext extends DBContext {
    public ArrayList<Apartment> getAparts(){
        ArrayList<Apartment> aparts=new ArrayList<>();
        try {           
            
            String sql="SELECT [ApartmentID]\n" +
                    "      ,[BuildID]\n" +
                    "      ,[AmountPeople]\n" +
                    "  FROM [Apartment]";
            PreparedStatement stm=connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Apartment a=new Apartment();
                a.setApartmentID(rs.getString("ApartmentID"));
                Building d =new Building();
                d.setBuildID(rs.getInt("BuildID"));
                a.setBuild(d);
                a.setAmountPeople(rs.getInt("AmountPeople"));
                aparts.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ApartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return aparts;
    }
}
