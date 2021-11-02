/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.resident;

import dal.ApartmentDBContext;
import dal.BuildingDBContext;
import dal.ResidentDBContext;
import dal.VaccinationDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Apartment;
import model.Building;
import model.Resident;
import model.Vaccination;

/**
 *
 * @author Tung
 */
public class UpdateResidentController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApartmentDBContext adb = new ApartmentDBContext();
        ArrayList<Apartment> aparts = adb.getAparts();
        request.setAttribute("aparts", aparts);
        BuildingDBContext bdb=new BuildingDBContext();
        ArrayList<Building> buildings = bdb.getBuildings();
        request.setAttribute("buildings", buildings);
       
        String id = request.getParameter("id");
        int residentID ;
        try {
            residentID = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            response.getWriter().println("ID invalid !");
            return;
        }
        ResidentDBContext rdb=new ResidentDBContext();
        Resident resident = rdb.getResidentbyID(residentID);
        request.setAttribute("resident", resident);
        
        request.getRequestDispatcher("../view/list/updateresident.jsp").forward(request, response);
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResidentDBContext rdb=new ResidentDBContext();
        Resident r=new Resident();
        String id = request.getParameter("id");
        int residentID ;
        try {
            residentID = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            response.getWriter().println("ID invalid !");
            return;
        }
//        for (Resident resident : rdb.getResidents()) {
//            if (residentID == resident.getID()) {
//                response.getWriter().println("ID exists !");
//                return;
//            }
//        }
        r.setID(residentID);
        String apartmentID = request.getParameter("apartmentID");
        Apartment a = new Apartment();
        a.setApartmentID(apartmentID);
        r.setApartment(a);
        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String homeTown = request.getParameter("homeTown");
        
        if (dob.isEmpty() || homeTown.isEmpty() || fullName.isEmpty() ) {
            response.getWriter().println("You must input all the information !");
            return;
        }
        r.setFullName(fullName);
        r.setDob(Date.valueOf(dob));
        r.setHomeTown(homeTown);
        String phone = request.getParameter("phone");
        int phonenumber;
        try {
            phonenumber = Integer.parseInt(phone);
        } catch (NumberFormatException e) {
            response.getWriter().println("Phone number invalid !");
            return;
        }
        r.setPhone(phonenumber);
        
        String firstInjection = request.getParameter("firstInjection");
        String firstInjectionDate = request.getParameter("1stDate");
        String secondInjection = request.getParameter("secondInjection");
        String secondInjectionDate = request.getParameter("2ndDate");
        if(firstInjection.isEmpty() || secondInjection.isEmpty()){
            response.getWriter().println("You must input vaccinated infomation !");
            return;
        }
        Vaccination v = new Vaccination();
        if (firstInjection.equals("Yes") && !secondInjection.equals("Yes")) {
            if (firstInjectionDate.isEmpty() || !secondInjectionDate.isEmpty()) {
                response.getWriter().println("Please input correct vaccination information!");
                return;
            } else {
                v = new Vaccination(residentID, true, Date.valueOf(firstInjectionDate), false, null);
            }
        } else if (!firstInjection.equals("Yes") && !secondInjection.equals("Yes")) {
            if (!firstInjectionDate.isEmpty() || !secondInjectionDate.isEmpty()) {
                response.getWriter().println("Please input correct vaccination information!");
                return;
            } else {
                v = new Vaccination(residentID, false, null, false, null);
            }
        } else {
            if (firstInjectionDate.isEmpty() || secondInjectionDate.isEmpty()) {
                response.getWriter().println("Please input date injection!");
                return;
            } else {
                v = new Vaccination(residentID, true, Date.valueOf(firstInjectionDate), true, Date.valueOf(secondInjectionDate));
            }
        }
        r.setVaccine(v);
        rdb.update(r);
        response.sendRedirect("listresident");
        
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
