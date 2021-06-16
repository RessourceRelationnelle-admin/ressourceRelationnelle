// -- Afficher fenêtre relations --
$(".btn-invite").click(function() {
    var userId = $(this).children(".valueUser").val();
    var myId = $(this).children(".valueSelf").val();
    $( "#relation-window" ).show();
    $( "#reluserid").val(userId) ;
    $( "#relownid").val(myId) ;
});

// -- Fermer la fenêtre relations --
$("#close-relation-window").click(function() {
    $( "#relation-window" ).hide();
});