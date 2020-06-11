<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/15 0015
  Time: 16:57
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
    <title>添加消费服务</title>

    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/layer/layer.js"></script>
    <script  src="js/consumption_service.js"></script>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/manage.css">


</head>

<body>
<nav> 首页 &gt; 消费管理  &gt;  消费服务管理 &gt;添加
</nav>
<form id="form">
    <table class="table">
        <thead>
        <tr>
            <th scope="col" colspan="4">添加消费服务信息</th>
        </tr>

        <th width="70">消费项目名称</th>
        <th width="70">价格</th>
        <th width="70">介绍</th>


        </thead>
        <tbody>
        <div class="row">
            <tr class="text-c">
                <td> <input   type="text" class="input" style="width:250px" id="serviceName" name="serviceName" ></td>
                <td> <input   type="text" class="input" style="width:250px" id="price" name="price" oninput="value=value.replace(/[^\d]/g,'')" ></td>
                <td> <input   type="text" class="input" style="width:250px" id="introduce" name="introduce" ></td>

                </td>
            </tr>
        </div>
        </tbody>
    </table>

    <div style="float:right;">
        <input   value="确定" id="consumption_service_add" class="btn"  style="float: right;"/>
    </div>
</form>

</body>
</html>
