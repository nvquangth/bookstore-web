<%-- 
    Document   : thanhtoan
    Created on : Dec 12, 2017, 9:00:25 AM
    Author     : NVQuang
--%>

<%@page import="control.SachMuaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SachMua"%>
<%@page import="model.Giohang"%>
<%@page import="model.Khachhang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thanh toan</title>
        <meta charset="utf-8">

        <link rel="stylesheet" type="text/css" href="./css/style_thanhtoan.css">
    </head>
    <body>
        <%
            Khachhang khachhang = (Khachhang) session.getAttribute("khachhang");
            Giohang giohang = (Giohang) session.getAttribute("cart");

            ArrayList<SachMua> list = new ArrayList<SachMua>();
            list = SachMuaDAO.getAll(giohang);

            session.setAttribute("sachmua", list);

        %>
        <div id = "container">
            <header>
                <div class="header-content">
                    <div class="logo">
                        <img src="./image/logo.png">
                    </div>

                    <form class="form-search">
                        <input type="text" name="keyword" placeholder="Nhập tên sách">
                        <button type="button">Tìm kiếm</button>
                    </form>

                    <div class="info-user">
                        <p><%=khachhang.getFullname()%></p>
                    </div>
                </div>

                <nav>
                    <a href="index.html">Trang chủ</a>
                    <a href="#">Giới thiệu</a>
                    <a href="#">Sản phẩm</a>
                    <a href="#">Dịch vụ</a>
                    <a href="#">Liên hệ</a>
                </nav>
            </header>

            <main>
                <h2 class="title-cart">Danh sách mặt hàng có trong giỏ</h2>
                <form action="exporttoexcel.jsp" method="POST">
                    <div id="tbl-cart">
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
                    </div>
                    <br>
                    <p style="text-align: center"><input type="submit" value = "In hoa don"></p>
                </form>
                <br>
                <!--<p style="text-align: center"><button id="btn-thanhtoan">Thanh toán</button></p>-->
            </main>
            <footer>
                <div id="footer">
                    <div>
                        <ul id="links">
                            <li>
                                <h4>Nhà sách ABC</h4>
                                <ul>
                                    <li>
                                        <a href="index.html">Chính sách bảo mật</a>
                                    </li>
                                    <li>
                                        <a href="index.html">Điều kiện mua hàng </a>
                                    </li>
                                    <li>
                                        <a href="index.html">Quy chế giao dịch</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <h4>Số điện thoại</h4>
                                <ul>
                                    <li>
                                        <p>+84 2462635673</p>
                                    </li>
                                    <li>
                                        <p>+84 2462636238</p>
                                    </li>
                                    <li>
                                        <p>+84 5487980289</p>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <h4>Địa chỉ</h4>
                                <ul>
                                    <li>
                                        <p>65 Quang Trung Hà Đông Hà Nội</p>
                                    </li>
                                    <li>
                                        <p>123 Trần Phú Hà Đông Hà Nội</p>
                                    </li>
                                    <li>
                                        <p>835 Quân 1 Thành phố Hồ Chí Minh</p>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <h4>Liên kết </h4>
                                <ul id="connect">
                                    <li>
                                        <a href="http://twitter.com" target="_blank" class="twitter">Twitter</a>
                                    </li>
                                    <li>
                                        <a href="http://facebook.com" target="_blank" class="facebook">Facebook</a>
                                    </li>
                                    <li>
                                        <a href="http://google.com" target="_blank" class="googleplus">Google +</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <!-- /#links -->
                        <p class="footnote">
                            © Copyright 2017.NhasachABC
                        </p>
                    </div>
                </div>
            </footer>
        </div>
        <script type="text/javascript" src="./js/jquery.js"></script>
    </body>
</html>
