package Controler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Models.datakonfirmasi;

public class kelola extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            datakonfirmasi data = new datakonfirmasi();
            String id = request.getParameter("id");
            String status = request.getParameter("status");
            out.print(status);
            String komentar = request.getParameter("komentar") + " ";
            String nama = request.getParameter("nama");
            String id_ail = request.getParameter("id_ail");
            String nopengajuan = id + "-" + request.getParameter("nama");
            String id_notifikasi = null;
            String host = "jdbc:mysql://localhost:3306/projek_sistemkeuanganlab";
            data.updatedata(id, id_notifikasi, id_ail, nama, nopengajuan, status, komentar);
            response.sendRedirect("konfirmasi Pengajuan/halaman_pengelola.jsp");
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
