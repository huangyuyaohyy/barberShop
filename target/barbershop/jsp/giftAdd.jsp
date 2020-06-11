<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/20 0020
  Time: 15:46
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
    <title>添加礼品</title>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script  src="js/gift.js"></script>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/manage.css">

</head>

<body>
<nav> 首页 &gt; 礼品管理  &gt;  礼品信息 &gt;添加
</nav>
<form id="form">
    <table class="table">
        <thead>
        <tr>
            <th scope="col" colspan="5">添加礼品信息</th>
        </tr>

        <th width="70">名称</th>
        <th width="70">剩余数量</th>
        <th width="70">介绍</th>
        <th width="70">需要积分</th>
        <th width="100">显示状态</th>



        </thead>
        <tbody>
        <div class="row">
            <tr class="text-c">
                <td> <input   type="text" class="input" style="width:250px" id="giftName" name="giftName" ></td>

                <td> <input  class="input"  type="input" style="width:250px"  style="width:250px" id="num" name="num" oninput="value=value.replace(/[^\d]/g,'')" ></td>

                <td> <input  class="input" type="text" class="input" style="width:250px" id="introduce" name="introduce" ></td>

                <td> <input   type="text" class="input" style="width:250px" id="exchangePoint" name="exchangePoint" oninput="value=value.replace(/[^\d]/g,'')" ></td>

                </td>

                <td>
                    显示<input   type="radio" name="state" value="1" title="1"  checked>

                    不显示<input   type="radio" name="state" value="0" title="0" >
                </td>
            </tr>
        </div>
        </tbody>
    </table>

    <div style="float:right;">
        <input   value="确定" id="gift_add" class="btn"  style="text-align:right;"/>
    </div>
</form>


</body>
</html>
