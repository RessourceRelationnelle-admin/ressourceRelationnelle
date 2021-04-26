{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    <p class="text-white">Rechercher un utilisateur :</p>
    <input id="myInput" type="text" placeholder="Nom ou prénom">
    {{ include('elements/users.tpl') }}
</div>

<div id="relation-window" class="container-fluid">
    <input id="reluserid" type="hidden" value="" class="valueUser">
    <input id="relownid" type="hidden" value="" class="valueUser">
    <div class="container">
        <div class="card placementPublication relation-card">
            <div class="card-header">
                <h5>Choisir un type de relation</h5>
                <div id="close-relation-window">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                </div>
            </div>
            <div class="card-body">
                <select name="TypRel" class="form-control mb-2" id="selectTypRel">
                    <option value="">Choisissez un type de relation</option>
                    {% for reltype in reltypelist.relationTypes %}
                    <option value="{{ reltype.idtyprel }}">{{ reltype.libelletyprel }}</option>
                    {% endfor %}
                </select>
                <button type="button" class="btn btn-primary" id="register">Valider</button>

            </div>
        </div>
    </div>
</div>


{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

<script>
    $(document).ready(function(){
        // -- Rechercher un utilisateur par son nom ou prénom --
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#users-list .username").filter(function() {
                $(this).parent().parent().parent().parent().toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });

        // -- Fermer la fenêtre relations --
        $("#close-relation-window").click(function() {
            $( "#relation-window" ).hide();
        });

        // -- Enregistrer la relation --
        $("#register").click(function() {
            var token = $("#token").val();
            var tokenParse = JSON.parse(token);
            var userId = $("#reluserid").val();
            var myId = $("#relownid").val();
            var typeRel = $("#selectTypRel").val();

            $.ajax({
                url : 'http://localhost:5000/rel/create',
                type : 'POST',
                dataType : 'json',
                data: {
                    "idUser2": userId,
                    "idTypRel": typeRel
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
                },
                success : function(json){
                    alert('Relation enregistrée.');
                    location.reload();
                },
                error: function (result, status, err) {
                    alert('Erreur : ' + result.responseText);
                }
            });
        });

    });
</script>

