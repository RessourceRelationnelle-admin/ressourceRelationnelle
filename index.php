<?php
    require __DIR__ . '/required/loader.php';

    // On appel la connexion pour voir si les informations envoyées sont identiques au retour
    //$getconnexion = "http://localhost:5000/users/connexion";
    
    echo $twig->render('index.tpl', [
        'isConnected' => $isConnected,
        'user' => $user
    ]);
    ?>
