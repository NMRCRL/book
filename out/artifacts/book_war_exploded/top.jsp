<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/10/5
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul>
    <li>
        <a href="${pageContext.request.contextPath}/index">首页</a>
    </li>
    <li>
        <a href="#">条目</a>
    </li>
    <li>
        <a href="#">阅读</a>
    </li>
    <li>
        <a href="#">编辑</a>
    </li>
    <li>
        <a href="#">历史</a>
    </li>
    <li>
        <a href="#">更多</a>
    </li>
</ul>
<ul>
    <input type="text" placeholder="搜索" class="search-input">
    <div class="search-btn">
        <img src="images/search.png" alt="">
    </div>
</ul>