<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Offres</title>
    <c:import url="includes/head.jsp"/>
    <script src="<c:url value="/resources/js/refresh.js"/>"></script>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<div class="container-fluid size">
    <%--<form:form method="get" class="form-horizontal" commandName="searchForm">--%>
        <%--<form:radiobutton path="searchType" class="btn btn-primary" value="Most recent"/>--%>
        <%--<form:radiobutton path="searchType" class="btn btn-primary" value="Most famous"/>--%>
    <%--</form:form>--%>
    <%--<button class="btn btn-primary">Most recent offers</button>--%>
    <%--<button class="btn btn-primary" style="display:inline; margin-right: 5px;">Most famous</button>--%>
    <%--<form class="form-inline" action="#" style="display:inline;">--%>
    <%--<div class="form-group">--%>
    <%--<div class="input-group">--%>
    <%--<input type="text" class="form-control" placeholder="Search">--%>
    <%--<span class="input-group-btn">--%>
    <%--<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span>--%>
    <%--</button>--%>
    <%--</span>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</form>--%>
    <c:if test="${category != null}">
        <span id="criteria"><button class="btn btn-primary btn-sm">Catégorie : ${category.name}<span id="categorySearch"
                                                                                                     class="glyphicon glyphicon-remove"
                                                                                                     style="color:#337ab7; margin-left:5px;"></span>
        </button></span>
    </c:if>
    <div class="panel panel-primary" style="margin-top:5px;">
        <div class="panel-heading">
            <h4 style="color:white;">Offres</h4>
        </div>
        <div id="mainPanel" class="panel-body">
            <c:forEach items="${offers}" var="offer">
                <div class="panel panel-default">
                    <div class="panel-body offer-height">
                        <img src="<c:url value="/showimage/${offer.imageUrl}"/>" alt="..." class="img-thumbnail thumbnail">
                        <p>
                            <a href="<c:url value="/offer/${offer.id}"/>"><b>${offer.title}</b></a>
                            <span class="index-offer-date">${offer.creationDate}</span>
                        </p>
                        <p>${offer.description}</p>
                    </div>
                    <div class="panel-footer">
                        <span>Categories :
                            <c:set var="i" value="0"/>
                            <c:forEach items="${offer.categories}" var="category">
                                <a href="<c:url value="/offers/cat_id=${category.id}"/>">${category.name}</a>
                                <%--Séparation des categories--%>
                                <c:choose>
                                    <c:when test="${i < offer.categories.size()-1}">,<c:set var="i" value="${i+1}"/></c:when>
                                    <c:when test="${i == offer.categories.size()-1}">.</c:when>
                                </c:choose>
                            </c:forEach>
                        </span>
                        <span style="float:right;">Auteur : <a href="#">${offer.owner.username}</a></span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</div>
<script>
    var ctx = '${pageContext.request.contextPath}';
</script>
</body>
<c:import url="includes/footer.jsp"/>

</html>
