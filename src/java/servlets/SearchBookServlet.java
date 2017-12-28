/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import control.SachDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Sach;

/**
 *
 * @author NVQuang
 */
@WebServlet(name = "SearchBookServlet", urlPatterns = {"/SearchBookServlet"})
public class SearchBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String ten = request.getParameter("keyword");
        ArrayList<Sach> sachs = SachDAO.searchBook(ten);
        HttpSession session = request.getSession();
        session.setAttribute("listsearch", sachs);
        response.sendRedirect("index.jsp");
        
    }

}
