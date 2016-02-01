<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<form action=
      <c:url value="/login"/> method="post" class="form-horizontal">
    <fieldset>
        <legend>Login Page</legend>
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
            <div class="col-lg-10 col-lg-offset-2">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </fieldset>
</form>
</body>
<c:import url="includes/footer.jsp"/>
</html>
