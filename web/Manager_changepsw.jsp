<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!--管理员密码修改-->
<head>
<meta charset="UTF-8">
<title>管理员密码修改</title>
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
<div align="center" class="main">管理员密码修改<br>
    <hr style="background-color:black;">
    <form method="post" action="${pageContext.request.contextPath}/man.let?type=change">
        <p>输入账号:<input type="text" size="25" name="name"></p>
        <p>旧的密码:<input type="password" size="25" name="password"></p>
        <p>新的密码:<input type="password" size="25" name="newpwd"></p>
        <p><input type="submit" value="修改" name="submit"></p>
    </form>
</div>
</body>
</html>