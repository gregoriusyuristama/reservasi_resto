/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package usd.project.controller;

import usd.project.dao.LoginRestoDao;
import usd.project.model.LoginBean;
import usd.project.model.RestoranBean;
import usd.project.logic.Lookup;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import usd.project.dao.RestoDao;
import usd.project.logic.LookupService;

/**
 *
 * @author gregoriusyuristama
 */
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LoginRestoDao loginDao;

    @Override
    public void init() {
        loginDao = new LoginRestoDao();
    }

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("idResto");
        String password = request.getParameter("password");
        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);
        String value = request.getParameter("remember");

        try {
            if (loginDao.validate(loginBean)) {
                HttpSession session = request.getSession();
                synchronized (session) {
                    boolean rememberMe = false;
                    if (value != null && value.equalsIgnoreCase("on")) {
                        rememberMe = true;
                    }
                    if (rememberMe) {           //If your checkbox value is true
                        Cookie cookieUsername = new Cookie("cookieLoginUserResto", username);
                        Cookie cookiePassword = new Cookie("cookieLoginPasswordResto", password);
                        cookieUsername.setMaxAge(60 * 60 * 24 * 365);
                        cookiePassword.setMaxAge(60 * 60 * 24 * 365);
                        response.addCookie(cookieUsername);
                        response.addCookie(cookiePassword);
                        System.out.println(cookiePassword);
                        System.out.println(cookieUsername);
                    }
                    LookupService service = new Lookup();
                    RestoDao rDao = new RestoDao();
                    RestoranBean resto = rDao.getResto(username);
                    session.setAttribute("resto", resto);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/homeResto_1.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                response.sendRedirect("./LoginResto.jsp");
            }
        } catch (ClassNotFoundException e) {
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
