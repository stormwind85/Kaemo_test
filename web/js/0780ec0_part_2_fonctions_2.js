function mouseOverElement(id)
{
    $('#'+id).css('border', '3px solid red');
}
function mouseOutElement(id)
{
    $('#'+id).css('border', '3px solid white');
}
function afficheInfos(monUrl)
{   
    $("#dialogInfosFilm").load(monUrl, function() {
        $(this).dialog({
            title: "Informations sur le film",
            resizable: true,
            height: 831,
            width: 1200,
            modal: true,
            draggable: true
        });
        $(".ui-dialog-title").css({ 
            "text-align" : "center"
        });
    });
}
function clickAndHide(id)
{
    setTimeout(function(){
        $("#"+id).fadeOut('slow');
    });
};
function timeAndHide(id)
{
    setTimeout(function(){
        $(id).fadeOut('slow');
    }, 3000);
};