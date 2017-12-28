<%-- 
    Document   : exporttoexcel_thongke
    Created on : Dec 15, 2017, 3:48:39 PM
    Author     : NVQuang
--%>

<%@page import="model.SachMua"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String s = (String) session.getAttribute("ngay");
            System.out.println(s);
            ArrayList<SachMua> list = (ArrayList<SachMua>) session.getAttribute("thongke_ngay");
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="+ "thongke_ngay.xls");
        %>
        <h2>Ngày: <%=s%></h2>
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
    </body>
</html>
