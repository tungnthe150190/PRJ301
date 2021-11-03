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
import model.F1F2;
import model.Resident;
import model.Vaccination;

/**
 *
 * @author Tung
 */
public class VaccinationDBContext extends DBContext {

    public ArrayList<Vaccination> listVaccine(int pagesize, int pageindex) {
        ArrayList<Vaccination> listVaccine = new ArrayList<>();
        try {
            String sql = "	SELECT [ID]\n"
                    + "                         ,ApartmentID\n"
                    + "                    	  ,BuildID\n"
                    + "                    	  ,Name\n"
                    + "                    	  ,FullName\n"
                    + "                      ,DateOfBirth\n"
                    + "                      ,Phone\n"
                    + "                          ,[1 injection]\n"
                    + "                          ,[1injectionDate]\n"
                    + "                          ,[2 injection]\n"
                    + "                          ,[2injectionDate] from (SELECT rownum=ROW_NUMBER() OVER (Order by a.[ApartmentID] ASC), r.[ID]\n"
                    + "                         ,r.ApartmentID\n"
                    + "                    	  ,b.BuildID\n"
                    + "                    	  ,b.Name\n"
                    + "                    	  ,r.FullName\n"
                    + "                      ,r.DateOfBirth\n"
                    + "                      ,r.Phone\n"
                    + "                          ,[1 injection]\n"
                    + "                          ,[1injectionDate]\n"
                    + "                          ,[2 injection]\n"
                    + "                          ,[2injectionDate]\n"
                    + "                      FROM [Vaccination] v\n"
                    + "                     right outer join Resident r on r.ID=v.ID\n"
                    + "                      inner join Apartment a on a.ApartmentID=r.ApartmentID\n"
                    + "                     inner join Building b on b.BuildID=a.BuildID) t\n"
                    + "					 where rownum >= (?-1)*?+1 and rownum <= ?*?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Vaccination v = new Vaccination();
                v.setID(rs.getInt("ID"));              
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
                r.setPhone(rs.getInt("Phone"));
                v.setResident(r);
                v.setFirstInjection(rs.getBoolean("1 injection"));
                v.setFirstInjectionDate(rs.getDate("1injectionDate"));
                v.setSecondInjection(rs.getBoolean("2 injection"));
                v.setSecondInjectionDate(rs.getDate("2injectionDate"));
                listVaccine.add(v);

            }
        } catch (SQLException ex) {
            Logger.getLogger(F1F2DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listVaccine;
    }

    public int getRowCount() {
        try {
            String sql = "select count(*) as Total from Vaccination";
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
