<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Profile</title>
    <c:import url="includes/head.jsp"/>
    <%--<script src="<c:url value="/resources/js/consultproposition.js"/>"></script>--%> <%--Already included in menu.jsp--%>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<div class="container-fluid size">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <a href="<c:url value="/user/update/${user.id}"/>" class="btn btn-default" style="float:right">Modifier
                profil</a>
            <h4 style="color:white;">Profile overview</h4>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <img src="<c:url value="/showimage/${user.imageUrl}"/>" alt="..."
                         style="width: 100%; max-height: 455px; border-radius:150px;">
                </div>
                <div class="col-sm-6 col-md-6">
                    <label> Username : </label> ${user.username} <br/>
                    <label> Email :</label> ${user.email} <br/>
                    <label> First name :</label> ${user.firstname}<br/>
                    <label> Last name :</label> ${user.lastname} <br/>
                    <label> Date of birth :</label> ${user.birthdate} <br/>
                    <label> Phone number :</label> ${user.phoneNumber} <br/>
                    <label> Description :</label> ${user.description} <br/>
                    <span>Feedback : </span>
                        ${thumbsUp}<span class="glyphicon glyphicon-thumbs-up" style="font-size: 12px; margin-right: 5px; color:green;"></span>
                        ${thumbsDown} <span class="glyphicon glyphicon-thumbs-down" style="font-size: 12px; margin-right: 5px; color:red;"></span>
                        <span>(<a id="displayComments" href="#" data-toggle="modal" data-target="#showComments">${thumbsUp+thumbsDown}</a>)</span>

                    <div class="modal fade" id="showComments">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        <span class="glyphicon glyphicon-remove"></span></button>
                                    <h4 class="modal-title">${user.username} - Comments</h4>
                                </div>
                                <div id="modalComments" class="modal-body">

                                </div>
                            </div>
                        </div>
                    </div>
                    <sec:authorize access="isAuthenticated()">
                        <c:if test="${user.id != currentUserId}">
                            <a href="#" class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#leaveComment">Leave a comment</a>
                        </c:if>
                    </sec:authorize>
                </div>
            </div>
            <hr>
            <div>
                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property='principal.username' var="principal"/>
                    <c:if test="${ principal == user.username}">
                        <ul class="nav nav-tabs">
                            <li role="presentation" class="active"><a href="#offers" aria-controls="home" role="tab" data-toggle="tab">Other offers</a></li>
                            <li role="presentation"><a href="#requests" aria-controls="home" role="tab" data-toggle="tab">Trading requests</a></li>
                            <li role="presentation"><a href="#favs" aria-controls="home" role="tab" data-toggle="tab" onclick="showFavs()">Favourites offers</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="offers" style="padding:10px;">
                    </c:if>
                </sec:authorize>
                <h5>Offers from ${user.username}</h5>
                <c:forEach items="${otherOffers}" var="otherOffer">
                    <div>
                        <a href="<c:url value="/offer/${otherOffer.id}"/>"> ${otherOffer.title}</a><br>
                        <span> ${otherOffer.description}</span>
                    </div>
                    <hr>
                </c:forEach>
                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property='principal.username' var="principal"/>
                    <c:if test="${ principal == user.username}">
                            </div>
                            <div role="tabpanel" class="tab-pane" id="requests" style="padding:10px;">
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <th>Offer name</th>
                                        <th>Proposition</th>
                                        <th></th>
                                    </tr>
                                    <c:forEach var="proposition" items="${user.propositions}">
                                        <tr>
                                            <td>${proposition.offer.title}</td>
                                            <td><a role="button" data-toggle="collapse" href="#prop${proposition.id}" aria-expanded="false" aria-controls="prop${proposition.id}" onclick="consultProp(${proposition.id}, 'profile')">${proposition.title}</a></td>
                                            <td id="newIcon${proposition.id}">

                                                <c:if test="${not proposition.viewed}"><img src="<c:url value="/resources/images/new.png"/>" style="width:30px;"/></c:if>
                                                 </td>
                                        </tr>
                                        <tr class="panel-collapse collapse" id="prop${proposition.id}">
                                            <td colspan="3">
                                                <div id="consultProp${proposition.id}" class="panel-body">
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="favs" style="padding:10px;">
                                <table id="favTable" class="table table-striped table-hover">
                                    <%--Voir script--%>
                                </table>
                            </div>
                        </div>
                    </c:if>
                </sec:authorize>
            </div>
        </div>
    </div>
</div>
<script>
    var ctx = '${pageContext.request.contextPath}';
    function showFavs(){
        $.ajax("http://localhost:8080/bazaar/api/user/getfavsoffers/" + ${user.id}).done(function(data){
            var fav_table = $('#favTable');
            if(data.length > 0) {
                fav_table.html('<tr><th>Offer name</th><th>Author</th></tr>');
                $.each(data, function (i, offer) {
                    var line = $('<tr>').appendTo(fav_table);
                    var offer_info = $('<td>').appendTo(line);
                    $('<a>').attr('href', ctx + '/offer/' + offer.id).text(offer.title).appendTo(offer_info);
                    var author_info = $('<td>').appendTo(line);
                    $('<a>').attr('href', ctx + '/profile/' + offer.owner.id).text(offer.owner.username).appendTo(author_info);
                });
            } else {
                fav_table.html('You have no favourite offers');
            }
        });
    }
</script>
</body>
<c:import url="includes/footer.jsp"/>
</html>
