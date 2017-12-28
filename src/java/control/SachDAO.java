/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Sach;

/**
 *
 * @author NVQuang
 */
public class SachDAO {
    public static Connection con;
    
    public static ArrayList<Sach> getAll() {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "SELECT * FROM sach";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            ArrayList<Sach> list =  new ArrayList<>();
            while(rs.next()) {
                list.add(new Sach(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
            return list;
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public static ArrayList<Sach> searchBook(String ten) {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "SELECT * FROM sach WHERE ten = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + ten + "%");
            ResultSet rs = ps.executeQuery();
            
            ArrayList<Sach> list =  new ArrayList<>();
            while(rs.next()) {
                list.add(new Sach(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
            return list;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public static boolean addBook(Sach sach) {
        sach.print();
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "INSERT INTO sach(ma,ten, gia, tacgia, theloai, danhgia, linkimage, ngaytao, xemtruoc) VALUES(1000,?,?,?,?,?,?,current_date(),?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sach.getTen());
            ps.setFloat(2, sach.getGia());
            ps.setString(3, sach.getTacgia());
            ps.setString(4, sach.getTheloai());
            ps.setInt(5, 5);
            ps.setString(6, sach.getLinkImage());
            ps.setString(7, sach.getXemtruoc());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SachDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
