function consultProp(id) {
    $.ajax("http://localhost:8080/bazaar/api/user/viewproposition/" + id).done(function (data) {
        console.log(data);
        if(data.viewed)
            $('#newIcon' + id).fadeOut( 1000, function() {
                $('#newIcon' + id).html('');
                $('#newIcon' + id).attr('style', 'display:default;');
            });
        var main_div = $('#consultProp' + id);
        main_div.html('');
        $('<p>').html('<b>' + data.title + '</b> : ' + data.description).appendTo(main_div);
        $('<p>').html('Worth ' + data.estimation + ' € !').appendTo(main_div);
        $('<p>').html('Interested in this proposition ? Contact the user at <a href="mailto:' + data.author.email + '">' + data.author.email + '</a>').appendTo(main_div);
    });
};