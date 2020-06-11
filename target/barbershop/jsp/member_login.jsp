<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/10 0010
  Time: 16:25
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
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>用户版</h1>

            <form class="form" action="members/login" method="post">
                <input type="text" placeholder="MemberName" name="member_name">
                <input type="password" placeholder="Password" name="password" >
                <button type="submit" id="login-button">登录</button>
                <br/><br/>
                <p><a href="jsp/register.jsp">注册</a></p>
            </form>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
    <h1>yq理发店管理系统</h1>
    <span class="r">用户版 <a href="#">管理员版</a></span>
</div>
<script >
    if("${msg}"!=""){
        alert("${msg}");
        ${msg}="";}
</script>
</body>
</html>
