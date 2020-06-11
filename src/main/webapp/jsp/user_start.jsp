<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/20 0020
  Time: 14:37
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
    <title>首页</title>

    <script src="js/jquery-2.1.1.min.js"></script>


    <style>
        *{margin: 0px;}
        .poster{
            width: 100%;
        }

        .content{
            width: 80%;
            margin: 45px auto;
        }

        .l{
            float: left;
            width: 60%;
            height: 600px;
        }
        .r{
            width: 40%;
            float: left;

        }
        .r p{
            text-indent: 2em;
            color: #222222;
            line-height: 25px;
            font-size: 14px;
        }
        .haircut{
            clear: both;
        }
        .title{
            text-align: center;
            color: #a3a3a3;
            text-transform: uppercase;
            padding-bottom: 15px;
        }
        .imgdiv{
            width: 100%;
            height: 360px;
            overflow: hidden;
        }
        .imgdiv img{
            float: left;
        }

        .footing{
            clear: both;
            margin-top: 20px;
            width: 100%;
            height: 80px;
            background-color: #3f434e;;
            margin-bottom: 0px;

        }
        .footing_content{
            padding-top: 20px;
            text-align: center;
            color: white;
        }
    </style>
</head>

<body>

<div class="poster" >

        <div><img src="images/01e01a5762190d0000012e7ed30faf.jpg" width="100%" height="447px"></div>

</div>


<div class="content">
    <div class="l">
        <img src="image/qiye1.png" width="400px" height="500px" style="margin-left: 100px">
    </div>
    <div class="r">
        <div><img src="image/qiye.png"></div>
        <div><span id="memberName"></span>
            <p>重庆市yq美发有限公司，是国内一家专业的美发管理企业，
            1990年创始于重庆，经过几十年如一日的努力，从一个品牌向更多领域渗透，
            谋求在新时代机遇下的全方面发展。</p></div>

    </div>
</div>

<div class="haircut">
    <div class="title">
        <h2>潮流发型</h2>
        <p>haircut</p>
    </div>
    <div class="imgdiv">
        <img src="images/波波头.jpg" width="253px" height="360px">
        <img src="images/短发.jpg" width="253px" height="360px">
        <img src="images/蛋卷头.jpg" width="253px" height="360px">
        <img src="images/中分.jpg" width="253px" height="360px">
        <img src="images/扎头发.jpg" width="253px" height="360px">
        <img src="images/中长发.jpg" width="253px" height="360px">
    </div>

</div>

<div class="footing">
    <div class="footing_content">
        地址：重庆市韩国路好美丽街道888号<br/>
        Copyright © 1990 重庆市yq美发有限公司 All Rights Reserved.
    </div>
</div>


<script>
document.getElementById("memberName").value=window.parent.member_name;
</script>
</body>
<%out.flush();%>
</html>
