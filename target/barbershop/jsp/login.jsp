<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/7 0007
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>登陆</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>管理员版</h1>

            <form class="form" action="managers/login" method="post">
                <input type="text" placeholder="Managername" name="manager_name">
                <input type="password" placeholder="Password" name="password" type="password">
                <button type="submit" id="login-button">登录</button>
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
    <span class="r">管理员版 <a href="jsp/member_login.jsp" target="_blank">用户版</a></span>
</div>
<script >
    if("${msg}"!=""){
        alert("${msg}");
        ${msg}="";}
</script>
</body>
<%out.flush();%>
</html>
