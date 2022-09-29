/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package usd.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import usd.project.dao.JadwalMejaDao;
import usd.project.model.RestoranBean;

/**
 *
 * @author gregoriusyuristama
 */
public class JadwalMejaServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            HttpSession session = request.getSession();
            String[] range = request.getParameter("range").split(" ", 2);
            synchronized (session) {
                RestoranBean resto = (RestoranBean) session.getAttribute("resto");

                JadwalMejaDao jDao = new JadwalMejaDao();
                int delete = jDao.deleteJadwal(resto.getIdResto());
                
                String[] strjamBuka = resto.getJamBuka().split(":", 2);
                String[] strjamTutup = resto.getJamTutup().split(":", 2);
                LinkedList<String> jadwalMeja = new LinkedList();
                for (int i = 0; i < (Integer.parseInt(strjamTutup[0]) - Integer.parseInt(strjamBuka[0]));
                        i += Integer.parseInt(range[0])) {
                    String jam = (Integer.parseInt(strjamBuka[0]) + i) + ":" + strjamBuka[1];
                    jadwalMeja.addLast(jam);
                }
                int result = jDao.insertJadwal(jadwalMeja, resto, Integer.parseInt(range[0]));
                String forwardJsp = "";
                if (result > 0) {
                    forwardJsp = "/LihatJadwalServlet";
                } else {
                    forwardJsp = "/homeResto_1.jsp";
                }
                RequestDispatcher rd = request.getRequestDispatcher(forwardJsp);
                rd.forward(request, response);
            }
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
            Logger.getLogger(JadwalMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(JadwalMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(JadwalMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(JadwalMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
