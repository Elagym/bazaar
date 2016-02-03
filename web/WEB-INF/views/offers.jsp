<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Offers</title>
    <c:import url="includes/head.jsp"/>
</head>
<body>
<c:import url="includes/menu.jsp"/>
    <div class="container-fluid size">
        <button class="btn btn-primary">Most recent offers</button>
        <button class="btn btn-primary" style="display:inline; margin-right: 5px;">Most famous</button>
        <form class="form-inline" action="#" style="display:inline;">
            <div class="form-group">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </div>
        </form>
        <div class="panel panel-primary" style="margin-top:5px;">
            <div class="panel-heading">
                <h4 style="color:white;">Offers</h4>
            </div>
            <div class="panel-body">
                <div class="panel panel-default">
                    <div class="panel-body offer-height">
                        <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." class="img-thumbnail thumbnail">
                        <p><b>Annonce 1</b> <span class="index-offer-date">27/01/2016</span></p>
                        <p>Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo </p>
                    </div>
                    <div class="panel-footer">
                        <span>Category : <a href="#">cat 1</a>, <a href="#">cat 2</a>, <a href="#">cat 3</a></span>
                        <span style="float:right;">Author : <a href="#">Vince</a></span>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body offer-height">
                        <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." class="img-thumbnail thumbnail">
                        <p><b>Annonce 2</b> <span class="index-offer-date">27/01/2016</span></p>
                        <p>Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo </p>
                    </div>
                    <div class="panel-footer">
                        <span>Category : <a href="#">cat 1</a>, <a href="#">cat 2</a>, <a href="#">cat 3</a></span>
                        <span style="float:right;">Author : <a href="#">Vince</a></span>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body offer-height">
                        <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." class="img-thumbnail thumbnail">
                        <p><b>Annonce 3</b> <span class="index-offer-date">27/01/2016</span></p>
                        <p>Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo </p>
                    </div>
                    <div class="panel-footer">
                        <span>Category : <a href="#">cat 1</a>, <a href="#">cat 2</a>, <a href="#">cat 3</a></span>
                        <span style="float:right;">Author : <a href="#">Vince</a></span>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body offer-height">
                        <img src="https://ejobba.com/app/webroot/img/default-profile.png" alt="..." class="img-thumbnail thumbnail">
                        <p><b>Annonce 4</b> <span class="index-offer-date">27/01/2016</span></p>
                        <p>Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo Bliblablublo </p>
                    </div>
                    <div class="panel-footer">
                        <span>Category : <a href="#">cat 1</a>, <a href="#">cat 2</a>, <a href="#">cat 3</a></span>
                        <span style="float:right;">Author : <a href="#">Vince</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<c:import url="includes/footer.jsp"/>

</html>
