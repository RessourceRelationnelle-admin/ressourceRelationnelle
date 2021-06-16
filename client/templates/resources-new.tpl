{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">

    <div class="container rounded bg-white mt-5 mb-5 centerprofil">
        <form id="new-resource">
            <div class="row mt-3">
                <div class="col-12">
                    <label for="inputTitre" class="form-label">Titre</label>
                    <input type="text" name="titre" class="form-control" id="inputTitre">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="inputIllustration" class="form-label">Illustration</label>
                    <input type="file" name="illustration" accept="image/png,image/jpeg" class="form-control" id="inputIllustration">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="inputMessage" class="form-label">Message</label>
                    <textarea rows="5" name="message" class="form-control" id="inputMessage"></textarea>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="inputDuree" class="form-label">Durée (heures)</label>
                    <input type="number" name="duree" class="form-control" id="inputDuree">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="selectTypRes" class="form-label">Type</label>
                    <select name="TypRes" class="form-control" id="selectTypRes">
                        <option value="">Choisissez un type</option>
                        {% for type in typelist.ressourceType %}
                        <option value="{{ type.idtypres }}">{{ type.libelletypres|replace({'‚' : 'é', '…' : 'à'}) }}</option>
                        {% endfor %}
                    </select>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="selectCatRes" class="form-label">Catégorie</label>
                    <select name="CatRes" class="form-control" id="selectCatRes">
                        <option value="">Choisissez une catégorie</option>
                        {% for cat in catlist.ressourceCategories %}
                        <option value="{{ cat.idcatres }}">{{ cat.libellecatres }}</option>
                        {% endfor %}
                    </select>
                </div>
            </div>
            <input type="hidden" id="token" value="{{ token }}">
            <button type="button" class="btn btn-primary  mb-3 mt-3" id="register">Enregistrer</button>
        </form>
    </div>

</div>

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

<script>

    // Enregistrement de la ressource
    $( document ).ready(function() {
        $("#register").click(function() {
            var titre = $("#inputTitre").val();
            var illustration = $("#inputIllustration").val();
            var message = $("#inputMessage").val();
            var duree = $("#inputDuree").val();
            var TypRes = $("#selectTypRes").val();
            var CatRes = $("#selectCatRes").val();
            var token = $("#token").val();
            var tokenParse = JSON.parse(token);

            $.ajax({
                type : 'POST',
                url : 'http://localhost:5000/res/create',

                data: {
                    "titre": titre,
                    "illustration": illustration,
                    "message": message,
                    "duree": duree,
                    "TypRes": TypRes,
                    "CatRes": CatRes,
                },
                dataType : 'json',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
                },
                success : function(json){
                    alert('La ressource a été créée avec succès.');
                    location.reload();
                },
                error: function (result, status, err) {
                    alert('Erreur : ' + result.responseText);
                }
            });
        });
    });

</script>
