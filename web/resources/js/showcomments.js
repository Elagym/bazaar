$(document).ready(function(){
    $('#displayComments').on('click', function(){
        $.ajax("http://localhost:8080/bazaar/api/profile/" + id + "/comments").done(function(data){
            var modal_body = $('#modalComments');
            modal_body.html('');
            $.each(data, function(i, comment){
                var comment_div = $('<div>').appendTo(modal_body);
                $('<span>').attr({
                    class : (comment.liked ? 'glyphicon glyphicon-thumbs-up' : 'glyphicon glyphicon-thumbs-down'),
                    style : 'color : ' + (comment.liked ? 'green' : 'red') + '; float:left; font-size:25px; margin-right:15px;'
                }).appendTo(comment_div);
                var title_span = $('<span>').appendTo(comment_div);
                $('<span>').attr('style', 'font-size:20px; color:#444; margin-right:10px;').html(comment.title).appendTo(title_span);
                $('<span>').attr('style', 'font-size:10px; color:grey;').html('Posted by <a href="' + ctx + '/profile/' + comment.author.id + '">' + comment.author.username + '</a>').appendTo(title_span);
                $('<p>').attr('style', 'margin-left:20px;').html(comment.description).appendTo(comment_div);
                $('<hr>').appendTo(modal_body);
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
