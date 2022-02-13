<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$id = null;

if(isset($_POST["type"]) && isset($_POST["id_groupe"]) && $_POST["type"]=="request" && test_token($_POST)){
    $id = $_POST["id_groupe"];
}
else if(isset($_SESSION["id_groupe"])){
    $id = $_SESSION["id_groupe"];
}

if($id == null){
    header("Location: index.php");
    die();
}

$req = "SELECT cours.id, cours.titre FROM cours INNER JOIN cours_groupes ON cours.id = cours_groupes.id_cour WHERE cours_groupes.id_groupe = :id_g;";
$cours = requete_prep($db, $req, [":id_g"=>$id]);


$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante


$_SESSION["last_page"] = "groupe_cour.php";
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Groupe/Cours</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>
        <div id="main_body" style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="margin: 5vh;">

                <div>
                    <button class="bt1" style="margin:2vh; margin-left:0;" onclick="window.location.href='groupe.php';">Retour</button>
                </div>

                <h1>Cours partagés à ce groupe : </h1>

                <div style="padding: 3vh;">

                    <?php

                        if(count($cours) == 0){
                            echo "<p>Il n'y a aucun cours disponible</p>";
                        }
                        else{
                            foreach($cours as $cr){
                                $idc = $cr["id"];
                                $titre = $cr["titre"];
                                echo "<div id='$idc' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; ' onclick='send_form(\"cour.php\", [[\"type\", \"request\"], [\"id_cour\", $idc]])'><h2>$titre</h2></div> </div>";
                            }
                        }

                    ?>

                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>
        <?php include "../include/form.php" ?>
        

    </body>
    <script src="../js/cours.js"></script>
    <script src="../js/menus.js"></script>
</html>
