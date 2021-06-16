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

    if (isset ($_SESSION['jwtToken'])) {
        echo $twig->render('resources-user.tpl', [
            'titre_page' => 'Ressources publiées',
            'isConnected' => $isConnected,
            'user' => $user,
            'profile' => $profile,
            'reslist' => $resourcesList,
            'token' => $_SESSION['jwtToken']
        ]);
    }
    else {
        echo $twig->render('resources-user.tpl', [
            'titre_page' => 'Ressources publiées',
            'isConnected' => $isConnected,
            'user' => $user,
            'profile' => $profile,
            'reslist' => $resourcesList,
        ]);
    }
}
?>
