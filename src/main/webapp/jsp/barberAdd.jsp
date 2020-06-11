<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/11 0011
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitiona.l//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>添加理发师</title>

    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/barber.js"></script>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/manage.css">

</head>

<body>
<nav> 首页 &gt; 门店管理  &gt;  理发师管理 &gt;添加
</nav>
<form id="form">
    <table class="table">
        <thead>
        <tr>
            <th scope="col" colspan="4">添加理发师信息</th>
        </tr>

        <th width="70">姓名</th>
        <th width="70">性别</th>
        <th width="70">出生日期</th>
        <th width="70">介绍</th>


        </thead>
        <tbody>
        <div class="row">
            <tr class="text-c">
                <td> <input  required type="text" class="input" style="width:250px" id="barberName" name="barberName" ></td>
                <td>
                    男<input   type="radio" name="gender" value="男" title="男"  checked>

                    女<input   type="radio" name="gender" value="女" title="女" >
                </td>
                <td> <input  class="input"  type="date" class="input" style="width:250px" id="age" name="age" ></td>

                <td> <input  class="input" type="text" class="input" style="width:250px" id="introduce" name="introduce" ></td>

                </td>
            </tr>
        </div>
        </tbody>
    </table>

    <div style="float:right;">
        <input   value="确定" id="barber_add" class="btn"  style="text-align:right;"/>
    </div>
</form>


</body>

</html>
