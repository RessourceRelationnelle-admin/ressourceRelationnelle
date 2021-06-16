<div id="relation-window" class="container-fluid">
    <input id="reluserid" type="hidden" value="" class="valueUser">
    <input id="relownid" type="hidden" value="" class="valueUser">
    <div class="container">
        <div class="card placementPublication relation-card">
            <div class="card-header">
                <h5>Choisir une relation à inviter</h5>
                <div id="close-relation-window">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                </div>
            </div>
            <div class="card-body">
                <select name="TypRel" class="form-control mb-2" id="selectTypRel">
                    <option value="">Choisissez une personne</option>
                    {% for key, utilisateur in userslist.utilisateurs %}
                    {% set inrelation = false %}
                    {% for relation in rellist.relations %}
                    {% if utilisateur.iduser in relation %}
                    <option value="{{ utilisateur.iduser }}">{{ utilisateur.prenomuser }} {{ utilisateur.nomuser }}
                        {% for relation in rellist.relations %}
                        {% if relation.iduser == utilisateur.iduser %}
                        ({{ relation.libelletyprel }})
                        {% endif %}
                        {% endfor %}</option>
                    {% endif %}
                    {% endfor %}
                    {% endfor %}
                </select>
                <button type="button" class="btn btn-primary" id="register">Valider</button>

            </div>
        </div>
    </div>
</div>
