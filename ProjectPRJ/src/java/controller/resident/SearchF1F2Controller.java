/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.resident;

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
public class SearchF1F2Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_page = request.getParameter("page");
        if (raw_page == null || raw_page.length() == 0) {
            raw_page = "1";
        }
        int page = Integer.parseInt(raw_page);
        
         ApartmentDBContext adb = new ApartmentDBContext();
        BuildingDBContext bdb = new BuildingDBContext();
        ArrayList<Apartment> aparts = adb.getAparts();
        ArrayList<Building> buildings = bdb.getBuildings();

        String raw_id = request.getParameter("id");
        String raw_buildID = request.getParameter("buildID");
        String raw_apartmentID = request.getParameter("apartmentID");
        String raw_name = request.getParameter("name");
        String raw_from = request.getParameter("from");          
        String raw_phone = request.getParameter("phone");
        String raw_firstInjection = request.getParameter("firstInjection");
        String raw_secondInjection = request.getParameter("secondInjection");

        if (raw_id == null || raw_id.length() == 0) {
            raw_id = "-1";
        }
        if (raw_buildID == null || raw_buildID.length() == 0) {
            raw_buildID = "-1";
        }
        if (raw_phone == null || raw_phone.length() == 0) {
            raw_phone = "-1";
        }
        if (raw_apartmentID == null || raw_apartmentID.length() == 0) {
            raw_apartmentID = "";
        }

        if (raw_firstInjection == null || raw_firstInjection.length() == 0) {
            raw_firstInjection = "all";
        }
        if (raw_secondInjection == null || raw_secondInjection.length() == 0) {
            raw_secondInjection = "all";
        }
        int id;
        int phone;
        int buildID;
        try {
            id = Integer.parseInt(raw_id);
            phone = Integer.parseInt(raw_phone);
            buildID = Integer.parseInt(raw_buildID);
        } catch (NumberFormatException e) {
            response.getWriter().println("Input invalid  !");
            return;
        }

        Date from = (raw_from != null && raw_from.length() > 0) ? Date.valueOf(raw_from) : null;       
        Boolean firstInjection = (!raw_firstInjection.equals("all")) ? raw_firstInjection.equals("Yes") : null;
        Boolean secondInjection = (!raw_secondInjection.equals("all")) ? raw_secondInjection.equals("Yes") : null;

       
        F1F2DBContext fdb=new F1F2DBContext();
        ArrayList<F1F2> f1f2 = fdb.search(id, buildID, raw_apartmentID, raw_name, phone, firstInjection, secondInjection, from);
        
         
        if (f1f2.isEmpty()) {
            response.getWriter().println("Not found resident !");
            return;
        }
        ArrayList<F1F2> results=fdb.searchWithPagging(page, id, buildID, raw_apartmentID, raw_name, phone, firstInjection, secondInjection, from);
        int count=f1f2.size();
        int totalpage = (count % 10 == 0) ? count / 10 : (count / 10) + 1;
        
       request.setAttribute("totalpage", totalpage);
        request.setAttribute("pageindex", page);
        request.setAttribute("results", results);
        request.setAttribute("aparts", aparts);
        request.setAttribute("buildings", buildings);

        request.setAttribute("id", id == -1 ? "" : id);
        request.setAttribute("phone", phone == -1 ? "" : phone);
        request.setAttribute("buildID", buildID);
        request.setAttribute("apartmentID", raw_apartmentID);
        request.setAttribute("fullName", raw_name);        
        request.setAttribute("from", raw_from == null ? "" : raw_from);      
        request.setAttribute("firstInjection", raw_firstInjection);
        request.setAttribute("secondInjection", raw_secondInjection);
        
        request.getRequestDispatcher("../view/search/searchf1f2.jsp").forward(request, response);
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
