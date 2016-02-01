<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create an offer</title>
    <c:import url="includes/head.jsp"/>
    <script>
        $(document).ready(function() {
            $('#resizing-select').change(function(){
                $("#width_tmp_option").html($('#resizing-select option:selected').text());
                $(this).width($("#width_tmp_select").width()+10);
            });
        });
    </script>
</head>
<body>
<c:import url="includes/menu.jsp"/>
body of index.jsp
    <div class="container-fluid size">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 style="color:white;">Create a new offer</h4>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" style="max-width: 90%;">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Category :</label>
                        <div class="col-sm-10">
                            <select id="resizing-select" name="category" style="width: 100px;">
                                <option>Category 1</option>
                                <option>Category 2</option>
                                <option>Category 3456456456464</option>
                                <option>Category 4</option>
                            </select>
                            <select id="width_tmp_select" style="display: none;">
                                <option id="width_tmp_option"></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="title">Offer's title :</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="title" placeholder="Title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="desc">Description :</label>
                        <div class="col-sm-10">
                            <textarea type="text" class="form-control" id="desc" rows="5" placeholder="Description here"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="estimation">Estimation :</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="estimation" placeholder="Estimation">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="expectation">Expectation :</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="expectation" placeholder="Expectation">
                        </div>
                    </div>
                </form>
            </div>
    </div>
</body>
</html>
