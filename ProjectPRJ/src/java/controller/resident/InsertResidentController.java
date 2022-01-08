/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.resident;

import controller.authentication.BaseRequiredAuthenController;
import dal.ApartmentDBContext;
import dal.ResidentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Apartment;
import model.Resident;
import model.Vaccination;

/**
 *
 * @author Tung
 */
public class InsertResidentController extends BaseRequiredAuthenController {

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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApartmentDBContext db = new ApartmentDBContext();
        ArrayList<Apartment> aparts = db.getAparts();
        request.setAttribute("aparts", aparts);
        request.getRequestDispatcher("../view/insert/insertresident.jsp").forward(request, response);
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResidentDBContext db = new ResidentDBContext();
        String id = request.getParameter("id");
        int residentID ;
        try {
            residentID = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            response.getWriter().println("ID invalid !");
            return;
        }

        String apartmentID = request.getParameter("apartmentID");
        Apartment a = new Apartment();
        a.setApartmentID(apartmentID);
        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String homeTown = request.getParameter("homeTown");
        String phone = request.getParameter("phone");
        if (dob.isEmpty() || homeTown.isEmpty() || fullName.isEmpty()) {
            response.getWriter().println("You must input all the information !");
            return;
        }
        
        int phonenumber;
        try {
            phonenumber = Integer.parseInt(phone);
        } catch (NumberFormatException e) {
            response.getWriter().println("Phone number invalid !");
            return;
        }

        for (Resident r : db.getResidents()) {
            if (residentID == r.getID()) {
                response.getWriter().println("ID exists !");
                return;
            }
        }

        String firstInjection = request.getParameter("firstInjection");
        String firstInjectionDate = request.getParameter("1stDate");
        String secondInjection = request.getParameter("secondInjection");
        String secondInjectionDate = request.getParameter("2ndDate");
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

        Resident r = new Resident(residentID, a, fullName, Date.valueOf(dob), homeTown, phonenumber, v);

        db.insertResident(r);
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
