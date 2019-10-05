<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 2019/9/28
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bo.entity.Character" %>
<%@ page import="com.bo.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    pageContext.setAttribute("user", user);
%>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <style type="text/css">
        h2, h3 {
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
    List<Character> characterList = (List<Character>) request.getAttribute("characterList");
%>
<%--将整个页面分为左边和右边--%>
<div class="row">
    <%--    左侧边栏部分--%>
    <div class="col-2">
        <a href="${pageContext.request.contextPath}/index">
            <img src="/images/RNG.jpg" alt="">
        </a>
        <ul>
            <li>分类索引</li>
            <li>特色内容</li>
            <li>现役选手</li>
            <li>退役选手</li>
        </ul>
        <hr>
        <ul>
            <li>帮助</li>
            <li>历史</li>
            <li>荣誉</li>
            <li>其他分部</li>
            <li>留言</li>
        </ul>
    </div>
    <%--右边主题部分--%>
    <div class="col-10">
        <%--        顶部登录栏--%>
        <div id="top">
            <ul>
                <li style="color: black">RNG皇族电子竞技俱乐部</li>
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
            <title>首页</title>
            <%--            搜索导航栏--%>
        </div>
        <div id="top">
            <jsp:include page="top.jsp"/>
        </div>
        <%--主体内容区--%>
        <div class="container">
            <div class="row">
                <%--右侧主体部分--%>
                <h3>RNG电子竞技俱乐部选手</h3>
                <hr>
                <div class="row">
                    <%--遍历图书数据集合，将每个图书对象放入页面对象--%>
                    <%
                        for (Character character : characterList) {
                            pageContext.setAttribute("character", character);
                    %>
                    <%--引用col-2表示每行显示5本，再追加card细节样式--%>
                    <div class="col-3 card">
                        <%--点击每本图书封面图，地址栏跳转为/detail/id,进入图书详情Servlet--%>
                        <a href="${pageContext.request.contextPath}/detail/${character.id}">
                            <img src="images/${character.portrait}" alt="">
                        </a>
                        <p style="color: rgb(51, 119, 178)">${character.name}</p>
                        <p>${character.influences}</p>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <footer>
                <ul>
                    <li>本页面最后修订于2019年10月4日 (星期五) 16:51</li>
                    <li>RNG现役，退役选手</li>
                    <li>使用请参阅条款</li>
                </ul>
                <ul>
                    <li>隐私政策</li>
                    <li>关于</li>
                    <li>免责声明</li>
                    <li>开发者</li>
                    <li>Cookie声明</li>
                </ul>
            </footer>
        </div>
    </div>
</div>
<%--使用jsp的include动作，将top.jsp页面包含进来，这个顶部导航可以给各个页面共享--%>

</body>
</html>