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
                <div class="col-sm-6 col-md-6">
                    <span>images</span>
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
                <div>
                    <h4>Description</h4>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                        ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                        laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                        in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
                        cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    </p>
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

                        var image = '<c:url value="/resources/images/flag.png"/>';
                        var marker = new google.maps.Marker({
                            position: myLatLng,
                            map: map,
                            icon : image
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
