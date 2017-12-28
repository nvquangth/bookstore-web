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
public class Khachhang {
    private int ma;
    private String username;
    private String password;
    private String fullname;

    public Khachhang(String username, String password, String fullname) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
    }

    public Khachhang(int ma, String username, String password, String fullname) {
        this.ma = ma;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
    }

    public int getMa() {
        return ma;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getFullname() {
        return fullname;
    }
    
    public void print() {
        System.out.println("username: " + username);
        System.out.println("password: " + password);
        System.out.println("fullname: " + fullname);
    }
    
}
