<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/5 0005
  Time: 13:46
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
    <title>门店服务</title>
    <style type="text/css">
        *{
            margin: 0;
        }
        .content{
            width: 920px;
            margin: 20px auto;
        }
        .barber_content{
            margin-top: 50px;
        }
        .barber{
            display: flex;
        }
        .barber_body{
            width: 260px;
            margin-left: 90px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }
        .b{
            text-decoration: none;
            display: inline-block;
            width: 60px;
            height: 38px;
            line-height: 38px;
            padding: 0 18px;
            background-color:
                    #169BD5;
            color:
                    #fff;
            white-space: nowrap;
            text-align: center;
            font-size: 14px;
            border: none;
            border-radius: 2px;
            cursor: pointer;

            margin-left: 100px;
            margin-top: 190px;

        }
        .barber_name{
            font-size: 16px;
            color: #0C0C0C;

        }
        span{
            color: #7F7F7F;
            font-size: 16px;
        }
        .intr{
            font-size: 14px;
            margin-top: 15px;

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
<div class="content">
    <h2>理发师详情</h2>
    <div class="barber_content">
        <c:if test="${barbers!=null}">
            <c:forEach var="barber" varStatus="status" items="${barbers}">
                <section class="barber">
                    <img src="${barber.image}" width="250" width="280" alt="礼品图片">
                    <div class="barber_body">
                        <span class="barber_name">${barber.barberId}号：${barber.barberName}</span>
                        <span>性别：${barber.gender}</span>
                        <span>年龄：${barber.age}</span>
                        <span class="intr">${barber.introduce}</span>
                    </div>
                </section>
                <hr style="height:1px;width:920px; border:none;border-top:1px solid #555555; margin:20px auto" />
            </c:forEach>
        </c:if>
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
