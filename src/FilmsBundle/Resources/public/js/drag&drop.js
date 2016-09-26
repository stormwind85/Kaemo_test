var id_dragged;

$(function(){
    $('.element').draggable({
        start: function(event, ui){
            $(this).css('z-index', 1);
            $(this).addClass('noclick');
            id_dragged = $(this).attr('id');
            id_dragged = id_dragged.substr(7, id_dragged.length);
        },
        revert: 'invalid',
        containment: 'table'
    });
    $(".element").droppable({
        accept: ".element",
        over: function(event, ui){
            $(this).css("opacity", 0.5);
        },
        out: function(event, ui){
            $(this).css("opacity", 1);
        },
        drop: function(event, ui){
            var position_trouvee = $(this).attr('class');
            position_trouvee = position_trouvee.substr(8, 1);
            $.ajax({
                type: "POST",
                url: Routing.generate('films_update', {id: id_dragged}),
                data: {position: position_trouvee},
                success: function (data, textStatus, jqXHR) {
                    window.location.href = Routing.generate('films_homepage');
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Erreur lors de la mise à jour de la liste des films");
                }
            });
            $("*").css("cursor", "wait");
        }
    });
    $('.element').click(function(){
        var id = $(this).find('img').attr('id');
        var url = Routing.generate('films_infos', {id: id});
        afficheInfos(url);
    });
});