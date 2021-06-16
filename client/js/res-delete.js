// Suppression de ressource
$( ".btn-delete" ).click(function() {
    var token = $("#token").val();
    var tokenParse = JSON.parse(token);
    var id = this.id;
    $.ajax({
        type : 'DELETE',
        url : 'http://localhost:5000/res/delete/' + id,
        data: {
            "id": id
        },
        dataType : 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
        },
        success : function(json){
            alert('La ressource a été supprimée.');
            document.location.href="home.php"; 
        },
        error: function (result, status, err) {
            alert('Erreur : ' + result.responseText);
        }
    });
});