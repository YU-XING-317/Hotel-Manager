<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!--后台登陆界面-->
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<style type="text/css">
    a:hover
    {
        color:yellow;
        text-decoration:none;
    }
    .main
    {
        text-align: center;
        border-radius: 20px;
        width: 600px;
        height: 350px;
        margin: auto;
        position: absolute;
        top: 0;
        left:0;
        right: 0;
        bottom: 0;
    }
</style>
<body style="align:center;background-color:#EEEEEE;">
<h1 style="text-align:center">旅客信息管理系统</h1>
<div align="center" class="main">管理员登录<br>
    <hr style="background-color:black;">
    <form id="login" method="post" action="${pageContext.request.contextPath}/man.let?type=login">
        <p>账号:<input type="text" size="25" name="name"></p>
        <p>密码:<input type="password" size="25" name="passw"><br></p>
        <p><input type="submit" value="确认" name="submit"></p>
    </form>
</div>
</body>
</html>