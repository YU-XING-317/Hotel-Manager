<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Travelers Check In</title>
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
</head>
<body style="align:center;background-color:#EEEEEE;">
<h1 style="text-align:center">旅客信息管理系统</h1>
<div align="center" class="main">旅客退房<br>
    <hr style="background-color:black;">
    <form method="post" action="${pageContext.request.contextPath}/check.let?type=out">
        <p>I_D:<input type="text" size="25" name="cid"></p>
        <p><input type="submit" value="确认" name="submit"></p>
    </form>
</div>
</body>
</html>
