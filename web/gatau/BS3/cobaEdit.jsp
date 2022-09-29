
<%@page import="java.util.Date"%>
<%@page import="Resto.DbConnection"%>
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
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Light Bootstrap Dashboard by Creative Tim</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


        <!-- Bootstrap core CSS     -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    </head>


    <body>

        <jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
        <div class="wrapper">
            import sidebar


            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">User</a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">
                                <li>
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-dashboard"></i>
                                        <p class="hidden-lg hidden-md">Dashboard</p>
                                    </a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-globe"></i>
                                        <b class="caret hidden-sm hidden-xs"></b>
                                        <span class="notification hidden-sm hidden-xs">5</span>
                                        <p class="hidden-lg hidden-md">
                                            5 Notifications
                                            <b class="caret"></b>
                                        </p>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Notification 1</a></li>
                                        <li><a href="#">Notification 2</a></li>
                                        <li><a href="#">Notification 3</a></li>
                                        <li><a href="#">Notification 4</a></li>
                                        <li><a href="#">Another notification</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="">
                                        <i class="fa fa-search"></i>
                                        <p class="hidden-lg hidden-md">Search</p>
                                    </a>
                                </li>
                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="">
                                        <p>Account</p>
                                    </a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <p>
                                            Dropdown
                                            <b class="caret"></b>
                                        </p>

                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">
                                        <p>Log out</p>
                                    </a>
                                </li>
                                <li class="separator hidden-lg hidden-md"></li>
                            </ul>
                        </div>
                    </div>
                </nav>


                <div class="content">
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


                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul>
                                <li>
                                    <a href="#">
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Company
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Portfolio
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Blog
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <p class="copyright pull-right">
                            &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
                        </p>
                    </div>
                </footer>

            </div>
        </div>


    </body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>

</html>
