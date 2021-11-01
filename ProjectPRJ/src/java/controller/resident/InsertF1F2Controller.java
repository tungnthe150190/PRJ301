/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.resident;

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
import model.F1F2;
import model.Resident;

/**
 *
 * @author Tung
 */
public class InsertF1F2Controller extends HttpServlet {

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
        ResidentDBContext rdb = new ResidentDBContext();
        F1F2DBContext fdb = new F1F2DBContext();
        ArrayList<F1F2> listF1F2 = fdb.listF1F2();
        ArrayList<Resident> residents = rdb.getResidents();
        request.setAttribute("residents", residents);
        request.setAttribute("listF1F2", listF1F2);
        request.getRequestDispatcher("../view/insert/insertf1f2.jsp").forward(request, response);
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
        String ID = request.getParameter("ID");
        request.setAttribute("ID", ID);
        ResidentDBContext rdb = new ResidentDBContext();
        F1F2DBContext fdb=new F1F2DBContext();
        ArrayList<F1F2> listF1F2 = fdb.listF1F2();
        ArrayList<Resident> residents = rdb.getResidents();
        boolean isExists = false;
        for (Resident r : residents) {
            if (r.getID() == Integer.parseInt(ID)) {
                isExists = true;
            }
        }
        if (isExists == false) {
            response.getWriter().println("Not Found Resident !");
            return;
        }
        boolean isF1F2Exists=false;
        for (F1F2 list : listF1F2) {
            if(list.getID()== Integer.parseInt(ID)){
                isF1F2Exists = true;
            }
        }
        if(isF1F2Exists){
            response.getWriter().println("F1/F2 is exsist !");
            return;
        }
        String quarantineDate = request.getParameter("quarantineDate");   
        F1F2 f=new F1F2();
        if (quarantineDate.isEmpty()) {
            response.getWriter().println("Please Input Quarantine Start Date !");
            return;
        } else{
         f=new F1F2(Integer.parseInt(ID), Date.valueOf(quarantineDate));
        }
        
        fdb.insertF1F2(f);
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
