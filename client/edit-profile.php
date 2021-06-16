<?php
require __DIR__ . '/required/loader.php';

// Empêche le visiteur non connecté d'aller sur son propre profil, mais peut toujours voir celui des autres
if ($isConnected == false || $profile['utilisateur']['iduser'] != $user['utilisateur']['iduser']) {
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
    echo $twig->render('edit-profile.tpl', [
        'titre_page' => 'Éditer mon profil',
        'isConnected' => $isConnected,
        'user' => $user,
        'profile' => $profile,
        'token' => $_SESSION['jwtToken']
    ]);
}

?>
