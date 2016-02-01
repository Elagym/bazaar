<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<div class="container-fluid size">
    <form:form method="post" action="signup" commandName="signUpForm">

        <div class="row">
            <label for="usernameInput">Username : </label>
            <form:input path="username" id="usernameInput"></form:input>
            <form:errors path="username" cssclass="error"></form:errors>
        </div>

        <div class="row">
            <label for="passwordInput">Password : </label>
            <form:input type="password" path="password" id="passwordInput"></form:input>
            <form:errors path="password" cssclass="error"></form:errors>
        </div>

        <div class="row">
            <label for="checkPasswordInput">Confirm Password : </label>
            <form:input type="password" path="passwordCheck" id="checkPasswordInput"></form:input>
            <form:errors path="passwordMatch" cssclass="error"></form:errors>
        </div>


        <div class="row">
            <label for="emailInput">Email: </label>
            <form:input path="email" id="emailInput"></form:input>
            <form:errors path="email" cssclass="error"></form:errors>
        </div>


        <div class="row">
            <label for="firstNameInput">First Name : </label>
            <form:input path="firstName" id="firstNameInput"></form:input>
            <form:errors path="firstName" cssclass="error"></form:errors>
        </div>


        <div class="row">
            <label for="lastNameInput">Last Name : </label>
            <form:input path="lastName" id="lastNameInput"></form:input>
            <form:errors path="lastName" cssclass="error"></form:errors>
        </div>

        <div class="row">
            <label for="dateOfBirth">Date of birth : </label>
            <form:input type="date" path="dateOfBirth" id="dateIfBirth"></form:input>
            <form:errors path="dateOfBirth" cssclass="error"></form:errors>
        </div>

        <div class="row">
            <label for="phoneInput">Phone: </label>
            <form:input path="phoneNumber" id="phoneInput"></form:input>
            <form:errors path="phoneNumber" cssclass="error"></form:errors>
        </div>

        <div class="row">
            <label for="descriptionInput">Description : </label>
            <form:input path="description" id="descriptionInput" placeholder="Hobbies, occupations, etc."></form:input>
            <form:errors path="description" cssclass="error"></form:errors>
        </div>
        <input type="submit" value="Submit"/>
    </form:form>
</div>
</body>
</html>
