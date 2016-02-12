$(document).ready(function() {

    console.log(offerId);

    $('#likeOffer').on('click', function () {
        $.ajax("http://localhost:8080/bazaar/api/like/" + offerId + "/" + userId).done(function (data) {
            console.log(data);
            if(!data) {
                $('#likeOffer').attr('style', 'color:#666; cursor:pointer;');
                popularity--;
            }
            else {
                $('#likeOffer').attr('style', 'color:#FF4C6C;cursor:pointer;');
                popularity++;
            }
            $('#likeCount:first-child').html(popularity);

            alreadyLiked = data;
        });
    });
});
