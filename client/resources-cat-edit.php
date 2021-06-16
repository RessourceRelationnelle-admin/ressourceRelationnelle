<?php
require __DIR__ . '/required/loader.php';

if ($user['utilisateur']['issuperadmin'] == false && $user['utilisateur']['isadmin'] == false)
{
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
    echo $twig->render('resources-cat-edit.tpl', [
        'titre_page' => 'Modifier catégorie',
        'isConnected' => $isConnected,
        'user' => $user,
        'idcatres' => $_GET['idcatres'],
        'libellecatres' => $_GET['libellecatres'],
        'token' => $_SESSION['jwtToken']
    ]);
}

?>
