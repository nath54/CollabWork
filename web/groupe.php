<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$id = null;

if(isset($_POST["type"]) && isset($_POST["id_groupe"]) && $_POST["type"]=="request" && test_token($_POST)){
    $id = $_POST["id_groupe"];
}
if(isset($_POST["type"]) && isset($_POST["id_groupe"]) && isset($_POST["nom"]) && $_POST["type"]=="save_nom_groupe" && test_token($_POST)){
    $id = $_POST["id_groupe"];
    $nom = $_POST["nom"];
    $req = "UPDATE groupes SET nom=:nom WHERE id=:id_groupe;";
    action_prep($db, $req, [":id_groupe"=>$id, ":nom"=>$nom]);
}
else if(isset($_POST["type"]) && $_POST["type"] == "nouveau_groupe" && test_token($_POST) && $est_connecte){
    $nom_groupe = "Groupe : " . random_str(10, "0123456789");
    $req = "INSERT INTO groupes (id_creator, nom, est_public) VALUES (:id_c, :nom, FALSE);";
    action_prep($db, $req, [":id_c"=>$_SESSION["id_compte"], ":nom"=>$nom_groupe]);
    $id = $db->lastInsertId();
}
else if(isset($_POST["type"]) && isset($_POST["id_groupe"]) && isset($_POST["est_public"]) && $_POST["type"]=="save_est_public" && test_token($_POST)){
    $id = $_POST["id_groupe"];
    $est_public = $_POST["est_public"];
    $req = "UPDATE cours SET est_public=:ep WHERE id=:id_c AND id_createur=:id_compte;";
    action_prep($db, $req, [":id_c"=>$id, ":id_compte"=>$_SESSION["id_compte"], ":ep"=>$est_public]);
}
else if(isset($_POST["type"])){ // ON protège des mauvaises requetes
    header("Location: index.php");
    die();
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
$appartient_au_groupe = true;
$est_createur = false;
if($est_connecte){
    $est_createur = $data[0]["id_creator"] == $_SESSION["id_compte"];
}
$nom_groupe = $data[0]["nom"];


$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante

$_SESSION["id_groupe"] = $id;
$_SESSION["last_page"] = "groupe.php";
script("window.id_groupe = $id");
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Groupe</title>
        <!-- SCRIPTS -->
        <script src="../js/groupe.js"></script>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div id="main_body" style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="display:block; margin:8vh;">
                
                <div>
                    <button class="bt1" style="margin:2vh; margin-left:0;" onclick="window.location.href='groupes.php';">Retour</button>
                </div>

                <?php

                    if(!$appartient_au_groupe){
                        if(!$est_public){
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
        <?php include "../include/form.php" ?>

    </body>
    <script src="../js/menus.js"></script>
</html>
