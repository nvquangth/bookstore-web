<%-- 
    Document   : thongke
    Created on : Dec 15, 2017, 2:26:11 PM
    Author     : NVQuang
--%>

<%@page import="control.SachMuaDAO"%>
<%@page import="model.SachMua"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê</title>
        <link rel="stylesheet" type="text/css" href="./css/style_thongke.css">
        <style type="text/css">
            h1
            {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<SachMua> list = new ArrayList<>();
            String s = request.getParameter("ngaymua");
            if (s != null && s.isEmpty() == false) {
                session.setAttribute("ngay", s);
                System.out.println("Ngay mua: " + s);
                list = SachMuaDAO.getSachMuaTheoNgay(s);
                if (list != null) {
                    session.setAttribute("thongke_ngay", list);
                }
            }
        %>

        <h1>Thống kê</h1>

        <form>
            <input type="date" name="ngaymua">
            <input type="submit" value="Xem">
        </form>

        <%
            if (s != null && s.isEmpty() == false) {
        %>
        <h3>Ngày: <%=s%></h3>
        <%}%>

        <div id="tbl-thongke">
            <table>
                <tr>
                    <th>Tên</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
                <%
                    int soluong = 0;
                    float tongtien = 0;
                    for (SachMua sm : list) {
                        soluong = soluong + sm.getSoluong();
                        tongtien = tongtien + sm.getSach().getGia() * sm.getSoluong();
                %>
                <tr>
                    <td><%=sm.getSach().getTen()%></td>
                    <td><%=sm.getSach().getGia()%></td>
                    <td><%=sm.getSoluong()%></td>
                    <td><%=sm.getSach().getGia() * sm.getSoluong()%></td>
                </tr>
                <%}%>
                <tr>
                    <th colspan="2">Tổng</th>
                    <th><%=soluong%></th>
                    <th><%=tongtien%></th>
                </tr>
            </table>
        </div>
        <form action="exporttoexcel_thongke.jsp">
            <p style="text-align: center"><input type="submit" value = "In hoa don"></p>
        </form>


    </body>
</html>
