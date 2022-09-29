<%-- 
    Document   : LihatReservasi
    Created on : Dec 1, 2020, 1:05:08 AM
    Author     : gregoriusyuristama
--%>

<%@page import="usd.project.model.DaftarInvoice"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Resto.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
<jsp:useBean id="daftarInvoice" class="usd.project.model.DaftarInvoice" scope="request"/>

<%
    DaftarInvoice listInv = daftarInvoice;
%>

<%@include file="header.jsp" %>
<div class="container">
    <h1>Lihat Reservasi</h1>
    <form action="LihatReservasi.jsp">
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
    <table id="mytable" border="1" >
        <tr>
            <td>
                No
            </td>
            <td>
                No Transaksi
            </td>
            <td>
                Nama Pengunjung
            </td>
            <td>
                Tanggal Pemesanan
            </td>
            <td>
                Status
            </td>
        </tr>
        <% for (int i = 0; i < daftarInvoice.getInvoice().size(); i++) {
        %>
        <tr>
            <td>
                <%=i + 1%>
            </td>
            <td>
                <%=daftarInvoice.getInvoice().get(i).getIdInvoice()%>
            </td>
            <td>
                <%=daftarInvoice.getInvoice().get(i).getIdPengunjung()%>
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
    </table>
    <br>
    <form action="LihatReservasiServletFiltered">
        <button type="submit" name="tombol" value="semua">Semua</button>
        <button type="submit" name="tombol" value="batal">Pembatalan</button>
        <button type="submit" name="tombol" value="belum_lunas">Belum Bayar</button>
        <button type="submit" name="tombol" value="lunas">Sudah Bayar</button>
        <button type="submit" name="tombol" value="pending">Pending</button>
    </form>
    <a href="./HomeResto.jsp">Home</a>
</div>
<script>
    function myFunction() {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>
<%@include file="footer.jsp" %>

