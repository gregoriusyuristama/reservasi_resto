<%@page import="usd.project.model.RestoranBean"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Home</title>
        <%@ include file="incFileHead.jsp" %>
        <style>
            img {
                border-radius: 50%;
            }
            .navbar img {
                display:block;
                margin: 0px auto;
            }.center {
                display: block;
                margin-left: auto;
                margin-right: auto;
                width: 50%;
            }
        </style>
        <jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
    </head>
    <body>
        <div class="wrapper">
            <%@ include file="sidebar.jsp" %>
            <div class="main-panel">
                <%@ include file="navigationBar.jsp" %>
                <div class="content">
                    <img src="images/Logo.png" alt="Rest-on Logo" class="center"/>
                </div>
            </div>
            <%@ include file="footer_1.jsp" %>
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

