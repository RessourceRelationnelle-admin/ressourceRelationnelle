<div class="container colorwhite">
    <div id="profile-header" class="row justify-content-start">
        <div class="col-md-2">
            <img src="assets/media/upload/images/palpatine_glasses.jpg" class="header-avatar">
        </div>
        <div class="col-md-2 col-name">
            <p class="name"><b>{{ profile.utilisateur.prenomuser }} {{ profile.utilisateur.nomuser }}</b><br></p>
            <p>
                {% if profile.utilisateur.issuperadmin == true %}
                Super Administrateur
                {% elseif profile.utilisateur.isadmin == true %}
                Administrateur
                {% elseif profile.utilisateur.ismoderateur == true %}
                Modérateur
                {% else %}
                Citoyen
                {% endif %}
                <br></p>
            <p>{{ profile.utilisateur.paysuser }}<br></p>
        </div>
    </div>

    <div id="profile-navbar" class="row justify-content-center">
        <div class="col-md-2 mb-2 mt-2">
            <a href="resources-user.php?id={{profile.utilisateur.iduser}}" class="profile-navlink {% if titre_page == "Ressources publiées" %} active {% endif %} ">Publications</a>
        </div>
        <div class="col-md-2 mb-2 mt-2">
            <a href="resources-favorites.php?id={{profile.utilisateur.iduser}}" class="profile-navlink {% if titre_page == "Ressources favorites" %} active {% endif %}">Favoris</a>
        </div>
        <div class="col-md-2 mb-2 mt-2">
            <a href="relations.php?id={{profile.utilisateur.iduser}}" class="profile-navlink {% if titre_page == "Relations" %} active {% endif %}">Relations</a>
        </div>
        {% if profile.utilisateur.iduser == user.utilisateur.iduser %}
        <!-- Si on se trouve sur notre propre page de profil, afficher ce bouton. Sur le profil de quelqu'un d'autre, le masquer. -->
        <div class="col-md-2 mb-2 mt-2">
            <a href="edit-profile.php?id={{profile.utilisateur.iduser}}" class="profile-navlink {% if titre_page == "Éditer mon profil" %} active {% endif %}">Éditer mon profil</a>
        </div>
        {% endif %}
    </div>
</div>

<script>

// document ready
$( document ).ready(function() {
   //on récupére l'id passé en URL pour ensuite l'envoyer
    var searchParams = new URLSearchParams(window.location.search);
    searchParams.has('id') ;
    var id = searchParams.get('id');
    
});
    

</script>
