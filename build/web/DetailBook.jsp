<%-- 
    Document   : DetailBook.jsp
    Created on : Nov 23, 2017, 9:23:27 PM
    Author     : NVQuang
--%>

<%@page import="control.KhachhangDAO"%>
<%@page import="org.apache.tomcat.util.digester.ArrayStack"%>
<%@page import="control.GiohangDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Giohang"%>
<%@page import="model.Khachhang"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.Sach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Chi tiet</title>
        <meta charset="utf-8">

        <link rel="stylesheet" type="text/css" href="./css/cssdetailbook.css">
    </head>
    <body>
        <%

            String bookId = request.getParameter("bookid");

            HashMap<String, Sach> map = (HashMap<String, Sach>) session.getAttribute("mapBook");
            Sach sach = map.get(bookId);

            Khachhang khachhang = (Khachhang) session.getAttribute("khachhang");
            khachhang.print();

            Giohang giohang = (Giohang) session.getAttribute("cart");
            session.setAttribute("sach", sach);
        %>
        <div id = "container">
            <!--            <div class="top-header">
                            <p class="hotline">Hotline: 19001001</p>
                            <p class="dang-nhap">Đăng nhập</p>
                            <p class="dang-ky">Đăng ký</p>
                        </div>-->
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
                <form action="AddToCartServlet" method="POST">
                    <div id="content">
                        <p>Noi dung</p>
                        <img id = "imgdetail" src="data/image/<%=sach.getLinkImage()%>">
                    </div>
                    <div id="sidebar111">
                        <div class="bookkk">
                            <div class="book-information">
                                <h2 id="nameBook"><%=sach.getTen()%></h2>
                                <p id="authorBook">Tác giả: <%=sach.getTacgia()%></p>
                                <p id="priceBook">Giá: <%=sach.getGia()%></p>
                                <p id="typeBook">Thể loại: <%=sach.getTheloai()%></p>

                                <span>
                                    <input type="number" name="soluong" value="1">
                                    <input type="submit" value="AddToCart">
                                </span>
                                </p>

                                <p id="contentDetail">
                                    <%=sach.getXemtruoc()%>
                                </p>
                            </div>
                        </div>
                    </div>
                </form>
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
                <!-- /#footer -->
            </footer>
        </div>
        <script type="text/javascript" src="./js/jquery.js"></script>
        <script type="text/javascript">
                document.title = "<%=sach.getTen()%>";

        </script>
        <script type="text/javascript" src="./js/detailbook.js"></script>

    </body>
</html>
