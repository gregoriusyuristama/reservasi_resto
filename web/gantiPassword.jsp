
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Ganti Kata Sandi</title>
        <%@ include file="incFileHead.jsp" %>
    </head>
    <body>
        <jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
        <div class="wrapper">
            <%@ include file="sidebar.jsp" %>
            <div class="main-panel">
                <%@ include file="navigationBar.jsp" %>
                <div class="content">
                    <h3>Ganti Password</h3>
                    <form action="./gantiPassServlet" method = "post">
                        <table>
                            <tr><td>Password Lama</td><td><input type ="password" name="oldPass" 
                                                                 value ="" /></td></tr>

                            <tr><td>Password Baru</td><td><input type ="password" name="newPass" 
                                                                 value ="" /></td></tr>
                            <tr><td>Konfirmasi Password Baru</td><td><input type ="password" name="confPass" 
                                                                            value =""/></td></tr>
                           
                            <tr><td></td><td><input class="btn btn-primary" style="float: right" type ="submit" name ="submit" value ="Ganti"/>
                                </td><td></td></tr>

                        </table>
                        <input type='hidden' name='idResto' value='<jsp:getProperty name="resto" property="idResto"/>'/>
                    </form>
                    <a href="./homeResto_1.jsp">Home</a>
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
    <%@ include file="incFile.jsp" %>
</html>


