/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

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
public class GiohangDAO {
    public static Connection con;
    
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
    
    public static boolean createCartEmpty(Khachhang khachhang) {
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
    
    public static boolean addBookToCart(Giohang giohang) {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "INSERT INTO giohang(ma, makhachhang, masach) VALUES(?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, giohang.getMa());
            ps.setInt(2, giohang.getKhachhang().getMa());
            ps.setInt(3, giohang.getListSach().get(giohang.getListSach().size() - 1).getMa());
            ps.executeUpdate();
            
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public static boolean addBookToCart2(Giohang giohang) {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "UPDATE giohang SET masach = ? WHERE ma = ? AND makhachhang = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, giohang.getListSach().get(giohang.getListSach().size() - 1).getMa());
            ps.setInt(2, giohang.getMa());
            ps.setInt(3, giohang.getKhachhang().getMa());
            ps.executeUpdate();
            
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
}
