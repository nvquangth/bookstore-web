<%-- 
    Document   : index
    Created on : Nov 23, 2017, 9:22:19 PM
    Author     : NVQuang
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="control.KhachhangDAO"%>
<%@page import="model.Giohang"%>
<%@page import="control.GiohangDAO"%>
<%@page import="model.Khachhang"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="util.DateUtil"%>
<%@page import="control.SachDAO"%>
<%@page import="model.Sach"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Quan ly ban sach</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="./css/style.css">

    </head>

    <body>
        <%
            Khachhang khachhang = (Khachhang) session.getAttribute("khachhang");
            Giohang giohang = null;
            // Tu dong tao 1 gio hang cho khach hang neu khach hang chuc co gio hang
            if (KhachhangDAO.hasCart(khachhang)) {
                giohang = KhachhangDAO.getGiohang(khachhang);
            } else {
                KhachhangDAO.createCart(khachhang);
                giohang = KhachhangDAO.getGiohang(khachhang);
            }

            ArrayList<Sach> list = new ArrayList<Sach>();
            list = SachDAO.getAll();
            if (list == null) {
                System.out.println("khong co sach");
            }
            Map<String, Sach> map = new HashMap<String, Sach>();
            for (Sach sach : list) {
                map.put("book" + sach.getMa(), sach);
            }
            session.setAttribute("listBook", list);
            session.setAttribute("mapBook", map);
            session.setAttribute("cart", giohang);

            String json = new Gson().toJson(list);
        %>

        <div id="container">
            <!--            <div class="top-header">
                            <p class="hotline">Hotline: 19001001</p>
                            <button class="dang-nhap">Đăng nhập</button> 
                            <button class="dang-ky">Đăng ký</button> 
                        </div>-->
            <header>
                <div class="header-content">
                    <div class="logo">
                        <img src="./image/logo.png">
                    </div>

                    <form class="form-search" action="SearchBookServlet" method="POST">
                        <input type="text" name="keyword" placeholder="Nhập tên sách">
                        <input type="submit">Tìm kiếm</button>
                    </form>

                    <div class="info-user">
                        <p><%=khachhang.getFullname()%></p>
                    </div>
                </div>

                <nav>
                    <a href="#">Trang chủ</a>
                    <a href="#">Giới thiệu</a>
                    <a href="#">Sản phẩm</a>
                    <a href="#">Dịch vụ</a>
                    <a href="#">Liên hệ</a>
                    <a href="checkisbn.html" target="_blank">check isbn</a>
                </nav>
            </header>

            <main>
                <aside class="side-bar">
                    <ul class="nav-side-bar">
                        <li class="filter-book-1">Tiểu thuyết</li>
                        <li class="filter-book-1">Tự truyện</li>
                        <li class="filter-book-1">Truyện ngắn</li>
                        <li class="filter-book-1">Sách Tiếng Anh</li>
                        <li class="filter-book-1">Nhật ký</li>
                        <li class="filter-book-1">Văn học</li>
                        <li class="filter-book-1">Kỹ năng</li>
                        <li class="filter-book-1">Kinh tế</li>
                        <li class="filter-book-1">Hồi ký</li>
                        <li class="filter-book-1">Nghệ thuật</li>
                        <li class="filter-book-1">Nghề nghiệp</li>
                        <li class="filter-book-1">Đời sống</li>
                    </ul>
                </aside>

                <aside class="side-bar-2">
                    <ul class="nav-side-bar-2">
                        <li class="filter-book-2">All</li>
                        <li class="filter-book-2">TOP 10</li>
                        <li class="filter-book-2">TOP 20</li>
                        <li class="filter-book-2">TOP 30</li>
                        <li class="filter-book-2">Giá tăng dần</li>
                        <li class="filter-book-2">Giá giảm dần</li>
                        <li class="filter-book-2">Sách mới</li>
                        <li class="filter-book-2">0-50k</li>
                        <li class="filter-book-2">50k-100k</li>
                        <li class="filter-book-2">100k-150k</li>
                        <li class="filter-book-2">Trên 150k</li>
                        <li class="filter-book-2">Noti</li>
                        <li class="filter-book-2">View1</li>
                        <li class="filter-book-2">View2</li>
                        <li class="filter-book-2">View3</li>
                    </ul>
                </aside>

                <div id="side-bar1">
                    <a href="thanhtoan.jsp"><img id="cart" src="image/cart5.png" /></a>
                </div>

                <div id="hoverCart">
                    <h4>Số sách có trong rỏ</h4>
                    <ul>
                        <li><p>Introduce Java : 100000</p></li>
                        <li><p>Lập trình web : 2000000</p></li>
                        <li><p>Tổng tiền : 3000000</p></li>
                    </ul>
                </div>

                <div class="main_right">
                    <div class="list-bookq">
                        <%
                            for (Sach sach : list) {
                                String s = "<img class='star-rate st_1' src='image/star-icon.png'>";
                                String rate = "";
                                for (int i = 1; i <= sach.getDanhgia(); i++) {
                                    rate = rate + s;
                                }
                                String sNewBook = "<img class='new-bookq' src='image/new-icon.png' >";

                                long n = DateUtil.getDateDiff(sach.getNgaytao());
                                if (n > 30) {
                                    sNewBook = "";
                                }
                        %>
                        <div class='bookq-container'>
                            <div class='bookq'>
                                <a href="DetailBook.jsp?bookid=book<%=sach.getMa()%>"><img class='photo-bookq' src='data/image/<%=sach.getLinkImage()%>' /></a>
                                <div class='info_book'>
                                    <p class='name-bookq'><%=sach.getTen()%></p>
                                    <p class='author-bookq'><%=sach.getTacgia()%></p>
                                    <p class='price-bookq'><%=sach.getGia()%></p>
                                    <p class='type-bookq'><%=sach.getTheloai()%></p>
                                    <%=sNewBook%>
                                    <div class='rate-bookq'>
                                        <%=rate%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="clear-fix"></div>
            </main>

            <footer>
                <div id="footer">
                    <div>
                        <ul id="links">
                            <li>
                                <h4>Nhà sách ABC</h4>
                                <ul>
                                    <li><a href="index.html">Chính sách bảo mật</a></li>
                                    <li><a href="index.html">Điều kiện mua hàng</a></li>
                                    <li><a href="index.html">Quy chế giao dịch</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4>Số điện thoại</h4>
                                <ul>
                                    <li><p>+84 2462635673</p></li>
                                    <li><p>+84 2462636238</p></li>
                                    <li><p>+84 5487980289</p></li>
                                </ul>
                            </li>
                            <li>
                                <h4>Địa chỉ</h4>
                                <ul>
                                    <li><p>65 Quang Trung Hà Đông Hà Nội</p></li>
                                    <li><p>123 Trần Phú Hà Đông Hà Nội</p></li>
                                    <li><p>835 Quân 1 Thành phố Hồ Chí Minh</p></li>
                                </ul>
                            </li>

                            <li>
                                <h4>Liên kết </h4>
                                <ul id="connect">
                                    <li><a href="http://twitter.com" target="_blank" class="twitter">Twitter</a></li>
                                    <li><a href="http://facebook.com" target="_blank" class="facebook">Facebook</a></li>
                                    <li><a href="http://google.com" target="_blank" class="googleplus">Google +</a></li>
                                </ul>
                            </li>
                        </ul>
                        <p class="footnote">
                            © Copyright 2017.NhasachABC
                        </p>
                    </div>
                </div>
            </footer>
        </div>
        <script type="text/javascript" src="./js/jquery.js"></script>
        <script>
            var obj;
            obj = JSON.parse('<%=json%>')
        </script>
        <script type="text/javascript" src="./js/app.js"></script>
        <!--<script type="text/javascript" src="./js/app2.js"></script>-->
    </body>

</html>
