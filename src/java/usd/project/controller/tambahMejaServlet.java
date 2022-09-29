package usd.project.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import usd.project.dao.MejaDao;
import usd.project.logic.PhotoUtil;
import usd.project.logic.PhotoUtilService;
import usd.project.model.MejaBean;

public class tambahMejaServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        MejaBean meja = new MejaBean();
        PhotoUtilService ambilfoto = new PhotoUtil();
        meja.setIdResto(request.getParameter("idResto"));
        meja.setNamaM(request.getParameter("namaM"));
        meja.setJumlahM(Integer.parseInt(request.getParameter("jumlahM")));
        meja.setDeskripsiM(request.getParameter("deskripsiM"));
        meja.setHargaM(Integer.parseInt(request.getParameter("hargaM")));
        meja.setFotoM(ambilfoto.ambilFoto(request.getPart("fotoM")));

        MejaDao mDao = new MejaDao();
        int result = mDao.insert(meja);

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
        } catch (SQLException ex) {
            Logger.getLogger(tambahMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(tambahMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(tambahMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(tambahMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
    


