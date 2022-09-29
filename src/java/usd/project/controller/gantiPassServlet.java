package usd.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import usd.project.dao.RestoDao;
import usd.project.model.RestoranBean;

public class gantiPassServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        HttpSession session = request.getSession();
        RestoranBean resto = (RestoranBean) session.getAttribute("resto");
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String confPass = request.getParameter("confPass");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            if (newPass == resto.getPasswordR() || confPass == resto.getPasswordR()) {
                out.println("<h1>pass sama</h1>");
                response.sendRedirect(request.getContextPath() + "/homeResto_1.jsp");
            } else if (newPass == confPass && newPass!=resto.getPasswordR()) {
                RestoDao rDao = new RestoDao();
                int result = rDao.updatePass(resto.getIdResto(), newPass);
                if (result > 0) {
                    response.sendRedirect(request.getContextPath() + "/homeResto_1.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/homeResto_1.jsp");
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(gantiPassServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(gantiPassServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(gantiPassServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(gantiPassServlet.class.getName()).log(Level.SEVERE, null, ex);
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
