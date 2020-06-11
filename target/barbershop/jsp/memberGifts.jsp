<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/5 0005
  Time: 15:11
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
    <title>我的兑换记录</title>

    <style>
        .content{
            text-align: center;
            margin-top: 50px;
            color: #333333;
        }
        table{
            width: 700px;
            margin: 50px auto;
            font-size: 13px;
            border:1px solid #dddddd;
        }
        td{ border:1px solid #dddddd;}
        th{border:1px solid #dddddd;}
    </style>
</head>

<body>
<div class="content">
<h2>我的兑换记录</h2>
<table>
    <thead>
    <th width="70">ID</th>
    <th width="70">礼品</th>
    <th width="70">兑换时间</th>
    <th width="70">兑换状态</th>

    </thead>
    <tbody>
    <c:if test="${point_gifts!=null}">
        <c:forEach var="point_gift" varStatus="status" items="${point_gifts}">
            <div class="row">
                <tr class="text-c">
                    <td> ${point_gift.pointGiftId}</td>
                    <td>${point_gift.giftName}</td>
                    <td>${point_gift.deal}</td>
                    <td>${point_gift.stateName}</td>

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
