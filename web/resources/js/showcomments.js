$(document).ready(function(){
    $('#displayComments').on('click', function(){
        $.ajax("http://localhost:8080/bazaar/api/profile/" + id + "/comments").done(function(data){
            var modal_body = $('#modalComments');
            modal_body.html('');
            $.each(data, function(i, comment){
                $('<p>').html('test').appendTo(modal_body);
            });


            //<c:forEach items="${otherOffers}" var="otherOffer">
            //    <div>
            //        <a href="<c:url value="/offer/${otherOffer.id}"/>"> ${otherOffer.title}</a><br>
            //        <span> ${otherOffer.description}</span>
            //    </div>
            //    <hr>
            //</c:forEach>
        });
    });
});
