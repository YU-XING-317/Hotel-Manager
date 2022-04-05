<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Travelers Check In</title>
    <script>
        //按房型选项添加价格
        function Addprice() {
            var selects = document.getElementById("rtype");
            var indexs = selects.selectedIndex;  //选中项的索引
            if(selects.options[indexs].value=="单人间")
                document.getElementById("rprice").value="100";
            else if(selects.options[indexs].value=="双人间")
                document.getElementById("rprice").value="160";
            else if(selects.options[indexs].value=="三人间")
                document.getElementById("rprice").value="200";
            else if(selects.options[indexs].value=="大床房")
                document.getElementById("rprice").value="125";
        }
    </script>
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
<div align="center" class="main">旅客入住<br>
    <hr style="background-color:black;">
    <form method="post" action="${pageContext.request.contextPath}/check.let?type=add">
        <p>I_D:<input type="text" size="25" name="cid"></p>
        <p>姓名:<input type="text" size="25" name="cname"><br></p>
        <p>电话:<input type="text" size="25" name="tel"><br></p>
        <p>房间:<select class="text" id="rtype" name="rtype" onchange="Addprice()">
                    <option value="0"></option>
                    <option value="单人间">单人间</option>
                    <option value="双人间">双人间</option>
                    <option value="三人间">三人间</option>
                    <option value="大床房">大床房</option>
                </select>
        <p>价格:<input type="text" size="25" id="rprice" name="rprice" disabled><br></p>
        <p>房号:<input type="text" size="25" name="rid"><br></p>
        <p><input type="submit" value="确认" name="submit"></p>
    </form>
</div>
</body>
</html>
