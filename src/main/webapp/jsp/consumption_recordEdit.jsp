<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/15 0015
  Time: 17:54
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
    <title>消费记录修改</title>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/consumption_record.js"></script>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/manage.css">
    <script>
        window.onload= function()
        {
            $("#barberId").get(0).selectedIndex = ${consumption_record.barberId};
        }

    </script>

</head>

<body>
<nav> 首页 &gt; 门店管理  &gt;  理发师管理 &gt;修改
</nav>
<form id="form">
    <table >
        <thead>
        <tr>
            <th scope="col" colspan="6">消费记录修改</th>
        </tr>
        <th width="70">ID</th>
        <th width="70">消费者</th>
        <th width="70">理发师工号</th>
        <th width="70">消费项目</th>

        </thead>
        <tbody>
        <div class="row">
            <tr class="text-c">
                <td> <input class="input" readonly="readonly" name="consumptionRecordId" value="${consumption_record.consumptionRecordId}"></td>
                <td> <input class="input" readonly="readonly"  id="memberId" name="memberId" value="${consumption_record.memberId}"></td>
                <td><select name="barberId" id="barberId">
                    <c:if test="${barbers!=null}">
                        <c:forEach var="barber" varStatus="status" items="${barbers}">
                            <option value="${barber.barberId}">${barber.barberId}</option>
                        </c:forEach>
                    </c:if>
                </select></td>

                <td><select name="consumptionServiceName">
                    <c:if test="${consumptionServices!=null}">
                        <c:forEach var="consumptionService" varStatus="status" items="${consumptionServices}">
                            <option value="${consumptionService.serviceName}">${consumptionService.serviceName}</option>
                        </c:forEach>
                    </c:if>
                </select></td>
            </tr>
        </div>
        </tbody>
    </table>

    <div style="float:right;">
        <input class="btn" type="button" value="确定" id="consumption_record_edit" />
    </div>
</form>
</body>
</html>
