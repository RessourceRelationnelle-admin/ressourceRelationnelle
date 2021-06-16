{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-3 order-md-2">

    {{ include('elements/admin-header.tpl') }}

    <div class="container rounded bg-white mt-5 mb-5 centerprofil">
        <form id="new-resource">
            <div class="row mt-3">
                <div class="col-12">
                    <label for="inputCatName" class="form-label">Libellé</label>
                    <input type="text" name="libelleCatRes" class="form-control" id="inputCatName">
                </div>
            </div>
            <input type="hidden" id="token" value="{{ token }}">
            <button type="button" class="btn btn-primary" id="register">Enregistrer</button>
        </form>
    </div>

</div>

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

<script>

    $( document ).ready(function() {

        $("#register").click(function() {
            var libelleCatRes = $("#inputCatName").val();
            var token = $("#token").val();
            var tokenParse = JSON.parse(token);

            $.ajax({
                type : 'POST',
                url : 'http://localhost:5000/rescat',
                data: {
                    "name": libelleCatRes
                },
                dataType : 'json',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", 'Bearer '+ tokenParse.jwtToken);
                },
                success : function(json){
                    alert('La catégorie a été créée avec succès.');
                    location.href='resources-cat-list.php';
                },
                error: function (result, status, err) {
                    alert('Erreur : ' + result.responseText);
                }
            });
        });
    });

</script>