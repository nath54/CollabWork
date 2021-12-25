<?php

$est_connecte = true;

$brouillons = [
    [
        "id" => 0,
        "titre" => "Brouillon n°1",
        "derniere_modif" => [20,12,2021]
    ],
    [
        "id" => 1,
        "titre" => "Brouillon n°2",
        "derniere_modif" => [24,12,2021]
    ]
];

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
        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0;">

            <?php include "../include/sidemenu.php" ?>

            <div class="container" style="margin: 20px;">

                <button class="bt1" >Nouveau brouillon</button>

                <h1>Vos brouillons :</h1>


                <div class="col">
                <?php
                
                    if(count($brouillons) == 0){
                        echo "<p>Vous n'avez pas de brouillons</p>";
                    }
                    else{
                        foreach($brouillons as $br){
                            $id = $br["id"];
                            $titre = $br["titre"];
                            $date = $br["derniere_modif"];
                            $text_date = "hier";
                            echo "<div id='$id' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$titre</h2><i style='font-size:0.9em;'>Dernière modification : $text_date</i></div> <div class='row'><img class='bt_svg' src='../res/pencil.svg' /> <img class='bt_svg' src='../res/trash.svg' /></div></div></div>";
                        }
                    }

                ?>
                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/menus.js"></script>
</html>
