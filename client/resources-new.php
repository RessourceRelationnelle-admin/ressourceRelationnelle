<?php
require __DIR__ . '/required/loader.php';

// Empêche le visiteur de poster une ressource
if ($isConnected == false) {
    echo("Accès non autorisé");
    header('Location: home.php');
}
else {
    $getcatroute = "http://localhost:5000/rescat";
    $catlist = json_decode(file_get_contents($getcatroute), true);

    $gettyperoute = "http://localhost:5000/restyp";
    $typelist = json_decode(file_get_contents($gettyperoute), true);

    echo $twig->render('resources-new.tpl', [
        'titre_page' => 'Nouvelle ressource',
        'isConnected' => $isConnected,
        'user' => $user,
        'catlist' => $catlist,
        'typelist' => $typelist,
        'token' => $_SESSION['jwtToken']
    ]);
}

?>
