<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/15 0015
  Time: 16:40
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
    <title>消费服务管理</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>

<body>
<nav> 首页 &gt; 消费管理  &gt;  消费服务管理
</nav>

<div class="page-container">

    <div class="item">
        <a  href="jsp/consumption_serviceAdd.jsp" target="_self" >添加消费服务</a>
        <span class="r">共有数据：<strong>${num}</strong> 条</span>
    </div>

    <div class="query">

        <form action="consumption_services/selectByName" method="post"  id="form-select">

            <td> <input type="text" class="input-text" style="width:250px" id="serviceName" name="serviceName" placeholder="输入消费服务名称"></td>

            <input type="submit"  class="btn" value="查找">

        </form>
    </div>

    <table>
        <thead>
        <tr>
            <th scope="col" colspan="6">消费服务信息管理</th>
        </tr>
        <th width="70">ID</th>
        <th width="70">消费项目</th>
        <th width="70">价格</th>
        <th width="70">介绍</th>
        <th width="70">编辑</th>



        </thead>
        <tbody>
        <c:if test="${consumption_services!=null}">
            <c:forEach var="consumption_service" varStatus="status" items="${consumption_services}">
                <div class="row">
                    <tr class="text-c">
                        <td> ${consumption_service.consumptionServiceId}</td>
                        <td>${consumption_service.serviceName}</td>
                        <td>${consumption_service.price}</td>
                        <td>${consumption_service.introduce}</td>

                        <td >
                            <a  href="consumption_services/consumption_serviceEdit?id=${consumption_service.consumptionServiceId}" style="text-decoration:none">编辑</a>
                        </td>

                    </tr>
                </div>


            </c:forEach>

        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>
