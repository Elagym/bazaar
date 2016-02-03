<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 18-01-16
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="/WEB-INF/views/includes/head.jsp"/>
    <title>Title</title>
</head>
<body>
<c:import url="/WEB-INF/views/includes/menu.jsp"/>
<div class="container-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Enabled</th>
            <th>Details</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.enabled}</td>
                <td><a class="btn btn-success" href="<c:url value="/admin/member/${user.id}"/>">+</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>