<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="/WEB-INF/views/includes/head.jsp"/>
    <title>Gestion des catégories</title>
</head>
<body>
<c:import url="/WEB-INF/views/includes/menu.jsp"/>
<table class="table table-striped table-hover ">
    <thead>
    <tr>
        <th>#</th>
        <th>Intitulé</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${categories}" var="cat">
        <tr>
            <td>${cat.id}</td>
            <td>${cat.name}</td>
            <td>
                <form:form action="deletecategory" method="post">
                    <c:choose>
                        <c:when test="${cat.id == 1}">
                            <button type="submit" class="btn btn-default" value="${cat.id}" name="categorynumber"
                                    disabled="true">Supprimer
                            </button>
                        </c:when>
                        <c:when test="${cat.id != 1}">
                            <button type="submit" class="btn btn-default" value="${cat.id}" name="categorynumber">
                                Supprimer
                            </button>
                        </c:when>
                    </c:choose>
                </form:form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    <form class="navbar-form navbar-left" action="createcategory" method="post">
        <div class="col-lg-6">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Nouvelle catégorie" name="newcategory">
      <span class="input-group-btn">
        <button class="btn btn-default" type="submit">Ajouter</button>
      </span>
            </div>
        </div>
    </form>
</table>
</body>
</html>
