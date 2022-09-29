

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="gatau/BS3/assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <jsp:useBean id="resto" class="usd.project.model.RestoranBean" scope="session"/>
        <title>Edit Profil</title>
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
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Edit Profil</h4>
                                    </div>
                                    <div class="content">
                                        <form>
                                            <div class="row">

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Nama Restoran</label>
                                                        <input type="text" class="form-control" placeholder="namaR" value ="<jsp:getProperty name="resto" property="namaR"/>" />
                                                    </div>

                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="emailResto">Email</label>
                                                        <input type="email" class="form-control" name="emailR" value='<jsp:getProperty name="resto" property="emailR"/>' />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Alamat Restoran</label>
                                                        <input type="text" class="form-control" name="alamatR" value ='<jsp:getProperty name="resto" property="alamatR"/>' />
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Nomor Telepon</label>
                                                        <input type="text" class="form-control" name="noTelpR" value ='<jsp:getProperty name="resto" property="noTelp"/>' />
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="namaBank">Nama Bank</label>
                                                        <input type="text" class="form-control" name="namaBank" value ='<jsp:getProperty name="resto" property="namaBank"/>' />
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="noRek">Nomor Rekening</label>
                                                        <input type="text" class="form-control" name="noRek" value ='<jsp:getProperty name="resto" property="noRek"/>' />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="namaPemilik">Nama Pemilik</label>
                                                        <input type="text" class="form-control" name="namaPemilik" value ='<jsp:getProperty name="resto" property="namaPemilik"/>' />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>Deskripsi</label>
                                                            <textarea id="deskripsiR" class="form-control" name="deskripsiR" form="updateRestoForm"><jsp:getProperty name="resto" property="deskripsiR"/></textarea></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%
                                                String[] jamBuka = resto.getJamBuka().split(":", 2);
                                                String jamBukaFormatted = jamBuka[0] + ":" + jamBuka[1] + ":00";
                                                String[] jamTutup = resto.getJamTutup().split(":", 2);
                                                String jamTutupFormatted = jamTutup[0] + ":" + jamTutup[1] + ":00";
                                            %>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="jamBuka">Jam Buka</label>
                                                        <input type="text" class="form-control" name="jamBuka" <input type ="time" name="jamBuka" 
                                                                                                                      value ='<%=jamBukaFormatted%>' />
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="jamTutup">Jam Tutup</label>
                                                        <input type="text" class="form-control" name="jamBuka" <input type ="time" name="jamTutup" 
                                                                                                                      alue ='<%=jamTutupFormatted%>' />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-10">
                                                    <div class="form-group">
                                                        <label for="foto">Foto</label>
                                                        <input type="file" name="foto1" accept="image/*" size="50"/> 
                                                        <input type="file" name="foto2" accept="image/*" size="50"/>
                                                        <input type="file" name="foto3" accept="image/*" size="50"/>
                                                        <input type="file" name="foto4" accept="image/*" size="50"/>
                                                        <input type="file" name="foto5" accept="image/*" size="50"/>
                                                    </div>

                                                    <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                                                    <div class="clearfix"></div>
                                                    </form>
                                                </div>
                                            </div>
                                            <a href="gantiPassword.jsp">Ganti Password</a>
                                    </div>

                                    <input type='hidden' name='idResto' value='<jsp:getProperty name="resto" property="idResto"/>'/>
                                    <input type ="submit" name ="Update" value ="Update"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="./homeResto.jsp">Home</a>
        <%@ include file="footer.jsp" %>
    </body>
    <%@ include file="incFile.jsp" %>
</html>

