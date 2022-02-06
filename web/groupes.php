<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

if($est_connecte){
    $req = "SELECT * FROM groupes WHERE id_creator=:id_compte;";
    $mes_groupes = requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"]]);
    $req = "SELECT groupes.id, groupes.id_creator, groupes.nom, groupes.nom_public FROM groupes INNER JOIN groupes_comptes ON groupes.id = groupes_comptes.id_groupe WHERE groupes_comptes.id_compte = :id_compte;";
    $groupes = requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"]]);
}
else{
    $mes_groupes = [];
    $groupes = [];
}


$req = "SELECT * FROM groupes WHERE est_public = TRUE;";
$groupes_publics = requete_prep($db, $req);


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
        <title>CollabWork - Groupes</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>
        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow: auto;">
            <div class="container" style="margin: 20px;">
                <?php
                if($est_connecte){
                    include "../include/groupes/connecte.php";
                }
                ?>

                <div class="row c_pointer" onclick="toggle_public();">
                    <span id="triangle3" style="z-index:-1; transition: all 0.4s; transform:rotate(90deg); margin-top:auto; margin-bottom:auto; margin-right: 10px;">&#9654;</span>
                    <h1>Groupes publics :</h1>
                </div>
                <div id="div_public" class="col">
                    <?php

                        if(count($groupes_publics) == 0){
                            echo "<p>Il n'y a pas de groupes publics</p>";
                        }
                        else{
                            foreach($groupes_publics as $grp){
                                $id = $grp["id"];
                                $nom = $grp["nom"];
                                echo "<div id='$id' class='bt_item row' onclick='window.location.href=\"groupe.php\"'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$nom</h2></div> </div>";
                            }
                        }

                    ?>
                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/menus.js"></script>
    <script src="../js/groupes.js"></script>
</html>
