<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!--管理员删除监测-->
<head>
<meta charset="UTF-8">
<title>check2</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("username");
if(name=="")
{
	out.print("<script>alert('输入为空!');</script>");
	response.setHeader("Refresh", "0.1;url=Manager2.jsp");
	return;
}
Connection conn = null;
PreparedStatement stmt = null;
Statement ps = null;
ResultSet rs1 = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/hotel_m?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
String username = "root";
String password = "020317";
conn = DriverManager.getConnection(url, username, password);
String sql="delete from Manager where name="+name+"";
String sql1="select *from Manager where name="+name+"";
ps = conn.createStatement();
rs1 = ps.executeQuery(sql1);
if(!rs1.next())
{
	out.print("<script>alert('输入错误!');</script>");
	response.setHeader("Refresh", "0.1;url=Manager2.jsp");
    return;
}
stmt=conn.prepareStatement(sql);
int rs = stmt.executeUpdate();
if(rs!=0)
{
	out.print("<script>alert('删除成功!');</script>");
	response.setHeader("Refresh", "0.1;url=Manager2.jsp");
    return;
}
%>
</body>
</html>