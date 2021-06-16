<?php

require __DIR__ . '/required/loader.php';

if ($user['utilisateur']['issuperadmin'] == false && $user['utilisateur']['isadmin'] == false)
{
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
// On récupère le tableau de données JSON renvoyé par l'url
    $getusersroute = "http://localhost:5000/users";
    $userslist = json_decode(file_get_contents($getusersroute), true);

    echo $twig->render('admin-users-list.tpl', [
        'titre_page' => 'Administration des utilisateurs',
        'isConnected' => $isConnected,
        'user' => $user,
        'userslist' => $userslist,
        'token' => $_SESSION['jwtToken']
    ]);
}


?>
