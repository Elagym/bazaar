function consultProp(id) {
    $.ajax("http://localhost:8080/bazaar/api/user/viewproposition/" + id).done(function (data) {
        console.log(data);
        if(data.viewed)
            $('#newIcon' + id).html('');
        var main_div = $('#consultProp' + id);
        main_div.html('');
        $('<p>').html('Hello World :-)').appendTo(main_div);
    });
};