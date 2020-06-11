<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/20 0020
  Time: 12:37
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
    <title>积分商城</title>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/gift.js"></script>

    <style type="text/css">
        *{
            margin: 0;
        }
        .content{
            width: 920px;
            margin: 20px auto;
        }
        .r{
            float: right;
        }
        .gift_content{
            margin-top: 50px;
        }
        .gift{
            display: flex;
        }
        .gift_body{
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
        .gift_title{
            font-size: 16px;
            color: #0C0C0C;

        }
        span{
            color: #7F7F7F;
            font-size: 16px;
        }
        .buttondiv{
            width: 190px;
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
    <span>我的积分数：</span><input type="text" readonly="readonly" name="num" style="border: none" value="${point.num}">
    <a class="r" href="point_gifts/memberGifts?pointId=${point.pointId}">我的兑换记录</a>
    <div class="gift_content">
        <c:if test="${gifts!=null}">
            <c:forEach var="gift" varStatus="status" items="${gifts}">
                <section class="gift">
                    <img src="${gift.image}" width="250" width="280" alt="礼品图片">
                    <div class="gift_body">
                        <span class="gift_title">${gift.giftName}</span>
                        <span>${gift.introduce}</span>
                        <span>剩余数量：${gift.num}</span>
                        <span>兑换积分数：${gift.exchangePoint}</span>
                    </div>
                    <div class="buttondiv">
                        <a  class="b" onclick="exchange(${gift.giftId},${point.pointId})"  >兑换</a>
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
