<?php
require __DIR__ . '/required/loader.php';

if ($user['utilisateur']['issuperadmin'] == false && $user['utilisateur']['isadmin'] == false)
{
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
    $getreltyperoute = "http://localhost:5000/reltyp";
    $reltypelist = json_decode(file_get_contents($getreltyperoute), true);

    echo $twig->render('relations-type-list.tpl', [
        'titre_page' => 'Liste des types relation',
        'isConnected' => $isConnected,
        'user' => $user,
        'token' => $_SESSION['jwtToken'],
        'reltypelist' => $reltypelist
    ]);
}

?>
