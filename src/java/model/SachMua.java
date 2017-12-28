/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author NVQuang
 */
public class SachMua {
    private int ma;
    private Sach sach;
    private int soluong;
    private float gia;
    private String ngaymua;

    public SachMua(int ma, Sach sach, int soluong) {
        this.ma = ma;
        this.sach = sach;
        this.soluong = soluong;
    }

    public SachMua(Sach sach, int soluong) {
        this.sach = sach;
        this.soluong = soluong;
    }

    public SachMua(Sach sach, int soluong, float gia) {
        this.sach = sach;
        this.soluong = soluong;
        this.gia = gia;
    }
    
    public SachMua(Sach sach, int soluong, String ngaymua) {
        this.sach = sach;
        this.soluong = soluong;
        this.ngaymua = ngaymua;
    }

    public float getGia() {
        return gia;
    }

    public void setGia(float gia) {
        this.gia = gia;
    }

    public int getMa() {
        return ma;
    }

    public void setMa(int ma) {
        this.ma = ma;
    }

    public Sach getSach() {
        return sach;
    }

    public void setSach(Sach sach) {
        this.sach = sach;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }
    
    public String getNgaymua() {
        return ngaymua;
    }
    
}
