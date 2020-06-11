<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/7 0007
  Time: 17:56
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
    <title>yq理发店</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">

    <script src="js/jquery-2.1.1.min.js">
    </script>
    <script src="js/index.js"></script>
</head>

<body>
<div class="container">
    <div class="heading"><span class="l">YQ理发店管理系统</span> <span class="r">管理员</span></div>

    <div class="content_menu">
        <dl>
            <dt id="show1">会员管理</dt>
            <dd id="show11">
                <ul>
                    <li><a href="members/memberList" title="会员信息管理"  target="content_iframe">会员信息</a></li>
                    <li><a title="积分信息管理" href="points/pointList" target="content_iframe">积分信息</a></li>
                </ul>
            </dd>
        </dl>

        </dl>
        <dl>
            <dt id="show2">消费管理</dt>
            <dd id="show22">
                <ul>
                    <li><a href="consumption_records/consumption_recordList" title="消费记录"  target="content_iframe">消费记录</a></li>
                    <li><a href="consumption_services/consumption_serviceList" title="服务管理"  target="content_iframe">服务管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl>
            <dt id="show3">礼品管理</dt>
            <dd id="show33">
                <ul>
                    <li><a title="礼品信息" href="gifts/giftList" target="content_iframe">礼品信息</a></li>
                    <li><a title="礼品兑换" href="point_gifts/point_giftList" target="content_iframe">礼品兑换</a></li>
                </ul>
            </dd>
        </dl>
        <dl>
            <dt id="show5">门店管理</dt>
            <dd id="show55">
                <ul>
                    <li><a  title="理发师管理" href="barbers/barberList" target="content_iframe">理发师管理</a></li>
<%--                    <li><a data-href="barbers/barberList" data-title="收入报表" href="money.html" target="content_iframe">收入报表</a></li>--%>

                </ul>
            </dd>
        </dl>

        <dl>
            <dt id="show4">帮助中心</dt>
            <dd id="show44">
                <ul>
                    <li><a  title="帮助中心" href="barbers/barberList" target="content_iframe">理发师管理</a></li>
                    <%--                    <li><a data-href="barbers/barberList" data-title="收入报表" href="money.html" target="content_iframe">收入报表</a></li>--%>

                </ul>
            </dd>
        </dl>
    </div>

    <div class="content_body" >
        <iframe class="iframe" scrolling="yes" frameborder="0" src="members/memberList" width="100%" height="100%" name="content_iframe"></iframe>
    </div>


</div>
</body>
</html>
