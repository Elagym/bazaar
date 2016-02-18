<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Offer : ${offer.title}</title>
    <c:import url="includes/head.jsp"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/js/bootstrap-switch.js"></script>
    <script src="<c:url value="/resources/js/showcomments.js"/>"></script>
    <script src="<c:url value="/resources/js/likeoffer.js"/>"></script>
</head>
<body>
<c:import url="includes/menu.jsp"/>
<div class="container-fluid size">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 style="font-weight: bold; float: right;">Expect : ${offer.expectation}</h4>
            <h4 style="color:white;">${offer.title}</h4>
        </div>
        <div class="panel-body">
            <sec:authorize access="isAuthenticated()">

                <c:choose>
                    <c:when test="${alreadyLiked}">
                        <span style="float:right;"><span id="likeCount">${offer.popularity}</span><span id="likeOffer"
                                                                                                        class="glyphicon glyphicon-heart"
                                                                                                        style="color:#FF4C6C;cursor:pointer;"></span></span>
                    </c:when>
                    <c:when test="${not alreadyLiked}">
                        <span style="float:right;"><span id="likeCount">${offer.popularity}</span><span id="likeOffer"
                                                                                                        class="glyphicon glyphicon-heart"
                                                                                                        style="cursor:pointer;"></span></span>
                    </c:when>
                </c:choose>
            </sec:authorize>
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <%--<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">--%>
                    <%--<!-- Indicators -->--%>
                    <%--<ol class="carousel-indicators">--%>
                    <%--<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>--%>
                    <%--<li data-target="#carousel-example-generic" data-slide-to="1"></li>--%>
                    <%--</ol>--%>

                    <%--<!-- Wrapper for slides -->--%>
                    <%--<div class="carousel-inner" role="listbox">--%>
                    <%--<div class="item active">--%>
                    <img src="<c:url value="/showimage/${offer.imageUrl}"/>" alt="..."
                         style="width: 100%; max-height: 455px;">
                    <%--<div class="carousel-caption">--%>
                    <%--Image 1--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                    <%--<img src="<c:url value="/showimage/${offer.imageUrl}"/>" alt="..." style="width: 100%; max-height: 455px">--%>
                    <%--<div class="carousel-caption">--%>
                    <%--Image 2--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <!-- Controls -->
                    <%--<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">--%>
                    <%--<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>--%>
                    <%--<span class="sr-only">Previous</span>--%>
                    <%--</a>--%>
                    <%--<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">--%>
                    <%--<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>--%>
                    <%--<span class="sr-only">Next</span>--%>
                    <%--</a>--%>
                    <%--</div>--%>
                </div>
                <div class="col-sm-6 col-md-6">
                    <p>Estimation of the belonging : ${offer.estimation}€</p>
                    <p>Phone number : ${owner.phoneNumber}</p>
                    <p>Address : ${offer.address}</p>
                    <p>Zip Code : ${offer.zipCode}</p>
                    <p>Published on : ${offer.creationDate}</p>
                    <p>Expiration date : ${offer.expirationDate}</p>
                </div>
            </div>
            <div>
                <%--nav tabs--%>
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#desc" aria-controls="home" role="tab" data-toggle="tab">Description</a></li>
                    <c:if test="${owner.id != currentUserId}">
                        <li role="presentation"><a href="#contact" aria-controls="home" role="tab" data-toggle="tab">Contact</a></li>
                    </c:if>
                    <li role="presentation"><a href="#owner" aria-controls="home" role="tab" data-toggle="tab">Owner profile</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="desc" style="padding:10px;">
                        ${offer.description}
                    </div>
                    <c:if test="${owner.id != currentUserId}">
                        <div role="tabpanel" class="tab-pane fade " id="contact" style="padding:10px;">
                            <sec:authorize access="isAuthenticated()">
                                <span class="glyphicon glyphicon-envelope" style="margin-right: 5px;"></span><span>If you wanna know further about this offer or propose a trade, fill this form to contact the owner.</span>
                                <form:form method="post" class="form-horizontal" style="max-width: 90%;"
                                           commandName="contactForm" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">Type</label>
                                        <div class="col-md-10 col-sm-10">
                                            <form:radiobutton path="type"
                                                              value="question"
                                                              checked="true"/> Ask a question
                                            <form:radiobutton path="type" value="offer"/> Propose a trade
                                        </div>
                                    </div>
                                    <div id="yourTitle" class="form-group">
                                        <label class="col-sm-2 control-label" for="yourTitle">Title* </label>
                                        <div class="col-sm-10">
                                            <form:input path="title" type="text" class="form-control" placeholder="Object"/>
                                        </div>
                                    </div>
                                    <div id="yourOffer" class="form-group">
                                        <label class="col-sm-2 control-label" for="yourOffer">Your offer </label>
                                        <div class="col-sm-10">
                                            <form:input path="offer" type="text" class="form-control"
                                                        placeholder="What you give"/>
                                        </div>
                                    </div>
                                    <div id="yourMessage" class="form-group">
                                        <label class="col-sm-2 control-label" for="yourMessage">Message* </label>
                                        <div class="col-sm-10">
                                            <form:input path="message" type="text" class="form-control"
                                                        placeholder="Type your message here"/>
                                        </div>
                                    </div>
                                    <div id="yourEstimation" class="form-group">
                                        <label class="col-sm-2 control-label" for="yourEstimation">Estimation(€) </label>
                                        <div class="col-sm-10">
                                            <form:input path="estimation" type="text" class="form-control"
                                                        placeholder=""/>
                                        </div>
                                    </div>

                                    <div id="yourImage" class="form-group">
                                        <label class="col-sm-2 control-label" for="yourImage">Image* </label>
                                        <div class="col-sm-10">
                                            <form:input type="file" class="form-control" id="image" path="image"/>
                                        </div>
                                    </div>
                                    <form:hidden path="targetId"/>
                                    <button type="submit" class="btn btn-default">Submit</button>
                                </form:form>
                            </sec:authorize>
                            <sec:authorize access="isAnonymous()">
                                <span>You must be logged in to access this category</span>
                            </sec:authorize>
                        </div>
                    </c:if>
                    <div role="tabpanel" class="tab-pane fade " id="owner" style="padding:10px;">
                        <div style="height: 76px;">
                            <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..."
                                 class="img-thumbnail thumbnail">
                            <span class="glyphicon glyphicon-play"
                                  style="font-size: 12px; margin-right: 5px;"></span><span>Published by :</span><span><a
                                href="<c:url value="/profile/${owner.id}"/>">${owner.username}</a> </span><br/>
                            <span class="glyphicon glyphicon-play"
                                  style="font-size: 12px; margin-right: 5px;"></span><span>Member since : ${owner.creationDate}</span><br/>
                            <span class="glyphicon glyphicon-play"
                                  style="font-size: 12px; margin-right: 5px;"></span><span>Feedback : </span>${thumbsUp}
                            <span class="glyphicon glyphicon-thumbs-up"
                                  style="font-size: 12px; margin-right: 5px; color:green;"></span>${thumbsDown} <span
                                class="glyphicon glyphicon-thumbs-down"
                                style="font-size: 12px; margin-right: 5px; color:red;"></span>
                            <span>(<a id="displayComments" href="#" data-toggle="modal"
                                      data-target="#showComments">${thumbsUp+thumbsDown}</a>)</span>

                            <div class="modal fade" id="showComments">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                <span class="glyphicon glyphicon-remove"></span></button>
                                            <h4 class="modal-title">${owner.username} - Comments</h4>
                                        </div>
                                        <div id="modalComments" class="modal-body">

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <sec:authorize access="isAuthenticated()">
                                <c:if test="${owner.id != currentUserId}">
                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                       data-target="#leaveComment">Leave a comment</a>
                                </c:if>
                            </sec:authorize>
                            <div class="modal fade" id="leaveComment">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                <span class="glyphicon glyphicon-remove"></span></button>
                                            <h4 class="modal-title">${owner.username} - Leave a comment</h4>
                                        </div>
                                        <form action="<c:url value="/offer/comment"/>" method="post" id="formComment"
                                              class="form-horizontal">
                                            <div class="modal-body">
                                                <div style="height:30px; text-align:center; margin-bottom:40px;">
                                                    <span>Like or unlike ?</span><br/>
                                                    <input type="checkbox" name="thumb" onColor="success"
                                                           offColor="danger"
                                                           data-on-text="<i class='glyphicon glyphicon-thumbs-up'></i>"
                                                           data-off-text="<i class='glyphicon glyphicon-thumbs-down'></i>"
                                                           data-on-color="success" data-off-color="danger" checked>
                                                </div>
                                                <div class="form-group">
                                                    <label for="commentTitle" class="col-xs-3 col-sm-3 col-md-3"
                                                           style="display:inline; margin-top:5px;">Comment </label>
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
                                                <input type="hidden" value="${offer.id}" name="offerId">
                                                <input type="hidden" value="${owner.id}" name="ownerId">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">Send</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <br/>
                        </div>
                        <hr/>
                        <div>
                            <h5>Other offers from ${owner.username}</h5>
                            <c:forEach items="${otherOffers}" var="otherOffer">
                                <div>
                                    <a href="<c:url value="/offer/${otherOffer.id}"/>"> ${otherOffer.title}</a><br>
                                    <span> ${otherOffer.description}</span>
                                </div>
                                <hr>
                            </c:forEach>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 style="color:white;">Location</h4>
        </div>
        <div class="panel-body">

            <div id="map" style="width: 100%;height: 450px;" class="loading"></div>
            <script>
                function initMap() {

                    var myLatLng = {lat: ${lat}, lng: ${long}};

                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 13,
                        center: myLatLng
                    });

                    var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map
                    });
                }

            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCxUWvhEElHV7Ig68dI3T6k2YcOWwuQqUA&signed_in=true&callback=initMap"
                    async defer></script>
        </div>
    </div>
</div>
</body>
<c:import url="includes/footer.jsp"/>
<script>
    $("[name='thumb']").bootstrapSwitch();
    var id = ${owner.id};
    var ctx = '${pageContext.request.contextPath}';
    var offerId = ${offer.id};
    var userId = ${currentUserId};
    var alreadyLiked = ${alreadyLiked};
    var popularity = ${offer.popularity};
</script>
<script>
    $('#yourImage, #yourOffer, #yourEstimation').hide();
    $("input[name=type]").on('change', function () {
        if ($("input[name=type]:checked").val() == "question") {
            $('#yourImage, #yourOffer, #yourEstimation').hide();
            $('#yourTitle').show();
        } else {
            $('#yourImage, #yourOffer, #yourEstimation').show();
            $('#yourTitle').hide();
        }
    });
</script>
</html>
