<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Profile</title>
    <c:import url="../includes/head.jsp"/>
</head>
<body>
<c:import url="../includes/menu.jsp"/>
<div class="container-fluid size">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 style="color:white;">Profile Update</h4>
        </div>
        <div class="panel-body">
            <form:form method="post" action="update" commandName="updateUser">
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
                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#leaveComment">Leave
                                a comment</a>
                        </c:if>
                    </sec:authorize>
                </div>
            </div>
        </div>
        </form:form>
    </div>
</div>
</body>
<c:import url="../includes/footer.jsp"/>
</html>
