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
                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal" var="menuuser"/>
                    <li <c:if test="${uri[3].equals(\"create\")}"> class="active" </c:if>>
                        <a href="<c:url value="/user/create"/>">Create offer</a>
                    </li>
                </sec:authorize>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Categories<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${categories}" var="category">
                            <li><a href="<c:url value="/offers/cat_id=${category.id}"/>">${category.name}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <%--<li <c:if test="${uri[3].equals(\"admin\")}"> class="active" </c:if>><a href="<c:url value="/admin/"/>">Admin</a></li>--%>
                    <li <c:if test="${uri[3].equals(\"admin\")}"> class="active" </c:if> class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Admin <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value="/admin/managecategories"/>">Manage categories</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<c:url value="/admin/members"/>">Members</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<c:url value="/admin/reports"/>">Reports<span id="report-badge" class="badge" style="background-color:dodgerblue;" title="You have %xxx% new propositions" data-toggle="modal" data-target="#newReportsModal" onclick="">0</span></a></li>
                        </ul>
                    </li>
                </sec:authorize>

            </ul>
            <script>
                function refreshProps(){
                    $.ajax("http://localhost:8080/bazaar/api/user/getnewpropscount/" + ${menuuser.id}).done( function(data){
                        if(data.length == 0) {
                            $('#prop-badge').hide();
                        }
                        else {
                            $('#prop-badge').text(data.length);

                            var modal_table = $('#modalTable');
                            modal_table.html('');
                            $('<tr>').html('<th>Offer name</th><th>Proposition</th><th></th>').appendTo(modal_table);
                            $.each(data, function (i, prop) {
                                var line = $('<tr>').appendTo(modal_table);
                                $('<td>').html(prop.offer.title).appendTo(line);
                                var prop_title = $('<td>').appendTo(line);
                                $('<a>').attr({
                                    'role': 'button',
                                    'data-toggle': 'collapse',
                                    'href': '#menuprop' + prop.id,
                                    'aria-expended': 'false',
                                    'aria-controls': 'menuprop' + prop.id,
                                    'onclick': 'consultProp(' + prop.id + ', "menu"); decrement();'
                                }).html(prop.title).appendTo(prop_title);
                                var icon_block = $('<td>').attr('id', 'newIconMenu' + prop.id).appendTo(line);
                                $('<img>').attr({
                                    'src': '<c:url value="/resources/images/new.png"/>', 'style': 'width:30px'
                                }).appendTo(icon_block);
                                var collapse_line = $('<tr>').attr({
                                    'class': 'panel-collapse collapse', 'id': 'menuprop' + prop.id
                                }).appendTo(modal_table);
                                var collapse_content = $('<td>').attr('colspan', 3).appendTo(collapse_line);
                                $('<div>').attr({
                                    'id': 'menuConsultProp' + prop.id, 'class': 'panel-body'
                                }).appendTo(collapse_content);
                            });
                        }
                    });
                }
                $(document).ready(function() {
                    refreshProps();
                });
            </script>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="isAuthenticated()">
                    <li><a href="#" style="padding-right: 0;"><span id="prop-badge" class="badge" style="background-color:#C70D0D;" title="You have ${menuuser.newPropsCount} new propositions" data-toggle="modal" data-target="#newPropsModal" onclick="refreshProps()">${menuuser.newPropsCount}</span></a></li>
                    <li><a href="<c:url value="/profile/${menuuser.id}"/>">My profile</a></li>
                    <li><a href="<c:url value="/logout"/>">Log out(${menuuser.username})</a></li>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <li <c:if test="${uri[3].equals(\"signup.jsp\")}"> class="active" </c:if>><a
                            href="<c:url value="/signup"/>">Sign up</a></li>
                    <li <c:if test="${uri[3].equals(\"login.jsp\")}"> class="active" </c:if>><a
                            href="<c:url value="/login"/>">Log in</a></li>
                </sec:authorize>
            </ul>
        </div>
        <%--Modal new Props--%>
        <sec:authorize access="isAuthenticated()">
            <div class="modal fade" id="newPropsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">New propositions</h4>
                        </div>
                        <div class="modal-body">
                            <table id="modalTable" class="table table-striped table-hover">
                                <%--<tr>--%>
                                    <%--<th>Offer name</th>--%>
                                    <%--<th>Proposition</th>--%>
                                    <%--<th></th>--%>
                                <%--</tr>--%>
                                <%--<c:forEach var="proposition" items="${user.propositions}">--%>
                                    <%--<c:if test="${not proposition.viewed}">--%>
                                        <%--<tr>--%>
                                            <%--<td>${proposition.offer.title}</td>--%>
                                            <%--<td><a role="button" data-toggle="collapse" href="#prop${proposition.id}" aria-expanded="false" aria-controls="prop${proposition.id}" onclick="consultProp(${proposition.id}); decrement();">${proposition.title}</a></td>--%>
                                            <%--<td id="newIcon${proposition.id}"><c:if test="${not proposition.viewed}"><img src="<c:url value="/resources/images/new.png"/>" style="width:30px;"/></c:if> </td>--%>
                                        <%--</tr>--%>
                                        <%--<tr class="panel-collapse collapse" id="prop${proposition.id}">--%>
                                            <%--<td colspan="3">--%>
                                                <%--<div id="consultProp${proposition.id}" class="panel-body">--%>
                                                <%--</div>--%>
                                            <%--</td>--%>
                                        <%--</tr>--%>
                                    <%--</c:if>--%>
                                <%--</c:forEach>--%>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </sec:authorize>
    </div>
</nav>