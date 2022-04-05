<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html >
<html>
<head>
    <script src="./Js/prototype.lite.js" type="text/javascript"></script>
    <script src="./Js/moo.fx.js" type="text/javascript"></script>
    <script src="./Js/moo.fx.pack.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript">
        window.onload = function () {
            var contents = document.getElementsByClassName('content');
            var toggles = document.getElementsByClassName('type');

            var myAccordion = new fx.Accordion(
            toggles, contents, {opacity: true, duration: 400}
            );
            myAccordion.showThisHideOpen(contents[0]);
            for(var i=0; i<document .getElementsByTagName("a").length; i++){
                var dl_a = document.getElementsByTagName("a")[i];
                    dl_a.onfocus=function(){
                        this.blur();
                    }
            }
        }
    </script>
</head>

<body>
    <table width="100%" height="200" border="0" cellpadding="0" cellspacing="0" >
        <tr>
            <td width="182" valign="top">
                <div id="container">
                    <h1 class="type"><a href="javascript:void(0)">旅客管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
                        <ul class="RM">
                            <li><a href="./checkin.jsp" target="main">旅客入住</a></li>
                            <li><a href="./viewuser.jsp" target="main">查看旅客</a></li>
                            <li><a href="./checkout.jsp" target="main">旅客退房</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">房间管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
                        <ul class="RM">
                            <li><a href="./viewroom.jsp" target="main">房间余量</a></li>
                            <li><a href="./room-change.jsp" target="main">旅客换房</a></li>
                        </ul>
                    </div>

                    <h1 class="type"><a href="javascript:void(0)">管理员设置</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
                        <ul class="RM">
                            <li><a href="Manager_changepsw.jsp" target="main">修改密码</a></li>
                            <li><a href="./Manager1.jsp" target="main">增加管理员</a></li>
                            <li><a href="./Manager2.jsp" target="main">删除管理员</a></li>
                        </ul>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
