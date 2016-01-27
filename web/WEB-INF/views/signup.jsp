<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<form action="signup" method="post" class="form-horizontal">
    <fieldset>
        <legend>Create an account</legend>
        <div class="form-group">
            <label for="inputEmail" class="col-lg-2 control-label">Email</label>
            <div class="col-lg-6">
                <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="inputEmail">
            </div>
        </div>
        <div class="form-group">
            <label for="inputUsername" class="col-lg-2 control-label">Username</label>
            <div class="col-lg-3">
                <input type="text" class="form-control" id="inputUsername" placeholder="Username" name="inputUsername">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-lg-2 control-label">Password</label>
            <div class="col-lg-3">
                <input type="password" class="form-control" id="inputPassword" placeholder="Password"
                       name="inputPassword">
            </div>
        </div>
        <div class="form-group">
            <label for="dateOfBirth" class="col-lg-2 control-label">Birth Date</label>
            <div class="col-lg-1">
                <input type="date" class="form-control" id="dateOfBirth" min="1979-12-31" max="2005-01-01"
                       name="inputBirthdate">
            </div>
        </div>
        <div class="form-group">
            <label for="textArea" class="col-lg-2 control-label">Description</label>
            <div class="col-lg-6">
                <textarea class="form-control" rows="3" id="textArea"></textarea>
                <span class="help-block">Describe yourself, what you like, what you're working on, etc.</span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputProfilePic" class="col-lg-2 control-label">Profile Picture</label>
            <div class="col-lg-3">
                <input type="text" class="form-control" id="inputProfilePic" placeholder="Profile Picture">
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <button type="reset" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </fieldset>
</form>
</body>
</html>
