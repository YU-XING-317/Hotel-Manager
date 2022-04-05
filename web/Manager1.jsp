<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!--管理员成员添加-->
<head>
<meta charset="UTF-8">
<title>增添管理员</title>
</head>
<style type="text/css">
a:hover 
{
color:yellow;
text-decoration:none;
}
body
{ 

   background-image:url("m.jpg");
   background-position:50% 10%;
   background-size:contain;
   background-repeat:no-repeat;
   background-size:cover;
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
<body background="m.jpg" style="align:center">
<h1 style="text-align:center">旅客信息管理系统</h1>
<div align="center" class="main">增添管理员<br>
<hr style="background-color:black;">
<form action="check1.jsp" method="post" name="manager1">
<p>输入账号:<input type="text" size="25" name="username"></p>
<p>输入密码:<input type="password" size="25" name="userpassword"><br></p>
<p>确认密码:<input type="password" size="25" name="userpassword1"></p>
<p><input type="submit" value="增添" name="submit"></p>
</form>
</div>
</body>
</html>