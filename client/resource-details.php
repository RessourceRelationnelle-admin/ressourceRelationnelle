<?php
require __DIR__ . '/required/loader.php';

$resId = $_GET['id'];
$getres = "http://localhost:5000/res/" . $resId;
$ressource = json_decode(file_get_contents($getres), true);

// Commentaires de la ressource
$getcommentroute = "http://localhost:5000/res/comm";
$commentlist = json_decode(file_get_contents($getcommentroute), true);

if (isset ($_SESSION['jwtToken'])) {
    // Utilisateurs
    $getusersroute = "http://localhost:5000/users";
    $userslist = json_decode(file_get_contents($getusersroute), true);
    // Types de relations
    $getreltyperoute = "http://localhost:5000/reltyp";
    $reltypelist = json_decode(file_get_contents($getreltyperoute), true);
    // Personnes en relation avec soi
    $getrelroute = "http://localhost:5000/rel/" . $user['utilisateur']['iduser'];
    $rellist = json_decode(file_get_contents($getrelroute), true);
    // Favoris de l'utilisateur
    $getfavroute = "http://localhost:5000/fav/user/" . $user['utilisateur']['iduser'];
    $favlist = json_decode(file_get_contents($getfavroute), true);

    echo $twig->render('resource-details.tpl', [
        'titre_page' => 'Détails de la ressource',
        'isConnected' => $isConnected,
        'user' => $user,
        'ressource' => $ressource,
        'userslist' => $userslist,
        'reltypelist' => $reltypelist,
        'rellist' => $rellist,
        'commentlist' => $commentlist,
        'favlist' => $favlist,
        'token' => $_SESSION['jwtToken'],
    ]);
}
else {
    echo $twig->render('resource-details.tpl', [
        'titre_page' => 'Détails de la ressource',
        'isConnected' => $isConnected,
        'user' => $user,
        'ressource' => $ressource,
        'commentlist' => $commentlist

    ]);
}

?>
