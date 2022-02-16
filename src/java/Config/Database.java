/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class Database {
    public static Connection connection;
    private Connection conn;
    private Statement st;
    
    public Database(){
        
    }
        
    public Database(String DBName,String Username, String Password) {
        this.connection = getConnection(DBName, Username, Password);
    }
    
    
    
    public static Connection getConnection(String DBName,String Username, String Password) {
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DBName,Username,Password);
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e);
        }
        return con;
    }

    public static void getconnection() {
        try {
            String db = "jdbc:mysql://localhost:3306/tumbal_proyek";
            String user = "root";
            String pass = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(db, user, pass);
        } catch (Exception x) {
            System.out.println("Terjadi kesalahan ambil koneksi : " + x);
        }
    }

    public void connection() {
        try {
            String db = "jdbc:mysql://localhost:3306/projek_sistemkeuanganlab";
            String user = "root";
            String pass = "";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(db, user, pass);
            st = conn.createStatement();
        } catch (Exception x) {

            System.out.println("Terjadi kesalahan koneksi : " + x);
        }
    }

    public void disconnect(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            st.close();
            conn.close();
        } catch (Exception x) {
            System.out.println("Terjadi kesalahan diskoneksi : " + x);
        }
    }

    public ResultSet getData(String sql) {
        ResultSet rs = null;
        try {
            connection();
            rs = st.executeQuery(sql);
        } catch (Exception x) {
            System.out.println("Terjadi kesalahan ambil data : " + x);
        }
        return rs;
    }

    public void saveData(String sql) {
        try {
            connection();
            st.executeUpdate(sql);
        } catch (Exception x) {
            System.out.println("Terjadi kesalahan simpan data : " + x);
        }
    }
    
    
    public static boolean saveQuery(String Query,Connection con){
        boolean stat=false;
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(Query);
            stat=ps.execute();
            ps.close();
            con.close();
            
            stat = true;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
        return stat;
    }
    
    public static ArrayList<ArrayList<String>> getData(String Query,Connection con){
        ArrayList<ArrayList<String>> data = new ArrayList<>();
        PreparedStatement ps;
        ResultSetMetaData rsMetaData;
        try {
            ps = con.prepareStatement(Query);
            try (ResultSet rs = ps.executeQuery()) {
                rsMetaData = rs.getMetaData();
                int count = rsMetaData.getColumnCount();
                ArrayList<String> colName = new ArrayList<>();
                for (int i = 1; i <= count; i++) {
                    colName.add(rsMetaData.getColumnName(i));
                }
                data.add(colName);
                
                while (rs.next()) {
                    //System.out.println(rs);
                    ArrayList<String> tmp = new ArrayList<>();
                    for (int i = 1; i <= count; i++) {
                        tmp.add(rs.getString(i));
                    }
                    data.add(tmp);
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return data;
    }
    
    public static void printEnum(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Enumeration<String> params = request.getParameterNames();
        PrintWriter out = response.getWriter();
        
        while(params.hasMoreElements()) {
            out.println(params.nextElement());
        }
    }
}
