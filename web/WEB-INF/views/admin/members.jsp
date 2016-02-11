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
    <table class="table table-striped table-hover ">
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Enabled</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr data-toggle="collapse" data-parent="#accordion" href="#collapseOne${user.id}"
                aria-expanded="false"
                aria-controls="collapseOne" style="cursor: pointer">
                <td>
                        ${user.id}
                </td>
                <td>
                        ${user.username}
                </td>
                <td>
                        ${user.enabled}
                </td>
                <td>
                    actions
                </td>
            </tr>
            <tr id="collapseOne${user.id}" class="panel-collapse collapse" role="tabpanel">
                <td>
                </td>
                <td>
                    <a href="<c:url value="/profile/${user.id}"/>" class="btn btn-primary btn-xs">Voir profil</a>
                </td>
                <td>
                    <a href="<c:url value="/update/${user.id}"/>" class="btn btn-primary btn-xs">Modifier</a>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${user.enabled eq true}">
                            <a href="<c:url value="/admin/disable/${user.id}"/>" class="btn btn-primary btn-xs">Désactiver</a>
                        </c:when>
                        <c:when test="${user.enabled eq false}">
                            <a href="<c:url value="/admin/enable/${user.id}"/>"
                               class="btn btn-primary btn-xs">Activer</a>
                        </c:when>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>