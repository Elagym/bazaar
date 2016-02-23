<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mon Profil</title>
    <c:import url="includes/head.jsp"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/js/bootstrap-switch.js"></script>
    <script src="<c:url value="/resources/js/showcomments.js"/>"></script>
    <%--<script src="<c:url value="/resources/js/consultproposition.js"/>"></script>--%> <%--Already included in menu.jsp--%>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<sec:authentication property='principal' var="principal"/>
<div class="container-fluid size">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <a href="<c:url value="/user/update/${user.id}"/>" class="btn btn-default" style="float:right">Modifier le
                profil</a>
            <h4 style="color:white;">Mon profil</h4>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <img src="<c:url value="/showimage/${user.imageUrl}"/>" alt="..."
                         style="width: 100%; max-height: 455px; border-radius:150px;">
                </div>
                <div class="col-sm-6 col-md-6">
                    <label> Nom d'utilisateur : </label> ${user.username} <br/>
                    <label> Email :</label> ${user.email} <br/>
                    <label> Prénom :</label> ${user.firstname}<br/>
                    <label> Nom :</label> ${user.lastname} <br/>
                    <label> Date de naissance :</label> ${user.birthdate} <br/>
                    <label> Téléphone :</label> ${user.phoneNumber} <br/>
                    <label> Description :</label> ${user.description} <br/>
                    <span>Avis : </span>
                        ${thumbsUp}<span class="glyphicon glyphicon-thumbs-up" style="font-size: 12px; margin-right: 5px; color:green;"></span>
                        ${thumbsDown} <span class="glyphicon glyphicon-thumbs-down" style="font-size: 12px; margin-right: 5px; color:red;"></span>
                        <span>(<a id="displayComments" href="#" data-toggle="modal" data-target="#showComments">${thumbsUp+thumbsDown}</a>)</span>

                    <div class="modal fade" id="showComments">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        <span class="glyphicon glyphicon-remove"></span></button>
                                    <h4 class="modal-title">${user.username} - Commentaires</h4>
                                </div>
                                <div id="modalComments" class="modal-body">

                                </div>
                            </div>
                        </div>
                    </div>

                    <sec:authorize access="isAuthenticated()">
                        <c:if test="${user.id != principal.id}">
                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                               data-target="#leaveComment">Laisser un commentaire</a>
                        </c:if>
                    </sec:authorize>
                    <div class="modal fade" id="leaveComment">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        <span class="glyphicon glyphicon-remove"></span></button>
                                    <h4 class="modal-title">${user.username} - Laisser un commentaire</h4>
                                </div>
                                <form action="<c:url value="/commentfromprofile"/>" method="post" id="formComment"
                                      class="form-horizontal">
                                    <div class="modal-body">
                                        <div style="height:30px; text-align:center; margin-bottom:40px;">
                                            <span>Votre avis ?</span><br/>
                                            <input type="checkbox" name="thumb" onColor="success"
                                                   offColor="danger"
                                                   data-on-text="<i class='glyphicon glyphicon-thumbs-up'></i>"
                                                   data-off-text="<i class='glyphicon glyphicon-thumbs-down'></i>"
                                                   data-on-color="success" data-off-color="danger" checked>
                                        </div>
                                        <div class="form-group">
                                            <label for="commentTitle" class="col-xs-3 col-sm-3 col-md-3"
                                                   style="display:inline; margin-top:5px;">Commentaires </label>
                                            <div class="col-xs-9 col-sm-9 col-md-9"
                                                 style="display:inline; margin-top:5px;">
                                                <input type="text" name="title" id="commentTitle"
                                                       placeholder="Title" rows="3" style="width: 90%;"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="messageInput" class="col-xs-3 col-sm-3 col-md-3"
                                                   style="display:inline; margin-top:5px;">Message </label>
                                            <div class="col-xs-9 col-sm-9 col-md-9"
                                                 style="display:inline; margin-top:5px;">
                                                        <textarea name="message" id="messageInput"
                                                                  placeholder="Leave your comment here" rows="3"
                                                                  style="width: 90%;"></textarea>
                                            </div>
                                        </div>
                                        <input type="hidden" value="${user.id}" name="userId">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Envoyer</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div>
                <sec:authorize access="isAuthenticated()">
                    <c:if test="${ principal.username == user.username}">
                        <ul class="nav nav-tabs">
                            <li role="presentation" class="active"><a href="#offers" aria-controls="home" role="tab"
                                                                      data-toggle="tab">Autres offres</a></li>
                            <li role="presentation"><a href="#requests" aria-controls="home" role="tab"
                                                       data-toggle="tab">Propositions en attente</a></li>
                            <li role="presentation"><a href="#favs" aria-controls="home" role="tab" data-toggle="tab"
                                                       onclick="showFavs()">Mes favoris</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="offers" style="padding:10px;">
                    </c:if>
                </sec:authorize>
                                <h5>Offres de ${user.username}</h5>
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
                                        <th>Titre de l'offre</th>
                                        <th>Proposition</th>
                                        <th></th>
                                    </tr>
                                    <c:forEach var="proposition" items="${user.propositions}">
                                        <tr>
                                            <td>${proposition.offer.title}</td>
                                            <td><a role="button" data-toggle="collapse" href="#prop${proposition.id}" aria-expanded="false" aria-controls="prop${proposition.id}" onclick="consultProp(${proposition.id}, 'profile'); decrementIfNotViewed(${proposition.id});">${proposition.title}</a></td>
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
    $("[name='thumb']").bootstrapSwitch();
    var id = ${user.id};
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
                fav_table.html('Vous n\'avez pas de favoris.');
            }
        });
    }
</script>
</body>
<c:import url="includes/footer.jsp"/>
</html>
