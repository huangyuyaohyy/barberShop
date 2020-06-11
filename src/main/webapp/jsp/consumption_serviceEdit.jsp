<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/15 0015
  Time: 17:16
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
    <title>消费服务信息修改</title>

    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/consumption_service.js"></script>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/manage.css">

    <script>
        window.onload= function()
        {
            $("input[name='gender'][value='${barber.gender}']").attr("checked",true);
        }

    </script>
</head>

<body>
<nav> 首页 &gt; 消费管理  &gt;  消费服务管理 &gt;修改
</nav>
<form id="form">
    <table >
        <thead>
        <tr>
            <th scope="col" colspan="4">消费服务信息修改</th>
        </tr>
        <th width="70">ID</th>
        <th width="70">消费项目</th>
        <th width="70">价格</th>
        <th width="70">介绍</th>


        </thead>
        <tbody>
        <div class="row">
            <tr class="text-c">
                <td> <input class="input" readonly="readonly" name="consumptionServiceId" value="${consumption_service.consumptionServiceId}"></td>
                <td> <input   type="text" class="input" id="serviceName" name="serviceName" value="${consumption_service.serviceName}"></td>
                <td> <input   type="text" class="input"  id="price" name="price" oninput="value=value.replace(/[^\d]/g,'')" value="${consumption_service.price}"></td>
                <td> <input   type="text" class="input"  id="introduce" name="introduce"  value="${consumption_service.introduce}"></td>

                </td>
            </tr>
        </div>
        </tbody>
    </table>

    <div style="float:right;">
        <input class="btn" type="button" value="确定" id="consumption_service_edit" />
    </div>
</form>
</body>
</html>
