<%@page import="usd.project.model.DaftarInvoice"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Resto.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>

<jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
<jsp:useBean id="daftarInvoice" class="usd.project.model.DaftarInvoice" scope="request"/>
<jsp:useBean id="daftarPengunjung" class="usd.project.model.ListPengunjung" scope="request"/>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Jadwal Reservasi</title>

        <%@ include file="../../incFileHead.jsp" %>
    </head>
    <body>
        <%
            DaftarInvoice listInv = daftarInvoice;
        %>
        <div class="wrapper">
            <%@ include file="../../sidebar.jsp" %>

            <div class="main-panel">
                <%@ include file="../../navigationBar.jsp" %>

                <div class="content">
                    <form action="reservasi.jsp">
                        <select name="filter">
                            <option value="invoice.idInvoice">No Transaksi</option>
                            <option value="pengunjung.namaP">Nama Pengunjung</option>
                            <option value="buktiinvoice.namaM">Nama Meja</option>
                        </select>
                        <button type="submit" name="tombol" value="search">Search</button>
                    </form>
                    <br>
                    <input type="text" id="myInput" placeholder="Search" 
                           onkeyup="myFunction()" title="Type in a name">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-plain">
                                    <div class="header">
                                        <h4 class="title">Jadwal Reservasi</h4>
                                        <p class="category">Jadwal yang tersimpan</p>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover">
                                            <thead>
                                            <th>No</th>
                                            <th>No. Transaksi</th>
                                            <th>Nama Pemesan</th>
                                            <th>Tanggal Pesanan</th>
                                            <th>Status</th>
                                            </thead>
                                            <tbody>
                                                <%                                                    for (int i = 0; i < daftarInvoice.getInvoice().size(); i++) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <%=i + 1%>
                                                    </td>
                                                    <td>
                                                        <%=daftarInvoice.getInvoice().get(i).getIdInvoice()%>
                                                    </td>
                                                    <td>
                                                        <%=daftarPengunjung.getDaftarPengunjung().get(i).getNamaP()%>
                                                    </td>
                                                    <td>
                                                        <%=daftarInvoice.getInvoice().get(i).getTglBooking()%>
                                                    </td>
                                                    <td>
                                                        <% String status = daftarInvoice.getInvoice().get(i).getStatusPembayaran();
                                                            if (status.equals("Pending")) {
                                                        %>
                                                        <form action="./DetailTransaksiServlet">
                                                            <button type="submit" name="konfirmasi" value="<%=daftarInvoice.getInvoice().get(i).getIdInvoice()%>" 
                                                                    class="btn-link">Pending</button>
                                                        </form>
                                                        <% } else {
                                                        %>
                                                        <%=status%>
                                                        <% }
                                                        %>

                                                    </td>
                                                </tr>
                                                <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="../../footer_1.jsp" %>
    </body>
    <%@ include file="../../incFile.jsp" %>
</html>

