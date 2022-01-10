<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

if($est_connecte){
    $req = "SELECT id, titre, texte, last_modif FROM brouillons WHERE id_compte = :id_compte";
    $brouillons = requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"]]);

    $req = "SELECT id, titre, texte, last_modif FROM brouillons_exercices WHERE id_compte = :id_compte";
    $exercices = requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"]]);
}


$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante


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
        <?php include "../include/sidemenu.php" ?>
        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow: auto;">

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
