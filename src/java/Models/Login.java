/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 *
 * @author HP
 */
public class Login {
    String FirstName,LastName,Email,Password,HakAkses;
    private Connection conn;
    private Statement st;
    
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tumbal_proyek", "root", "");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    public String getHakAkses() {
        return HakAkses;
    }

    public void setHakAkses(String HakAkses) {
        this.HakAkses = HakAkses;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
       
    
    public int insertUser(String FirstName, String LastName, String Email, String Password, String HakAkses){
        int status = 0;
        try {
                Connection con = Login.getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO `account`(`First Name`, `Last Name`, `Email`, `Password`, `Hak_Akses`) VALUES ('"+ FirstName+"', '"+LastName+"', '"+Email+"', '"+Password+"', '"+HakAkses+"');");
            status = ps.executeUpdate();
            con.close();
            status++;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    
}
