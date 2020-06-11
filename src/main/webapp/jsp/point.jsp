<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/24 0024
  Time: 9:54
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
    <title>积分信息</title>

    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/point.js"></script>
</head>

<body>
<nav> 首页 &gt; 会员管理  &gt;  积分信息
</nav>

<div class="page-container">

    <div class="item">

        <span class="r">共有数据：<strong>${num}</strong> 条</span>
    </div>

    <div class="query">

        <form  id="form-select">

            <td> <input type="text" class="input-text" style="width:250px" id="memberName" name="memberName" placeholder="输入会员名"></td>

            <input id="search" type="button"  class="btn" value="查找">

        </form>
    </div>

    <table>
        <thead>
        <tr>
            <th scope="col" colspan="3">积分信息</th>
        </tr>
        <th width="70">ID</th>
        <th width="70">会员姓名</th>
        <th width="70">积分数</th>




        </thead>
        <tbody>
        <c:if test="${points!=null}">
            <c:forEach var="point" varStatus="status" items="${points}">
                <div class="row">
                    <tr class="text-c">
                        <td> ${point.pointId}</td>
                        <td>${point.memberName}</td>
                        <td>${point.num}</td>

                    </tr>
                </div>


            </c:forEach>

        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>
