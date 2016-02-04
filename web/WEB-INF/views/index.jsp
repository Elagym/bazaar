<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                <img src="<c:url value="/showimage/${offer.imageUrl}"/>" alt="..." class="img-thumbnail thumbnail">
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
                                            <c:when test="${i < offers.size()}">,<c:set var="i" value="${i+1}"/></c:when>
                                            <c:when test="${i == offers.size()}">.</c:when>
                                        </c:choose>
                                    </c:forEach>
                                </span>
                                <span style="float:right;">Author : <a href="#">${offer.owner.username}</a></span>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="panel panel-default">
                        <div class="panel-body offer-height">
                            <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." class="img-thumbnail thumbnail">
                            <p><b>Annonce 1</b> <span class="index-offer-date">27/01/2016</span></p>
                            <p>Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo </p>
                        </div>
                        <div class="panel-footer">
                            <span>Category : <a href="#">cat 1</a>, <a href="#">cat 2</a>, <a href="#">cat 3</a></span>
                            <span style="float:right;">Author : <a href="#">Vince</a></span>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body offer-height">
                            <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." class="img-thumbnail thumbnail">
                            <p><b>Annonce 2</b> <span class="index-offer-date">27/01/2016</span></p>
                            <p>Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo </p>
                        </div>
                        <div class="panel-footer">
                            <span>Category : <a href="#">cat 1</a>, <a href="#">cat 2</a>, <a href="#">cat 3</a></span>
                            <span style="float:right;">Author : <a href="#">Vince</a></span>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body offer-height">
                            <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." class="img-thumbnail thumbnail">
                            <p><b>Annonce 3</b> <span class="index-offer-date">27/01/2016</span></p>
                            <p>Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo </p>
                        </div>
                        <div class="panel-footer">
                            <span>Category : <a href="#">cat 1</a>, <a href="#">cat 2</a>, <a href="#">cat 3</a></span>
                            <span style="float:right;">Author : <a href="#">Vince</a></span>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body offer-height">
                            <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." class="img-thumbnail thumbnail">
                            <p><b>Annonce 4</b> <span class="index-offer-date">27/01/2016</span></p>
                            <p>Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo </p>
                        </div>
                        <div class="panel-footer">
                            <span>Category : <a href="#">cat 1</a>, <a href="#">cat 2</a>, <a href="#">cat 3</a></span>
                            <span style="float:right;">Author : <a href="#">Vince</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cotnainer-fluid col-md-4">
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
