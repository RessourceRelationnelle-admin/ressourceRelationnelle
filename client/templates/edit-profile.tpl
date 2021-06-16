{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
{{ include('elements/profile-header.tpl') }}
    <div class="container rounded bg-white mt-5 mb-5 centerprofil">
        <form id="edit-profile" action="">
            <div class="row mt-3">
                    <div class="col-md-12">  
                    <label for="inputAvatar" class="form-label">Image de profil</label>
                    <input type="file" accept="image/png,image/jpeg" class="form-control" id="inputAvatar">
                    </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">  
                    <label for="inputNom" class="form-label">Nom</label>
                    <input type="text" class="form-control" id="inputNom" value="{{ nom }}">
                </div>
                <div class="col-md-6">  
                    <label for="inputPrenom" class="form-label">Prénom</label>
                    <input type="text" class="form-control" id="inputPrenom" value="{{ prenom }}">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">  
                    <label for="inputPays" class="form-label">Pays</label>
                    <input type="text" class="form-control" id="inputPays" value="{{ pays }}">
                </div>
                <div class="col-md-6">  
                    <label for="inputAdresse" class="form-label">Adresse</label>
                    <input type="text" class="form-control" id="inputAdresse" value="{{ adresse }}">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-12">  
                    <label for="inputEmail" class="form-label">Adresse email</label>
                    <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" value="{{ email }}">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">  
                    <label for="inputTel" class="form-label">Téléphone</label>
                    <input type="text" class="form-control" id="inputTel" value="{{ tel }}">
                </div>
                <div class="col-md-6">  
                    <label for="inputPays" class="form-label">Situation</label>
                    <input type="text" class="form-control" id="inputSituation" value="{{ situation }}">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">
                    <label for="inputPassword1" class="form-label">Mot de passe</label>
                    <input type="password" class="form-control" id="inputPassword1">
                </div>
                <div class="col-md-6">
                    <label for="inputPassword2" class="form-label">Confirmer le mot de passe</label>
                    <input type="password" class="form-control" id="inputPassword2">
                </div>
            </div>
        <button type="button" id="register" class="btn btn-primary" style="margin: 30px; left: 0;">Enregistrer</button>
        </form>
    </div>
</div>
<input type="hidden" id="token" value="{{ token }}"> 

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

<script>
$( document ).ready(function() {
   //on récupére l'id passé en URL pour ensuite l'envoyer
    var searchParams = new URLSearchParams(window.location.search);
    searchParams.has('id') ;
    var id = searchParams.get('id');

    var token = $("#token").val();
    var tokenParse = JSON.parse(token);

    $.ajax({
        url : 'http://localhost:5000/users/'+id,
        type : 'GET',
        /*data: {
        "id": id,
        },*/
        dataType : 'json',
        success : function(json){
            console.log(json);
            $('#inputNom').val(json.utilisateur.nomuser);
            $('#inputPrenom').val(json.utilisateur.prenomuser);
            $('#inputPays').val(json.utilisateur.paysuser);
            $('#inputEmail').val(json.utilisateur.emailuser);
            $('#inputSituation').val(json.utilisateur.situationuser);
            $('#inputAdresse').val(json.utilisateur.adresseuser);
            $('#inputTel').val(json.utilisateur.teluser);
        },
    });

    $("#register").click(function() {
        var email = $("#inputEmail").val();
        var prenom = $("#inputPrenom").val();
        var nom = $("#inputNom").val();
        var tel = $("#inputTel").val();
        var pays = $("#inputPays").val();
        var situation = $("#inputSituation").val();
        var adresse = $("#inputAdresse").val();
        if($("#inputPassword2").val() == $("#inputPassword1").val()){
            var mdp = $("#inputPassword1").val();
        }else{
            alert('Les mots de passe ne correspondent pas.');
        }

        console.log(email + " " + prenom + " " + nom + " " + tel + " " + pays + " " + situation + " " + mdp + " " + adresse + " " + id);
        $.ajax({
            data: {
                "email": email,
                "mdp" : mdp,
                "nom": nom,
                "prenom": prenom,
                "tel": tel,
                "adresse": adresse,
                "pays": pays,
                "situation": situation
            },
            type : 'PUT',
            url : 'http://localhost:5000/users/update/'+ id,
            dataType : 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
            },
            success : function(json){
                alert('Utilisateur modifié avec succès.');
                //location.reload();
            },
            error: function (result, status, err) {
                alert('Erreur : ' + result.responseText);
            }
        });
    });
    
});

</script>