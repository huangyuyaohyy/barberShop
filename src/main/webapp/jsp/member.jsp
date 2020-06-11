<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/8 0008
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
    <title>会员信息</title>

    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
<nav> 首页 &gt; 会员管理  &gt;  会员信息管理
</nav>

<div class="page-container">

    <div class="item">
        <span class="r">共有数据：<strong>${num}</strong> 条</span>
    </div>

    <div class="query">

        <form action="members/selectByMemberName" method="post" class="form form-horizontal" id="form-select">

            <td> <input type="text" class="input-text" style="width:250px" id="memberName" name="memberName" placeholder="请输入会员的名字"></td>

            <input type="submit"  class="btn" value="查找"></input>
            </span>
        </form>
    </div>

    <table>
        <thead>
        <tr>
            <th scope="col" colspan="8">会员信息管理</th>
        </tr>
        <th width="70">ID</th>
        <th width="70">姓名</th>
        <th width="70">性别</th>
        <th width="70">电话</th>
        <th width="70">地址</th>
        <th width="70">年龄</th>
        <th width="70">操作</th>

        </thead>
        <tbody>
        <c:if test="${members!=null}">
        <c:forEach var="member" varStatus="status" items="${members}">
        <div class="row">
            <tr >
                <td> ${member.memberId}</td>
                <td>${member.memberName}</td>
                <td>${member.gender}</td>
                <td>${member.tel}</td>
                <td>${member.address}</td>
                <td>${member.age}</td>

                <td >
                    <a  href="consumption_records/consumption_recordsAddByMember?id=${member.memberId}" style="text-decoration:none">点击消费</a>
                </td>
            </tr>
            </div>
        </c:forEach>
        </c:if>
        </div>

        </tbody>
    </table>


</div>
</body>
</html>
