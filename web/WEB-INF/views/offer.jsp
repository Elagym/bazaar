<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Offer : ${title}</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>
    <div class="container-fluid size">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 style="color:white;">Offer title</h4>
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
                                    <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." style="width: 100%;">
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
                        <p>Estimation of the belonging : $1,000,000</p>
                        <p>Phone number : 02 444 719</p>
                        <p>State : Alabama (sweet home)</p>
                        <p>Zip Code : 12346</p>
                        <p>City : blabla</p>
                        <p>Published on : 28/01/2016</p>
                        <p>Expiration date : 28/02/2016</p>
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
                        <div role="tabpanel" class="tab-pane fade in active" id="desc">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                            ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                            in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
                            cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </div>
                        <div role="tabpanel" class="tab-pane fade " id="contact">
                            Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                            laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
                            architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas
                            sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione
                            voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,
                            consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore
                            et dolore magnam aliquam quaerat voluptatem.
                        </div>
                        <div role="tabpanel" class="tab-pane fade " id="owner">
                            But I must explain to you how all this mistaken idea of denouncing pleasure
                            and praising pain was born and I will give you a complete account of the system,
                            and expound the actual teachings of the great explorer of the truth,
                            the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself,
                            because it is pleasure, but because those who do not know how to pursue pleasure
                            rationally encounter consequences that are extremely painful.
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
</html>
