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
public class Sach {
    private int ma;
    private String ten;
    private float gia;
    private String tacgia;
    private String theloai;
    private int danhgia;
    private String linkImage;
    private String ngaytao;
    private String xemtruoc;
    
    public void print() {
        System.out.println(ten);
        System.out.println(gia);
        System.out.println(tacgia);
        System.out.println(theloai);
        System.out.println(linkImage);
        System.out.println(xemtruoc);
    }

    public Sach() {
    }

    public Sach(int ma, String ten, float gia, String tacgia, String theloai, int danhgia, String linkImage, String ngaytao, String xemtruoc) {
        this.ma = ma;
        this.ten = ten;
        this.gia = gia;
        this.tacgia = tacgia;
        this.theloai = theloai;
        this.danhgia = danhgia;
        this.linkImage = linkImage;
        this.ngaytao = ngaytao;
        this.xemtruoc = xemtruoc;
    }

    public Sach(String ten, float gia, String tacgia, String theloai, int danhgia, String linkImage, String ngaytao, String xemtruoc) {
        this.ten = ten;
        this.gia = gia;
        this.tacgia = tacgia;
        this.theloai = theloai;
        this.danhgia = danhgia;
        this.linkImage = linkImage;
        this.ngaytao = ngaytao;
        this.xemtruoc = xemtruoc;
    }
    
    public Sach(String ten, float gia, String tacgia, String theloai, String linkImage, String xemtruoc) {
        this.ten = ten;
        this.gia = gia;
        this.tacgia = tacgia;
        this.theloai = theloai;
        this.linkImage = linkImage;
        this.xemtruoc = xemtruoc;
    }

    public Sach(String ten, float gia, String tacgia, String theloai) {
        this.ten = ten;
        this.gia = gia;
        this.tacgia = tacgia;
        this.theloai = theloai;
    }
    
    public Sach(String ten, float gia) {
        this.ten = ten;
        this.gia = gia;
    }

    public int getMa() {
        return ma;
    }

    public void setMa(int ma) {
        this.ma = ma;
    }

    public String getTen() {
        return ten;
    }
    
    public String getNgaytao() {
        return ngaytao;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public float getGia() {
        return gia;
    }

    public void setGia(float gia) {
        this.gia = gia;
    }

    public String getTacgia() {
        return tacgia;
    }

    public void setTacgia(String tacgia) {
        this.tacgia = tacgia;
    }

    public String getTheloai() {
        return theloai;
    }

    public void setTheloai(String theloai) {
        this.theloai = theloai;
    }

    public int getDanhgia() {
        return danhgia;
    }

    public void setDanhgia(int danhgia) {
        this.danhgia = danhgia;
    }

    public String getLinkImage() {
        return linkImage;
    }

    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }
    
    public void setNgaytao(String ngaytao) {
        this.ngaytao = ngaytao;
    }
    
    public String getXemtruoc() {
        return xemtruoc;
    }
    
    public void setXemtruoc(String xemtruoc) {
        this.xemtruoc = xemtruoc;
    }
    
//    public void print() {
//        System.out.println("Ma: " + ma);
//        System.out.println("Ten: " + ten);
//        System.out.println("Gia: " + gia);
//        System.out.println("Tac gia: " + tacgia);
//        System.out.println("The loai: " + theloai);
//        System.out.println("Danh gia: " + danhgia);
//        System.out.println("Link anh: " + linkImage);
//        System.out.println("Ngay tao: " + ngaytao);
//        System.out.println("Xem truoc: " + xemtruoc);
//        System.out.println("");
//    }
    
}
