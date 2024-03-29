<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$cours = [];
$cours_vosgroupes = [];

if($est_connecte){
    $req = "SELECT id, titre FROM cours WHERE id_createur=:id_c;";
    $cours = requete_prep($db, $req, [":id_c"=>$_SESSION["id_compte"]]);

    if(isset($_POST["type"]) && $_POST["type"] == "new_cour" && test_token($_POST)){
        $titre = "Cour n°" . (count($cours) + 1);
        $req = "INSERT INTO cours (titre, id_createur, est_public) VALUES (:t, :id_c, 0);";
        action_prep($db, $req, [":t"=>$titre, ":id_c"=>$_SESSION["id_compte"]]);
        $id_cour = $db->lastInsertId();
        $_SESSION["request"]="cour";
        $_SESSION["id_cour"]=$id_cour;
        header("Location: cour.php");
        die();
    }

    // Cours vos groupes

    // On récupère les groupes dont l'utilisateur est membre
    $req = "SELECT id_groupe FROM groupes_comptes WHERE id_compte=:id_c;";
    $groupes = requete_prep($db, $req, [":id_c"=>$_SESSION["id_compte"]]);

    // On récupère les cours de chaque groupe
    $cours_vosgroupes = [];
    foreach($groupes as $groupe){
        // ON récupère les cours partagés avec ce groupe
        $id_g = $groupe["id_groupe"];
        $req = "SELECT cours.id AS id, titre FROM cours INNER JOIN cours_groupes ON cours.id=cours_groupes.id_cour WHERE id_groupe=:id_g;";
        $cours_groupe = requete_prep($db, $req, [":id_g"=>$id_g]);
        $cours_vosgroupes = array_merge($cours_vosgroupes, $cours_groupe);
    }


}

$cours_publics = [];

$req = "SELECT id, titre FROM cours WHERE est_public=1;";
$cours_publics = requete_prep($db, $req);


$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante

$_SESSION["last_page"] = "cours.php";
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Cours</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>
        <div id="main_body" style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <?php
            if($est_connecte){
                include "../include/cours/connecte.php";
            }
            ?>

            <div class="container" style="margin: 20px;">

                <h1>Cours accessibles : </h1>

                <div style="padding: 3vh;">

                    <div class="row">
                        <button id="bt_vosgroupes" class="bt2 souligne" onclick="aff_vosgroupes();">Vos groupes</button>
                        <span style="margin-left:2vh; margin-right:2vh;">|</span>
                        <button id="bt_public" class="bt2" onclick="aff_public();">Public</button>
                    </div>

                    <div class="row" style="margin:3vh;">
                        <div style="border:1px solid black; padding:2px;" class="row">
                            <input id="input_search" placeholder="search..." style="border:none; width:100%; height:100%;">
                            <img src="../res/loupe.svg" style="width: 3vh; height:3vh; margin:1vh; background:none; cursor:pointer;" onclick="search();"/>
                        </div>
                    </div>



                    <div id="div_vosgroupes" class="col">

                        <?php
                            if($est_connecte){
                                if(count($cours_vosgroupes) == 0){
                                    echo "<p>Il n'y a aucun cours disponible</p>";
                                }
                                else{
                                    foreach($cours_vosgroupes as $cr){
                                        $id = $cr["id"];
                                        $titre = $cr["titre"];
                                        echo "<div id='$id' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto;'  onclick='send_form(\"cour.php\", [[\"type\", \"request\"], [\"id_cour\", $id]]);'><h2>$titre</h2></div> </div>";
                                    }
                                }
                            }
                            else{
                                echo "<p>Vous devez être connecté pour voir les cours accessibles par les groupes dont vous appartenez</p>";
                            }
                        ?>

                    </div>

                    <div id="div_public" class="col" style="display:none;">

                            <?php

                                if(count($cours_publics) == 0){
                                    echo "<p>Il n'y a aucun cours disponible</p>";
                                }
                                else{
                                    foreach($cours_publics as $cr){
                                        $id = $cr["id"];
                                        $titre = $cr["titre"];
                                        echo "<div id='$id' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; ' onclick='send_form(\"cour.php\", [[\"type\", \"request\"], [\"id_cour\", $id]]);'><h2>$titre</h2></div> </div>";
                                    }
                                }

                            ?>

                    </div>

                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php"; ?>
        <?php include "../include/form.php"; ?>

    </body>
    <script src="../js/cours.js"></script>
    <script src="../js/menus.js"></script>
</html>
