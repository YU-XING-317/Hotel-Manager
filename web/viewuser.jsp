<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!--查看用户-->
<head>
<meta charset="UTF-8">
<title>查看用户</title>
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
request.setCharacterEncoding("utf-8");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/hotel_m?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true&characterEncoding=utf8";
String username = "root";
String password = "020317";
conn = DriverManager.getConnection(url, username, password);
stmt=conn.createStatement();
rs = stmt.executeQuery("select *from Client");
%>
<h1 style="text-align:center">旅客信息管理系统</h1>
<div align="center" class="main">查看旅客<br>
<hr style="background-color:black;">
<h4 style="text-align:center">当前在库用户</h4>
<%
int i=1;
while(rs.next())
{
	out.print((i++)+". 姓名"+rs.getString("name")+"&nbsp;&nbsp;&nbsp;&nbsp;ID:"+rs.getInt("id")+"&nbsp;&nbsp;&nbsp;&nbsp;电话:"+rs.getString("tel")+"&nbsp;&nbsp;&nbsp;&nbsp;所选房型:"+rs.getString("type")+"&nbsp;&nbsp;&nbsp;&nbsp;房间号:"+rs.getInt("rid")+"<br>");
}
%>
</div>
</body>
</html>