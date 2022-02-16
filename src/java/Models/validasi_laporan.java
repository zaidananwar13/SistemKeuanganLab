package Models;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class validasi_laporan extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    public void updatelaporan(String id, String id_ail, String a, String status, String komentar) {
        try {
            String host = "jdbc:mysql://localhost:3306/projek_sistemkeuanganlab";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(host, "root", "");
            if (conn != null) {
                if (status.equalsIgnoreCase("terima")) {
                    PreparedStatement pst = conn.prepareStatement("update laporan set status='terima' where id='" + id + "'");
                    PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi_laporan values(?,?,?,?)");
                    pst.executeUpdate();
                    status = "terima";
                    pst2.setString(1, id_ail);
                    pst2.setString(2, null);
                    pst2.setString(3, "'" + status + "'");
                    pst2.setString(4, komentar);
                    pst2.executeUpdate();
                    pst.close();
                    pst2.close();
                } else if (status.equalsIgnoreCase("tolak")) {
                    PreparedStatement pst = conn.prepareStatement("update laporan set status='tolak' where id='" + id + "'");
                    PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi_laporan values(?,?,?,?)");
                    pst.executeUpdate();
                    status = "tolak";
                    pst2.setString(1, id_ail);
                    pst2.setString(2, null);
                    pst2.setString(3, "'" + status + "'");
                    pst2.setString(4, komentar);
                    pst2.executeUpdate();
                    pst.close();
                    pst2.close();
                }
            } else {
            }
        } catch (SQLException ex) {
        } catch (Exception ex) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
