<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!--查看房间-->
<head>
<meta charset="UTF-8">
<title>查看房间</title>
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
.mytable
{
   width:500px;
   height:800px;
   margin:0 auto;
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
rs = stmt.executeQuery("select *from Room");
%>
<h1 style="text-align:center">旅客信息管理系统</h1>
<div align="center" class="main">查看房间<br>
<hr style="background-color:black;">
<h4 style="text-align:center">当前房间入住情况</h4>
<table border="1" class="mytable" style="text-align:center">
<tr>
<th rowspan="5">单人间</th>   
<td>101</td>   
<td>
<%
rs = stmt.executeQuery("select *from Room where type='单人间' and id='101' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>         
</tr>
<tr>                       
<td>102</td>   
<td>
<%
rs = stmt.executeQuery("select *from Room where type='单人间' and id='102' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>    
</tr>
<tr>                      
<td>103</td>   
<td>
<%
rs = stmt.executeQuery("select *from Room where type='单人间' and id='103' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td> 
</tr>
<tr>                      
<td>104</td> 
<td>
<%
rs = stmt.executeQuery("select *from Room where type='单人间' and id='104' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>   
</tr>
<tr>                      
<td>105</td> 
<td>
<%
rs = stmt.executeQuery("select *from Room where type='单人间' and id='105' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>   
</tr>

<tr>
<th rowspan="5">双人间</th>   
<td>201</td>
<td>
<%
rs = stmt.executeQuery("select *from Room where type='双人间' and id='201' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>             
</tr>
<tr>                       
<td>202</td>  
<td>
<%
rs = stmt.executeQuery("select *from Room where type='双人间' and id='202' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>      
</tr>
<tr>                      
<td>203</td>  
<td>
<%
rs = stmt.executeQuery("select *from Room where type='双人间' and id='203' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td> 
</tr>
<tr>                      
<td>204</td>   
<td>
<%
rs = stmt.executeQuery("select *from Room where type='双人间' and id='204' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>
</tr>
<tr>                      
<td>205</td> 
<td>
<%
rs = stmt.executeQuery("select *from Room where type='双人间' and id='205' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>  
</tr>

<tr>
<th rowspan="5">三人间</th>   
<td>301</td>
<td>
<%
rs = stmt.executeQuery("select *from Room where type='三人间' and id='301' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>            
</tr>
<tr>                       
<td>302</td> 
<td>
<%
rs = stmt.executeQuery("select *from Room where type='三人间' and id='302' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>          
</tr>
<tr>                      
<td>303</td> 
<td>
<%
rs = stmt.executeQuery("select *from Room where type='三人间' and id='303' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>     
</tr>
<tr>                      
<td>304</td> 
<td>
<%
rs = stmt.executeQuery("select *from Room where type='三人间' and id='304' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>     
</tr>
<tr>                      
<td>305</td>  
<td>
<%
rs = stmt.executeQuery("select *from Room where type='三人间' and id='305' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>    
</tr>

<tr>
<th rowspan="5">大床房</th>   
<td>401</td>  
<td>
<%
rs = stmt.executeQuery("select *from Room where type='大床房' and id='401' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>           
</tr>
<tr>                       
<td>402</td>
<td>
<%
rs = stmt.executeQuery("select *from Room where type='大床房' and id='402' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>         
</tr>
<tr>                      
<td>403</td>  
<td>
<%
rs = stmt.executeQuery("select *from Room where type='大床房' and id='403' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>  
</tr>
<tr>                      
<td>404</td>  
<td>
<%
rs = stmt.executeQuery("select *from Room where type='大床房' and id='404' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>  
</tr>
<tr>                      
<td>405</td> 
<td>
<%
rs = stmt.executeQuery("select *from Room where type='大床房' and id='405' ");
if(rs.next()&&rs.getInt("state")==1)
	  out.print("空闲中");
else
	  out.print("入住中");
%>
</td>   
</tr>

</table>
</div>
</body>
</html>