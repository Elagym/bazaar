<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h4 style="color:white;">Profile overview</h4>
        </div>
        <div class="panel-body">
            <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." class="img-thumbnail thumbnail">
            <label> Username : </label> ${user.username} <br/>
            <label> Email :</label> ${user.email} <br/>
            <label> First name :</label> ${user.firstname}<br/>
            <label> Last name :</label> ${user.lastname} <br/>
            <label> Date of birth :</label> ${user.birthdate} <br/>
            <label> Phone number :</label> ${user.phoneNumber} <br/>
            <label> Description :</label> ${user.description} <br/>
            <hr>
            <div>
                <h5>Offers from ${user.username}</h5>
                <c:forEach items="${otherOffers}" var="otherOffer">
                    <div>
                        <a href="<c:url value="/offer/${otherOffer.id}"/>"> ${otherOffer.title}</a><br>
                        <span> ${otherOffer.description}</span>
                    </div>
                    <hr>
                </c:forEach>
            </div>
        </div>
    </div>

</div>

</body>
<c:import url="includes/footer.jsp"/>
</html>
