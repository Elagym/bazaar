<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <div class="container-fluid size">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 style="color:white;">Create a new offer</h4>
            </div>
            <div class="panel-body">
                <form:form class="form-horizontal" style="max-width: 90%;" commandName="createOfferForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Category </label>
                        <div class="col-sm-10">
                            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseCats" aria-expanded="false" aria-controls="collapseCats">
                                Toggle categories
                            </button>
                            <div class="collapse" id="collapseCats">
                                <div class="well" style="border-bottom-left-radius:20px; border-bottom-right-radius:20px; border-top-right-radius:20px;">
                                    <%--<c:forEach items="${categories}" var="category">--%>
                                        <%--<label style="margin-right:15px; margin-bottom:5px;"><form:checkboxes value="${category.id}" path="categories" items="${categorySet}"/>${category.name}</label>--%>
                                    <%--</c:forEach>--%>
                                        <form:checkboxes path="categories" items="${categorySet}" itemValue="id" itemLabel="name" style="margin-left:10px;"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="title">Offer's title* </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="title" placeholder="Title" path="title"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="desc">Description* </label>
                        <div class="col-sm-10">
                            <form:textarea class="form-control" id="desc" rows="5" placeholder="Description here" path="desc"></form:textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="estimation">Estimation (€)* </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="estimation" placeholder="Estimation" path="estimation"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="expectation">Expectation </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="expectation" placeholder="Expectation" path="expectation"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="address">Address* </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="address" placeholder="Address" path="address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="zipcode">Zip code* </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="zipcode" placeholder="Zip code" path="zipcode"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="keywords">Keywords </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" id="keywords" placeholder="First, second, ..." path="keywords"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="image">Image* </label>
                        <div class="col-sm-10">
                            <form:input type="file" class="form-control" id="image" path="image"/>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit" style="margin-left: 30px;">Submit</button>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>
