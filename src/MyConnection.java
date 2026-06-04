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
    private static final String URL = "jdbc:postgresql://localhost:5432/tugas5_1402025013";
    private static final String USER = "postgres"; 
    private static final String PASSWORD = "ver23rito45";

    public static Connection getConnection() {
        Connection con = null;
        try {
            // Memuat Driver PostgreSQL
            Class.forName("org.postgresql.Driver");
            
            // Membuat koneksi
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Koneksi ke database 'bukuku' BERHASIL!");
            
        } catch (ClassNotFoundException e) {
            System.err.println("Driver tidak ditemukan: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Koneksi GAGAL: " + e.getMessage());
        }
        return con;
    }
    
    public static void main(String[] args) {
        getConnection();
    }
}