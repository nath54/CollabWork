<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

if(isset($_POST["type"]) && $_POST["type"]=="toggle_mode_non_auteur" && test_token($_POST)){
    if(isset($_SESSION["mode_non_auteur"])){
        unset($_SESSION["mode_non_auteur"]);
    }
    else{
        $_SESSION["mode_non_auteur"] = true;
    }
}

$_SESSION["last_page"] = "main.php";
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Parametres</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div id="main_body" style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <!-- Mode non auteur -->
            <div>
                <button id="mode_non_auteur" class="btn btn-primary" onclick="send_form('settings.php', [['type', 'toggle_mode_non_auteur']]);"><?php if(isset($_SESSION["mode_non_auteur"])){ echo "Désactiver"; } else { echo "Activer"; } ?> le mode non auteur (session)</button>
            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>
        <?php include "../include/form.php" ?>

    </body>
    <script src="../js/menus.js"></script>
</html>
