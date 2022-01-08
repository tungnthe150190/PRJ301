/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.authentication;

import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Group;

/**
 *
 * @author Tung
 */
public class CreateAccountController extends HttpServlet {

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
        AccountDBContext db=new AccountDBContext();
        ArrayList<Group> groups = db.getGroups();
        request.setAttribute("groups", groups);
        request.getRequestDispatcher("view/auth/createaccount.jsp").forward(request, response);
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
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String re_password=request.getParameter("repassword");
        String displayname=request.getParameter("displayname");
        if(username.isEmpty() || password.isEmpty() || displayname.isEmpty()){
            response.getWriter().println("Username,password or displayname invalid !");
            return;
        }
        if(!password.equals(re_password)){
            response.getWriter().println("Re-password does not match password !");
            return;
        }
        AccountDBContext db=new AccountDBContext();
        ArrayList<Account> accounts = db.getAccounts();
        for (Account a : accounts) {
            if(a.getUsername().equals(username)){
                response.getWriter().println("Account exists !");
            return;
            }
        }
        String inputgid=request.getParameter("gid");              
        int gid=Integer.parseInt(inputgid);
        db.creatAccount(username, password, displayname, gid);
        response.sendRedirect("login");
        
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
