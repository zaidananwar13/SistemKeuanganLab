package Models;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class datakonfirmasi extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    public void updatedata(String id, String id_notifikasi, String id_ail, String nama, String nopengajuan, String status, String komentar) {
        try {
            String host = "jdbc:mysql://localhost:3306/projek_sistemkeuanganlab";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(host, "root", "");
            if (conn != null) {
                if (id != null) {
                    if (status.equalsIgnoreCase("terima")) {
                        PreparedStatement pst = conn.prepareStatement("update form_pengajuan set status='terima' where id='" + id + "'");
                        PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi values(?,?,?,?,?,?,?)");
                        pst.executeUpdate();
                        status = "terima";
                        pst2.setString(1, id_notifikasi);
                        pst2.setString(2, id_ail);
                        pst2.setString(3, "0");
                        pst2.setString(4, nama);
                        pst2.setString(5, nopengajuan);
                        pst2.setString(6, status);
                        pst2.setString(7, komentar);
                        pst2.executeUpdate();
                        pst.close();
                        pst2.close();
                    } else if (status.equalsIgnoreCase("tolak")) {
                        PreparedStatement pst = conn.prepareStatement("update form_pengajuan set status='tolak' where id='" + id + "'");
                        PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi values(?,?,?,?,?,?,?)");
                        pst.executeUpdate();
                        status = "tolak";
                        pst2.setString(1, id_notifikasi);
                        pst2.setString(2, id_ail);
                        pst2.setString(3, "0");
                        pst2.setString(4, nama);
                        pst2.setString(5, nopengajuan);
                        pst2.setString(6, status);
                        pst2.setString(7, komentar);
                        pst2.executeUpdate();
                        pst.close();
                        pst2.close();
                    }
                }
            } else {
            }
        } catch (SQLException ex) {
        } catch (Exception ex) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
