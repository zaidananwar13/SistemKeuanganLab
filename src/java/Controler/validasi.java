package Controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Models.validasi_laporan;

public class validasi extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            String id_ail = request.getParameter("id_ail");
            String status = request.getParameter("status");
            String komentar = request.getParameter("komentar") + " ";
            String id_notifikasi = null;
            String host = "jdbc:mysql://localhost:3306/projek_sistemkeuanganlab";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(host, "root", "");
                if (conn != null) {
                    if (id != null) {
                        validasi_laporan objek = new validasi_laporan();
                        objek.updatelaporan(id, id_ail, id_notifikasi, status, komentar);
                        response.sendRedirect("Memvalidasi Laporan/halaman_validasi.jsp");
                    }
                } else {
                    response.sendRedirect("Memvalidasi Laporan/halaman_validasi.jsp");
                }
            } catch (SQLException ex) {
                out.print("Gagal Koneksi" + ex);
            } catch (Exception ex) {
                out.println("gagal");
                out.print(ex.getMessage());
            }
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
