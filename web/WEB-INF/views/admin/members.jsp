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
        <c:forEach items="${users}" var="menuuser">
            <%--<tr data-toggle="collapse" data-parent="#accordion" href="#collapseOne${user.id}"--%>
            <%--aria-expanded="false"--%>
            <%--aria-controls="collapseOne" style="cursor: pointer">--%>
            <tr>
                <td>
                        ${menuuser.id}
                </td>
                <td>
                        ${menuuser.username}
                </td>
                <td>
                        ${menuuser.enabled}
                </td>
                <td>
                    <a href="<c:url value="/profile/${menuuser.id}"/>" class="btn btn-primary btn-xs">Voir profil</a>
                    <a href="<c:url value="/user/update/${menuuser.id}"/>" class="btn btn-primary btn-xs">Modifier</a>
                    <c:if test="${menuuser.id gt 1}">
                        <c:choose>
                            <c:when test="${menuuser.enabled eq true}">
                                <a href="<c:url value="/admin/disable/${menuuser.id}"/>" class="btn btn-primary btn-xs">Désactiver</a>
                            </c:when>
                            <c:when test="${menuuser.enabled eq false}">
                                <a href="<c:url value="/admin/enable/${menuuser.id}"/>"
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