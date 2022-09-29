package usd.project.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import usd.project.dao.MejaDao;
import usd.project.db.DbConnection;
import usd.project.logic.PhotoUtil;
import usd.project.logic.PhotoUtilService;
import usd.project.model.DaftarMeja;
import usd.project.model.MejaBean;

@MultipartConfig(maxFileSize = 16177215)
public class editMejaServlet extends HttpServlet {

    private static final int BUFFER_SIZE = 4096;

    protected void ambilFoto(Part inputPart, HttpServletRequest request, PreparedStatement pstmt, String namaParameter,
            int idx) throws IOException, ServletException, SQLException {
        InputStream inputStream = null;
        if (inputPart != null) {

            // obtains input stream of the upload file inputStream =
            inputStream = inputPart.getInputStream();
            if (request.getPart(namaParameter) != null) {
                pstmt.setBlob(idx, inputStream);
            }
        }

    }

    protected void updateFoto(Part inputPart, HttpServletRequest request, PreparedStatement pstmt, String namaParameter,
            int idx, String idResto, String namaMeja) throws IOException, ServletException, SQLException, ClassNotFoundException {
        InputStream inputStream = null;
        if (inputPart.getSize() != 0) {

            // obtains input stream of the upload file inputStream =
            inputStream = inputPart.getInputStream();
            if (request.getPart(namaParameter) != null) {
                pstmt.setBlob(idx, inputStream);
            }
        } else {
            Connection conn = null;
            ResultSet rs = null;
            Statement st = null;
            String sql = "select fotoM from meja where meja.idResto='" + idResto + "' and meja.namaM='" + namaMeja + "'";
            try {
                DbConnection dbConn = new DbConnection();
                conn = dbConn.getConnection();
                st = conn.createStatement();

                rs = st.executeQuery(sql);
                rs.next();
                pstmt.setBlob(idx, rs.getBlob(1));
            } catch (ClassNotFoundException | SQLException e) {
                System.out.println(st.toString());
            }
        }

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
       String[] TnamaM = request.getParameterValues("TnamaM");
        String[] TdeskM = request.getParameterValues("TdeskripsiM");
        String[] TjumlahM = request.getParameterValues("TjumlahM");
        String[] ThargaM = request.getParameterValues("ThargaM");
        String[] data = request.getParameterValues("namaMlama");

        //Untuk input data baru
        String idResto = request.getParameter("idResto");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if ("Update".equals(request.getParameter("submit"))) {
                HttpSession session = request.getSession();
                DaftarMeja dMeja = (DaftarMeja) session.getAttribute("daftarMeja");
                LinkedList<MejaBean> dMejaBaru = new LinkedList();
                PhotoUtilService ambilfoto = new PhotoUtil();
                for (int i = 0; i < TnamaM.length; i++) {
                    MejaBean meja = dMeja.getDaftarMeja().get(i);
                    meja.setNamaM(TnamaM[i]);
                    meja.setDeskripsiM(TdeskM[i]);
                    meja.setJumlahM(Integer.parseInt(TjumlahM[i]));
                    meja.setHargaM(Integer.parseInt(ThargaM[i]));
                    if (request.getPart("TfotoM" + i).getSize() != 0) {
                        meja.setFotoM(ambilfoto.ambilFoto(request.getPart("TfotoM" + i)));
                    }
                    dMejaBaru.add(meja);
                }
                dMeja.setDaftarMeja(dMejaBaru);
                MejaDao mDao = new MejaDao();
                int result = mDao.editBatch(dMeja, idResto, data);
                String forwardJsp = "";
                if (result > 0) {
                    forwardJsp = "/homeResto_1.jsp";
                } else {
                    forwardJsp = "/homeResto_1.jsp";
                }
                RequestDispatcher rd = request.getRequestDispatcher(forwardJsp);
                rd.forward(request, response);
            }
            if ("Tambahkan".equals(request.getParameter("submit"))) {
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
            Logger.getLogger(editMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editMejaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
