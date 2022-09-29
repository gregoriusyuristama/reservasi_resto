<%-- 
    Document   : EditJamReservasi
    Created on : Dec 5, 2020, 7:54:43 PM
    Author     : Asus
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>



<jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
<jsp:useBean id="jadwal" class="usd.project.model.JadwalRestoBean" scope="request"/>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Jam Reservasi</title>

        <%@ include file="incFileHead.jsp" %>
    </head>

    <body>
        <div class="wrapper">
            <%@ include file="sidebar.jsp" %>
            <div class="main-panel">
                <%@ include file="navigationBar.jsp" %>
                <div class="content">
                    <h1>Jam Reservasi</h1>
                    <h3>Pilih range waktu</h3>
                    <form  method="post" action="./JadwalMejaServlet" >
                        <table>
                            <tr>
                                <td>Jam buka : ${resto.jamBuka}</td>
                                <td>Jam tutup : ${resto.jamTutup}</td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="range">Pilih range waktu </label>
                                    <select name="range" id="range">
                                        <option value="1 jam">1 Jam</option>
                                        <option value="2 Jam">2 Jam</option>
                                        <option value="3 Jam">3 Jam</option>
                                    </select>
                                </td>
                            </tr>

                            <%for (int i = 0; i < jadwal.getJamMeja().size(); i++) {
                            %>
                            <tr>
                                <td><%=jadwal.getJamMeja().get(i)%></td>
                            </tr>
                            <%
                                }
                            %>

                            <tr> <td><input type ="submit" name ="Apply" value ="Apply"/></td></tr>
                        </table>

                    </form>
                </div>
                <%@ include file="footer_1.jsp" %>
            </div>
        </div>
    </body>
    <%@ include file="incFile.jsp" %>
</html>

