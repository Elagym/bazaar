<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <%--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">--%>
            <%--<span class="sr-only">Toggle navigation</span>--%>
            <%--<span class="icon-bar"></span>--%>
            <%--<span class="icon-bar"></span>--%>
            <%--<span class="icon-bar"></span>--%>
            <%--</button>--%>
            <a class="navbar-brand" href="<c:url value="/"/>"><span style="color:red;font-style: italic;">Bazaar</span></a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <c:set var="uri" value="${fn:split(pageContext.request.requestURI, '/')}"/>
            <ul class="nav navbar-nav">
                <li <c:if test="${uri[3].equals(\"index.jsp\")}"> class="active" </c:if>><a href="<c:url value="/"/>">Index</a>
                </li>
                <li <c:if test="${uri[3].equals(\"offers.jsp\")}"> class="active" </c:if>><a
                        href="<c:url value="/offers"/>">Offers</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Categories<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${categories}" var="category">
                            <li><a href="#">${category.name}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <%--<li <c:if test="${uri[3].equals(\"admin\")}"> class="active" </c:if>><a href="<c:url value="/admin/"/>">Admin</a></li>--%>
                    <li <c:if test="${uri[3].equals(\"admin\")}"> class="active" </c:if> class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Admin <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value="/admin/"/>">Index</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<c:url value="/admin/members"/>">Members</a></li>
                        </ul>
                    </li>
                </sec:authorize>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="isAuthenticated()">
                    <li><a href="<c:url value="/profile"/>">My profile</a></li>
                    <li><a href="<c:url value="/logout"/>">Log out</a></li>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <li <c:if test="${uri[3].equals(\"signup.jsp\")}"> class="active" </c:if>><a
                            href="<c:url value="/signup"/>">Sign up</a></li>
                    <li <c:if test="${uri[3].equals(\"login.jsp\")}"> class="active" </c:if>><a
                            href="<c:url value="/login"/>">Log in</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>