<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!--管理员成员删除-->
<head>
<meta charset="UTF-8">
<title>管理员删除</title>
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
<%

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/hotel_m?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
String username = "root";  
String password = "020317";
Connection conn = DriverManager.getConnection(url, username, password);
request.setCharacterEncoding("utf-8");
String sql="select *from Manager";
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
<h1 style="text-align:center">旅客信息管理系统</h1>
<div align="center" class="main">删除管理员<br>
<hr style="background-color:black;">
<%
    out.print("当前在库的管理员:"+"<br>");
    int i=1;
    while(rs.next())
    {
    	out.print((i++)+"."+rs.getString("name")+"<br>");
    }
%>
<form action="check2.jsp" method="post" name="manager2">
<p>请填写你想删除的管理员账号：
<input type="text" size="25" name="username"></p>
<p><input type="submit" value="删除" name="submit"></p>
</form>
</div>
</body>
</html>