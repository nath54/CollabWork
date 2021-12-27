<?php

$est_connecte = true;

$groupe_public = false;

$appartient_au_groupe = true;

$est_createur = false;

$nom_groupe = "Nom du groupe";

?>

<!doctype HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Groupe</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="display:block; margin:8vh;">
                
                <div>
                    <button class="bt1" style="margin:2vh; margin-left:0;" onclick="window.location.href='groupes.php';">Retour</button>
                </div>

                <?php

                    if(!$appartient_au_groupe){
                        if(!$groupe_public){
                            echo "<p>Vous n'êtes pas autorisés à accéder à ce groupe</p>";
                        }
                        else{
                            include "../include/groupe/non_appartient_public.php";
                        }
                    }
                    else{
                        include "../include/groupe/appartient.php";
                    }
                    

                ?>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/menus.js"></script>
</html>