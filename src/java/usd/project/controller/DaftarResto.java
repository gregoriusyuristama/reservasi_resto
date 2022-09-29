/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package usd.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static usd.project.controller.DaftarRestoPart2.resto;
import usd.project.dao.RestoDao;
import usd.project.logic.PhotoUtil;
import usd.project.model.RestoranBean;
import usd.project.logic.PhotoUtilService;

/**
 *
 * @author gregoriusyuristama
 */
@MultipartConfig(maxFileSize = 16177215)
public class DaftarResto extends HttpServlet {
    
    private static final int BUFFER_SIZE = 4096;
    // database connection settings

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param inputPart
     * @param response servlet response
     * @return
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            RestoranBean resto = new RestoranBean();
            PhotoUtilService ambilfoto = new PhotoUtil();
            resto.setIdResto(request.getParameter("idResto"));
            resto.setNamaR(request.getParameter("namaR"));
            resto.setNoTelp(request.getParameter("noTelpR"));
            resto.setAlamatR(request.getParameter("alamatR"));
            resto.setDeskripsiR(request.getParameter("deskripsiR"));
            resto.setNamaPemilik(request.getParameter("namaPemilik"));
            resto.setKTP(request.getParameter("KTP"));
            resto.setNamaBank(request.getParameter("namaBank"));
            resto.setNoRek(request.getParameter("noRek"));
            resto.setJamBuka(request.getParameter("jamBuka"));
            resto.setJamTutup(request.getParameter("jamTutup"));
            resto.setFotoKTP(ambilfoto.ambilFoto(request.getPart("fotoKTP")));
            resto.setFoto1(ambilfoto.ambilFoto(request.getPart("foto1")));
            resto.setFoto2(ambilfoto.ambilFoto(request.getPart("foto2")));
            resto.setFoto3(ambilfoto.ambilFoto(request.getPart("foto3")));
            resto.setFoto4(ambilfoto.ambilFoto(request.getPart("foto4")));
            resto.setFoto5(ambilfoto.ambilFoto(request.getPart("foto5")));
            resto.getEmailR();
            resto.getPasswordR();
            RestoDao rDao = new RestoDao();
            int result = rDao.insert(resto);
            
            String forwardJsp = "";
            if (result > 0) {
                forwardJsp = "/LoginResto.jsp";
            } else {
                forwardJsp = "/LoginResto.jsp";
            }

            RequestDispatcher rd = request.getRequestDispatcher(forwardJsp);
            rd.forward(request, response);
        } catch (Exception e) {
            out.println(e);
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
        } catch (ParseException ex) {
            Logger.getLogger(DaftarResto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaftarResto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaftarResto.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(DaftarResto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DaftarResto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaftarResto.class.getName()).log(Level.SEVERE, null, ex);
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
