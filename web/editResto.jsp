
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="header.jsp" %>
<jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
<div class="container">
    <form action="./updateResto" method = "post" enctype="multipart/form-data" name="updateRestoForm" id="updateRestoForm">
        <h2> PROFIL RESTO </h2>
        <table>
            <tr>
                <td>Nama Resto : </td><td><input type ="text" name="namaR" 
                                                 value ="<jsp:getProperty name="resto" property="namaR"/>" readonly/></td>
            </tr>
            <tr>
                <td>E-mail : </td><td><input type ="text" name="emailR" 
                                             value ='<jsp:getProperty name="resto" property="emailR"/>' /></td>
            </tr>
            <tr>
                <td>Nomor Telepon : </td><td><input type ="text" name="noTelpR" 
                                                    value ='<jsp:getProperty name="resto" property="noTelp"/>' /></td>
            </tr>
            <tr>
                <td>Alamat: </td><td><input type ="text" name="alamatR" 
                                            value ='<jsp:getProperty name="resto" property="alamatR"/>' /></td>
            </tr>
            <tr>
                <td>Deskripsi : </td><td><textarea id="deskripsiR" name="deskripsiR" form="updateRestoForm"><jsp:getProperty name="resto" property="deskripsiR"/></textarea></td>
            </tr>
            <tr>
                <td>Bank : </td><td><input type ="text" name="namaBank" 
                                           value ='<jsp:getProperty name="resto" property="namaBank"/>' /></td>
            </tr>
            <tr>
                <td>Nomor Rekening : </td><td><input type ="text" name="noRek" 
                                                     value ='<jsp:getProperty name="resto" property="noRek"/>' /></td>
            </tr>
            <%
                String[] jamBuka = resto.getJamBuka().split(":", 2);
                String jamBukaFormatted = jamBuka[0] + ":" + jamBuka[1] + ":00";
                String[] jamTutup = resto.getJamTutup().split(":", 2);
                String jamTutupFormatted = jamTutup[0] + ":" + jamTutup[1] + ":00";
            %>
            <tr>
                <td>Jam Buka : </td><td><input type ="time" name="jamBuka" 
                                               value ='<%=jamBukaFormatted%>' /></td>
            </tr>
            <tr>
                <td>Jam Tutup : </td><td><input type ="time" name="jamTutup" 
                                                value ='<%=jamTutupFormatted%>' /></td>
            </tr>
            <tr>
                <td>Foto : </td><td>
                    <input type="file" name="foto1" accept="image/*" size="50"/> 
                    <input type="file" name="foto2" accept="image/*" size="50"/>
                    <input type="file" name="foto3" accept="image/*" size="50"/>
                    <input type="file" name="foto4" accept="image/*" size="50"/>
                </td>
            </tr>
            <tr>
                <td>Logo : </td>
                <td>
                    <input type="file" name="foto5" accept="image/*" size="50"/>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="gantiPassword.jsp">Ganti Password</a>
                </td>
            </tr>
            <tr><td><input type='hidden' name='idResto' value='<jsp:getProperty name="resto" property="idResto"/>'/>
                    <input type ="submit" name ="Update" value ="Update"/>
                </td><td></td></tr>

        </table>
    </form>
    <a href="./HomeResto.jsp">Home</a>
</div>
<%@include file="footer.jsp" %>

