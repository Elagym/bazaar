<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
    var ctx = '${pageContext.request.contextPath}';
</script>


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
                <li <c:if test="${uri[3].equals(\"index.jsp\")}"> class="active" </c:if>><a href="<c:url value="/"/>">Accueil</a>
                </li>
                <li <c:if test="${uri[3].equals(\"offers.jsp\")}"> class="active" </c:if>><a
                        href="<c:url value="/offers"/>">Offres</a></li>
                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal" var="menuuser"/>
                    <li <c:if test="${uri[3].equals(\"create.jsp\")}"> class="active" </c:if>>
                        <a href="<c:url value="/user/create"/>">Créer une offre</a>
                    </li>
                </sec:authorize>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Catégories<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${categories}" var="category">
                            <li><a href="<c:url value="/offers/cat_id=${category.id}"/>">${category.name}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <%--<li <c:if test="${uri[3].equals(\"admin\")}"> class="active" </c:if>><a href="<c:url value="/admin/"/>">Admin</a></li>--%>
                    <li <c:if test="${uri[3].equals(\"admin\")}"> class="active" </c:if> class="dropdown" onclick="refreshReports();">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Admin <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value="/admin/managecategories"/>">Gestion des categories</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<c:url value="/admin/members"/>">Gestion des membres</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<c:url value="/admin/reports"/>"><span style="margin-right:10px;">Gestion des abus</span><span
                                    id="report-badge" class="badge" style="background-color:dodgerblue;"></span></a>
                            </li>
                        </ul>
                    </li>
                </sec:authorize>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="isAuthenticated()">
                    <li><a href="#" style="padding-right: 0;"><span id="prop-badge" class="badge" style="background-color:#C70D0D;" title="You have ${menuuser.newPropsCount} new propositions" data-toggle="modal" data-target="#newPropsModal" onclick="refreshProps()">${menuuser.newPropsCount}</span></a></li>
                    <li><a href="<c:url value="/profile/${menuuser.id}"/>">Mon profil</a></li>
                    <li><a href="<c:url value="/logout"/>">Déconnexion(${menuuser.username})</a></li>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <li <c:if test="${uri[3].equals(\"signup.jsp\")}"> class="active" </c:if>><a
                            href="<c:url value="/signup"/>">Créer un compte</a></li>
                    <li <c:if test="${uri[3].equals(\"login.jsp\")}"> class="active" </c:if>><a
                            href="<c:url value="/login"/>">Se connecter</a></li>
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
                            <h4 class="modal-title" id="myModalLabel">Nouvelles propositions</h4>
                        </div>
                        <div class="modal-body">
                            <table id="modalTable" class="table table-striped table-hover">
                                <tr>
                                    <th>Offer name</th>
                                    <th>Proposition</th>
                                    <th></th>
                                </tr>
                                <c:forEach var="proposition" items="${user.propositions}">
                                    <c:if test="${not proposition.viewed}">
                                        <tr>
                                            <td>${proposition.offer.title}</td>
                                            <td><a role="button" data-toggle="collapse" href="#propMenu${proposition.id}" aria-expanded="false" aria-controls="propMenu${proposition.id}" onclick="consultProp(${proposition.id}, 'menu'); decrement();">${proposition.title}</a></td>
                                            <td id="newIconMenu${proposition.id}"><c:if test="${not proposition.viewed}"><img src="<c:url value="/resources/images/new.png"/>" style="width:30px;"/></c:if> </td>
                                        </tr>
                                        <tr class="panel-collapse collapse" id="propMenu${proposition.id}">
                                            <td colspan="3">
                                                <div id="menuConsultProp${proposition.id}" class="panel-body">
                                                </div>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </sec:authorize>
    </div>
</nav>
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
    function refreshReports(){
        $.ajax("http://localhost:8080/bazaar/api/admin/getnewreportscount").done(function(data){
            console.log(data + 'new reports');
            $('#report-badge').text(data + ' new');
        });
    }
</script>