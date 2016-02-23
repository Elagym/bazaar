<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mise à jour du profil</title>
    <c:import url="../includes/head.jsp"/>
</head>
<body>
<c:import url="../includes/menu.jsp"/>
<div class="container-fluid size">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 style="color:white;">Mise à jour du profil</h4>
        </div>
        <div class="panel-body">
            <form:form method="post" commandName="updateUserForm" enctype="multipart/form-data">
                <div class="col-sm-6 col-md-6">
                    <img src="<c:url value="/showimage/${user.imageUrl}"/>" alt="..."
                         style="width: 100%; max-height: 455px; border-radius:150px;">
                </div>
                <div class="col-sm-6 col-md-6 form-group">
                    <label for="usernameInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Nom d'utilisateur </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:input path="username" id="usernameInput" disabled="true"></form:input>
                    </div>
                    <form:errors path="username" cssclass="error"></form:errors>
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
                        <form:input type="date" path="dateOfBirth" id="dateOfBirth"></form:input>
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
                    <label for="descriptionInput" class="col-xs-4 col-sm-4 col-md-4"
                           style="display:inline; margin-top:5px;">Description </label>
                    <div class="col-xs-8 col-sm-8 col-md-8" style="display:inline; margin-top:5px;">
                        <form:textarea path="description" id="descriptionInput"></form:textarea>
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
                    <button class="btn btn-primary" type="submit" style="width: 100px; margin-top: 15px;">Appliquer
                    </button>
                    <button class="btn btn-primary" type="reset" style="width: 100px; margin-top: 15px;">Annuler
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
<c:import url="../includes/footer.jsp"/>
</html>
