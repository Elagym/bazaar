<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 04-02-16
  Time: 09:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="/WEB-INF/views/includes/head.jsp"/>
    <title>Create a new category</title>
</head>
<body>
<c:import url="/WEB-INF/views/includes/menu.jsp"/>
<table class="table table-striped table-hover ">
    <thead>
    <tr>
        <th>#</th>
        <th>Category name</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${categories}" var="cat">
        <tr>
            <td>${cat.id}</td>
            <td>${cat.name}</td>
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
