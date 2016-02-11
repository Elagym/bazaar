$(document).ready(function(){
   $('#categorySearch').on('click', function(){
       $.ajax("http://localhost:8080/bazaar/api/offers/refresh").done(function(data){
           console.log(data);

           $('#criteria').html('');

           var main_div = $('#mainPanel');
           main_div.attr('class', 'panel-body').html('');

           $.each(data, function(i, item){
               var panel_div = $('<div>').attr('class', 'panel panel-default').appendTo(main_div);
               var body_div = $('<div>').attr('class', 'panel-body offer-height').appendTo(panel_div);
                   $('<img>').attr({
                       src : item.imageUrl,
                       class : "img-thumbnail thumbnail"
                   }).appendTo(body_div);
                    var title_p = $('<p>').appendTo(body_div);
                    $('<a>').attr('href', ctx + '/offer/' + item.id).html('<b>' + item.title + '</b>').appendTo(title_p);
                    $('<span>').attr('class', 'index-offer-date').html(new Date(item.creationDate).toDateString()).appendTo(title_p);
                    $('<p>').html(item.description).appendTo(body_div);

               var footer_div = $('<div>').attr('class', 'panel-footer').appendTo(panel_div);
                    var footer_span = $('<span>').html('Category :').appendTo(footer_div);
                    var cats = item.categories;
                    $.each(cats, function(index, cat){
                        $('<a>').attr('href', ctx + '/offers/cat_id=' + cat.id).html(cat.name).appendTo(footer_span);
                        if(index < item.categories.length)
                            footer_span.append(', ');

                        else if(index == item.categories.length)
                            footer_span.append('.');
                    });
                    var footer_author_span = $('<span>').attr('style', 'float:right;').appendTo(footer_div);
                    $('<a>').attr('href', ctx + '/profile/' + item.owner.id).html(item.owner.username).appendTo(footer_author_span);
           });
       });
   });
});