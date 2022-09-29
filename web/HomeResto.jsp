<%-- 
    Document   : HomeResto
    Created on : Nov 28, 2020, 4:25:28 AM
    Author     : gregoriusyuristama
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Resto.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="header.jsp" %>
<jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>

<div class="container">
    <h1>Selamat Datang, <jsp:getProperty name="resto" property="namaR"/></h1>
    <%
        byte[] data = resto.getFotoKTP().getBytes(1, (int) resto.getFotoKTP().length());
        String encode = Base64.getEncoder().encodeToString(data);
        request.setAttribute("imgBase", encode);
    %>
    <img src="data:image/jpeg;base64,${imgBase}" alt="foto resto" width="300" height="300"/>
    <br>
    <a href="editResto.jsp">Edit Resto</a>
    <br>
    <a href="editMeja.jsp">Edit Meja</a>
    <br>
    <a href="LihatReservasiServlet">Lihat Reservasi</a>
    <br>
    <a href="LihatTransaksiServlet">Lihat Transaksi</a>
    <br>
    <a href="EditJamReservasi.jsp">Edit Jam Reservasi</a>
    <br>
    <br>
    <div style="text-align: left"><a href="LogoutServlet">Logout</a></div>
</div>
<%@include file="footer.jsp" %>

