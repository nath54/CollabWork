<?php

$est_connecte = true;

?>

<!doctype HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Main</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0;">

            <div id="sidemenu" class="sidemenu">
                <div class="col" style="margin-left: 10px; margin-top:10px;">
                    <a href="#" class="lien_sidemenu">Accueil</a>
                    <a href="#" class="lien_sidemenu">Brouillons</a>
                    <a href="#" class="lien_sidemenu">Exercices</a>
                    <a href="#" class="lien_sidemenu">Cours</a>
                    <a href="#" class="lien_sidemenu">Fiches</a>
                    <a href="#" class="lien_sidemenu">Groupes</a>
                </div>
            </div>

        </div>

        <div id="accountmenu" class="col accountmenu cache">
            <?php
                if($est_connecte){
                    include "../include/account_menu/connecte.php";
                }
                else{
                    include "../include/account_menu/non_connecte.php";
                }
            ?>
        </div>


    </body>
    <script src="../js/menus.js"></script>
</html>
