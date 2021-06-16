
<div class="col-md-2 order-1 left-sidebar">
    <div class="d-flex flex-column p-3  sticky-top">
        <a href="home.php" class="d-flex align-items-center mb-3 mb-md-0  text-decoration-none d-none d-lg-block">
            {{ include('elements/logo-svg.tpl') }}
        </a>
        <hr class="d-none d-lg-block">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand d-lg-none toggler">{{ include('elements/logo-r.tpl') }}
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                <ul class="nav nav-pills navbar-nav nav-fill flex-column mb-auto">
                    <li class="nav-item">
                        <a href="home.php" class="nav-link  {% if titre_page == 'Home'%} active {% endif %}">
                            <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
                            Accueil
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link ">
                            <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
                            Explorer
                        </a>
                    </li>
                    <li>
                        <a href="users-list.php" class="nav-link  {% if titre_page == 'Utilisateurs inscrits'%} active {% endif %}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                                <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                <path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/>
                                <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
                            </svg>
                            Utilisateurs
                        </a>
                    </li>
                    {% if isConnected == true %}
                    <li class="nav-item">
                        <a href="messages.php" class="nav-link  {% if titre_page == 'Messages'%} active {% endif %}">
                            <svg class="bi me-2" width="16" height="16"><use xlink:href="#chat-quote-fill"/></svg>
                            Messages
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="profile.php" class="nav-link  {% if titre_page == 'Profil'%} active {% endif %}">
                            <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                            Profil
                        </a>
                    </li>
                    <li class="nav-item d-lg-none">
                        <a href="resources-new.php" class="nav-link  {% if titre_page == 'Nouvelle ressource'%} active {% endif %}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-plus" viewBox="0 0 16 16">
                                <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                <path d="M8 4a.5.5 0 0 1 .5.5V6H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V7H6a.5.5 0 0 1 0-1h1.5V4.5A.5.5 0 0 1 8 4z"/>
                            </svg>
                            Nouvelle ressource
                        </a>
                    </li>
                    {% if user.utilisateur.issuperadmin == true or user.utilisateur.isadmin == true or user.utilisateur.ismoderateur == true %}
                    <li class="nav-item d-lg-none">
                        <a href="admin.php" class="nav-link  {% if titre_page == 'Administration'%} active {% endif %}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"/>
                                <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"/>
                            </svg>
                            Administration
                        </a>
                    </li>
                    <li><hr class="dropdown-divider d-lg-none"></li>
                    {% endif %}
                    <li class="nav-item d-lg-none">
                        <a href="logout.php" class="nav-link ">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-door-open-fill" viewBox="0 0 16 16">
                                <path d="M1.5 15a.5.5 0 0 0 0 1h13a.5.5 0 0 0 0-1H13V2.5A1.5 1.5 0 0 0 11.5 1H11V.5a.5.5 0 0 0-.57-.495l-7 1A.5.5 0 0 0 3 1.5V15H1.5zM11 2h.5a.5.5 0 0 1 .5.5V15h-1V2zm-2.5 8c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
                            </svg>
                            Se déconnecter
                        </a>
                    </li>
                    {% else %}
                    <li class="nav-item d-lg-none">
                        <a href="index.php" class="nav-link ">
                            <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                            Se connecter ou s'inscrire
                        </a>
                    </li>
                    {% endif %}

                </ul>
            </div>
        </nav>
        <hr class="d-none d-lg-block">
        <div class="dropdown d-none d-lg-block ">
            <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2">
                <strong>{% if isConnected == true %} {{ user.utilisateur.prenomuser }} {% else %} Visiteur {% endif %} </strong>
            </a>
            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                {% if isConnected == true %}
                <li><a class="dropdown-item" href="resources-new">Nouvelle ressource</a></li>
                <li><a class="dropdown-item" href="profile.php">Profil</a></li>
                {% if user.utilisateur.issuperadmin == true or user.utilisateur.isadmin == true or user.utilisateur.ismoderateur == true %}
                <li><a class="dropdown-item" href="admin.php">Administration</a></li>
                {% endif %}
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="logout.php">Se déconnecter</a></li>
                {% else %}
                <li><a class="dropdown-item" href="index.php">Se connecter ou s'inscrire</a></li>
                {% endif %}
            </ul>
        </div>
    </div>
</div>
