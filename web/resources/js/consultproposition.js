function consultProp(id, from) {
    $.ajax("http://localhost:8080/bazaar/api/user/viewproposition/" + id).done(function (data) {
        console.log(data);

        if (from == 'menu') {
            var main_div = $('#menuConsultProp' + data.id);
        }

        if (from == 'profile') {
            var main_div = $('#consultProp' + data.id);
        }
        main_div.html('');
        $('<p>').html('<b>' + data.title + '</b> : ' + data.description).appendTo(main_div);
        $('<p>').html('Worth ' + data.estimation + ' € !').appendTo(main_div);
        $('<p>').html('Interested in this proposition ? Contact the user at <a href="mailto:' + data.author.email + '">' + data.author.email + '</a>').appendTo(main_div);

        if(data.viewed) {
            $('#newIconMenu' + id).fadeOut(1000, function () {
                $('#newIconMenu' + id).html('');
                $('#newIconMenu' + id).attr('style', 'display:default;');
            });
            $('#newIcon' + id).fadeOut(1000, function () {
                $('#newIcon' + id).html('');
                $('#newIcon' + id).attr('style', 'display:default;');
            });
        }
    });
};
function decrement(){
    $('#prop-badge').text($('#prop-badge').text()-1);
    if($('#prop-badge').text() == 0){
        $('#prop-badge').hide();
    }
}