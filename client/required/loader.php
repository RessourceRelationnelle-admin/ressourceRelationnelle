<?php
require './vendor/autoload.php';
use Twig\Environment;
use Twig\Loader\FilesystemLoader;

$loader = new FilesystemLoader('./templates');
$twig = new Environment($loader);

session_start();

$user = '';
$user_id = '';
$user_profile = '';
$profile = '';
$isConnected = false;

// Définit quel utilisateur charger sur la page de profil
if (isset($_GET['id'])) {
    $user_id = $_GET['id'];
    // On récupère le tableau de données JSON renvoyé par l'url
    $getuser = ("http://localhost:5000/users/" . $user_id);
    $profile = json_decode(file_get_contents($getuser), true);
}
else if (isset($_SESSION['user'])) {
    $profile = $_SESSION['user'];
}

if (isset($_SESSION['user'])) {
    $user = $_SESSION['user'];
}

if (isset($_SESSION['token']))
{
    $isConnected = true;
}
else if (!isset($_SESSION['token'])) {
    $isConnected = false;
}