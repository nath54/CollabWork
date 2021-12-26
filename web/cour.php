<?php

$est_connecte = true;

$chapitres = [

    [
        "id" => 0,
        "titre" => "1. La construction du monde"
    ],
    [
        "id" => 1,
        "titre" => "2. Le développement des hommes"
    ],
    [
        "id" => 2,
        "titre" => "3. La destruction"
    ],
    [
        "id" => 3,
        "titre" => "Conclusion"
    ]

];

?>

<!doctype HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Cour</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body>
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="margin:3vh;">

                <div class="row">
                    <h2 id="titre" style="margin-top:auto; margin-bottom:auto;">Titre du cour</h2>
                    <input id="input_titre" value="Titre du cour" style="display:none;"/>
                    <button id="bt_modif_titre" onclick="modif_titre();" class="bt1" style="margin:2vh;">Modifier</button>
                    <button id="bt_save_titre" class="bt1" style="margin:2vh; display:none;">Sauvegarder</button>
                    <button id="bt_annule_titre" onclick="annule_titre();" class="bt1" style="margin:2vh; display:none;">Annuler</button>
                </div>
                
                <div class="row">
                    <p id="description" style="display:block;">Voici la description de ce cour, elle peut être tellement longue qu'elle peut prendre plusieurs lignes, il faut donc faire bien attention à l'affichage résultant de la page dans ces situations suivantes, pour qu'il soit quand même joli et agréable pour l'utilisateur</p>
                    <textarea id="input_description" style="width: 100%; display:none;">Voici la description de ce cour, elle peut être tellement longue qu'elle peut prendre plusieurs lignes, il faut donc faire bien attention à l'affichage résultant de la page dans ces situations suivantes, pour qu'il soit quand même joli et agréable pour l'utilisateur</textarea>
                    <button id="bt_modif_description" onclick="modif_description();" class="bt1" style="margin:2vh; display:block;">Modifier</button>
                    <button id="bt_save_description" class="bt1" style="margin:2vh; display:none;">Sauvegarder</button>
                    <button id="bt_annule_description" onclick="annule_description();"class="bt1" style="margin:2vh; margin-left:0; display:none;">Annuler</button>
                </div>

                <h1>Chapitres :</h1>

                <div class="col">

                    <?php

                        if(count($chapitres)==0){
                            echo "<p>Il n'y a pas de chapitres dans ce cours</p>";
                        }
                        else{
                            foreach($chapitres as $c){
                                $id = $c["id"];
                                $titre = $c["titre"];
                                echo "<div id='$id' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$titre</h2></div> </div>";
                            }
                        }

                    ?>

                </div>

                <div>
                    <button class="bt1" style="margin:2vh;">Nouveau chapitre</button>
                </div>

                <div>
                    <button class="bt3" style="margin:2vh; margin-top:0;">Supprimer le cour</button>
                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/cour.js"></script>
    <script src="../js/menus.js"></script>
</html>
