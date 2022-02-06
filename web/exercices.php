<?php

include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";


$exercices = [];

$exercices_vosgroupes = [];

if($est_connecte){

    $req = "SELECT id, titre FROM exercices WHERE id_compte=:id_c;";
    $exercices = requete_prep($db, $req, [":id_c"=>$_SESSION["id_compte"]]);


    if(isset($_POST["type"]) && $_POST["type"]=="new" && test_token($_POST)){
        $titre = "Exercice " . strval(count($exercices)+1);
        $req = "INSERT INTO exercices (id_compte, titre) VALUES (:id_compte, :titre)";
        action_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"], ":titre"=>$titre]);
        //
        $id = $db->lastInsertId();
    }

    $req = "SELECT id, titre FROM exercices WHERE id_compte=:id_c;";
    $exercices = requete_prep($db, $req, [":id_c"=>$_SESSION["id_compte"]]);

    for($i=0; $i<count($exercices); $i++){
        $req = "SELECT id FROM chapitres_exercices WHERE id_exercice=:id_e;";
        $exercices[$i]["id_chapitres"] = requete_prep($db, $req, [":id_e"=>$exercices[$i]["id"]]);
    }

    //TODO : exercices_vosgroupes
}

$req = "SELECT id, titre FROM exercices WHERE est_public;";

$exercices_publics = requete_prep($db, $req);

for($i=0; $i<count($exercices_publics); $i++){
    $req = "SELECT id FROM chapitres_exercices WHERE id_exercice=:id_e;";
    $exercices_publics[$i]["id_chapitres"] = requete_prep($db, $req, [":id_e"=>$exercices_publics[$i]["id"]]);
}


$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante


$_SESSION["last_page"] = "exercices.php";
?>

<!DOCTYPE HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Exercices</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>
        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <?php
            if($est_connecte){
                include "../include/exercices/connecte.php";
            }
            ?>

            <div class="container" style="margin: 20px;">

                <h1>Exercices accessibles : </h1>

                <div style="padding: 3vh;">

                    <div class="row">
                        <button id="bt_vosgroupes" class="bt2 souligne" onclick="aff_vosgroupes();">Vos groupes</button>
                        <span style="margin-left:2vh; margin-right:2vh;">|</span>
                        <button id="bt_public" class="bt2" onclick="aff_public();">Public</button>
                    </div>

                    <div class="row" style="margin:3vh;">
                        <div style="border:1px solid black; padding:2px;" class="row">
                            <input id="input_search" onkeyup="search();" placeholder="search..." style="border:none; width:100%; height:100%;">
                            <img src="../res/loupe.svg" style="width: 3vh; height:3vh; margin:1vh; background:none; cursor:pointer;" onclick="search();"/>
                        </div>
                    </div>

                    <div id="div_vosgroupes" class="col">

                        <?php
                            if($est_connecte){
                                if(count($exercices_vosgroupes) == 0){
                                    echo "<p>Il n'y a aucun exercice disponible</p>";
                                }
                                else{
                                    foreach($exercices_vosgroupes as $cr){
                                        $id = $cr["id"];
                                        $titre = $cr["titre"];
                                        echo "<div id='$id' class='bt_item row' onclick='send_form(\"exercice.php\", [[\"type\", \"request\"], [\"id_exercice\", $id]]);'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2 class='titre_elt'>$titre</h2></div> </div>";
                                    }
                                }
                            }
                            else{
                                echo "<p>Vous devez être connecté pour voir les exercices accessibles par les groupes dont vous appartenez</p>";
                            }
                        ?>

                    </div>

                    <div id="div_public" class="col" style="display:none;">

                            <?php

                                if(count($exercices_publics) == 0){
                                    echo "<p>Il n'y a aucun exercice disponible</p>";
                                }
                                else{
                                    foreach($exercices_publics as $cr){
                                        $id = $cr["id"];
                                        $titre = $cr["titre"];
                                        echo "<div id='$id' class='bt_item row' onclick='send_form(\"exercice.php\", [[\"type\", \"request\"], [\"id_exercice\", $id]]);'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2 class='titre_elt'>$titre</h2></div> </div>";
                                    }
                                }

                            ?>

                    </div>

                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>
        <?php include "../include/form.php" ?>

    </body>
    <script src="../js/cours.js"></script>
    <script src="../js/menus.js"></script>
    <script>

function search(){
    var txt_search = document.getElementById("input_search").value;
    for(t of document.getElementsByClassName("titre_elt")){
        var d = t.parentNode.parentNode;
        if(t.innerHTML.toLowerCase().includes(txt_search)){
            d.style.display = "block";
        }
        else{
            d.style.display = "none";
        }
    }
}

    </script>
</html>
