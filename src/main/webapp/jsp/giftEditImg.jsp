<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/20 0020
  Time: 16:41
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
    <title>修改礼品图片</title>

    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/gift.js"></script>

    <link rel="stylesheet" href="css/style.css">
    <style>
        .c{
            width: 400px;
            margin: 0 auto;
        }

        span{
            line-height: 25px;
            font-size: 14px;
        }

        *{color: #888888;}
        form{padding-top: 50px;}

        .input{
            margin-left: 10px;
            width: 180px;
            height: 38px;
            border-width: 1px;
            border-style: solid;
            background-color:   #fff;
            border-radius: 2px;}
    </style>
</head>

<body>
<nav> 首页 &gt; 礼品管理  &gt;  礼品信息 &gt;修改图片
</nav>
<form class="c" action="gifts/saveImg" method="post" enctype="multipart/form-data">
    <div class="inline"> <span>选择图片:</span><input type="file" required name="upload"  accept="image/*" /></div>

    <span>礼品id：</span><input class="input" readonly="readonly" name="giftId" value="${gift.giftId}"></label>
    <p><span>名称：</span>${gift.giftName}</p>
    <p><span>剩余数量：</span>${gift.num}</p>
    <p><span>介绍：</span>${gift.introduce}</p>
    <p><span>需要积分：</span>${gift.exchangePoint}</p>

    <input type="submit" class="btn" value="确定上传" />
</form>
</body>
</html>
