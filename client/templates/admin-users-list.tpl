{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    {{ include('elements/admin-header.tpl') }}
    <p class="libelleRecherche">Rechercher un utilisateur :</p>
    <input id="myInput" type="text" placeholder="Nom ou prénom" class="form-control">
    {{ include('elements/users.tpl') }}
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
    });
</script>

