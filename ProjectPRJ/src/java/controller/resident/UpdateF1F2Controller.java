/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.resident;

import controller.authentication.BaseRequiredAuthenController;
import dal.ApartmentDBContext;
import dal.BuildingDBContext;
import dal.F1F2DBContext;
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
import model.Building;
import model.F1F2;
import model.Resident;

/**
 *
 * @author Tung
 */
public class UpdateF1F2Controller extends BaseRequiredAuthenController {

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
        F1F2DBContext fdb=new F1F2DBContext();
        F1F2 f1f2 = fdb.getF1F2ByID(residentID);
        request.setAttribute("f1f2", f1f2);
        request.getRequestDispatcher("../view/list/updatef1f2.jsp").forward(request, response);
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
       F1F2DBContext fdb=new F1F2DBContext();
       F1F2 f1f2=new F1F2();
       String id = request.getParameter("id");
        int residentID ;
        try {
            residentID = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            response.getWriter().println("ID invalid !");
            return;
        }
        f1f2.setID(residentID);
        String quarantineStartDate=request.getParameter("quarantineStartDate");
        if(quarantineStartDate.isEmpty()){
            response.getWriter().println("You must input quarantine start date !");
            return;
        }else{
             f1f2.setQuarantineStartDate(Date.valueOf(quarantineStartDate));
            }
        fdb.update(f1f2);
        response.sendRedirect("listF1F2");
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
