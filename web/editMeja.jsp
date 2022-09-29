
<%@page import="usd.project.db.DbConnection"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="org.imgscalr.Scalr"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Atur Meja</title>

        <%@ include file="incFileHead.jsp" %>
        <style>
            td {
                position: relative;
            }

            input[type="text"], textarea {
                position: absolute;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                resize: none;

                /* for full width without spacing */
                width: 100%;
                border: none;
            }

            input[type="number"], textarea {
                position: absolute;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                resize: none;

                /* for full width without spacing */
                width: 100%;
                border: none;
            }
        </style>
    </head>

    <body>
        <jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
        <jsp:useBean id="daftarMeja" class="usd.project.model.DaftarMeja" scope="session"/>
        <div class="wrapper">
            <%@ include file="sidebar.jsp" %>
            <div class="main-panel">
                <%@ include file="navigationBar.jsp" %>

                <form action="./editMejaServlet" method = "post" enctype="multipart/form-data">

          

                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Tambah Meja Baru</h4>
                                            <p class="category">Isi tabel berikut untuk menambahkan pilihan meja reservasi baru :</p>
                                        </div>
                                        <div class="content table-responsive table-full-width">
                                            <table class="table table-hover table-striped">
                                                <thead>
                                                <th>Nama Meja</th>
                                                <th>Deskripsi</th>
                                                <th>Harga Meja</th>
                                                <th>Foto Meja</th>
                                                </thead>

                                                <tbody>
                                                    <tr>
                                                        <td><input type ="text" class="form-control" name="namaM" value =""/></td>
                                                        <td><textarea id="deskM" class="form-control" name="deskripsiM" rows="4" cols="30"></textarea></td>
                                                        <td><input type ="number" class="form-control" name="hargaM" value =""/></td>
                                                        <td>
                                                            Upload Foto
                                                            <input type="file" name="fotoM"/>
                                                        </td>
                                                        
                                                <input type ="hidden" name="jumlahM" value ="10">
                                                    </tr>

                                                </tbody>
                                            </table>
                                            <div class="container">
                                                <div class="col-md-2" style="float: right">
                                                    <input class="btn btn-primary" type ="submit" name ="submit" value ="Tambahkan" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

             
                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Edit Meja</h4>
                                            <p class="category">Edit tabel berikut jika ada perubahan pada kolom-kolom yang disediakan :</p>
                                        </div>
                                        <div class="content table-responsive table-full-width">
                                            <table class="table table-hover table-striped w-auto">
                                                <thead>
                                                <th>Nama</th>
                                                <th>Deskripsi</th>
                                                <th>Harga</th>
                                                <th>Foto Meja</th>
                                                </thead>
                                                <tbody>
                                                    <% for (int i = 0; i < daftarMeja.getDaftarMeja().size(); i++) {
                                                            
                                                        
                                                    %>
                                                    <tr>
                                                        <td>
                                                            <input type ="text" class="form-control" name="TnamaM" value ='<%=daftarMeja.getDaftarMeja().get(i).getNamaM()%>' />
                                                        </td>
                                                        <td>
                                                            <textarea id="deskM" class="form-control" name="TdeskripsiM" rows="4" cols="16"><%=daftarMeja.getDaftarMeja().get(i).getDeskripsiM()%></textarea>
                                                        </td>
                                                        <td>
                                                            <input type ="text" class="form-control" name="ThargaM" value =<%=daftarMeja.getDaftarMeja().get(i).getHargaM()%> />
                                                        </td>
                                                        <td>
                                                            <%
                                                                data = daftarMeja.getDaftarMeja().get(i).getFotoM().getBytes(1l, (int) daftarMeja.getDaftarMeja().get(i).getFotoM().length());
                                                                encode = Base64.getEncoder().encodeToString(data);
                                                                request.setAttribute("imgBase", encode);
                                                            %>


                                                            <img class="img-thumbnail" src="data:image/jpeg;base64,${imgBase}" width="80" height="80"/>
                                                            <br>Ganti Foto
                                                            <input type="file" class="form-control" name="TfotoM<%=i%>"/>
                                                        </td>

                                                <input type ="hidden" name="TjumlahM" value ="10">
                                                <input type ="hidden" name="namaMlama" value ='<%=daftarMeja.getDaftarMeja().get(i).getNamaM()%>'>
                                                </tr>

                                                <%
                                                            
                                                        }
                                                    
                                                %>

                                                </tbody>
                                            </table>

                                            <input type='hidden' name='idResto' value='<jsp:getProperty name="resto" property="idResto"/>'/>
                                            <div class="container">
                                                <div class="col-md-2" style="float: right">
                                                    <input class="btn btn-primary" type ="submit" name ="submit" value ="Update"/>      
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <%@ include file="footer_1.jsp" %>

                </form>
            </div>
        </div>
    </body>
    <%@ include file="footer_1.jsp" %>
    <%@ include file="incFile.jsp" %>
</html>

