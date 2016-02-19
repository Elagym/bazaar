<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="/WEB-INF/views/includes/head.jsp"/>
    <title>Manage reports</title>
</head>
<body>
<c:import url="/WEB-INF/views/includes/menu.jsp"/>
<div class="container-fluid">
    <table class="table table-striped table-hover ">
        <thead>
        <tr>
            <th>Report title</th>
            <th>Author</th>
            <th>Date</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${reports}" var="report">
            <%--<tr data-toggle="collapse" data-parent="#accordion" href="#collapseOne${user.id}"--%>
            <%--aria-expanded="false"--%>
            <%--aria-controls="collapseOne" style="cursor: pointer">--%>
            <tr>
                <td>
                        ${report.title}
                </td>
                <td>
                        ${report.author.username}
                </td>
                <td>
                        ${report.date}
                </td>
                <td>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>