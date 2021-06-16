{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    <div class="container">
        <div class="input-group mb-3">
            <input  id="search-res" type="text" class="form-control" placeholder="Rechercher une ressource..." aria-describedby="basic-addon1">
        </div>
        <div id="resources-list">
            {% for key, ressource in reslist.ressources %}
            {{ include('elements/resources.tpl') }}
            {% endfor %}
        </div>
    </div>
</div>

{{ include('elements/relations-window.tpl') }}

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

<script src="js/res-delete.js"></script>
<script src="js/res-fav.js"></script>
<script src="js/relation-invite.js"></script>
<script>
    $(document).ready(function(){
        // -- Rechercher une ressource --
        $("#search-res").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#resources-list .res-title").filter(function() {
                $(this).parent().parent().parent().parent().toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
