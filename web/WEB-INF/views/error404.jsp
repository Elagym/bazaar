<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1>Oops!</h1><br>
                <h2>404 Not Found</h2><br>
                <h3>Sorry, an error has occured. Requested page not found!</h3>
                <div class="error-actions">
                    <br>
                    <a href="<c:url value="/"/>" class="btn btn-primary btn-lg"><span
                            class="glyphicon glyphicon-home"></span>Take Me Home </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<c:import url="includes/footer.jsp"/>
</html>
