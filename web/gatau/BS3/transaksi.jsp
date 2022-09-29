<%@page import="usd.project.model.MejaBean"%>
<%@page import="usd.project.model.BeanPengunjung"%>
<%@page import="usd.project.model.InvoiceBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Resto.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
    <jsp:useBean id="daftarInvoice" class="usd.project.model.DaftarInvoice" scope="request"/>
    <jsp:useBean id="daftarPengunjung" class="usd.project.model.ListPengunjung" scope="request"/>
    <jsp:useBean id="daftarMeja" class="usd.project.model.ListMeja" scope="request"/>
    <head>
        <meta charset="utf-8" />

        <link rel="icon" type="image/png" href="gatau/BS3/assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Transaksi</title>
        <%@ include file="incFileHead.jsp" %>
    </head>
    <body>

        <div class="wrapper">
            <%@ include file="sidebar.jsp" %>
            <div class="main-panel">
                <%@ include file="navigationBar.jsp" %>

                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Tabel Transaksi</h4>
                                        <p class="category">Transaksi reservasi restoran anda selama ini.</p>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                            <th>No.</th>
                                            <th>No. Transaksi</th>
                                            <th>Nama Pemesan</th>
                                            <th>Tipe Meja</th>
                                            <th>Jumlah</th>
                                            <th>Tanggal Booking</th>
                                            <th>Jumlah harga</th>
                                            <th>Status</th>
                                            </thead>
                                            <tbody>
                                                <%                                                    for (int i = 0; i < daftarInvoice.getInvoice().size(); i++) {
                                                        InvoiceBean inv = daftarInvoice.getInvoice().get(i);
                                                        BeanPengunjung pengunjung = daftarPengunjung.getDaftarPengunjung().get(i);
                                                        MejaBean meja = daftarMeja.getDaftarMeja().get(i);
                                                %>
                                                <tr>
                                                    <td><%=i + 1%></td>
                                                    <td><%=inv.getIdInvoice()%></td>
                                                    <td><%=pengunjung.getNamaP()%></td> 
                                                    <td><%=inv.getNamaM()%></td> 
                                                    <td><%=inv.getJumlahM()%></td>
                                                    <td><%=inv.getTglBooking()%></td>
                                                    <td><%=meja.getHargaM() * inv.getJumlahM()%></td>
                                                    <td><%=inv.getStatusPembayaran()%></td>
                                                </tr>
                                                <%
                                                    }
                                                %>
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

        <%@ include file="footer.jsp" %>
    </body>
    <%@ include file="incFile.jsp" %>
</html>
