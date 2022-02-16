
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id_ail = request.getParameter("id_ail");
    String nama_barang = request.getParameter("nama_barang");
    String id = null;
    String ket = request.getParameter("ket");
    int jumlah_barang = Integer.parseInt(request.getParameter("jumlah_barang"));

    String tanggal_pengajuan = request.getParameter("tanggal_pengajuan");
    String deskripsi = request.getParameter("deskripsi");
    String status = request.getParameter("status");
    String host = "jdbc:mysql://localhost:3306/projek_sistemkeuanganlab";
    System.out.println(status);

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, "root", "");
        if (conn != null) {
            if (id_ail != null) {
                PreparedStatement pst = conn.prepareStatement("INSERT INTO form_pengajuan VALUES(?,?,?,?,?,?,?,?)");
                pst.setString(1, id);
                pst.setString(2, id_ail);
                pst.setString(3, nama_barang);
                pst.setInt(4, jumlah_barang);
                pst.setString(5, tanggal_pengajuan);
                pst.setString(6, deskripsi);
                pst.setString(7, ket);
                pst.setString(8, status);
                pst.executeUpdate();
                response.sendRedirect("indexPengajuan.jsp");
            }
        } else {
            response.sendRedirect("gagalSimpan_pengajuan.jsp");
        }
    } catch (SQLException ex) {
        out.print("Gagal Koneksi"+ex);
    } catch (Exception ex) {
        out.print(ex.getMessage());
    }
%>
