<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/13 0013
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>yq理发店</title>
    <link rel="stylesheet" href="css/user.css">
    <script src="js/jquery-2.1.1.min.js"></script>
</head>

<body>
<div class="container">

    <div class="heading">
        <div class="heading_nav">
            <div class="heading_tittle"> YQ理发店</div>
            <div class="menu">
                <ul>
                    <li><a href="jsp/user_start.jsp" target="content_iframe">首页</a> </li>
                    <li><a  href="members/pointShop?memberName=${member_name}" target="content_iframe">积分商城</a> </li>
                    <li><a  href="barbers/barberIntroduce" target="content_iframe">门店信息</a> </li>
                    <li><a  href="members/information?memberName=${member_name}" target="content_iframe">个人信息</a> </li>
                    <li><a  href="jsp/aboutUs.jsp" target="content_iframe">关于我们</a> </li>
                </ul>
            </div>
            <div class="heading_img" >
                <img src="image/20170326161532_aGteC.jpeg" width="26px" height="26px" style=" border-radius: 30px;float: right;">
                <span style=" float: right;color: #ff896e;" id="member_name">${member_name},欢迎您！</span>
            </div>
        </div>
    </div>

    <div class="content">

        <div class="content_body" >
            <iframe id="test" class="iframe"  scrolling="no" frameborder="0" src="jsp/user_start.jsp" style="width:100%;height:100%;"  name="content_iframe"></iframe>

        </div>
    </div>


</div>
<script>

    // 计算页面的实际高度，iframe自适应会用到

    function calcPageHeight(doc) {

        var cHeight = Math.max(doc.body.clientHeight, doc.documentElement.clientHeight)

        var sHeight = Math.max(doc.body.scrollHeight, doc.documentElement.scrollHeight)

        var height  = Math.max(cHeight, sHeight)

        return height

    }

    //根据ID获取iframe对象

    var ifr = document.getElementById('test')

    ifr.onload = function() {

        //解决打开高度太高的页面后再打开高度较小页面滚动条不收缩

        ifr.style.height='0px';

        var iDoc = ifr.contentDocument || ifr.document

        var height = calcPageHeight(iDoc)

        if(height < 850){

            height = 850;

        }

        ifr.style.height = height + 'px'

    }

</script>
</body>
<%out.flush();%>
</html>
