<?php
require __DIR__ . '/required/loader.php';

// On récupère la liste des ressources vérifiées
$getResourcesIsVerified = "http://localhost:5000/res/Verified";
$resourcesList = json_decode(file_get_contents($getResourcesIsVerified), true);

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

    echo $twig->render('home.tpl', [
        'titre_page' => 'Home',
        'isConnected' => $isConnected,
        'user' => $user,
        'reslist' => $resourcesList,
        'userslist' => $userslist,
        'reltypelist' => $reltypelist,
        'rellist' => $rellist,
        'favlist' => $favlist,
        'token' => $_SESSION['jwtToken']
    ]);
}
else {
    echo $twig->render('home.tpl', [
        'titre_page' => 'Home',
        'isConnected' => $isConnected,
        'user' => $user,
        'reslist' => $resourcesList,
    ]);
}
?>
