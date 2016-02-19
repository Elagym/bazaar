function consultReport(id){
    $.ajax("http://localhost:8080/bazaar/api/admin/viewreport/" + id).done(function(data){
        console.log(data);

        var main_div = $('#consultReport' + data.id);
        main_div.html('');
        $('<p>').html('<b>' + data.title + '</b> : ' + data.message).appendTo(main_div);
        var offer = $('<p>').html('Concerned offer : ').appendTo(main_div);
        $('<a>').attr('href', ctx + '/offer/' + data.offer.id).html(data.offer.title).appendTo(offer);
        var owner = $('<p>').html('Offer owner : ').appendTo(main_div);
        $('<a>').attr('href', ctx + '/profile/' + data.offer.owner.id).html(data.offer.owner.username).appendTo(owner);

        if(data.viewed) {
            $('#newIcon' + id).fadeOut(1000, function () {
                $('#newIcon' + id).html('');
                $('#newIcon' + id).attr('style', 'display:default;');
            });
        }
    });
}
