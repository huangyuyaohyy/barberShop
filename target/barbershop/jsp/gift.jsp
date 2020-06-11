<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/20 0020
  Time: 15:37
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
<nav> 首页 &gt; 礼品管理  &gt;  礼品信息
</nav>

<div class="page-container">

    <div class="item">
        <a  href="jsp/giftAdd.jsp" target="_self" class="">添加礼品</a>
        <span class="r">共有数据：<strong>${num}</strong> 条</span>
    </div>

    <div class="query">

        <form action="gifts/selectByName" method="post" class="form form-horizontal" id="form-select">

            <td> <input type="text" class="input-text" style="width:250px" id="giftName" name="giftName" placeholder="请输入礼品名称"></td>

            <input type="submit"  class="btn" value="查找">

        </form>
    </div>

    <table>
        <thead>
        <tr>
            <th scope="col" colspan="9">礼品信息管理</th>
        </tr>
        <th width="70">ID</th>
        <th width="70">图片</th>
        <th width="70">名称</th>
        <th width="70">剩余数量</th>
        <th width="70">介绍</th>
        <th width="70">需要积分</th>
        <th width="70">显示状态</th>
        <th width="70">编辑</th>
        <th width="70">操作</th>


        </thead>
        <tbody>
        <c:if test="${gifts!=null}">
            <c:forEach var="gift" varStatus="status" items="${gifts}">
                <div class="row">
                    <tr class="text-c">
                        <td> ${gift.giftId}</td>
                        <td> <img src="${gift.image}" width="230" width="230" alt="礼品图片"></td>
                        <td>${gift.giftName}</td>
                        <td>${gift.num}</td>
                        <td>${gift.introduce}</td>
                        <td>${gift.exchangePoint}</td>
                        <td>${gift.state}</td>

                        <td class="f-14">
                            <a  href="gifts/giftEdit?id=${gift.giftId}" >编辑</a>
                                <%--                            <a title="删除"  onclick="deleteBarber(this,${barber.barberId})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>--%>
                        </td>

                        <td>
                            <a  href="gifts/giftEditImg?id=${gift.giftId}">修改图像</a>

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
