<?php
require __DIR__ . '/required/loader.php';

// Empêche le visiteur non connecté d'aller sur son propre profil, mais peut toujours voir celui des autres
if ($isConnected == false && $profile == '') {
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
    // On récupère la liste des ressources vérifiées
    $getResourcesIsVerified = "http://localhost:5000/res/Verified";
    $resourcesList = json_decode(file_get_contents($getResourcesIsVerified), true);

    // Favoris de l'utilisateur
    $getfavroute = "http://localhost:5000/fav/user/" . $profile['utilisateur']['iduser'];
    $favlist = json_decode(file_get_contents($getfavroute), true);

    if (isset ($_SESSION['jwtToken'])) {
        echo $twig->render('resources-favorites.tpl', [
            'titre_page' => 'Ressources favorites',
            'isConnected' => $isConnected,
            'user' => $user,
            'profile' => $profile,
            'reslist' => $resourcesList,
            'favlist' => $favlist,
            'token' => $_SESSION['jwtToken']
        ]);
    }
    else {
        echo $twig->render('resources-favorites.tpl', [
            'titre_page' => 'Ressources favorites',
            'isConnected' => $isConnected,
            'user' => $user,
            'profile' => $profile,
            'reslist' => $resourcesList,
            'favlist' => $favlist
        ]);
    }

}


?>
