/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controler;

import Config.Database;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nocty
 */
@WebServlet(name = "InputNotifikasi", urlPatterns = {"/Notifikasi/input-notifikasi"})
public class inputnotifikasi extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InputNotifikasi</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InputNotifikasi at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        PrintWriter out = response.getWriter();
        try {
            new Database("projek_sistemkeuanganlab", "root", "");
            String id_pembelian = request.getParameter("id_pembelian");
            String no_pengajuan = id_pembelian + request.getParameter("no_pengajuan");
            String status = request.getParameter("status");
            String deskripsi = request.getParameter("deskripsi");
            String id_notifikasi = null;
            String id_ail = "1";

            String host = "jdbc:mysql://localhost:3306/projek_sistemkeuanganlab";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(host, "root", "");
            PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi values(?,?,?,?,?,?,?)");
            pst2.setString(1, id_notifikasi);
            pst2.setString(2, id_ail);
            pst2.setString(3, id_pembelian);
            pst2.setString(4, "");
            pst2.setString(5, no_pengajuan);
            pst2.setString(6, status);
            pst2.setString(7, deskripsi);
            pst2.executeUpdate();
            pst2.close();
            response.sendRedirect(request.getContextPath() + "/DaftarBelanja/index.jsp");
        } catch (Exception e) {
            out.println("Something went wrong! + " + e);
        }
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
