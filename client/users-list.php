<?php

require __DIR__ . '/required/loader.php';

// On récupère le tableau de données JSON des utilisateurs renvoyé par l'url
$getusersroute = "http://localhost:5000/users";
$userslist = json_decode(file_get_contents($getusersroute), true);

// Types de relations
$getreltyperoute = "http://localhost:5000/reltyp";
$reltypelist = json_decode(file_get_contents($getreltyperoute), true);

if (isset ($_SESSION['jwtToken'])) {
    // Personnes en relation avec soi
    $getrelroute = "http://localhost:5000/rel/" . $user['utilisateur']['iduser'];
    $rellist = json_decode(file_get_contents($getrelroute), true);

    echo $twig->render('users-list.tpl', [
        'titre_page' => 'Utilisateurs inscrits',
        'isConnected' => $isConnected,
        'user' => $user,
        'userslist' => $userslist,
        'reltypelist' => $reltypelist,
        'rellist' => $rellist,
        'token' => $_SESSION['jwtToken']
    ]);
}
else
{
    echo $twig->render('users-list.tpl', [
        'titre_page' => 'Utilisateurs inscrits',
        'isConnected' => $isConnected,
        'user' => $user,
        'userslist' => $userslist,
        'reltypelist' => $reltypelist
    ]);
}





?>
