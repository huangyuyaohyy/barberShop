<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/14 0014
  Time: 18:58
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
    <title>修改理发师信息</title>

    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/barber.js"></script>

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
<nav> 首页 &gt; 门店管理  &gt;  理发师管理 &gt;修改
</nav>
<form id="form">
    <table >
        <thead>
        <tr>
            <th scope="col" colspan="5">理发师信息修改</th>
        </tr>
        <th width="70">ID</th>
        <th width="70">姓名</th>
        <th width="70">性别</th>
        <th width="70">出生日期</th>
        <th width="70">介绍</th>



        </thead>
        <tbody>
        <div class="row">
            <tr class="text-c">
                <td> <input class="input" readonly="readonly" name="barberId" value="${barber.barberId}"></td>
                <td> <input class="input" type="text"  id="barberName" name="barberName" value="${barber.barberName}"></td>
                <td>
                    男<input   type="radio" name="gender" value="男" title="男" checked >

                    女<input   type="radio" name="gender" value="女" title="女" >
                </td>
                <td> <input  class="input"  type="date"  id="age" name="age" value="${barber.age}"></td>
                <td> <input  class="input" type="text"   id="introduce" name="introduce" value="${barber.introduce}" ></td>

                </td>
            </tr>
        </div>
        </tbody>
    </table>

    <div style="float:right;">
        <input class="btn" type="button" value="确定" id="barber_edit" />
    </div>
</form>
</body>
</html>
