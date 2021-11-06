/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
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

    public ArrayList<Resident> search(int id, int buildID, String apartmentID, String fullName, Date from, Date to, String homeTown, Boolean firstInjection, Date firstfrom, Date firstto, Boolean secondInjection, Date secondfrom, Date secondto) {
        ArrayList<Resident> vaccines = new ArrayList<>();
        try {

            String sql = "SELECT r.[ID]\n"
                    + "                    ,b.BuildID\n"
                    + "                    ,Name\n"
                    + "                    ,a.ApartmentID\n"
                    + "                    ,FullName\n"
                    + "                    ,DateOfBirth\n"
                    + "                    ,HomeTown\n"
                    + "                    ,Phone\n"
                    + "                    ,[1 injection]\n"
                    + "			   ,[1injectionDate]\n"
                    + "                    ,[2 injection]\n"
                    + "			   ,[2injectionDate]\n"
                    + "                    FROM [Resident] r\n"
                    + "                    inner join [Vaccination] v on r.ID=v.ID\n"
                    + "                    inner join Apartment a on a.ApartmentID=r.ApartmentID\n"
                    + "                    inner join Building b on b.BuildID=a.BuildID\n"
                    + "                    WHERE\n"
                    + "                    (1=1)\n";

            HashMap<Integer, Object[]> params = new HashMap<>();
            int paramIndex = 0;

            if (id != -1) {
                sql += "AND r.ID = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = id;
                params.put(paramIndex, param);
            }
            if (buildID != -1) {
                sql += "AND b.BuildID = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = buildID;
                params.put(paramIndex, param);
            }
            if (!apartmentID.equals("")) {
                sql += "AND a.[ApartmentID] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = apartmentID;
                params.put(paramIndex, param);
            }

            if (fullName != null) {
                sql += "AND [FullName] like '%' + ? + '%' ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = fullName;
                params.put(paramIndex, param);
            }
            if (from != null) {
                sql += "AND [DateOfBirth] >= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = from;
                params.put(paramIndex, param);
            }
            if (to != null) {
                sql += "AND [DateOfBirth] <= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = to;
                params.put(paramIndex, param);
            }
            if (homeTown != null) {
                sql += "AND HomeTown like '%' + ? + '%' ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = homeTown;
                params.put(paramIndex, param);
            }

            if (firstInjection != null) {
                sql += "AND [1 injection] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getTypeName();
                param[1] = firstInjection;
                params.put(paramIndex, param);
            }
            if (firstfrom != null) {
                sql += "AND [1injectionDate] >= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = firstfrom;
                params.put(paramIndex, param);
            }
            if (firstto != null) {
                sql += "AND [1injectionDate] <= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = firstto;
                params.put(paramIndex, param);
            }
            if (secondInjection != null) {
                sql += "AND [2 injection] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getTypeName();
                param[1] = secondInjection;
                params.put(paramIndex, param);
            }

            if (secondfrom != null) {
                sql += "AND [2injectionDate] >= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = secondfrom;
                params.put(paramIndex, param);
            }
            if (secondto != null) {
                sql += "AND [2injectionDate] <= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = secondto;
                params.put(paramIndex, param);
            }

            PreparedStatement stm = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                Integer index = entry.getKey();
                Object[] value = entry.getValue();
                String type = value[0].toString();
                if (type.equals(Integer.class.getName())) {
                    stm.setInt(index, Integer.parseInt(value[1].toString()));
                } else if (type.equals(String.class.getName())) {
                    stm.setString(index, value[1].toString());
                } else if (type.equals(Date.class.getName())) {
                    stm.setDate(index, (Date) value[1]);
                } else if (type.equals(Boolean.class.getName())) {
                    stm.setBoolean(index, (Boolean) value[1]);
                }
            }
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
                Vaccination v = new Vaccination();
                v.setFirstInjection(rs.getBoolean("1 injection"));
                v.setFirstInjectionDate(rs.getDate("1injectionDate"));
                v.setSecondInjection(rs.getBoolean("2 injection"));
                v.setSecondInjectionDate(rs.getDate("2injectionDate"));
                r.setVaccine(v);
                vaccines.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vaccines;
    }

    public ArrayList<Resident> searchWithPagging(int pageindex, int id, int buildID, String apartmentID, String fullName, Date from, Date to, String homeTown, Boolean firstInjection, Date firstfrom, Date firstto, Boolean secondInjection, Date secondfrom, Date secondto) {
        ArrayList<Resident> vaccines = new ArrayList<>();
        try {
            String sql = "SELECT rownum=ROW_NUMBER() OVER (Order by a.[ApartmentID] ASC) \n"
                    + "  , r.[ID]\n"
                    + " ,b.BuildID\n"
                    + " ,Name\n"
                    + ",a.ApartmentID\n"
                    + " ,FullName\n"
                    + " ,DateOfBirth\n"
                    + " ,HomeTown\n"
                    + " ,Phone\n"
                    + " ,[1 injection]\n"
                    + " ,[1injectionDate]\n"
                    + "   ,[2 injection]\n"
                    + "  ,[2injectionDate]\n"
                    + "   FROM [Resident] r\n"
                    + "  inner join [Vaccination] v on r.ID=v.ID\n"
                    + "  inner join Apartment a on a.ApartmentID=r.ApartmentID\n"
                    + " inner join Building b on b.BuildID=a.BuildID where 1=1 ";

            HashMap<Integer, Object[]> params = new HashMap<>();
            int paramIndex = 0;          
            if (id != -1) {
                sql += "AND r.ID = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = id;
                params.put(paramIndex, param);
            }
            if (buildID != -1) {
                sql += "AND b.BuildID = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = buildID;
                params.put(paramIndex, param);
            }
            if (!apartmentID.equals("")) {
                sql += "AND a.[ApartmentID] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = apartmentID;
                params.put(paramIndex, param);
            }

            if (fullName != null) {
                sql += "AND [FullName] like '%' + ? + '%' ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = fullName;
                params.put(paramIndex, param);
            }
            if (from != null) {
                sql += "AND [DateOfBirth] >= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = from;
                params.put(paramIndex, param);
            }
            if (to != null) {
                sql += "AND [DateOfBirth] <= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = to;
                params.put(paramIndex, param);
            }
            if (homeTown != null) {
                sql += "AND HomeTown like '%' + ? + '%' ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = homeTown;
                params.put(paramIndex, param);
            }

            if (firstInjection != null) {
                sql += "AND [1 injection] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getTypeName();
                param[1] = firstInjection;
                params.put(paramIndex, param);
            }
            if (firstfrom != null) {
                sql += "AND [1injectionDate] >= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = firstfrom;
                params.put(paramIndex, param);
            }
            if (firstto != null) {
                sql += "AND [1injectionDate] <= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = firstto;
                params.put(paramIndex, param);
            }
            if (secondInjection != null) {
                sql += "AND [2 injection] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getTypeName();
                param[1] = secondInjection;
                params.put(paramIndex, param);
            }

            if (secondfrom != null) {
                sql += "AND [2injectionDate] >= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = secondfrom;
                params.put(paramIndex, param);
            }
            if (secondto != null) {
                sql += "AND [2injectionDate] <= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = secondto;
                params.put(paramIndex, param);
            }
            String results="SELECT rownum, [ID]\n"
                    + ",BuildID\n"
                    + " ,Name\n"
                    + " ,ApartmentID\n"
                    + " ,FullName\n"
                    + "  ,DateOfBirth\n"
                    + " ,HomeTown\n"
                    + ",Phone\n"
                    + "  ,[1 injection]\n"
                    + "  ,[1injectionDate]\n"
                    + "  ,[2 injection]\n"
                    + "   ,[2injectionDate] from "
                    + "(" + sql+ ") t where rownum >= (?-1)*20+1 and rownum <= ?*20 ";
            

            PreparedStatement stm = connection.prepareStatement(results);
            stm.setInt(paramIndex +1, pageindex);
            stm.setInt(paramIndex+2, pageindex);
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                Integer index = entry.getKey();
                Object[] value = entry.getValue();
                String type = value[0].toString();
                if (type.equals(Integer.class.getName())) {
                    stm.setInt(index, Integer.parseInt(value[1].toString()));
                } else if (type.equals(String.class.getName())) {
                    stm.setString(index, value[1].toString());
                } else if (type.equals(Date.class.getName())) {
                    stm.setDate(index, (Date) value[1]);
                } else if (type.equals(Boolean.class.getName())) {
                    stm.setBoolean(index, (Boolean) value[1]);
                }
            }

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
                Vaccination v = new Vaccination();
                v.setFirstInjection(rs.getBoolean("1 injection"));
                v.setFirstInjectionDate(rs.getDate("1injectionDate"));
                v.setSecondInjection(rs.getBoolean("2 injection"));
                v.setSecondInjectionDate(rs.getDate("2injectionDate"));
                r.setVaccine(v);
                vaccines.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vaccines;
    }
}
