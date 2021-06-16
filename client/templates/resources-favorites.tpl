{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    {{ include('elements/profile-header.tpl') }}

    {% for fav in favlist.favoris %}
    {% for ressource in reslist.ressources %}
    {% if ressource.idressource == fav.idressource %}
    {{ include('elements/resources.tpl') }}
    {% endif %}
    {% endfor %}
    {% endfor %}
</div>


{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

<script src="js/res-delete.js"></script>
<script src="js/res-fav.js"></script>
<script src="js/relation-invite.js"></script>



