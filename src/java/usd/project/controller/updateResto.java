package usd.project.controller;

import java.io.IOException;
import java.sql.SQLException;
import usd.project.model.RestoranBean;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import usd.project.dao.RestoDao;
import usd.project.logic.PhotoUtil;
import usd.project.logic.PhotoUtilService;

@WebServlet(name = "updateResto", urlPatterns = {"/updateResto"})
@MultipartConfig(maxFileSize = 16177215)
public class updateResto extends HttpServlet {

    private static final int BUFFER_SIZE = 4096;
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, ClassNotFoundException, IOException, SQLException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        RestoranBean resto = (RestoranBean) session.getAttribute("resto");
        PhotoUtilService ambilfoto = new PhotoUtil();
        RestoDao rDao = new RestoDao();

        resto.setNamaR(request.getParameter("namaR"));
        resto.setEmailR(request.getParameter("emailR"));
        resto.setNoTelp(request.getParameter("noTelpR"));
        resto.setAlamatR(request.getParameter("alamatR"));
        resto.setDeskripsiR(request.getParameter("deskripsiR"));
        resto.setNamaBank(request.getParameter("namaBank"));
        resto.setNoRek(request.getParameter("noRek"));
        
        String jamBuka = request.getParameter("jamBuka");
        String jamTutup = request.getParameter("jamTutup");
        
        String[] jamBukaArr = jamBuka.split(":");
        String jamBukaFormatted = jamBukaArr[0] + ":" + jamBukaArr[1];
        String[] jamTutupArr = jamTutup.split(":");
        String jamTutupFormatted = jamTutupArr[0] + ":" + jamTutupArr[1];
        
        resto.setJamBuka(jamBukaFormatted);
        resto.setJamTutup(jamTutupFormatted);
        
        if (request.getPart("foto1").getSize() != 0) {
            resto.setFoto1(ambilfoto.ambilFoto(request.getPart("foto1")));
        }
        if (request.getPart("foto2").getSize() != 0) {
            resto.setFoto2(ambilfoto.ambilFoto(request.getPart("foto2")));
        }
        if (request.getPart("foto3").getSize() != 0) {
            resto.setFoto3(ambilfoto.ambilFoto(request.getPart("foto3")));
        }
        if (request.getPart("foto4").getSize() != 0) {
            resto.setFoto4(ambilfoto.ambilFoto(request.getPart("foto4")));
        }
        if (request.getPart("foto5").getSize() != 0) {
            resto.setFoto5(ambilfoto.ambilFoto(request.getPart("foto5")));
        }

        int result = rDao.update(resto);
        String forwardJsp = "";
        if (result > 0) {
            forwardJsp = "/homeResto_1.jsp";
        } else {
            forwardJsp = "/homeResto_1.jsp";
        }

        RequestDispatcher rd = request.getRequestDispatcher(forwardJsp);
        rd.forward(request, response);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updateResto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(updateResto.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updateResto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(updateResto.class.getName()).log(Level.SEVERE, null, ex);
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
