<%-- 
    Document   : login
    Created on : Dec 5, 2017, 9:50:00 AM
    Author     : NVQuang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link rel="stylesheet" type="text/css" href="./css/loginstyle.css">
    </head>
    <body>
        <div class="login">
            <h1>Đăng nhập </h1>
            <form method="post" action="LoginServlet">
                <p><input type="text" name="username" value="" placeholder="Tên đăng nhập"></p>
                <p><input type="password" name="password" value="" placeholder="Mật khẩu"></p>
                <p class="submit"><input type="submit" name="commit" value="Đăng nhập"></p>
            </form>
        </div>
    </body>
</html>
