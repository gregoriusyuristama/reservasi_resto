<%@page import="usd.project.model.RestoranBean"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Resto.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="gatau/BS3/assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Home</title>
        <%@ include file="incFileHead.jsp" %>

        <jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
    </head>
    <body>

        <div class="wrapper">
            <%@ include file="sidebar.jsp" %>
            <div class="main-panel">
                <%@ include file="navigationBar.jsp" %>
                <%= resto.getFoto1()%>
            </div>
            <%@ include file="footer.jsp" %>
        </div>

    </body>

    <%@ include file="incFile.jsp" %>
    <script type="text/javascript">
        $(document).ready(function () {

            demo.initChartist();

            $.notify({
                icon: 'pe-7s-gift',
                message: "Selamat datang, jangan lupa cek reservasi hari ini ya !"

            }, {
                type: 'info',
                timer: 4000
            });

        });
    </script>

</html>

