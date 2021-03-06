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
import model.Building;

/**
 *
 * @author Tung
 */
public class BuildingDBContext extends DBContext {

    public ArrayList<Building> getBuildings() {
        ArrayList<Building> buildings = new ArrayList<>();
        try {
            String sql = "select b.BuildID,Name,NumberOfFloors,NumberOfPeoPle=sum(a.AmountPeople)\n"
                    + "                    from Building b join Apartment a on a.BuildID=b.BuildID\n"
                    + "                    group by  b.BuildID,Name,NumberOfFloors";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Building b = new Building();
                b.setBuildID(rs.getInt("BuildID"));
                b.setName(rs.getString("Name"));
                b.setNumberOfFloors(rs.getInt("NumberOfFloors"));
                b.setNumberOfPeople(rs.getInt("NumberOfPeoPle"));                
                buildings.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BuildingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return buildings;
    }
    public ArrayList<Building> getBuildingsF1F2(){
        ArrayList<Building> buildings = new ArrayList<>();
        try {
            String sql = "select b.BuildID,Name,NumberOfPeoPle=sum(a.AmountPeople),F1F2=COUNT(f.ID)\n" +
"                    from Building b join Apartment a on a.BuildID=b.BuildID\n" +
"					join Resident r on r.ApartmentID=a.ApartmentID\n" +
"					join F1F2Management f on f.ID=r.ID\n" +
"                    group by  b.BuildID,Name";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Building b = new Building();
                b.setBuildID(rs.getInt("BuildID"));
                b.setName(rs.getString("Name"));               
                b.setNumberOfPeople(rs.getInt("NumberOfPeoPle"));  
                 b.setNumberOfF1F2(rs.getInt("F1F2"));
                buildings.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BuildingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return buildings;
    }
}
