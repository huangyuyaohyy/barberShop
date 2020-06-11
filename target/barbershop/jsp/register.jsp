<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/10 0010
  Time: 16:36
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
    <title>注册界面</title>
    <link rel="stylesheet" href="css/register.css">

    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/member.js"></script>

</head>

<body>
<div class="heading">
    <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
        <h1>yq专业美发会员注册</h1>
    </div>

</div>
<div class="content">
    <form id="form">

        <div class="item">

            <div class="inline">
                姓名<input type="text" name="memberName" id="memberName" required  placeholder="请输入姓名"  class="input" >

                <span class="red">*</span></div>
        </div>
        <div class="item">

            <div class="inline">
                密码<input type="password" id="password" name="password" required  placeholder="请输入密码" autocomplete="off" class="input">

                <span class="red"  >*</span> </div>
        </div>
        <div class="item">

            <div class="inline l">
                确认密码<input type="password" id="password_again" name="password_again" required  placeholder="请输入密码" autocomplete="off" class="input" >

                <span class="red"  >*</span> </div>
        </div>
        <div class="item">

            <div class="inline">
                电话 <input type="text" id="tel" name="tel" required  placeholder="请输入电话" autocomplete="off" class="input">

                <span class="red" >*</span></div>
        </div>
        <div class="item">

            <div class="layui-input-inline">
                地址<input type="text" id="address" name="address"   placeholder="请输入地址" autocomplete="off" class="input">
            </div>
        </div>
        <div class="item">

            <div class="inline"> 性别 &nbsp&nbsp
                男<input class="c" type="radio" name="gender" value="男" title="男"  checked>

                女<input class="c" type="radio" name="gender" value="女" title="女" >
            </div>
        </div>
        <div class="item">
            <div class="inline">

                <div class="inline">
                    出生日期<input required type="date" id="birth" class="input"  name="birth" placeholder="yyyy-MM-dd">
                    <span class="red" >*</span></div>
            </div>
        </div>

        <div class="item">
            <div class="inline">
                <input type="button" class="btn"  value="注册" id="member_add" />
                <a  href="jsp/member_login.jsp" >返回登录</a>
            </div>
        </div>

    </form>
</div>

<script>
    var again=document.querySelector("#password_again");
    again.addEventListener("blur",function (evt) {
        var password=document.getElementById("password").value;
        var password_again=document.getElementById("password_again").value;
        if(password!=password_again){
            document.getElementById("password_again").value="";
            window.alert("密码不一致！");
        }
    })
    // 判断密码输入是否一致

</script>
</body>
<%out.flush();%>
</html>
