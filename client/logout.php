<?php

session_start();

if (isset ($_SESSION['jwtToken'])) {
    unset($_SESSION['jwtToken']);
    unset($_SESSION['token']);
    session_unset();
    session_destroy();
    header('Location: ./');
}
else {
    header('Location: home.php');
}





