<%-- 
    Document   : DisplayImage
    Created on : Dec 2, 2020, 2:11:02 AM
    Author     : gregoriusyuristama
--%>

<%@page import="org.imgscalr.Scalr"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
    Connection con = null;
    byte[] imgData = null;
    Statement stmt = null;
    ResultSet rs = null;
    BufferedImage img = null;
    BufferedImage thumbnail = null;
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    String idInvoice = request.getParameter("idInvoice");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rpl", "root", "");
        stmt = con.createStatement();
        rs = stmt.executeQuery("select buktiPembayaran from invoice where idInvoice = '"+idInvoice+"'");
        if (rs.next()) {
            int width = 200, height = 200;
            img = ImageIO.read(rs.getBinaryStream(1));
            thumbnail = Scalr.resize(img, Scalr.Method.SPEED, Scalr.Mode.FIT_TO_WIDTH,
                    width, height, Scalr.OP_ANTIALIAS);
            ImageIO.write(thumbnail, "png", baos);
            imgData = baos.toByteArray();

        } else {
            out.println("Display Blob Example");
            out.println("image not found for given id>");
            return;
        }
// display the image
        response.setContentType("image/jpg");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    } catch (Exception e) {
        out.println("Unable To Display image");
        out.println("Image Display Error=" + e.getMessage());
        return;
    } finally {
        try {
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>