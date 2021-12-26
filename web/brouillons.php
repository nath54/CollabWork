<?php

$est_connecte = true;

$brouillons = [
    [
        "id" => 0,
        "titre" => "Brouillon n°1",
        "derniere_modif" => [20,12,2021]
    ],
    [
        "id" => 1,
        "titre" => "Brouillon n°2",
        "derniere_modif" => [24,12,2021]
    ]
];

?>

<!doctype HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Brouillons</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0;">

            <?php include "../include/sidemenu.php" ?>

            <?php
            if($est_connecte){
                include "../include/brouillons/connecte.php";
            }
            else{
                include "../include/erreur_non_connecte.php";
            }
            ?>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/menus.js"></script>
</html>