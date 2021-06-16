{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">

    <div class="container">
        <div class="card placementPublication">
            <div class="card-header">
                <a href="profile.php?id={{ ressource.ressource.idauteur }}">
                    <h5>
                        <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2">
                        <input type="hidden" class="idressource" value="{{ ressource.ressource.idressource }}">
                        <!-- ici on récupére l'id de l'auteur dans une variale hidden pour une requête ajax ensuite -->
                        <input type="hidden" class="idauteur" value="{{ ressource.ressource.idauteur }}">
                        <input type="hidden" class="idtype" value="{{ ressource.ressource.idtypres }}">
                        <input type="hidden" class="idcat" value="{{ ressource.ressource.idcatres }}">
                        <strong class="nomAuteur-{{ ressource.ressource.idauteur }}">AUTEUR</strong>
                    </h5>
                </a>
            </div>
            <div class="card-body">
                <h5 class="card-title">{{ ressource.ressource.titreressource }}</h5>
                <div class="type-res-{{ ressource.ressource.idtypres }}"></div>
                <div class="cat-res-{{ ressource.ressource.idcatres }}"></div>

                <p class="card-text duree-res">Durée : {{ ressource.ressource.dureeressource }} minutes </p>
                <hr>
                <p class="card-text">{{ ressource.ressource.messageressource }}</p>
                <hr>
                {% if ressource.ressource.isverified == true and isConnected == true %}
                <!-- Afficher ces actions si la ressource est validée / visible publiquement -->
                {% set isfav = false %}
                {% for fav in favlist.favoris %}
                {% if fav.idressource == ressource.ressource.idressource %}
                {% set isfav = true %}
                {% endif %}
                {% endfor %}
                {% if isfav == true %}
                <a id="{{ ressource.ressource.idressource }}" title="Retirer des favoris" class="bouton-ressource btn-fav-delete">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                    </svg>
                </a>
                {% else %}
                <a id="{{ ressource.ressource.idressource }}" title="Ajouter en favoris" class="bouton-ressource btn-fav">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                    </svg>
                </a>
                {% endif %}
                <a href="#comment-post"><svg class="bi me-2" width="16" height="16"><use xlink:href="#comment"/></svg></a>
                <a title="Inviter à participer" class="btn-invite">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#share"/></svg>
                </a>
                {% endif %}
                {% if ressource.ressource.idauteur == user.utilisateur.iduser
                or user.utilisateur.issuperadmin
                or user.utilisateur.isadmin
                %}
                <!-- Afficher ces actions si la ressource appartient à l'utilisateur connecté ou pour admin / modo -->
                <a href="resources-edit?idres={{ ressource.ressource.idressource }}" title="Éditer" class="bouton-ressource">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                    </svg>
                </a>
                <a id="{{ ressource.ressource.idressource }}" title="Supprimer définitivement" class="bouton-ressource btn-delete">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                    </svg>
                </a>
                {% endif %}
            </div>
        </div>
    </div>

    <div class="container comments-section d-flex justify-content-center mt-100 mb-100">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Commentaires récents</h4>
                    </div>
                    <div class="comment-widgets m-b-20">
                        {% for comment in commentlist.commentaires %}
                        {% if ressource.ressource.idressource == comment.idressource %}
                        <div class="d-flex flex-row comment-row">
                            <input class="idauteurcomm" type="hidden" value="{{ comment.iduser }}">
                            <img src="https://github.com/mdo.png" alt="mdo" width="50" height="50" class="rounded-circle me-2">
                            <div class="col-md-12 comment-text active w-100">
                                <h5 class="nomAuteurComm-{{ comment.iduser }}">Nom prénom</h5>
                                <div class="comment-footer d-flex"><span class="date">{{ comment.datecommentaire|split('T')[0] }}</span>
                                    <span class="action-icons active">
                                        <a href="#" data-abc="true"><i class="fa fa-pencil"></i></a>
                                        <a href="#" data-abc="true"><i class="fa fa-rotate-right text-success"></i></a> <a href="#" data-abc="true"><i class="fa fa-heart text-danger"></i></a> </span> </div>
                                <p class="m-b-5 m-t-10">
                                    {{ comment.contenucommentaire }}
                                </p>
                                {% if comment.iduser == user.utilisateur.iduser
                                or user.utilisateur.issuperadmin
                                or user.utilisateur.isadmin
                                or user.utilisateur.ismoderateur
                                %}
                                <a id="{{ comment.idcommentaire }}" title="Supprimer définitivement" class="bouton-ressource btn-delete-comment">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                    </svg>
                                </a>
                                {% endif %}
                            </div>
                        </div>
                        {% endif %}
                        {% endfor %}

                    </div>
                </div>
            </div>
        </div>
    </div>
    {% if isConnected %}
    <div class="bg-light p-2">
        <div class="d-flex flex-row align-items-start"><img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2">
            <textarea class="form-control ml-1 shadow-none textarea" id="valueCommentaire"></textarea>
        </div>
        <div class="mt-2 text-right">
            <button class="btn btn-primary btn-sm shadow-none" id="addCommentaire" type="button">Ajouter un commentaire</button>
        </div>
    </div>
    {% endif %}
</div>

{{ include('elements/relations-window.tpl') }}

<script src="js/relation-invite.js"></script>

<script>
    $( document ).ready(function() {

        var token = $("#token").val();
        var tokenParse = JSON.parse(token);

        // -- Affichage du nom et prénom de l'auteur de la ressource --
        //on parcourt pour chaque élément ayant la classe id auteur, on récupére son ID puis on fait une recherche de l'utilisateur qui l'a crée
        var collection = $(".idauteur");
        collection.each(function () {
            var id = $(this).val();
            $.ajax({
                url: 'http://localhost:5000/users/' + id,
                type: 'GET',
                dataType: 'json',
                success: function (json) {
                    $('.nomAuteur-'+id).html(json.utilisateur.nomuser + ' ' + json.utilisateur.prenomuser);
                }
            });
        });

        // -- Affichage du nom et prénom de l'auteur pour les commentaires --
        var commentcollection = $(".idauteurcomm");
        commentcollection.each(function () {
            var id = $(this).val();
            $.ajax({
                url: 'http://localhost:5000/users/' + id,
                type: 'GET',
                dataType: 'json',
                success: function (json) {
                    $('.nomAuteurComm-'+id).html(json.utilisateur.nomuser + ' ' + json.utilisateur.prenomuser);
                }
            });
        });

        // -- Affichage du type --
        var typecollection = $(".idtype");
        typecollection.each(function () {
            var id = $(this).val();
            $.ajax({
                url: 'http://localhost:5000/restyp/' + id,
                type: 'GET',
                dataType: 'json',
                success: function (json) {
                    $('.type-res-'+id).html(json.ressourceType.libelletypres);
                }
            });
        });

        // -- Affichage de la catégorie --
        var catcollection = $(".idcat");
        catcollection.each(function () {
            var id = $(this).val();
            $.ajax({
                url: 'http://localhost:5000/rescat/' + id,
                type: 'GET',
                dataType: 'json',
                success: function (json) {
                    $('.cat-res-'+id).html(json.ressourceCategory.libellecatres);
                }
            });
        });

        // -- Ajout de commentaire -- 
        $("#addCommentaire").click(function() {
            var contenu = $("#valueCommentaire").val();
            var idUser = $(".idauteur").val();
            var idRessource = $(".idressource").val();
           
            //console.log(tokenParse);
            $.ajax({
                data: {
                    "contenu": contenu
                },
                type : 'POST',
                url : 'http://localhost:5000/res/comm/' +idRessource,
                dataType : 'json',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
                },
                success : function(json){
                    alert('Commentaire ajouté avec succès');
                    location.reload();
                },
                error: function (result, status, err) {
                    alert('Erreur : ' + result.responseText);
                }
            });
        });

        // Suppression de commentaire
        $( ".btn-delete-comment" ).click(function() {
            var token = $("#token").val();
            var tokenParse = JSON.parse(token);
            var id = this.id;
            console.log(id);
            $.ajax({
                type : 'DELETE',
                url : 'http://localhost:5000/res/comm/delete/' + id,
                data: {
                    "id": id
                },
                dataType : 'json',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
                },
                success : function(json){
                    alert('Le commentaire a été supprimé.');
                    document.location.reload();
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

<script src="js/res-delete.js"></script>
<script src="js/res-fav.js"></script>
