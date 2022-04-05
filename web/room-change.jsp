<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!--换房-->
<head>
<meta charset="UTF-8">
<title>换房</title>
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
String sql="select *from Client";
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
<a href="home.jsp">返回主页</a>
<h1 style="text-align:center">旅客信息管理系统</h1>
<div align="center" class="main">换房<br>
<hr style="background-color:black;">
<h4 style="text-align:center">当前在库用户</h4>
<%
    int i=1;
    while(rs.next())
    {
    	out.print((i++)+". ID:"+rs.getInt("id")+"&nbsp;&nbsp;&nbsp;&nbsp;所选房型:"+rs.getString("type")+"&nbsp;&nbsp;&nbsp;&nbsp;房间号:"+rs.getInt("rid")+"<br>");
    }
%>
<h4 style="text-align:center">当前各类型房间剩余情况</h4>
<%
Statement stmt1 = conn.createStatement();
ResultSet rs1 = stmt1.executeQuery("select *from Room");
int flag=0;
out.print("1.单人间:");
while(rs1.next())
{
	if(rs1.getInt("state")==1&&rs1.getString("type").equals("单人间"))
	{
		++flag;
		out.print(" "+rs1.getInt("id"));
	}
}
if(flag==0)
{
	out.print("无");
}
flag=0;
out.print("<br>"+"2.双人间:");
Statement stmt2 = conn.createStatement();
ResultSet rs2 = stmt2.executeQuery("select *from Room");
while(rs2.next())
{
	if(rs2.getInt("state")==1&&rs2.getString("type").equals("双人间"))
	{
		++flag;
		out.print(" "+rs2.getInt("id"));
	}
}
if(flag==0)
{
	out.print("无");
}
flag=0;
out.print("<br>"+"3.三人间:");
Statement stmt3 = conn.createStatement();
ResultSet rs3 = stmt3.executeQuery("select *from Room");
while(rs3.next())
{
	if(rs3.getInt("state")==1&&rs3.getString("type").equals("三人间"))
	{
		++flag;
		out.print(" "+rs3.getInt("id"));
	}
}
if(flag==0)
{
	out.print("无");
}
flag=0;
out.print("<br>"+"4.大床房:");
Statement stmt4 = conn.createStatement();
ResultSet rs4 = stmt4.executeQuery("select *from Room");
while(rs4.next())
{
	if(rs4.getInt("state")==1&&rs4.getString("type").equals("大床房"))
	{
		++flag;
		out.print(" "+rs4.getInt("id"));
	}
}
if(flag==0)
{
	out.print("无");
}
flag=0;
%>
<form action="check4.jsp" method="post" name="change">
<p>请输入要更换的对象的ID:
<input type="text" size="25" name="userid"></p>
<p>请选择当前的房间类型:
<select name="room1">
<option value="单人间" selected>单人间</option>
<option value="双人间">双人间</option>
<option value="三人间">三人间</option>
<option value="大床房">大床房</option>
</select></p>
<p>请输入当前的房间号:<input type="text" size="25" name="roomid1"></p>
<p>请选择要替换的房间类型:
<select name="room2">
<option value="单人间" selected>单人间</option>
<option value="双人间">双人间</option>
<option value="三人间">三人间</option>
<option value="大床房">大床房</option>
</select></p>
<p>请选择要替换的房间号:<input type="text" size="25" name="roomid2"></p>
<p><input type="submit" value="换房" name="submit"></p>
</form>
</div>
</body>
</html>