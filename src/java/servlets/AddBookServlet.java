/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import control.SachDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Sach;

/**
 *
 * @author NVQuang
 */
@WebServlet(name = "AddBookServlet", urlPatterns = {"/AddBookServlet"})
public class AddBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tensach = request.getParameter("tensach");
        String sgia = request.getParameter("gia");
        String tacgia = request.getParameter("tacgia");
        String theloai = request.getParameter("theloai");
        String linkanh = request.getParameter("linkanh");
        String xemtruoc = request.getParameter("xemtruoc");
//        float gia = Float.parseFloat(sgia);
        float gia = 10;
        
        boolean b = SachDAO.addBook(new Sach(tensach, gia, tacgia, theloai, linkanh, xemtruoc));
        System.out.println("Result: " + b);
        response.sendRedirect("admin.jsp");
    }
}
