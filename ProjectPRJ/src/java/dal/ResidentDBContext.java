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
import model.Resident;
import model.Vaccination;

/**
 *
 * @author Tung
 */
public class ResidentDBContext extends DBContext {

    public ArrayList<Resident> getResidentsWithPagging(int pagesize, int pageindex) {
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

    public void insertResident(Resident r) {
        try {
            connection.setAutoCommit(false);
            String sql_add_resident = "INSERT INTO [Resident]\n"
                    + "           ([ID]\n"
                    + "           ,[ApartmentID]\n"
                    + "           ,[FullName]\n"
                    + "           ,[DateOfBirth]\n"
                    + "           ,[HomeTown]\n"
                    + "           ,[Phone])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql_add_resident);
            stm.setInt(1, r.getID());
            stm.setString(2, r.getApartment().getApartmentID());
            stm.setString(3, r.getFullName());
            stm.setDate(4, r.getDob());
            stm.setString(5, r.getHomeTown());
            stm.setInt(6, r.getPhone());
            stm.executeUpdate();

            String sql_updateAmount = "update Apartment\n"
                    + "set AmountPeople=AmountPeople+1\n"
                    + "where ApartmentID=?";
            PreparedStatement stm_update_amount = connection.prepareStatement(sql_updateAmount);
            stm_update_amount.setString(1, r.getApartment().getApartmentID());
            stm_update_amount.executeUpdate();

            String sql_add_vaccine = "INSERT INTO [Vaccination]\n"
                    + "           ([ID]\n"
                    + "           ,[1 injection]\n"
                    + "           ,[1injectionDate]\n"
                    + "           ,[2 injection]\n"
                    + "           ,[2injectionDate])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm_add_vaccine = connection.prepareStatement(sql_add_vaccine);
            stm_add_vaccine.setInt(1, r.getID());
            stm_add_vaccine.setBoolean(2, r.getVaccine().isFirstInjection());
            stm_add_vaccine.setDate(3, r.getVaccine().getFirstInjectionDate());
            stm_add_vaccine.setBoolean(4, r.getVaccine().isSecondInjection());
            stm_add_vaccine.setDate(5, r.getVaccine().getSecondInjectionDate());
            stm_add_vaccine.executeUpdate();

            connection.commit();

        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Resident> getResidents() {
        ArrayList<Resident> residents = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,a.[ApartmentID]\n"
                    + "	  ,b.BuildID\n"
                    + "	  ,b.Name\n"
                    + "      ,[FullName]\n"
                    + "      ,[DateOfBirth]\n"
                    + "      ,[HomeTown]\n"
                    + "      ,[Phone]\n"
                    + "  FROM [Resident] r\n"
                    + "  inner join Apartment a on r.ApartmentID=a.ApartmentID\n"
                    + "  inner join Building b on a.BuildID=b.BuildID";
            PreparedStatement stm = connection.prepareStatement(sql);
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

    public Resident getResidentbyID(int ID) {
        try {
            String sql = "SELECT r.[ID]\n"
                    + ",a.[ApartmentID]\n"
                    + ",b.BuildID\n"
                    + " ,b.Name\n"
                    + ",[FullName]\n"
                    + ",[DateOfBirth]\n"
                    + ",[HomeTown]\n"
                    + ",[Phone]\n"
                    + ",[1 injection]\n"
                    + ",[1injectionDate]\n"
                    + ",[2 injection]\n"
                    + ",[2injectionDate]\n"
                    + "FROM [Resident] r\n"
                    + " inner join Apartment a on r.ApartmentID=a.ApartmentID\n"
                    + " inner join Building b on a.BuildID=b.BuildID\n"
                    + " inner join Vaccination v on v.ID=r.ID\n"
                    + " where r.[ID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ID);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
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
                return r;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Resident> search(int id, int buildID, String apartmentID, String fullName, Date from, Date to, String homeTown, int phone, Boolean firstInjection, Boolean secondInjection) {
        ArrayList<Resident> residents = new ArrayList<>();
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
            if (phone != -1) {
                sql += "AND [Phone] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = phone;
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
            if (secondInjection != null) {
                sql += "AND [2 injection] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getTypeName();
                param[1] = secondInjection;
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
                residents.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return residents;
    }

    public void update(Resident resident) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [Resident]\n"
                    + "   SET [ApartmentID] = ?\n"
                    + "      ,[FullName] = ?\n"
                    + "      ,[DateOfBirth] = ?\n"
                    + "      ,[HomeTown] = ?\n"
                    + "      ,[Phone] = ?\n"
                    + " WHERE ID=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, resident.getApartment().getApartmentID());
            stm.setString(2, resident.getFullName());
            stm.setDate(3, resident.getDob());
            stm.setString(4, resident.getHomeTown());
            stm.setInt(5, resident.getPhone());
            stm.setInt(6, resident.getID());
            stm.executeUpdate();

            //delete Vaccination
            String sql_delete_vaccine = "delete from Vaccination where ID=?";
            PreparedStatement stm_delete_vaccine = connection.prepareStatement(sql_delete_vaccine);
            stm_delete_vaccine.setInt(1, resident.getID());
            stm_delete_vaccine.executeUpdate();

            //insert vaccination
            String sql_add_vaccine = "INSERT INTO [Vaccination]\n"
                    + "           ([ID]\n"
                    + "           ,[1 injection]\n"
                    + "           ,[1injectionDate]\n"
                    + "           ,[2 injection]\n"
                    + "           ,[2injectionDate])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm_add_vaccine = connection.prepareStatement(sql_add_vaccine);
            stm_add_vaccine.setInt(1, resident.getID());
            stm_add_vaccine.setBoolean(2, resident.getVaccine().isFirstInjection());
            stm_add_vaccine.setDate(3, resident.getVaccine().getFirstInjectionDate());
            stm_add_vaccine.setBoolean(4, resident.getVaccine().isSecondInjection());
            stm_add_vaccine.setDate(5, resident.getVaccine().getSecondInjectionDate());
            stm_add_vaccine.executeUpdate();

            connection.commit();

        } catch (SQLException ex) {
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void delete(int id) {
        try {
            connection.setAutoCommit(false);
            String sql_delete_f1f2 = "Delete from F1F2Management where ID=?";
            PreparedStatement stm_delete_f1f2 = connection.prepareStatement(sql_delete_f1f2);
            stm_delete_f1f2.setInt(1, id);
            stm_delete_f1f2.executeUpdate();

            String sql_delete_vaccine = "Delete from Vaccination where ID=?";
            PreparedStatement stm_delete_vaccine = connection.prepareStatement(sql_delete_vaccine);
            stm_delete_vaccine.setInt(1, id);
            stm_delete_vaccine.executeUpdate();

            String sql = "Delete from Resident where ID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
