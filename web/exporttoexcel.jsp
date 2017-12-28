<%-- 
    Document   : exporttoexcel
    Created on : Dec 12, 2017, 8:08:27 PM
    Author     : NVQuang
--%>

<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="model.Khachhang"%>
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
            ArrayList<SachMua> list = (ArrayList<SachMua>) session.getAttribute("sachmua");
            Khachhang khachhang = (Khachhang) session.getAttribute("khachhang");
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="+ "danhsachsachmua.xls");
//            response.setContentType("application/pdf");
//            response.setHeader("Content-disposition", "attachment; filename=" + "danhsachsachmua.pdf");
        %>

        <p>Khách hàng: <%=khachhang.getFullname()%></p>

        <table>
            <tr>
                <th>Tên</th>
                <th>Tác giả</th>
                <th>Thể loại</th>
                <th>Giá <br>(Nghìn đồng)</th>
                <th>Số lượng <br>(Quyển)</th>
                <th>Thành tiền <br>(Nghìn đồng)</th>

            </tr>
            <%
                int tongSoluong = 0;
                float tongTien = 0;
                for (SachMua sm : list) {
                    tongSoluong = tongSoluong + sm.getSoluong();
                    tongTien = tongTien + sm.getSoluong() * sm.getSach().getGia();
            %>
            <tr>
                <td><%=sm.getSach().getTen()%></td>
                <td><%=sm.getSach().getTacgia()%></td>
                <td><%=sm.getSach().getTheloai()%></td>
                <td><%=sm.getSach().getGia()%></td>
                <td><%=sm.getSoluong()%></td>
                <td><%=sm.getSoluong() * sm.getSach().getGia()%></td>
            </tr>
            <%}%>
            <tr>
                <th colspan="4">Tổng</th>
                <th><%=tongSoluong%></th>
                <th><%=tongTien%></th>
            </tr>
        </table>
    </body>
</html>
