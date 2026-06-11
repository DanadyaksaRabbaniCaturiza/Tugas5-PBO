/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author user
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/tugas5_1402025013";
    private static final String USER = "root"; 
    private static final String PASSWORD = "";

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Koneksi ke database MySQL XAMPP BERHASIL!");
            
        } catch (ClassNotFoundException e) {
            System.err.println("Driver MySQL tidak ditemukan! Pastikan Jar/Dependency sudah dipasang: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Koneksi GAGAL: " + e.getMessage());
        }
        return con;
    }
    
    public static void main(String[] args) {
        getConnection();
    }
}