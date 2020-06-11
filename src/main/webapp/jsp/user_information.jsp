<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/23 0023
  Time: 15:04
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
    <title>我的信息</title>

    <style>
        *{
            margin: 0;
            padding: 0;
        }
        table{
            width: 700px;
            margin: 50px auto;
            font-size: 13px;
            border:1px solid #dddddd;
        }
        td{ border:1px solid #dddddd;}
        th{border:1px solid #dddddd;}
        .content{
            width: 80%;
            margin: 0 auto;
            background: rgba(242, 242, 242, 0.2);
            padding-top: 50px;
        }
        .shang{
            width: 60%;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;

        }
        p{
            margin-top: 20px;
        }
        .a{margin-top: 20px;}
        .xian{
            margin-top: 30px;
            margin-bottom: 30px;
            width: 100%;
            height: 1px;
            background: #333333;
        }
        .xia{
            text-align: center;
            padding-top: 20px;
            width: 100%;
            margin: 0 auto;
            overflow: hidden;
        }
    </style>
</head>

<body>
<div class="content">
    <div class="shang">
        <div class="left">
<p>ID： ${member.memberId}</p>
<p>姓名：${member.memberName}</p>
<p>性别：${member.gender}</p>
<p>电话：${member.tel}</p>
<p>地址：${member.address}</p>
<p>年龄：${member.age}</p>
            <div class="a">
                <a   href="members/informationEdit?id=${member.memberId}" style="text-decoration:none;">修改</a>
            </div></div>
        <div class="right">
            <img src="image/mp16261163_1432481430975_1_th_fv23.jpeg" width="276px" height="309px"></div>
    </div>
    <div class="xian"></div>
    <div class="xia">
        <h3>我的消费记录</h3>


<table>
    <thead>
    <tr>
        <th scope="col" colspan="7">消费记录</th>
    </tr>
    <th width="70">记录ID</th>
    <th width="70">消费项目</th>
    <th width="70">理发师</th>
    <th width="70">价格</th>
    <th width="70">消费时间</th>



    </thead>
    <tbody>
    <c:if test="${consumption_records!=null}">
        <c:forEach var="consumption_record" varStatus="status" items="${consumption_records}">
            <div class="row">
                <tr class="text-c">
                    <td> ${consumption_record.consumptionRecordId}</td>
                    <td> ${consumption_record.consumptionServiceName}</td>
                    <td>${consumption_record.barberName}</td>
                    <td>${consumption_record.price}</td>
                    <td>${consumption_record.time}</td>

                </tr>
            </div>
        </c:forEach>

    </c:if>
    </tbody>
</table>
    </div>

</div>

</body>
</html>
