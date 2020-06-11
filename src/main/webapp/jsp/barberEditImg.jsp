<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/14 0014
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>修改头像</title>

    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/barber.js"></script>

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
<nav> 首页 &gt; 门店管理  &gt;  理发师管理 &gt;修改头像
</nav>
<form class="c" action="barbers/saveImg" method="post" enctype="multipart/form-data">
    <div class="inline"> <span>上传头像:</span><input type="file" required name="upload"  accept="image/*" /></div>

    <label></label><span>理发师id：</span><input class="input" readonly="readonly" name="barberId" value="${barber.barberId}"></label>
    <p><span>姓名：</span>${barber.barberName}</p>
    <p><span>性别：</span>${barber.gender}</p>
    <p><span>年龄：</span>${barber.age}</p>
    <p><span>介绍：</span>${barber.introduce}</p>

    <input type="submit" class="btn" value="确定上传" />
</form>
</body>
</html>
