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


$req = "SELECT * FROM groupes WHERE id=:id;";
$data = requete_prep($db, $req, [":id"=>$id]);

if(count($data) != 1){
    header("Location: index.php");
    die();
}

$est_public = $data[0]["est_public"];
$id_createur = $data[0]["id_creator"];
$appartient_au_groupe = true;
$est_createur = false;
if($est_connecte){
    $est_createur = $id_createur == $_SESSION["id_compte"];
}
$nom_groupe = $data[0]["nom"];



$req = "SELECT comptes.id, comptes.pseudo FROM comptes INNER JOIN groupes_comptes ON comptes.id = groupes_comptes.id_compte WHERE groupes_comptes.id_groupe = :id_g;";
$comptes = requete_prep($db, $req, [":id_g"=>$id]);

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

                <h1>Membres du groupe : </h1>

                <div style="padding: 3vh;">

                    <?php

                        foreach($comptes as $cr){
                            $id_c = $cr["id"];
                            $pseudo = $cr["pseudo"];
                            $pathi = "../res/person.svg";
                            if($id_c == $id_createur){
                                $pathi = "../res/crown.svg";
                            }
                            echo "  <div id='$id_c' class='bt_item row'>
                                        <div class='row' style='width:100%; padding:2vh; margin:auto; '>
                                            <img src=\"$pathi\" class=\"img_car\" style=\"margin-right: 2vh;\"/>
                                            <h2>$pseudo</h2>
                                        </div>
                                    </div>";
                        }

                    ?>

                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/cours.js"></script>
    <script src="../js/menus.js"></script>
</html>
