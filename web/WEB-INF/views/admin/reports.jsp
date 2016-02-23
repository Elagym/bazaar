<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="/WEB-INF/views/includes/head.jsp"/>
    <title>Gestion des abus</title>
    <script src="<c:url value="/resources/js/consultreport.js"/>"></script>
</head>
<body>
<c:import url="/WEB-INF/views/includes/menu.jsp"/>
<div class="container-fluid">
    <table class="table table-striped table-hover ">
        <thead>
        <tr>
            <th>Titre du signalement</th>
            <th>Auteur</th>
            <th>Date</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${reports}" var="report">
            <%--<tr data-toggle="collapse" data-parent="#accordion" href="#collapseOne${user.id}"--%>
            <%--aria-expanded="false"--%>
            <%--aria-controls="collapseOne" style="cursor: pointer">--%>
            <tr data-toggle="collapse" href="#report${report.id}" aria-expanded="false" aria-controls="report${report.id}" style="cursor:pointer;" onclick="consultReport(${report.id});">
                <td>
                        ${report.title}
                </td>
                <td>
                        ${report.author.username}
                </td>
                <td>
                        ${report.date}
                </td>
                <td id="newIcon${report.id}">
                    <c:if test="${not report.viewed}"><img src="<c:url value="/resources/images/new.png"/>" style="width: 30px;"/></c:if>
                </td>
            </tr>
            <tr class="panel-collapse collapse" id="report${report.id}">
                <td colspan="4">
                    <div id="consultReport${report.id}" class="panel-body">

                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>