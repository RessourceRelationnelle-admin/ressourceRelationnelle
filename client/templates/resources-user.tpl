{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">
    {{ include('elements/profile-header.tpl') }}

    {% for key, ressource in reslist.ressources %}
    {% if ressource.idauteur == profile.utilisateur.iduser %}

    {{ include('elements/resources.tpl') }}
    {% endif %}
    {% endfor %}
</div>


{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

<script src="js/res-delete.js"></script>
