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
import model.Resident;

/**
 *
 * @author Tung
 */
public class ResidentDBContext extends DBContext {

    public ArrayList<Resident> getResidents(int pagesize, int pageindex) {
        ArrayList<Resident> residents = new ArrayList<>();
        try {
            String sql = "			 select [ID],[ApartmentID],BuildID,Name,[FullName],[DateOfBirth],[HomeTown],[Phone] from \n"
                    + "                   (select rownum=ROW_NUMBER() OVER (Order by a.[ApartmentID] ASC),\n"
                    + "                    				 [ID]\n"
                    + "                                           ,a.[ApartmentID]\n"
                    + "                                         ,b.BuildID\n"
                    + "                                         ,b.Name\n"
                    + "                                            ,[FullName]\n"
                    + "                                            ,[DateOfBirth]\n"
                    + "                                          ,[HomeTown]\n"
                    + "                                        ,[Phone] from [Resident] r\n"
                    + "                                         inner join Apartment a on r.ApartmentID=a.ApartmentID\n"
                    + "                                        inner join Building b on a.BuildID=b.BuildID) t\n"
                    + "                   where\n"
                    + "                   rownum >= (?-1)*?+1 and rownum <= ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Resident r = new Resident();
                r.setID(rs.getInt("ID"));
                Apartment a = new Apartment();
                a.setApartmentID(rs.getString("ApartmentID"));
                r.setApartment(a);
                Building b = new Building();
                b.setBuildID(rs.getInt("BuildID"));
                b.setName(rs.getString("Name"));
                r.setBuilding(b);
                r.setFullName(rs.getString("FullName"));
                r.setDob(rs.getDate("DateOfBirth"));
                r.setHomeTown(rs.getString("HomeTown"));
                r.setPhone(rs.getInt("Phone"));
                residents.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return residents;
    }

    public int getRowCount() {
        try {
            String sql = "select count(*) as Total from Resident";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
