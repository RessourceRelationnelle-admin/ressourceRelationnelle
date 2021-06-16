{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    {{ include('elements/admin-header.tpl') }}
    <div class="container rounded bg-white mt-5 mb-5 centerprofil">
    <form id="edit-profile">
        <!--<div class="mb-3">
            <label for="selectRole" class="form-label">Rôle</label>
            <select class="form-select" id="selectRole">
                <option value="citoyen">Citoyen</option>
                <option value="moderateur">Modérateur</option>  
                <option value="administrateur">Administrateur</option>
            </select>
        </div>-->
        <!--<div class="mb-3">
            <label for="inputAvatar" class="form-label">Image de profil</label>
            <input type="file" accept="image/png,image/jpeg" class="form-control" id="inputAvatar">
        </div>
        <button type="" class="btn btn-primary">Supprimer l'image</button>-->
        <div class="mb-3">
            <label for="inputEmail" class="form-label">Adresse email</label>
            <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="inputPrenom" class="form-label">Prénom</label>
            <input type="text" class="form-control" id="inputPrenom" >
        </div>
        <div class="mb-3">
            <label for="inputNom" class="form-label">Nom</label>
            <input type="text" class="form-control" id="inputNom" >
        </div>
        <div class="mb-3">
            <label for="inputTel" class="form-label">Téléphone</label>
            <input type="text" class="form-control" id="inputTel">
        </div>
        <div class="mb-3">
            <label for="inputPays" class="form-label">Pays</label>
            <input type="text" class="form-control" id="inputPays">
        </div>
        <div class="mb-3">
            <label for="inputAdrese" class="form-label">Adresse</label>
            <input type="text" class="form-control" id="inputAdresse">
        </div>
        <div class="mb-3">
            <label for="inputSituation" class="form-label">Situation familiale</label>
            <input type="text" class="form-control" id="inputSituation">
        </div>
        <div class="mb-3">
            <label for="inputPassword1" class="form-label">Mot de passe</label>
            <input type="password" class="form-control" id="inputPassword1">
        </div>
        <div class="mb-3">
            <label for="inputPassword2" class="form-label">Confirmer le mot de passe</label>
            <input type="password" class="form-control" id="inputPassword2">
        </div>

        <button class="btn btn-danger">Supprimer l'utilisateur</button>
        <button type="button" class="btn btn-primary" id="register">Enregistrer</button>
    </form>
    </div>
    <input type="hidden" id="token" value="{{ token }}">  

</div>

<script>

$( document ).ready(function() {

    //on récupére l'id passé en URL pour ensuite l'envoyer
    var searchParams = new URLSearchParams(window.location.search);
    searchParams.has('id') ;
    var id = searchParams.get('id');

    var token = $("#token").val();
    var tokenParse = JSON.parse(token);
    
    //alert(tokenParse.jwtToken);

    $.ajax({
        url : 'http://localhost:5000/users/'+ id,
        type : 'GET',
        dataType : 'json',
        success : function(json){
            //console.log(json);
            $('#inputNom').val(json.utilisateur.nomuser);
            $('#inputPrenom').val(json.utilisateur.prenomuser);
            $('#inputPays').val(json.utilisateur.paysuser);
            $('#inputEmail').val(json.utilisateur.emailuser);
            $('#inputTel').val(json.utilisateur.teluser);
            $('#inputSituation').val(json.utilisateur.situationuser);
            $('#inputAdresse').val(json.utilisateur.adresseuser);
            $('#inputPassword1').val(json.utilisateur.mdpuser);
            $('#inputPassword2').val(json.utilisateur.mdpuser);   
        },
    });

    $("#register").click(function() {
        var email = $("#inputEmail").val();
        var prenom = $("#inputPrenom").val();
        var nom = $("#inputNom").val();
        var tel = $("#inputTel").val();
        var pays = $("#inputPays").val();
        var situation = $("#inputSituation").val();
        var mdp = $("#inputPassword2").val();
        var adresse = $("#inputAdrese").val();

        //console.log(email + " " + prenom + " " + nom + " " + tel + " " + pays + " " + situation + " " + mdp + " " + adresse + " " + id);
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
                location.reload();
            },
            error: function (result, status, err) {
                alert('Erreur : ' + result.responseText);
            }
        });
    });
});
    
</script>

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

