
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String host = "jdbc:mysql://localhost:3306/projek_sistemkeuanganlab";
            String laporan = "";
            String nama_file = "";
            String tanggal_laporan = "";
            String id_ail = "";
            if (ServletFileUpload.isMultipartContent(request)) {
                try {
                    List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                    for (FileItem item : multiparts) {
                        if (!item.isFormField()) {
                            laporan = new File(item.getName()).getName();
                            item.write(new File("C:/Users/harta/Videos/Kelompok/kel1/SIKEL_Ganjil/web/file/"
                                    + File.separator + laporan));
                        } else if (item.isFormField()) {
                            if (item.getFieldName().equals("nama_file")) {
                                nama_file = item.getString();
                            } else if (item.getFieldName().equals("tanggal_laporan")) {
                                tanggal_laporan = item.getString();
                            } else if (item.getFieldName().equals("id_ail")) {
                                id_ail = item.getString();
                            }
                        }
                    }
                } catch (Exception ex) {
                    request.setAttribute("message", "File Upload Failed due to " + ex);
                }
            } else {
                request.setAttribute("message", "File not found");
            }
            out.print(id_ail);
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(host, "root", "");
                if (conn != null) {
                    PreparedStatement pst = conn.prepareStatement("INSERT INTO `laporan`( `id_ail`, `nama_file`, `laporan`, `tanggal_laporan`) VALUES (" + id_ail + ", '" + nama_file + "', '" + laporan + "', '" + tanggal_laporan + "');");

                    pst.executeUpdate();

                    response.sendRedirect("ViewLaporan.jsp");
                }
            } catch (Exception ex) {
                out.print("Can't connect to database, with error = " + ex.getMessage());
            }
        %>
    </body>
</html>
