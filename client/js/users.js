$(document).ready(function(){
    // -- Rechercher un utilisateur par son nom ou prénom --
    $("#myInput").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#users-list .username").filter(function() {
            $(this).parent().parent().parent().parent().toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    // -- Fermer la fenêtre relations --
    $("#close-relation-window").click(function() {
        $( "#relation-window" ).hide();
    });

    // -- Enregistrer la relation --
    $("#register").click(function() {
        var token = $("#token").val();
        var tokenParse = JSON.parse(token);
        var userId = $("#reluserid").val();
        var myId = $("#relownid").val();
        var typeRel = $("#selectTypRel").val();

        $.ajax({
            url : 'http://localhost:5000/rel/create',
            type : 'POST',
            dataType : 'json',
            data: {
                "idUser2": userId,
                "idTypRel": typeRel
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
            },
            success : function(json){
                alert('Relation enregistrée.');
                location.reload();
            },
            error: function (result, status, err) {
                alert('Erreur : ' + result.responseText);
            }
        });
    });

});