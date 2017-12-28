/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import control.KhachhangDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Giohang;
import model.Sach;

/**
 *
 * @author NVQuang
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int soluong = Integer.parseInt(request.getParameter("soluong"));
        Giohang giohang = (Giohang) session.getAttribute("cart");
        Sach sach = (Sach) session.getAttribute("sach");
        System.out.println("ma sach: " + sach.getMa());
        System.out.println("ma gio hang: " + giohang.getMa());
        KhachhangDAO.addBookToCart(giohang, sach, soluong);
        System.out.println("Add thanh cong");
        response.sendRedirect("index.jsp");
    }

}
