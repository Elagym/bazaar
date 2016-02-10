<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Offers</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<div class="container-fluid size">
    <button class="btn btn-primary">Most recent offers</button>
    <button class="btn btn-primary" style="display:inline; margin-right: 5px;">Most famous</button>
    <form class="form-inline" action="#" style="display:inline;">
        <div class="form-group">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span>
                      </button>
                    </span>
            </div>
        </div>
    </form>
    <div class="panel panel-primary" style="margin-top:5px;">
        <div class="panel-heading">
            <h4 style="color:white;">Offers</h4>
        </div>
        <div class="panel-body">
            <c:forEach items="${offers}" var="offer">
                <div class="panel panel-default">
                    <div class="panel-body offer-height">
                        <img src="${offer.imageUrl}" alt="..."
                             class="img-thumbnail thumbnail">
                        <p><b>${offer.title}</b> <span class="index-offer-date">${offer.creationDate}</span></p>
                        <p>${offer.description}</p>
                    </div>
                    <div class="panel-footer">
                        <span>Category :
                                    <c:set var="i" value="0"/>
                                    <c:forEach items="${offer.categories}" var="category">
                                        <a href="#">${category.name}</a>
                                        <%--Séparation des categories--%>
                                        <c:choose>
                                            <c:when test="${i < offers.size()}">,<c:set var="i"
                                                                                        value="${i+1}"/></c:when>
                                            <c:when test="${i == offers.size()}">.</c:when>
                                        </c:choose>
                                    </c:forEach>
                                </span>
                        <span style="float:right;">Author : <a href="#">${offer.owner.username}</a></span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</div>
</body>
<c:import url="includes/footer.jsp"/>

</html>
