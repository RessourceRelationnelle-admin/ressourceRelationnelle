<?php
require __DIR__ . '/required/loader.php';

// Empêche le visiteur non connecté d'aller sur son propre profil, mais peut toujours voir celui des autres
if ($isConnected == false && $profile == '') {
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
    // Utilisateurs
    $getusersroute = "http://localhost:5000/users";
    $userslist = json_decode(file_get_contents($getusersroute), true);
    // Types de relations
    $getreltyperoute = "http://localhost:5000/reltyp";
    $reltypelist = json_decode(file_get_contents($getreltyperoute), true);
    // Personnes en relation avec soi
    $getrelroute = "http://localhost:5000/rel/" . $profile['utilisateur']['iduser'];
    $rellist = json_decode(file_get_contents($getrelroute), true);

    if (isset ($_SESSION['jwtToken'])) {

        echo $twig->render('relations.tpl', [
            'titre_page' => 'Relations',
            'isConnected' => $isConnected,
            'user' => $user,
            'profile' => $profile,
            'userslist' => $userslist,
            'reltypelist' => $reltypelist,
            'rellist' => $rellist,
            'token' => $_SESSION['jwtToken']
        ]);
    }
    else
    {
        echo $twig->render('relations.tpl', [
            'titre_page' => 'Relations',
            'isConnected' => $isConnected,
            'user' => $user,
            'profile' => $profile,
            'userslist' => $userslist,
            'reltypelist' => $reltypelist,
            'rellist' => $rellist
        ]);
    }
}

?>
