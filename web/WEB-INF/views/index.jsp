<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Title</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>

<div class="container-fluid size">
    <div class="container-fluid col-md-8">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 style="color:white;">Last offers</h4>
            </div>
            <div class="panel-body">
                <c:forEach items="${offers}" var="offer">
                    <div class="panel panel-default">
                        <div class="panel-body offer-height">
                            <!-- <img src="<c:url value="/showimage/${offer.imageUrl}"/>" alt="..." class="img-thumbnail thumbnail"> -->
                            <img src="${offer.imageUrl}" class="img-thumbnail thumbnail">
                            <p><a href="<c:url value="/offer/${offer.id}"/>"><b>${offer.title}</b></a> <span
                                    class="index-offer-date">${offer.creationDate}</span></p>
                            <p>${offer.description}</p>
                        </div>
                        <div class="panel-footer">
                                <span>Category :
                                    <c:set var="i" value="0"/>
                                    <c:forEach items="${offer.categories}" var="category">
                                        <a href="<c:url value="/offers/cat_id=${category.id}"/>">${category.name}</a>
                                        <%--Séparation des categories--%>
                                        <c:choose>
                                            <c:when test="${i == offer.categories.size()-1}">.</c:when>
                                            <c:when test="${i < offer.categories.size()-1}">,<c:set var="i" value="${i+1}"/></c:when>
                                        </c:choose>
                                    </c:forEach>
                                </span>
                            <span style="float:right;">Author : <a href="<c:url value="/profile/${offer.owner.id}"/>">${offer.owner.username}</a></span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="container-fluid col-md-4">
        <sec:authorize access="isAuthenticated()">
            <div class="panel panel-primary" style="width:100%;">
                <div class="panel-body">
                    Bienvenue <b>${user.username}</b> :-)
                </div>
            </div>
        </sec:authorize>
        <div class="panel panel-primary" style="width:100%;">
            <div class="panel-body">
                Troquez dans la bonne humeur sur Bazaar :)
                /* presentation */
            </div>
        </div>
        <div class="panel panel-primary" style="width:100%;">
            <div class="panel-heading">
                <h4 style="color:white;">Follow us on facebook</h4>
            </div>
            <div class="panel-body">
                Body content
            </div>
        </div>
        <div class="panel panel-primary" style="width:100%;">
            <div class="panel-heading">
                <h4 style="color:white;">Partenaires</h4>
            </div>
            <div class="panel-body">
                Body content
            </div>
        </div>
    </div>
</div>
</body>
<c:import url="includes/footer.jsp"/>
</html>
