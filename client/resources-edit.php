<?php
require __DIR__ . '/required/loader.php';

if ($user['utilisateur']['issuperadmin'] == false && $user['utilisateur']['isadmin'] == false)
{
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
    $resId = $_GET['idres'];
    $getres = "http://localhost:5000/res/" . $resId;
    $ressource = json_decode(file_get_contents($getres), true);

    $getcatroute = "http://localhost:5000/rescat";
    $catlist = json_decode(file_get_contents($getcatroute), true);

    $gettyperoute = "http://localhost:5000/restyp";
    $typelist = json_decode(file_get_contents($gettyperoute), true);

    echo $twig->render('resources-edit.tpl', [
        'titre_page' => 'Modifier ressource',
        'isConnected' => $isConnected,
        'user' => $user,
        'resId' => $resId,
        'catlist' => $catlist,
        'typelist' => $typelist,
        'ressource' => $ressource,
        'token' => $_SESSION['jwtToken']
    ]);
}

?>
