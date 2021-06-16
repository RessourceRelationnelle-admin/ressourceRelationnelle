<div class="container">
    <div id="profile-navbar" class="row">
        <div class="col-md-3 mb-4 mt-4">
            <h3>Ressources</h3>
            <div class="container">
                <a href="resources-pending.php" class="profile-navlink row justify-content-center {% if titre_page == "Ressources en attente" %} active {% endif %} ">Ressources en attente</a>
            </div>
        </div>
        {% if user.utilisateur.issuperadmin == true or user.utilisateur.isadmin == true %}
        <div class="col-md-3 mb-4 mt-4">
            <h3>Catégories</h3>
            <div class="container">
                <a href="resources-cat-list.php" class="profile-navlink row justify-content-center {% if titre_page == "Liste des catégories" %} active {% endif %} ">Liste des catégories</a><br>
                <a href="resources-cat-new.php" class="profile-navlink row justify-content-center {% if titre_page == "Nouvelle catégorie" %} active {% endif %} ">Nouvelle catégorie</a><br>
            </div>
        </div>
        <div class="col-md-3 mb-4 mt-4">
            <h3>Utilisateurs</h3>
            <div class="container">
                <a href="admin-users-list.php" class="profile-navlink row justify-content-center {% if titre_page == "Utilisateurs" %} active {% endif %}">Liste des utilisateurs</a><br>
            </div>
        </div>
        <div class="col-md-3 mb-4 mt-4">
            <h3>Types relations</h3>
            <div class="container">
                <a href="relations-type-list.php" class="profile-navlink row justify-content-center {% if titre_page == "Liste des types relation" %} active {% endif %} ">Liste des types relation</a><br>
                <a href="relations-type-new.php" class="profile-navlink row justify-content-center {% if titre_page == "Nouveau type relation" %} active {% endif %} ">Nouveau type relation</a><br>
            </div>
        </div>
        {% endif %}
    </div>
</div>
