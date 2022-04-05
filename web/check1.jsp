<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %> 
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!--管理员注册检测-->
<head>
<meta charset="UTF-8">
<title>check1</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("username");
String pwd=request.getParameter("userpassword");
String pwd1=request.getParameter("userpassword1");
if(name==""||pwd==""||pwd1=="")
{
	out.print("<script>alert('账号或密码输入不能为空');</script>");
	response.setHeader("Refresh", "0.1;url=Manager1.jsp");
	return;
}
if(pwd1.equals(pwd))
{
    Connection conn = null;
    Statement stmt = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/hotel_m?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
    String username = "root";
	String password = "020317";
	conn = DriverManager.getConnection(url, username, password);
	stmt=conn.createStatement();
	ResultSet rs = stmt.executeQuery("select *from Manager where name ='" + name + "' ");
	if(rs.next())
	{
		out.print("<script>alert('用户以存在，添加失败请重试');</script>");
		response.setHeader("Refresh", "0.1;url=Manager1.jsp");
        return;
	}
	else
	{
	stmt=conn.createStatement();
	String sql="insert into Manager(name,passw) value ('"+name+"','"+pwd+"')";
	if(stmt.executeUpdate(sql)!=0)
	{
	out.print("<script>alert('添加成功');</script>");
	response.setHeader("Refresh", "0.1;url=Manager1.jsp");
    return;
	}
	}
}
else
{
	out.print("<script>alert('两次密码输入不一致，请重试');</script>");
	response.setHeader("Refresh", "0.5;url=Manager1.jsp");
    return;
}
%>
</body>
</html>