<?php

if (isset($_GET['token'])) {
    $jwtToken = $_GET['token'];
    $token = json_decode($jwtToken, true);
    $email = $_GET['email'];
    session_start();
    if (!isset($_SESSION['jwtToken']) && !isset($_SESSION['token']) && !isset($_SESSION['email'])) {
        $_SESSION['jwtToken'] = $jwtToken;
        $_SESSION['token'] = $token;
        $_SESSION['email'] = $email;
        // On récupère l'user connecté grâce à son email
        $getuser = ("http://localhost:5000/users/getId/" . $email);
        $_SESSION['user'] = json_decode(file_get_contents($getuser), true);
    }
    echo "Connexion réussie";
    header('Location: home.php');
}
else {
    header('Location: ./');
    echo "Erreur de connexion";
}

?>