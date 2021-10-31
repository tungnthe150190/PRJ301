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

/**
 *
 * @author Tung
 */
public class F1F2DBContext extends DBContext {

    public ArrayList<F1F2> listF1F2(int pagesize, int pageindex) {
        ArrayList<F1F2> f1f2 = new ArrayList<>();
        try {
            String sql = "select	ID,ApartmentID,BuildID,Name,FullName,DateOfBirth,HomeTown,Phone\n" +
"                 ,QuarantineStartDate,NumberOfDaysQuarantine from  \n" +
"				 (select rownum=ROW_NUMBER() OVER (Order by a.[ApartmentID] ASC),f.ID,r.ApartmentID,b.BuildID,b.Name\n" +
"				 ,r.FullName,r.DateOfBirth,r.HomeTown,r.Phone\n" +
"                 ,f.QuarantineStartDate,DATEDIFF(DAY,f.QuarantineStartDate,GETDATE()) as NumberOfDaysQuarantine\n" +
"                     from F1F2Management f\n" +
"                    inner join Resident r on r.ID=f.ID\n" +
"                    inner join Apartment a on a.ApartmentID=r.ApartmentID\n" +
"                    inner join Building b on b.BuildID=a.BuildID\n" +
"                   ) t \n" +
"					where rownum >= (?-1)*?+1 and rownum <= ?*? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                F1F2 f = new F1F2();
                f.setID(rs.getInt("ID"));
                Apartment a = new Apartment();
                a.setApartmentID(rs.getString("ApartmentID"));
                f.setApartment(a);
                Building b = new Building();
                b.setBuildID(rs.getInt("BuildID"));
                b.setName(rs.getString("Name"));
                f.setBuilding(b);
                Resident r = new Resident();
                r.setID(rs.getInt("ID"));
                r.setFullName(rs.getString("FullName"));
                r.setDob(rs.getDate("DateOfBirth"));
                r.setHomeTown(rs.getString("HomeTown"));
                r.setPhone(rs.getInt("Phone"));
                f.setResident(r);
                f.setQuarantineStartDate(rs.getDate("QuarantineStartDate"));
                f.setNumberOfDays(rs.getInt("NumberOfDaysQuarantine"));
                f1f2.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(F1F2DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f1f2;
    }
    public int getRowCount() {
        try {
            String sql = "select count(*) as Total from F1F2Management";
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
