<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <%--<tr data-toggle="collapse" data-parent="#accordion" href="#collapseOne${user.id}"--%>
            <%--aria-expanded="false"--%>
            <%--aria-controls="collapseOne" style="cursor: pointer">--%>
            <tr>
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
                    <a href="<c:url value="/profile/${user.id}"/>" class="btn btn-primary btn-xs">Voir profil</a>
                    <a href="<c:url value="/user/update/${user.id}"/>" class="btn btn-primary btn-xs">Modifier</a>
                    <c:if test="${user.id gt 1}">
                        <c:choose>
                            <c:when test="${user.enabled eq true}">
                                <a href="<c:url value="/admin/disable/${user.id}"/>" class="btn btn-primary btn-xs">Désactiver</a>
                            </c:when>
                            <c:when test="${user.enabled eq false}">
                                <a href="<c:url value="/admin/enable/${user.id}"/>"
                                   class="btn btn-primary btn-xs">Activer</a>
                            </c:when>
                        </c:choose>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>