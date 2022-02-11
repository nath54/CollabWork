<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

if($est_connecte){
}
else{
}

$fiches_et_chaps = [];

$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante

$_SESSION["last_page"] = "groupes.php";
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Quiz</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>
        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow: auto;">
            <div class="container" style="margin: 20px;">
                <div class="row c_pointer" onclick="toggle_selectionnes();">
                    <span id="triangle3" style="z-index:-1; transition: all 0.4s; transform:rotate(90deg); margin-top:auto; margin-bottom:auto; margin-right: 10px;">&#9654;</span>
                    <h1>Chapitres / Fiches sélectionnées </h1>
                    <img src="../res/save.svg" class="bt_svg" onclick="save_selectionnes();" style="margin-right:auto; margin-left: 2vh;"/>
                </div>
                <div id="div_selectionnes" class="col">
                    <?php

                        if(count($fiches_et_chaps) == 0){
                            echo "<p>Vous n'avez rien sélectionné !</p>";
                        }
                        else{
                            foreach($fiches_et_chaps as $elt){
                                $ide = $elt["id"];
                                $type = $elt["type"];
                                $nom = $elt["nom"];
                                echo "<div id='$ide' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$nom</h2></div> </div>";
                            }
                        }

                    ?>
                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>
        <?php include "../include/form.php"; ?>

    </body>
    <script src="../js/menus.js"></script>
    <script src="../js/quizs.js"></script>
</html>
