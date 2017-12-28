<%-- 
    Document   : addBookToCart
    Created on : Dec 12, 2017, 9:27:24 PM
    Author     : NVQuang
--%>

<%@page import="control.KhachhangDAO"%>
<%@page import="model.Sach"%>
<%@page import="model.Giohang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int soluong = Integer.parseInt(request.getParameter("soluong"));
            Giohang giohang = (Giohang) session.getAttribute("cart");
            Sach sach = (Sach) session.getAttribute("sach");
            System.out.println("ma sach: " + sach.getMa());
            System.out.println("ma gio hang: " + giohang.getMa());
            KhachhangDAO.addBookToCart(giohang, sach, soluong);
            System.out.println("Add thanh cong");
            response.sendRedirect("index.jsp");
        %>
        <h1>Đã thêm sách vào giỏ hàng</h1>
    </body>
</html>
