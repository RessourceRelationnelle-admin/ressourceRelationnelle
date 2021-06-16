<?php
require __DIR__ . '/required/loader.php';

if ($user['utilisateur']['issuperadmin'] == false && $user['utilisateur']['isadmin'] == false)
{
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
    $getcatroute = "http://localhost:5000/rescat";
    $catlist = json_decode(file_get_contents($getcatroute), true);
    echo $twig->render('resources-cat-list.tpl', [
        'titre_page' => 'Liste des catégories',
        'isConnected' => $isConnected,
        'user' => $user,
        'token' => $_SESSION['jwtToken'],
        'catlist' => $catlist
    ]);
}

?>
