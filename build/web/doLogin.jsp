<%-- 
    Document   : doLogin
    Created on : Dec 5, 2017, 10:48:48 AM
    Author     : NVQuang
--%>

<%@page import="control.KhachhangDAO"%>
<%@page import="model.Khachhang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Khachhang khachhang = KhachhangDAO.checkLogin(username, password);
    if (khachhang != null) {
        session.setAttribute("khachhang", khachhang);
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("login.jsp");
    }
%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>-->
