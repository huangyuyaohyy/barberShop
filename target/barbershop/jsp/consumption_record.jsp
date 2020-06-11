<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/15 0015
  Time: 17:41
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
    <title>消费记录</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/consumption_record.js"></script>
</head>

<body>
<nav> 首页 &gt; 消费管理  &gt;  消费记录
</nav>

<div class="page-container">

    <div class="item">
         <span class="r">共有数据：<strong>${num}</strong> 条</span>
    </div>

    <div class="query">

        <form id="form-select">

            <td> <input type="text" class="input-text" style="width:250px" id="memberName" name="memberName" placeholder="请输入会员的名字"></td>

            <input id="search" type="button"  class="btn btn-success radius" value="查找">
            </span>
        </form>
    </div>

    <table>
        <thead>
        <tr>
            <th scope="col" colspan="7">消费记录</th>
        </tr>
        <th width="70">ID</th>
        <th width="70">消费项目</th>
        <th width="70">消费者</th>
        <th width="70">理发师</th>
        <th width="70">价格</th>
        <th width="70">消费时间</th>
        <th width="70">编辑</th>



        </thead>
        <tbody>
        <c:if test="${consumption_records!=null}">
            <c:forEach var="consumption_record" varStatus="status" items="${consumption_records}">
                <div class="row">
                    <tr class="text-c">
                        <td> ${consumption_record.consumptionRecordId}</td>
                        <td> ${consumption_record.consumptionServiceName}</td>
                        <td>${consumption_record.memberName}</td>
                        <td>${consumption_record.barberName}</td>
                        <td>${consumption_record.price}</td>
                        <td>${consumption_record.time}</td>
                        <td >
                            <a  href="consumption_records/consumption_recordEdit?id=${consumption_record.consumptionRecordId}" style="text-decoration:none">编辑</a>
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
