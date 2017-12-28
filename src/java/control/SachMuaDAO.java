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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Giohang;
import model.Sach;
import model.SachMua;

/**
 *
 * @author NVQuang
 */
public class SachMuaDAO {

    public static Connection con;

    public static ArrayList<SachMua> getAll(Giohang giohang) {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "SELECT s.ten, s.tacgia, s.theloai, s.gia, SUM(sm.soluong) AS soluong\n"
                    + "FROM ql_bansach.sachmua sm, ql_bansach.sach s\n"
                    + "WHERE sm.masach = s.ma AND sm.magiohang = ?\n"
                    + "GROUP BY s.ten, s.tacgia, s.theloai, s.gia";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, giohang.getMa());
            ResultSet rs = ps.executeQuery();

            ArrayList<SachMua> list = new ArrayList<>();

            while (rs.next()) {
                Sach sach = new Sach(rs.getString(1), rs.getFloat(4), rs.getString(2), rs.getString(3));
                list.add(new SachMua(sach, rs.getInt(5), rs.getInt(5) * rs.getFloat(4)));
            }
            return list;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static ArrayList<SachMua> getSachMuaTheoNgay(String ngay) {
        try {
            con = ConnectionManager.getDBConnection();
            String sql = "SELECT s.ten, s.gia, SUM(sm.soluong) AS soluong, sm.ngaymua\n"
                    + "FROM ql_bansach.sachmua sm, ql_bansach.sach s\n"
                    + "WHERE ngaymua = STR_TO_DATE(?, '%Y-%m-%d') AND sm.masach = s.ma\n"
                    + "GROUP BY s.ten, s.gia";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ngay);
            ResultSet rs = ps.executeQuery();

            ArrayList<SachMua> list = new ArrayList<>();

            while (rs.next()) {
                list.add(new SachMua(new Sach(rs.getString(1), rs.getFloat(2)), rs.getInt(3), rs.getString(4)));
            }
            
            return list;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
