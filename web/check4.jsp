<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*" errorPage=""%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html><!--换房检测-->
<head>
<meta charset="UTF-8">
<title>check4</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String uid=request.getParameter("userid");
String type1=request.getParameter("room1");
String rid1=request.getParameter("roomid1");
String type2=request.getParameter("room2");
String rid2=request.getParameter("roomid2");
if(uid==""||rid1==""||rid2=="")
{
	out.print("<script>alert('ID和房间号不能为空');</script>");
	response.setHeader("Refresh", "0.1;url=room-change.jsp");
	return;
}
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
ResultSet rsn = null;
ResultSet rsm = null;
ResultSet rsb = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/hotel_m?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true&characterEncoding=utf8";
String username = "root";
String password = "020317";
conn = DriverManager.getConnection(url, username, password);
stmt=conn.createStatement();
rsn = stmt.executeQuery("select *from Client where id='"+uid+"' ");
if(!rsn.next())
{
	out.print("<script>alert('未找到指定用户!');</script>");
	response.setHeader("Refresh", "0.1;url=room-change.jsp");
    return;
}
rsm = stmt.executeQuery("select *from Room where type='"+type1+"' and id='"+rid1+"' ");
if(rsm.next()&&rsm.getInt("state")==1)
{
	out.print("<script>alert('你替换前的房间输入错误!');</script>");
	response.setHeader("Refresh", "0.1;url=room-change.jsp");
    return;
}
rsb = stmt.executeQuery("select *from Room where type='"+type2+"' and id='"+rid2+"' ");
if(rsb.next()&&rsb.getInt("state")!=1)
{
	out.print("<script>alert('替换失败，房间已被入住!');</script>");
	response.setHeader("Refresh", "0.1;url=room-change.jsp");
    return;
}
rs = stmt.executeQuery("select *from Client");
if(rs.next())
{
	int count=0,count1=0;
	String sql="update Client set type='"+type2+"' ,rid='"+rid2+"' where id='"+uid+"'";
	int rs1=stmt.executeUpdate(sql);
ResultSet rsa = null;
rsa = stmt.executeQuery("select *from Room");
if(rsa.next())
{
	String sqla="update Room set state='"+1+"' where type='"+type1+"' and id='"+rid1+"' ";
	String sqlb="update Room set state='"+0+"' where type='"+type2+"' and id='"+rid2+"' ";
	int rs2=stmt.executeUpdate(sqla);
	int rs3=stmt.executeUpdate(sqlb);
	if(rs2!=0&&rs3!=0)
		count++;
}
	if(rs1!=0&&count!=0)
	{
		out.print("<script>alert('修改成功!');</script>");
		response.setHeader("Refresh", "0.1;url=room-change.jsp");
	    return;
	}
}




%>
</body>
</html>