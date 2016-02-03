<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<div class="container-fluid size">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 style="color:white;">Log in</h4>
        </div>
        <div class="panel-body">
            <form action="<c:url value="/login"/>" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label for="inputusername" class="col-lg-2 control-label">Username</label>
                        <div class="col-lg-3">
                            <input type="text" class="form-control" id="inputusername" placeholder="Username" name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputpassword" class="col-lg-2 control-label">Password</label>
                        <div class="col-lg-3">
                            <input type="password" class="form-control" id="inputpassword" placeholder="Password"
                                   name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
            </form>
            <c:if test="${errorMessage != null}">
                <div class="error-alert" style="width:200px;">
                    <strong>Error!</strong>
                    <span>${errorMessage}</span>
                </div>
            </c:if>
        </div>
    </div>
</div>
</body>
<c:import url="includes/footer.jsp"/>
</html>
