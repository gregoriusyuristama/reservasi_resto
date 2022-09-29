<%-- 
    Document   : SignUp
    Created on : Nov 27, 2020, 3:32:49 AM
    Author     : gregoriusyuristama
--%>

<%@page language="java"contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Daftar Resto</title>
    </head>
    <body>
        <h1>Profil Resto</h1>
        <table>
            <form name="fileform" method="post" action="./DaftarResto" enctype="multipart/form-data">
                <tr>
                    <td><label>ID Resto*</label></td>
                    <td><input type="text" name="idResto"/></td>
                </tr>
                <tr>
                    <td><label>Password</label></td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td><label>Konfirmasi Password</label></td>
                    <td><input type="password" name="konfirmasi"/></td>
                </tr>
                <tr>
                    <td><label>Nama Resto</label></td>
                    <td><input type="text" name="namaR"/></td>
                </tr>
                <tr>
                    <td><label>E-mail</label></td>
                    <td><input type="text" name="emailR"/></td>
                </tr>
                <tr>
                    <td><label>No Telp</label></td>
                    <td><input type="text" name="noTelpR"/></td>
                </tr>
                <tr>
                    <td><label>Alamat</label></td>
                    <td><input type="text" name="alamatR"/></td>
                </tr>
                <tr>
                    <td><label>Deskripsi</label></td>
                    <td><input type="text" name="deskripsiR"/></td>
                </tr>
                <tr>
                    <td><label>Nama Pemilik</label></td>
                    <td><input type="text" name="namaPemilik"/></td>
                </tr>
                <tr>
                    <td><label>No KTP</label></td>
                    <td><input type="text" name="KTP"/></td>
                </tr>
                <tr>
                    <td><label>Foto KTP</label></td>
                    <td><input type="file" name="fotoKTP" size="50" accept="image/*" /></td>
                </tr>
                <tr>
                    <td><label>Nama Bank</label></td>
                    <td><input type="text" name="namaBank"/></td>
                </tr>
                <tr>
                    <td><label>Nomor Rekening</label></td>
                    <td><input type="text" name="noRek"/></td>
                </tr>
                <tr>
                    <td><label>Jam Buka</label></td>
                    <td><input type="time" name="jamBuka"/></td>
                </tr>
                <tr>
                    <td><label>Jam Tutup</label></td>
                    <td><input type="time" name="jamTutup"/></td>
                </tr>
                <tr>
                    <td><label>Foto Restoran (Maks 5) : </label></td>
                    <td>
                        <input type="file" name="foto1" size="50" accept="image/*" />
                        <input type="file" name="foto2" size="50" accept="image/*" />
                        <input type="file" name="foto3" size="50" accept="image/*" />
                        <input type="file" name="foto4" size="50" accept="image/*" />
                        <input type="file" name="foto5" size="50" accept="image/*" />
                    </td>
                </tr>

                <tr>
                    <td><input type="submit" value="Daftar" name="submit"/></td>
                </tr>
            </form>
        </table>

    </body>
</html>
