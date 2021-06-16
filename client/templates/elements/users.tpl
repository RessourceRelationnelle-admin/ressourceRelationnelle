<div id="users-list" class="container">
    <div class="row">
    {% for key, utilisateur in userslist.utilisateurs %}
        {% set inrelation = false %}
        {% for relation in rellist.relations %}
        {% if utilisateur.iduser in relation %}
        {% set inrelation = true %}
        {% endif %}
        {% endfor %}
        {% if (titre_page == 'Utilisateurs inscrits') or (titre_page == 'Administration des utilisateurs') or (titre_page == 'Relations' and inrelation == true) %}
        <div class="col-md-6 user-card">
            <div class="card placementPublication relation-card" id="fetchUsers">
                <h5 class="card-header">
                    <a href="profile.php?id={{utilisateur.iduser}}">
                        <img src="assets/media/upload/images/homer.jpg" class="rounded-circle user-pic">
                        <strong class="username">{{ utilisateur.prenomuser }} {{ utilisateur.nomuser }}</strong><br>
                        <h5>
                            {% if utilisateur.issuperadmin == true %}
                            Super Administrateur
                            {% elseif utilisateur.isadmin == true %}
                            Administrateur
                            {% elseif utilisateur.ismoderateur == true %}
                            Modérateur
                            {% else %}
                            Citoyen
                            {% endif %}
                            <br></h5>
                    </a>
                    {% for relation in rellist.relations %}
                    {% if relation.iduser == utilisateur.iduser %}
                    <p>{{ relation.libelletyprel }}</p>
                    {% endif %}
                    {% endfor %}
                </h5>
                <div class="card-body">
                    <a href="profile.php?id={{utilisateur.iduser}}" title="Voir le profil" class="bouton-relation" id="profilUser">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                        </svg>
                    </a>
                    {% if isConnected and utilisateur.iduser != user.utilisateur.iduser %}
                    <a href="messages.php?id={{utilisateur.iduser}}" title="Envoyer un message" class="bouton-relation">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-chat-quote-fill" viewBox="0 0 16 16">
                            <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM7.194 6.766a1.688 1.688 0 0 0-.227-.272 1.467 1.467 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 5.734 6C4.776 6 4 6.746 4 7.667c0 .92.776 1.666 1.734 1.666.343 0 .662-.095.931-.26-.137.389-.39.804-.81 1.22a.405.405 0 0 0 .011.59c.173.16.447.155.614-.01 1.334-1.329 1.37-2.758.941-3.706a2.461 2.461 0 0 0-.227-.4zM11 9.073c-.136.389-.39.804-.81 1.22a.405.405 0 0 0 .012.59c.172.16.446.155.613-.01 1.334-1.329 1.37-2.758.942-3.706a2.466 2.466 0 0 0-.228-.4 1.686 1.686 0 0 0-.227-.273 1.466 1.466 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 10.07 6c-.957 0-1.734.746-1.734 1.667 0 .92.777 1.666 1.734 1.666.343 0 .662-.095.931-.26z"/>
                        </svg>
                    </a>
                    {% endif %}

                    {% if (titre_page == 'Utilisateurs inscrits' and isConnected and utilisateur.iduser != user.utilisateur.iduser)
                        or (titre_page == 'Relations' and utilisateur.iduser != profile.utilisateur.iduser and profile.utilisateur.iduser == user.utilisateur.iduser ) %}
                    {% if inrelation == true %}
                    <a title="Retirer des relations" class="bouton-relation btn-remove-relation">
                        <input type="hidden" value="{{utilisateur.iduser}}" class="valueUser">
                        <input type="hidden" value="{{user.utilisateur.iduser}}" class="valueSelf">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
                        </svg>
                    </a>
                    {% endif %}
                    {% if inrelation == false %}
                    <a title="Se mettre en relation" class="bouton-relation btn-relation">
                        <input type="hidden" value="{{utilisateur.iduser}}" class="valueUser">
                        <input type="hidden" value="{{user.utilisateur.iduser}}" class="valueSelf">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                            <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                        </svg>
                    </a>
                    {% endif %}
                    {% endif %}

                    {% if titre_page == 'Administration des utilisateurs' %}
                    {% if user.utilisateur.issuperadmin or user.utilisateur.isadmin %}
                    <!-- Options admin -->
                    <a title="Supprimer l'utilisateur" class="bouton-relation deleteUtilisateur">
                        <input type="hidden" value="{{utilisateur.iduser}}" class="valueUser">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
                        </svg>
                    </a>
                    <a href="admin-edit-user.php?id={{utilisateur.iduser}}" title="Modifier l'utilisateur" class="bouton-relation">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                            <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
                        </svg>
                    </a>
                    {% endif %}
                    {% if user.utilisateur.issuperadmin or (user.utilisateur.isadmin and utilisateur.isadmin == false) %}
                    {% if utilisateur.issuperadmin == false and utilisateur.ismoderateur == false %}
                    <a title="Définir en tant que modérateur" class="bouton-relation btn-modo">
                        <input type="hidden" value="{{utilisateur.iduser}}" class="valueUser">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
                        </svg>
                    </a>
                    {% endif %}
                    {% endif %}
                    {% if user.utilisateur.issuperadmin %}
                    {% if utilisateur.issuperadmin == false and utilisateur.isadmin == false %}
                    <a title="Définir en tant qu'administrateur" class="bouton-relation btn-admin">
                        <input type="hidden" value="{{utilisateur.iduser}}" class="valueUser">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-up" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M7.646 2.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 3.707 2.354 9.354a.5.5 0 1 1-.708-.708l6-6z"/>
                            <path fill-rule="evenodd" d="M7.646 6.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 7.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
                        </svg>
                    </a>
                    {% endif %}
                    {% if (utilisateur.issuperadmin == false and utilisateur.isadmin == true) %}
                    <a title="Retirer tous les droits" class="bouton-relation btn-no-admin">
                        <input type="hidden" value="{{utilisateur.iduser}}" class="valueUser">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                        </svg>
                    </a>
                    {% endif %}
                    {% endif %}
                    {% if user.utilisateur.issuperadmin or user.utilisateur.isadmin %}
                    {% if (utilisateur.issuperadmin == false and utilisateur.ismoderateur == true) %}
                    <a title="Retirer tous les droits" class="bouton-relation btn-no-modo">
                        <input type="hidden" value="{{utilisateur.iduser}}" class="valueUser">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                        </svg>
                    </a>
                    {% endif %}
                    {% endif %}
                    {% endif %}
                </div>
            </div>
        </div>
        {% endif %}
        {% endfor %}
    </div>
</div>


<script>

$(".deleteUtilisateur").click(function() {
    var userId = $(this).children(".valueUser").val();
    var token = $("#token").val();
    var tokenParse = JSON.parse(token);
    //alert(userId);
    //console.log(tokenParse.jwtToken);
    $.ajax({
        url : 'http://localhost:5000/users/delete/'+ userId,
        headers: {
        'Accept':'application/json',
        'Content-Type':'application/json',
        'Authorization':'Bearer ' + tokenParse.jwtToken
        },
        type : 'DELETE',
        /*data: {
        "id": userId,
        },*/
        dataType : 'json',
        success : function(json){
            alert('L\'utilisateur a été supprimé.');
            location.reload();
        },
        error: function (result, status, err) {
            alert('Erreur : ' + result.responseText);
        }
    });
});

// -- Assignation rôle modérateur --
$(".btn-modo").click(function() {
    var userId = $(this).children(".valueUser").val();
    var token = $("#token").val();
    var tokenParse = JSON.parse(token);
    $.ajax({
        url : 'http://localhost:5000/users/newModo/'+ userId,
        type : 'PUT',
        dataType : 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
        },
        success : function(json){
            alert('L\'utilisateur a été assigné en tant que modérateur.');
            location.reload();
        },
        error: function (result, status, err) {
            alert('Erreur : ' + result.responseText);
        }
    });
});

// -- Assignation rôle administrateur --
$(".btn-admin").click(function() {
    var userId = $(this).children(".valueUser").val();
    var token = $("#token").val();
    var tokenParse = JSON.parse(token);
    $.ajax({
        url : 'http://localhost:5000/users/newAdmin/'+ userId,
        type : 'PUT',
        dataType : 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
        },
        success : function(json){
            alert('L\'utilisateur a été assigné en tant qu\'administrateur.');
            location.reload();
        },
        error: function (result, status, err) {
            alert('Erreur : ' + result.responseText);
        }
    });
});

// -- Retire rôle modérateur --
$(".btn-no-modo").click(function() {
    var userId = $(this).children(".valueUser").val();
    var token = $("#token").val();
    var tokenParse = JSON.parse(token);
    $.ajax({
        url : 'http://localhost:5000/users/noModo/'+ userId,
        type : 'PUT',
        dataType : 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
        },
        success : function(json){
            alert('L\'utilisateur n\'est plus modérateur.');
            location.reload();
        },
        error: function (result, status, err) {
            alert('Erreur : ' + result.responseText);
        }
    });
});

// -- Retire rôle administrateur --
$(".btn-no-admin").click(function() {
    var userId = $(this).children(".valueUser").val();
    var token = $("#token").val();
    var tokenParse = JSON.parse(token);
    $.ajax({
        url : 'http://localhost:5000/users/noAdmin/'+ userId,
        type : 'PUT',
        dataType : 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
        },
        success : function(json){
            alert('L\'utilisateur n\'est plus administrateur.');
            location.reload();
        },
        error: function (result, status, err) {
            alert('Erreur : ' + result.responseText);
        }
    });
});

// -- Afficher fenêtre relations --
$(".btn-relation").click(function() {
    var userId = $(this).children(".valueUser").val();
    var myId = $(this).children(".valueSelf").val();
    $( "#relation-window" ).show();
    $( "#reluserid").val(userId) ;
    $( "#relownid").val(myId) ;
});

// -- Retirer des relations --
$(".btn-remove-relation").click(function() {
    var myId = $(this).children(".valueSelf").val();
    var userId = $(this).children(".valueUser").val();
    var token = $("#token").val();
    var tokenParse = JSON.parse(token);
    $.ajax({
        url : 'http://localhost:5000/rel/delete/'+ myId + '/' + userId,
        type : 'DELETE',
        dataType : 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
        },
        success : function(json){
            alert('Cet utilisateur a été retiré de vos relations.');
            location.reload();
        },
        error: function (result, status, err) {
            alert('Erreur : ' + result.responseText);
        }
    });
});

</script>