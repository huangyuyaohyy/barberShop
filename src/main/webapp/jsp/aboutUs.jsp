<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/17 0017
  Time: 15:44
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
    <title>关于我们</title>
    <style>
        *{
            margin: 0px;
        }
        .head{
            z-index:1;
            /*background: url("../images/zhu1 (2).png") no-repeat;*/
            /*background-size:100% 100%;*/
            width: 100%;
            height: 400px;
        }
        .content{
            background: white;
            z-index: 2;
            width: 1000px;
            margin: -100px auto;
            position:relative;

        }
        .text{
            margin-left: 50px;
            padding-top: 40px;
            margin-right: 20px;
        }
        .contentImg{
            margin: 50px;
            width: auto;
            display: flex;

            flex-direction: row;
            justify-content: space-between;
        }
        .section{
            text-align: center;
        }
        .footing{
            clear: both;
            margin-top: 180px;
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
        .tt{
            margin-top: 20px;
            text-indent: 2em;
            font-size: 17px;
            color: #7F7F7F;
        }
        .grey{
            color: #7F7F7F;
            margin-top: 20px;
        }
    </style>
</head>

<body>
<div class="head">
      <img src="images/01e01a5762190d0000012e7ed30faf.jpg" width="100%" height="400px">
</div>
<div class="content">
    <div class="text">
        <h1>关于我们</h1>
        <p class="tt">重庆市yq美发有限公司，是国内一家专业的美发管理企业，
            1990年创始于重庆，经过几十年如一日的努力，从一个品牌向更多领域渗透，
            谋求在新时代机遇下的全方面发展。</p></div>
    <div class="contentImg">
        <div class="section">
            <img src="image/address.png" width="180px" height="150px">
            <p>地址</p>
            <p class="grey">重庆市好美丽街道</p>
        </div>

        <div class="section">
            <img src="image/tel.png" width="180px" height="150px">
            <p>电话</p>
            <p class="grey">88888888</p>
        </div>

        <div class="section">
            <img src="image/weixin.png" width="180px" height="150px">
            <p>微信</p>
            <p class="grey">yqbarbershop123</p>
        </div>

    </div>

</div>


<div class="footing">
    <div class="footing_content">
        地址：重庆市韩国路好美丽街道888号<br/>
        Copyright © 1990 重庆市yq美发有限公司 All Rights Reserved.
    </div>
</div>
</body>
</html>
