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
public class F1F2DBContext extends DBContext {

    public ArrayList<F1F2> listF1F2WithPagging(int pagesize, int pageindex) {
        ArrayList<F1F2> f1f2 = new ArrayList<>();
        try {
            String sql = "select ID,ApartmentID,BuildID,Name,FullName,DateOfBirth,HomeTown,Phone\n"
                    + "                 ,QuarantineStartDate,NumberOfDaysQuarantine from  \n"
                    + "				 (select rownum=ROW_NUMBER() OVER (Order by a.[ApartmentID] ASC),f.ID,r.ApartmentID,b.BuildID,b.Name\n"
                    + "				 ,r.FullName,r.DateOfBirth,r.HomeTown,r.Phone\n"
                    + "                 ,f.QuarantineStartDate,DATEDIFF(DAY,f.QuarantineStartDate,GETDATE()) as NumberOfDaysQuarantine\n"
                    + "                     from F1F2Management f\n"
                    + "                    inner join Resident r on r.ID=f.ID\n"
                    + "                    inner join Apartment a on a.ApartmentID=r.ApartmentID\n"
                    + "                    inner join Building b on b.BuildID=a.BuildID\n"
                    + "                   ) t \n"
                    + "					where rownum >= (?-1)*?+1 and rownum <= ?*? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                F1F2 f = new F1F2();
                f.setID(rs.getInt("ID"));
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

    public ArrayList<F1F2> listF1F2() {
        ArrayList<F1F2> f1f2 = new ArrayList<>();
        try {
            String sql = "select f.ID,a.ApartmentID,b.BuildID,b.Name,r.FullName,r.DateOfBirth,r.HomeTown,r.Phone\n"
                    + "					,QuarantineStartDate,NumberOfDaysQuarantine=DATEDIFF(DAY,f.QuarantineStartDate,GETDATE())\n"
                    + "                                       from F1F2Management f\n"
                    + "                                     inner join Resident r on r.ID=f.ID\n"
                    + "                                     inner join Apartment a on a.ApartmentID=r.ApartmentID\n"
                    + "                                       inner join Building b on b.BuildID=a.BuildID";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                F1F2 f = new F1F2();
                f.setID(rs.getInt("ID"));
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

    public void insertF1F2(F1F2 f1f2) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [F1F2Management]\n"
                    + "           ([ID]\n"
                    + "           ,[QuarantineStartDate])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, f1f2.getID());
            stm.setDate(2, f1f2.getQuarantineStartDate());
            stm.executeUpdate();
              String sql_update="Update Resident set IsF1F2=1 where ID=?";
            PreparedStatement stm_update=connection.prepareStatement(sql_update);
            stm_update.setInt(1, f1f2.getID());
            stm_update.executeUpdate();
            connection.commit();
            
        } catch (SQLException ex) {
            Logger.getLogger(F1F2DBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(F1F2DBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(F1F2DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
    }}

    public void update(F1F2 f1f2) {
        try {
            String sql = "UPDATE [F1F2Management]\n"
                    + "   SET \n"
                    + "     [QuarantineStartDate] = ?\n"
                    + " WHERE ID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, f1f2.getQuarantineStartDate());
            stm.setInt(2, f1f2.getID());
            stm.executeUpdate();
            
          
        } catch (SQLException ex) {
            Logger.getLogger(F1F2DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public F1F2 getF1F2ByID(int ID) {

        try {
            String sql = "select f.ID,a.ApartmentID,b.BuildID,b.Name,r.FullName,r.DateOfBirth,r.HomeTown,r.Phone\n"
                    + "					,QuarantineStartDate,NumberOfDaysQuarantine=DATEDIFF(DAY,f.QuarantineStartDate,GETDATE())\n"
                    + "                                       from F1F2Management f\n"
                    + "                                     inner join Resident r on r.ID=f.ID\n"
                    + "                                     inner join Apartment a on a.ApartmentID=r.ApartmentID\n"
                    + "                                       inner join Building b on b.BuildID=a.BuildID\n"
                    + "where f.ID=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                F1F2 f = new F1F2();
                f.setID(rs.getInt("ID"));
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
                f.setResident(r);
                f.setQuarantineStartDate(rs.getDate("QuarantineStartDate"));
                f.setNumberOfDays(rs.getInt("NumberOfDaysQuarantine"));
                return f;
            }
        } catch (SQLException ex) {
            Logger.getLogger(F1F2DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void delete(int id) {
        try {
            connection.setAutoCommit(false);
            String sql="Update Resident set IsF1F2=0 where ID=?";
           PreparedStatement stm=connection.prepareStatement(sql);
           stm.setInt(1, id);
           stm.executeUpdate();
            
            String sql_delete_f1f2 = "Delete from F1F2Management where ID=?";
            PreparedStatement stm_delete_f1f2 = connection.prepareStatement(sql_delete_f1f2);
            stm_delete_f1f2.setInt(1, id);
            stm_delete_f1f2.executeUpdate();
            
           
           
           connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(F1F2DBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(F1F2DBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(F1F2DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
    }}

    public ArrayList<F1F2> search(int id, int buildID, String apartmentID, String fullName, int phone, Boolean firstInjection, Boolean secondInjection, Date from) {
        ArrayList<F1F2> f1f2 = new ArrayList<>();
        try {

            String sql = "select f.ID,r.FullName,r.ApartmentID,b.BuildID,b.Name,r.Phone,v.[1 injection],v.[1injectionDate],v.[2 injection],v.[2injectionDate],f.QuarantineStartDate,DATEDIFF(DAY,f.QuarantineStartDate,GETDATE()) as NumberOfDaysQuarantine\n"
                    + "							  from F1F2Management f join Resident r on f.ID=r.ID\n"
                    + "							  join Vaccination v on v.ID=f.ID\n"
                    + "							  join Apartment a on a.ApartmentID=r.ApartmentID\n"
                    + "							  join Building b on a.BuildID=b.BuildID  \n"
                    + "							  where (1=1) \n";

            HashMap<Integer, Object[]> params = new HashMap<>();
            int paramIndex = 0;

            if (id != -1) {
                sql += "AND f.ID = ? ";
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
                sql += "AND r.[FullName] like '%' + ? + '%' ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = fullName;
                params.put(paramIndex, param);
            }
            if (phone != -1) {
                sql += "AND r.[Phone] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = phone;
                params.put(paramIndex, param);
            }
            if (firstInjection != null) {
                sql += "AND v.[1 injection] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getTypeName();
                param[1] = firstInjection;
                params.put(paramIndex, param);
            }
            if (secondInjection != null) {
                sql += "AND v.[2 injection] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getTypeName();
                param[1] = secondInjection;
                params.put(paramIndex, param);
            }
            if (from != null) {
                sql += "AND f.QuarantineStartDate >= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = from;
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
                F1F2 f = new F1F2();
                f.setID(rs.getInt("ID"));
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
                r.setPhone(rs.getInt("Phone"));
                Vaccination v = new Vaccination();
                v.setFirstInjection(rs.getBoolean("1 injection"));
                v.setFirstInjectionDate(rs.getDate("1injectionDate"));
                v.setSecondInjection(rs.getBoolean("2 injection"));
                v.setSecondInjectionDate(rs.getDate("2injectionDate"));
                r.setVaccine(v);
                f.setResident(r);
                f.setQuarantineStartDate(rs.getDate("QuarantineStartDate"));
                f.setNumberOfDays(rs.getInt("NumberOfDaysQuarantine"));
                f1f2.add(f);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f1f2;
    }

    public ArrayList<F1F2> searchWithPagging(int pageindex, int id, int buildID, String apartmentID, String fullName, int phone, Boolean firstInjection, Boolean secondInjection, Date from) {
        ArrayList<F1F2> f1f2 = new ArrayList<>();
        try {

            String sql = "select rownum=ROW_NUMBER() OVER (Order by a.[ApartmentID] ASC), f.ID,r.FullName,r.ApartmentID,b.BuildID,b.Name,r.Phone\n"
                    + "	,v.[1 injection],v.[1injectionDate],v.[2 injection],v.[2injectionDate],f.QuarantineStartDate,DATEDIFF(DAY,f.QuarantineStartDate,GETDATE()) as NumberOfDaysQuarantine\n"
                    + "	from F1F2Management f join Resident r on f.ID=r.ID\n"
                    + "	join Vaccination v on v.ID=f.ID\n"
                    + "	join Apartment a on a.ApartmentID=r.ApartmentID\n"
                    + "	join Building b on a.BuildID=b.BuildID  \n"
                    + "	where (1=1) ";

            HashMap<Integer, Object[]> params = new HashMap<>();
            int paramIndex = 0;

            if (id != -1) {
                sql += "AND f.ID = ? ";
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
                sql += "AND r.[ApartmentID] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = apartmentID;
                params.put(paramIndex, param);
            }

            if (fullName != null) {
                sql += "AND r.[FullName] like '%' + ? + '%' ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = fullName;
                params.put(paramIndex, param);
            }
            if (phone != -1) {
                sql += "AND r.[Phone] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = phone;
                params.put(paramIndex, param);
            }
            if (firstInjection != null) {
                sql += "AND v.[1 injection] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getTypeName();
                param[1] = firstInjection;
                params.put(paramIndex, param);
            }
            if (secondInjection != null) {
                sql += "AND v.[2 injection] = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getTypeName();
                param[1] = secondInjection;
                params.put(paramIndex, param);
            }
            if (from != null) {
                sql += "AND f.QuarantineStartDate >= ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Date.class.getTypeName();
                param[1] = from;
                params.put(paramIndex, param);
            }
            String results = "select rownum,ID,FullName,ApartmentID,BuildID,Name,Phone\n"
                    + "				,[1 injection],[1injectionDate],[2 injection],[2injectionDate],QuarantineStartDate\n"
                    + "				,NumberOfDaysQuarantine  \n"
                    + "				from"
                    + "(" + sql + ") t where rownum >= (?-1)*10+1 and rownum <= ?*10 ";
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
                F1F2 f = new F1F2();
                f.setID(rs.getInt("ID"));
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
                r.setPhone(rs.getInt("Phone"));
                Vaccination v = new Vaccination();
                v.setFirstInjection(rs.getBoolean("1 injection"));
                v.setFirstInjectionDate(rs.getDate("1injectionDate"));
                v.setSecondInjection(rs.getBoolean("2 injection"));
                v.setSecondInjectionDate(rs.getDate("2injectionDate"));
                r.setVaccine(v);
                f.setResident(r);
                f.setQuarantineStartDate(rs.getDate("QuarantineStartDate"));
                f.setNumberOfDays(rs.getInt("NumberOfDaysQuarantine"));
                f1f2.add(f);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ResidentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f1f2;
    }
}
