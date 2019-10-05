<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 2019/10/4
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bo.entity.Character" %>
<%@ page import="com.bo.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    pageContext.setAttribute("user", user);
%>
<html>
<head>
    <title>图书详情页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <style type="text/css">
        h2, h3 {
            font-size: 40px;
            font-family: STKaiti;
            margin-top: 10px;
            color: rgb(73, 73, 73);
        }

        .card {
            height: 180px;
            padding-bottom: 32px;
            margin: 20px 5px 20px 5px;
        }

        .card img {
            width: 60%;
            height: 90%;
        }

        .card p {
            font-size: 13px;
            color: rgb(25, 72, 167);
        }

        .col-2 {
            border-right: 1px solid rgb(176, 214, 246);
        }

        .col-2 img {
            margin-left: 30px;
            width: 70%;
        }

        .col-2 ul {
            list-style: none;
            margin-top: 30px;
            margin-left: 30px;
            padding: auto 10px auto 10px;
        }

        .col-2 ul li {
            font-size: 18px;
            color: rgb(25, 72, 167);
            margin-top: 4px;
        }

        .col-4 img {
            margin: 10px 5px 20px 5px;
            width: 80%;
        }

        hr {
            width: 90%;
            color: #eee;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<%
    Character character = (Character) request.getAttribute("character");
    pageContext.setAttribute("character", character);
%>
<div class="row">
    <%--    左侧边栏部分--%>
    <div class="col-2">
        <a href="${pageContext.request.contextPath}/index">
            <img src="/images/wiki.png" alt="">
        </a>
        <ul>
            <li>分类索引</li>
            <li>特色内容</li>
            <li>最近改动</li>
            <li>随机条目</li>
        </ul>
        <hr>
        <ul>
            <li>帮助</li>
            <li>维基群社</li>
            <li>方针与指引</li>
            <li>互助客栈</li>
            <li>知识问答</li>
        </ul>
    </div>
    <div class="col-10">
        <%--        顶部登录栏--%>
        <div id="top">
            <ul>
                <li style="color: black">维基百科，自由的百科全书</li>
            </ul>
            <ul>
                <%
                    if (user != null) {
                %>
                <li>
                    <a href="${pageContext.request.contextPath}/user">
                        <img src="${pageContext.request.contextPath}/images/${user.avatar}" alt="" class="avatar">
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout">退出</a>
                </li>
                <%
                } else {
                %>
                <a href="${pageContext.request.contextPath}/login">去登录</a>
                <%
                    }
                %>
            </ul>
        </div>

        <div id="top">
            <jsp:include page="top.jsp"/>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <h3>${character.name}</h3>
                    <hr>
                    <div class="row">
                        <div class="col-6">
                            <img src="/images/${character.portrait}" alt="">
                        </div>
                        <div class="col-4">
                            <p>${character.influences}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>