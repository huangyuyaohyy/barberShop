<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/20 0020
  Time: 17:10
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
    <title>礼品兑换信息</title>

    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/point_gifts.js"></script>

</head>

<body>
<nav> 首页 &gt; 礼品管理  &gt;  礼品兑换信息
</nav>

<div class="page-container">
    <div class="title title-on">兑换记录</div>
    <div class="title "><a href="point_gifts/excahnge_deal">到店兑换</a></div>

    <div class="item">

        <span class="r">共有数据：<strong>${num}</strong> 条</span>
    </div>

    <div class="query">

        <form action="point_gifts/selectByNameOne" method="post" class="form form-horizontal" id="form-select">

            <td> <input type="text" class="input-text" style="width:250px" id="memberName" name="memberName" placeholder="请输入会员姓名"></td>

            <input  id="searchOne" type="button" class="btn" value="查找">

        </form>
    </div>

    <table>
        <thead>
        <tr>
            <th scope="col" colspan="7">礼品兑换信息</th>
        </tr>
        <th width="70">ID</th>
        <th width="70">会员</th>
        <th width="70">礼品</th>
        <th width="70">兑换时间</th>
        <th width="70">到店领取时间</th>


        </thead>
        <tbody>
        <c:if test="${point_gifts!=null}">
            <c:forEach var="point_gift" varStatus="status" items="${point_gifts}">
                <div class="row">
                    <tr class="text-c">
                        <td> ${point_gift.pointGiftId}</td>
                        <td>${point_gift.memberName}</td>
                        <td>${point_gift.giftName}</td>
                        <td>${point_gift.deal}</td>
                        <td>${point_gift.fact}</td>

                    </tr>
                </div>
            </c:forEach>

        </c:if>
        </tbody>

        </tbody>
    </table>
</div>

</body>
</html>
