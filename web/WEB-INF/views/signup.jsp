<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Créer un compte</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<div class="container-fluid size">
    <div class="panel panel-primary" style="min-width: 480px;">
        <div class="panel-heading">
            <h4 style="color:white;">Créer un compte</h4>
        </div>
        <div class="panel-body">
            <form:form method="post" action="signup" commandName="signUpForm" enctype="multipart/form-data">
                <div class="col-sm-6 col-md-6 form-group">
                    <label for="usernameInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Nom d'utilisateur </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="username" id="usernameInput"></form:input>
                    </div>
                    <form:errors path="username" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label for="passwordInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Mot de passe </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input type="password" path="password" id="passwordInput"></form:input>
                    </div>
                    <form:errors path="password" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label for="checkPasswordInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Confirmez le mot de passe </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input type="password" path="passwordCheck" id="checkPasswordInput"></form:input>
                    </div>
                    <form:errors path="passwordMatch" cssclass="error"></form:errors>
                </div>


                <div class="form-group col-sm-6 col-md-6">
                    <label for="emailInput" class="col-xs-4 col-sm-4 col-md-4" style="display:inline; margin-top:5px;">Email </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="email" id="emailInput"></form:input>
                    </div>
                    <form:errors path="email" cssclass="error"></form:errors>
                </div>


                <div class="form-group col-sm-6 col-md-6">
                    <label for="firstNameInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Prénom </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="firstName" id="firstNameInput"></form:input>
                    </div>
                    <form:errors path="firstName" cssclass="error"></form:errors>
                </div>


                <div class="form-group col-sm-6 col-md-6">
                    <label for="lastNameInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Nom </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="lastName" id="lastNameInput"></form:input>
                    </div>
                    <form:errors path="lastName" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label for="dateOfBirth" class="col-xs-4 col-sm-4 col-md-4" style="display:inline; margin-top:5px;">Date
                        de naissance </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input type="date" path="dateOfBirth" id="dateIfBirth"></form:input>
                    </div>
                    <form:errors path="dateOfBirth" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label for="phoneInput" class="col-xs-4 col-sm-4 col-md-4" style="display:inline; margin-top:5px;">Téléphone </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="phoneNumber" id="phoneInput"></form:input>
                    </div>
                    <form:errors path="phoneNumber" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label for="descriptionInput" class="col-xs-4 col-sm-4 col-md-4" style="display:inline; margin-top:5px;">Description </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:textarea path="description" id="descriptionInput" placeholder="Hobbies, occupations, etc."></form:textarea>
                    </div>
                    <form:errors path="description" cssclass="error"></form:errors>
                </div>

                <div class="form-group col-sm-6 col-md-6">
                    <label class="col-xs-4 col-sm-4 col-md-4" for="image">Image* </label>
                    <div class="col-xs-8 col-sm-8 col-md-8">
                        <form:input type="file" class="form-control" id="image" path="imageURL"/>
                    </div>
                </div>

                <div class="row" style="text-align: center;">
                    <button class="btn btn-primary" type="submit" style="width: 100px; margin-top: 15px;">Soumettre
                    </button>
                    <button class="btn btn-primary" type="reset" style="width: 100px; margin-top: 15px;">Annuler
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
