<%-- 
    Document   : admin.jsp
    Created on : Nov 23, 2017, 9:32:10 PM
    Author     : NVQuang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản lý sách</title>
        <link rel="stylesheet" type="text/css" href="./css/style_admin.css">
        <meta charset="utf-8">

    </head>
    <body>
        <main>
            <section id="add-book">
                <h2>Thêm sách</h2>
                <div class="frm-info frm-input">
                    <form  id="frm-add-book" action="AddBookServlet" method="POST">
                        Tên sách <span>*</span> <br> 		
                        <input type="text" name="tensach" /><br>		

                        Giá <span>*</span> <br>
                        <input type="text" name="gia" /><br>

                        Tác giả <span>*</span> <br> 		
                        <input type="text" name="tacgia" /><br>		

                        Thể loại <span>*</span> <br>
                        <input type="text" name="theloai" /><br>

                        Link ảnh <span>*</span> <br>
                        <input type="text" name="linkanh" /><br>
                        
                        Xem trước <span>*</span><br>
                        <input type="text" name="xemtruoc"><br>
                        
                        <input type="submit" value ="Add">
                    </form>
                    <br>
                </div>
            </section>
        </main>
        <footer>

        </footer>
        <script type="text/javascript" src="./js/jquery.js"></script>
    </body>
</html>
