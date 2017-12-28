/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import static control.GiohangDAO.con;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Giohang;
import model.Khachhang;
import model.Sach;

/**
 *
 * @author NVQuang
 */
public class KhachhangDAO {
    public static Connection con;
    
    public static Khachhang checkLogin(String username, String password) {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "SELECT * FROM khachhang WHERE username = ? && password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                return new Khachhang(rs.getInt(4), rs.getString(1), rs.getString(2), rs.getString(3));
            }
            return null;
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public static boolean hasCart(Khachhang khachhang) {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "SELECT * FROM giohang WHERE makhachhang = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, khachhang.getMa());
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                return true;
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public static boolean createCart(Khachhang khachhang) {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "INSERT INTO giohang(ma, makhachhang) VALUES(null, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, khachhang.getMa());
            ps.executeUpdate();
            
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public static Giohang getGiohang(Khachhang khachhang) {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "SELECT * FROM giohang WHERE makhachhang = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, khachhang.getMa());
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                return new Giohang(rs.getInt(1), khachhang);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public static boolean addBookToCart(Giohang giohang, Sach sach, int soluong) {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "INSERT INTO sachmua(ma, masach, magiohang, soluong, ngaymua) VALUES(null, ?, ?, ?, current_date())";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, sach.getMa());
            ps.setInt(2, giohang.getMa());
            ps.setInt(3, soluong);
            ps.executeUpdate();
            
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
