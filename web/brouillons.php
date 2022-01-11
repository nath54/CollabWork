<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$redirect = null;

if($est_connecte){
    $req = "SELECT id, titre, texte, last_modif FROM brouillons WHERE id_compte = :id_compte";
    $brouillons = requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"]]);

    $req = "SELECT id, titre, texte, last_modif FROM brouillons_exercices WHERE id_compte = :id_compte";
    $exercices = requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"]]);

    if(isset($_POST["type"]) && $_POST["type"] == "new" && test_token($_POST)){
        $titre = "Brouillon " . strval(count($brouillons)+1);
        $req = "INSERT INTO brouillons (id_compte, titre, texte, last_modif) VALUES (:id_compte, :titre, \"\", NOW())";
        action_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"], ":titre"=>$titre]);
        //
        $id = $db->lastInsertId();
        $_SESSION["brouillon_id"] = $id;
        $_SESSION["request"] = "brouillon";
        $redirect = "brouillon.php";
    }

    if(isset($_POST["type"]) && $_POST["type"] == "delete" && test_token($_POST) && isset($_POST["brouillon_id"])){
        $req = "DELETE FROM brouillons WHERE id=:id_b;";
        action_prep($db, $req, [":id_b"=>$_POST["brouillon_id"]]);
        header("Location: brouillons.php");
    }


}

$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante


$_SESSION["last_page"] = "brouillons.php";

if($redirect != null){
    header("Location: $redirect");
}
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
        
        <?php include "../include/form.php"; ?>

    </body>
    <script src="../js/menus.js"></script>
</html>
