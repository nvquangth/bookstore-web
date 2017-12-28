/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author NVQuang
 */
public class Giohang {
    private int ma;
    private ArrayList<SachMua> listSach;
    private Khachhang khachhang;

    public Giohang(int ma) {
        this.ma = ma;
    }
    
    public Giohang(int ma, Khachhang khachhang) {
        this.ma = ma;
        this.khachhang = khachhang;
    }

    public Giohang(int ma, ArrayList<SachMua> listSach, Khachhang khachhang) {
        this.ma = ma;
        this.listSach = listSach;
        this.khachhang = khachhang;
    }

    public int getMa() {
        return ma;
    }

    public void setMa(int ma) {
        this.ma = ma;
    }

    public ArrayList<SachMua> getListSach() {
        return listSach;
    }

    public void setListSach(ArrayList<SachMua> listSach) {
        this.listSach = listSach;
    }

    public Khachhang getKhachhang() {
        return khachhang;
    }

    public void setKhachhang(Khachhang khachhang) {
        this.khachhang = khachhang;
    }
    
}
