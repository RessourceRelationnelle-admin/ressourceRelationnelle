// Ajouter une ressource en favoris
$( ".btn-fav" ).click(function() {
    var token = $("#token").val();
    var tokenParse = JSON.parse(token);
    var id = this.id;
    $.ajax({
        type : 'POST',
        url : 'http://localhost:5000/fav/' + id,
        data: {
            "id": id
        },
        dataType : 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
        },
        success : function(json){
            alert('La ressource a été ajoutée en favoris.');
            document.location.reload();
        },
        error: function (result, status, err) {
            alert('Erreur : ' + result.responseText);
        }
    });
});

// Supprimer une ressource des favoris
$( ".btn-fav-delete" ).click(function() {
    var token = $("#token").val();
    var tokenParse = JSON.parse(token);
    var id = this.id;
    $.ajax({
        type : 'DELETE',
        url : 'http://localhost:5000/fav/' + id,
        data: {
            "id": id
        },
        dataType : 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
        },
        success : function(json){
            alert('La ressource a été retirée des favoris.');
            document.location.reload();
        },
        error: function (result, status, err) {
            alert('Erreur : ' + result.responseText);
        }
    });
});