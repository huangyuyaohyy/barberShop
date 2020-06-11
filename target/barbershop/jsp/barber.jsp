<%--
  Created by IntelliJ IDEA.
  User: hyy
  Date: 2020/3/8 0008
  Time: 23:24
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
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>

<body>
<nav> 首页 &gt; 门店管理  &gt;  理发师管理
</nav>

<div class="page-container">

    <div class="item">
        <a  href="jsp/barberAdd.jsp" target="_self" class="">添加理发师</a>
        <span class="r">共有数据：<strong>${num}</strong> 条</span>
    </div>

    <div class="query">

        <form action="barbers/selectByName" method="post" class="form form-horizontal" id="form-select">

            <td> <input type="text" class="input-text" style="width:250px" id="barberName" name="barberName" placeholder="请输入理发师的名字"></td>

            <input type="submit"  class="btn" value="查找">

        </form>
    </div>

    <table>
        <thead>
        <tr>
            <th scope="col" colspan="8">理发师信息管理</th>
        </tr>
        <th width="70">ID</th>
        <th width="70">照片</th>
        <th width="70">姓名</th>
        <th width="70">性别</th>
        <th width="70">年龄</th>
        <th width="70">介绍</th>
        <th width="70">编辑</th>
        <th width="70">操作</th>


        </thead>
        <tbody>
        <c:if test="${barbers!=null}">
            <c:forEach var="barber" varStatus="status" items="${barbers}">
                <div class="row">
                    <tr class="text-c">
                        <td> ${barber.barberId}</td>
                        <td> <img src="${barber.image}" width="230" width="230" alt="理发师头像"></td>
                        <td>${barber.barberName}</td>
                        <td>${barber.gender}</td>
                        <td>${barber.age}</td>
                        <td>${barber.introduce}</td>

                        <td class="f-14">
                            <a  href="barbers/barberEdit?id=${barber.barberId}" >编辑</a>
                                <%--                            <a title="删除"  onclick="deleteBarber(this,${barber.barberId})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>--%>
                        </td>

                        <td>
                            <a  href="barbers/barberEditImg?id=${barber.barberId}">修改头像</a>

                        </td>
                    </tr>
                </div>


            </c:forEach>

        </c:if>
        </tbody>

        </tbody>
    </table>

</div>
</body>
</html>
