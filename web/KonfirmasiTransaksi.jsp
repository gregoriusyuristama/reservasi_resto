<%@page import="java.util.Base64"%>
<!doctype html>

<jsp:useBean id="invoice" class="usd.project.model.InvoiceBean" scope="request"/>
<jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
<html lang="en">
    <head>

        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="gatau/BS3/assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Konfirmasi Reservasi</title>

        <%@ include file="incFileHead.jsp" %>
    </head>
    <body>
        <div class="wrapper">
            <%@ include file="sidebar.jsp" %>
            <div class="main-panel">
                <%@ include file="navigationBar.jsp" %>
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <h2>Transaksi : <%=invoice.getIdInvoice()%></h2>
                        </div>
                        <%
                            data = invoice.getBuktiPembayaran().getBytes(1, (int) invoice.getBuktiPembayaran().length());
                            encode = Base64.getEncoder().encodeToString(data);
                            request.setAttribute("imgBase", encode);
                        %>

                        <div class="row">
                            <h3>Bukti Transfer</h3>
                            <img src="data:image/jpeg;base64,${imgBase}" alt="foto resto" width="300" height="300"/>
                        </div>
                        <div class="row">
                            <br>
                            <form action="./KonfirmasiTransaksiServlet">
                                <input type="hidden" name="idInvoice" value="<%=invoice.getIdInvoice()%>">
                                <input class="btn btn-danger" type="submit" name="tombol" value="Tolak">
                                <input class="btn btn-success" type="submit" name="tombol" value="Konfirmasi">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="footer_1.jsp" %>
        </div>

    </body>
    <%@ include file="incFile.jsp" %>
</html>

