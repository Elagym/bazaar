<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Profile</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<div class="container-fluid size">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <a href="<c:url value="/user/update/${user.id}"/>" class="btn btn-default" style="float:right">Modifier
                profil</a>
            <h4 style="color:white;">Profile overview</h4>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <img src="<c:url value="/showimage/${user.imageUrl}"/>" alt="..."
                         style="width: 100%; max-height: 455px; border-radius:150px;">
                </div>
                <div class="col-sm-6 col-md-6">
                    <label> Username : </label> ${user.username} <br/>
                    <label> Email :</label> ${user.email} <br/>
                    <label> First name :</label> ${user.firstname}<br/>
                    <label> Last name :</label> ${user.lastname} <br/>
                    <label> Date of birth :</label> ${user.birthdate} <br/>
                    <label> Phone number :</label> ${user.phoneNumber} <br/>
                    <label> Description :</label> ${user.description} <br/>
                    <sec:authorize access="isAuthenticated()">
                        <c:if test="${user.id != currentUserId}">
                            <a href="#" class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#leaveComment">Leave a comment</a>
                        </c:if>
                    </sec:authorize>
                </div>
            </div>
            <hr>
            <div>
                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property='principal.username' var="principal"/>
                    <c:if test="${ principal == user.username}">
                        <ul class="nav nav-tabs">
                            <li role="presentation" class="active"><a href="#offers" aria-controls="home" role="tab" data-toggle="tab">Other offers</a></li>
                            <li role="presentation"><a href="#requests" aria-controls="home" role="tab" data-toggle="tab">Trading requests</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="offers" style="padding:10px;">
                    </c:if>
                </sec:authorize>
                <h5>Offers from ${user.username}</h5>
                <c:forEach items="${otherOffers}" var="otherOffer">
                    <div>
                        <a href="<c:url value="/offer/${otherOffer.id}"/>"> ${otherOffer.title}</a><br>
                        <span> ${otherOffer.description}</span>
                    </div>
                    <hr>
                </c:forEach>
                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property='principal.username' var="principal"/>
                    <c:if test="${ principal == user.username}">
                            </div>
                            <div role="tabpanel" class="tab-pane fade in active" id="requests" style="padding:10px;">

                            </div>
                        </div>
                    </c:if>
                </sec:authorize>
            </div>
        </div>
    </div>
</div>

</body>
<c:import url="includes/footer.jsp"/>
</html>
