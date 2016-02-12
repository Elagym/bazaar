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
            <form:form method="post" commandName="signUpForm">
                <div class="col-sm-6 col-md-6">
                    <button type="button" class="btn btn-default" aria-label="Left Align">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="float:right"></span>
                    </button>
                    <img src="<c:url value="/showimage/${user.imageUrl}"/>" alt="..."
                         style="width: 100%; max-height: 455px; border-radius:150px;">
                </div>
                <div class="col-sm-6 col-md-6 form-group">
                    <label for="usernameInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Username </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="username" id="usernameInput" disabled="true" placeholder="${user.username}"
                                    value="${user.username}"></form:input>
                    </div>
                    <form:errors path="username" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label for="passwordInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Password </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input type="password" path="password" id="passwordInput"
                                    value="${user.password}"></form:input>
                    </div>
                    <form:errors path="password" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label for="checkPasswordInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Confirm Password </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input type="password" path="passwordCheck" id="checkPasswordInput"
                                    value="${user.password}"></form:input>
                    </div>
                    <form:errors path="passwordMatch" cssclass="error"></form:errors>
                </div>


                <div class="form-group col-sm-6 col-md-6">
                    <label for="emailInput" class="col-xs-4 col-sm-4 col-md-4" style="display:inline; margin-top:5px;">Email </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="email" id="emailInput" placeholder="${user.email}"
                                    value="${user.email}"></form:input>
                    </div>
                    <form:errors path="email" cssclass="error"></form:errors>
                </div>


                <div class="form-group col-sm-6 col-md-6">
                    <label for="firstNameInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">First Name </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="firstName" id="firstNameInput" placeholder="${user.firstname}"
                                    value="${user.firstname}"></form:input>
                    </div>
                    <form:errors path="firstName" cssclass="error"></form:errors>
                </div>


                <div class="form-group col-sm-6 col-md-6">
                    <label for="lastNameInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Last Name </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="lastName" id="lastNameInput" placeholder="${user.lastname}"
                                    value="${user.lastname}"></form:input>
                    </div>
                    <form:errors path="lastName" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label for="dateOfBirth" class="col-xs-4 col-sm-4 col-md-4" style="display:inline; margin-top:5px;">Date
                        of birth </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input type="date" path="dateOfBirth" id="dateIfBirth"
                                    value="${user.birthdate}"></form:input>
                    </div>
                    <form:errors path="dateOfBirth" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label for="phoneInput" class="col-xs-4 col-sm-4 col-md-4" style="display:inline; margin-top:5px;">Phone </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="phoneNumber" id="phoneInput" placeholder="${user.phoneNumber}"
                                    value="${user.phoneNumber}"></form:input>
                    </div>
                    <form:errors path="phoneNumber" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label for="descriptionInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Description </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:textarea path="description" id="descriptionInput" placeholder="${user.description}"
                                       value="${user.description}"></form:textarea>
                    </div>
                    <form:errors path="description" cssclass="error"></form:errors>
                </div>

                <div class="row" style="text-align: center;">
                    <button class="btn btn-primary" type="submit" style="width: 100px; margin-top: 15px;">Submit
                    </button>
                    <button class="btn btn-primary" type="reset" style="width: 100px; margin-top: 15px;">Cancel</button>
                </div>
            </form:form>
    </div>
</div>
</body>
<c:import url="../includes/footer.jsp"/>
</html>
