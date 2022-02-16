/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controler;

import Config.Database;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nocty
 */
@WebServlet(name = "EditDaftarBelanja", urlPatterns = {"/DaftarBelanja/edit-belanja"})
public class EditDaftarBelanja extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditDaftarBelanja</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditDaftarBelanja at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        new Database("tumbal_proyek", "root", "");
        
        String id = request.getParameter("id_pembelian"),
            ail = request.getParameter("AIL"),
            lab = request.getParameter("LAB"),
            nama_barang = request.getParameter("nama_barang"),
            jumlah_barang = request.getParameter("jumlah_barang"),
            harga_per_unit = request.getParameter("harga_per_unit"),
            supplier = request.getParameter("supplier"),
            tanggal = request.getParameter("tanggal_pembelian"),
            query = "update pembelian set id_ail='" + ail + "', "
                + "id_lab='" + lab + "', "
                + "nama_barang='" + nama_barang + "', "
                + "jumlah_barang='" + jumlah_barang + "', "
                + "harga_per_unit='" + harga_per_unit + "', "
                + "id_supplier='" + supplier + "', "
                + "tanggal_pembelian='" + tanggal + "' "
                + "where id_pembelian='" + id + "'";
        
            System.out.println(query);
        
        if(Database.saveQuery(query, Database.connection)) {
            response.sendRedirect(request.getContextPath() + "/DaftarBelanja");
        }else {
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html><p>Something went wrong!</p>");
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
