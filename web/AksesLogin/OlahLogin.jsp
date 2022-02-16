<%-- 
    Document   : OlahLogin
    Created on : Feb 8, 2022, 10:52:53 AM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page import="Models.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String Email = request.getParameter("Email");
            String Password = request.getParameter("Password");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tumbal_proyek", "root", "");
                if (conn != null) {
                    if (Email != null && Password != null) {
                        Statement st = conn.createStatement();
                        String query = "SELECT * FROM account where Email ='" + Email + "' AND Password = '" + Password + "'";
                        ResultSet rs = null;
                        rs = st.executeQuery(query);
                        int cek = 0;
                        while (rs.next()) {
                            cek++;
                            HttpSession sesi = request.getSession();
                            sesi.setAttribute("First Name", rs.getString("First Name"));
                            sesi.setAttribute("Hak_Akses", rs.getString("Hak_Akses"));
                            if (cek > 0) {
                                if (rs.getNString("Hak_Akses").equalsIgnoreCase("KAJUR")) {
                                    response.sendRedirect("../konfirmasi Pengajuan/halaman_pengelola.jsp");
                                } else if (rs.getNString("Hak_Akses").equalsIgnoreCase("KALAB")) {
                                    response.sendRedirect("../Memvalidasi Laporan/halaman_validasi");
                                } else {
                                    response.sendRedirect("../FormPengajuan/notif_pengajuan.jsp");
                                }
                            } else {
                                response.sendRedirect("Login.jsp");
                            }
                        }

                    }
                } else {
                    response.sendRedirect("");
                }
            } catch (Exception e) {
                out.println("Can't connect to database:" + e.getMessage());
            }
        %>
    </body>
</html>
