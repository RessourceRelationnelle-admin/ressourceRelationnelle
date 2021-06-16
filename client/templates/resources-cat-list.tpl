{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    {{ include('elements/admin-header.tpl') }}
    <br/>
    <ol class="list-group list-group-numbered">
    {% for cat in catlist.ressourceCategories %}
    <li class="list-group-item">{{ cat.libellecatres }}
        <a href="resources-cat-edit?idcatres={{ cat.idcatres }}&libellecatres={{ cat.libellecatres }}" title="Éditer" class="bouton-ressource">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
            </svg>
        </a>
        <a id="{{ cat.idcatres }}" title="Supprimer définitivement" class="bouton-ressource btn-delete">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
            </svg>
        </a>
    </li>

    {% endfor %}
    </ol>
</div>


{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

<script>

    // Suppression de ressource
    $( ".btn-delete" ).click(function() {
        var token = $("#token").val();
        var tokenParse = JSON.parse(token);
        var id = this.id;
        $.ajax({
            type : 'DELETE',
            url : 'http://localhost:5000/rescat/delete/' + id,
            data: {
                "id": id
            },
            dataType : 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
            },
            success : function(json){
                alert('La catégorie a été supprimée.');
                location.href='resources-cat-list.php';
            },
            error: function (result, status, err) {
                alert('Erreur : ' + result.responseText);
            }
        });
    });

</script>
