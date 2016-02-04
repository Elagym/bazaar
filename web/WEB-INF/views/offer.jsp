<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Offer : ${offer.title}</title>
    <c:import url="includes/head.jsp"/>
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
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img src="<c:url value="/showimage/${offer.imageUrl}"/>" alt="..." style="width: 100%;">
                                    <div class="carousel-caption">
                                        Image 1
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." style="width: 100%;">
                                    <div class="carousel-caption">
                                        Image 2
                                    </div>
                                </div>
                            </div>

                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
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
                        <li role="presentation"><a href="#contact" aria-controls="home" role="tab" data-toggle="tab">Contact</a></li>
                        <li role="presentation"><a href="#owner" aria-controls="home" role="tab" data-toggle="tab">Owner profile</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="desc" style="padding:10px;">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                            ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                            in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
                            cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </div>
                        <div role="tabpanel" class="tab-pane fade " id="contact" style="padding:10px;">
                            <span class="glyphicon glyphicon-envelope" style="margin-right: 5px;"></span><span>If you wanna know further about this offer, fill this form to contact the owner.</span>
                            <form style="max-width: 500px;">
                                <div class="form-group">
                                    <%--<label for="name">Name</label>--%>
                                    <input type="name" class="form-control" id="name" placeholder="Name">
                                </div>
                                <div class="form-group">
                                    <%--<label for="e-mail">E-mail</label>--%>
                                    <input type="email" class="form-control" id="e-mail" placeholder="E-mail">
                                </div>
                                <div class="form-group">
                                    <%--<label for="object">Object</label>--%>
                                    <input type="text" class="form-control" id="object" placeholder="Object" value="Re : Offer title">
                                </div>
                                <div class="form-group">
                                    <%--<label for="message">Message</label>--%>
                                    <textarea type="" class="form-control" id="message" placeholder="Type your message here" rows="5"></textarea>
                                </div>
                                <div>
                                    /*captcha*/
                                </div>
                                <button type="submit" class="btn btn-default">Submit</button>
                            </form>
                        </div>
                        <div role="tabpanel" class="tab-pane fade " id="owner" style="padding:10px;">
                            <div style="height: 76px;">
                            <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." class="img-thumbnail thumbnail">
                            <span class="glyphicon glyphicon-play" style="font-size: 12px; margin-right: 5px;"></span><span>Published by :</span><span><a href="#">${owner.username}</a> </span><br/>
                            <span class="glyphicon glyphicon-play" style="font-size: 12px; margin-right: 5px;"></span><span>Member since : ${owner.creationDate}</span><br/>
                            <span class="glyphicon glyphicon-play" style="font-size: 12px; margin-right: 5px;"></span><span>Feedback : </span><a href="#">25</a> <span class="glyphicon glyphicon-thumbs-up" style="font-size: 12px; margin-right: 5px; color:green;"></span><a href="#">4</a> <span class="glyphicon glyphicon-thumbs-down" style="font-size: 12px; margin-right: 5px; color:red;"></span><br/>
                            </div>
                            <hr/>
                            <div>
                                <h5>Other offers from Vince</h5>
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

                <div id="map" style="width: 100%;height: 450px;"></div>
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
</html>
