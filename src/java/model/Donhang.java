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
public class Donhang {
    private int ma;
    private Khachhang khachhang;
    private Giohang giohang;

    public Donhang(int ma, Khachhang khachhang, Giohang giohang) {
        this.ma = ma;
        this.khachhang = khachhang;
        this.giohang = giohang;
    }

    public int getMa() {
        return ma;
    }

    public void setMa(int ma) {
        this.ma = ma;
    }

    public Khachhang getKhachhang() {
        return khachhang;
    }

    public void setKhachhang(Khachhang khachhang) {
        this.khachhang = khachhang;
    }

    public Giohang getGiohang() {
        return giohang;
    }

    public void setGiohang(Giohang giohang) {
        this.giohang = giohang;
    }
}
