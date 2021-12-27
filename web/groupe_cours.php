<?php

$est_connecte = true;

$cours = [
    [
        "id" => 2,
        "titre" => "Thermodynamique des fluides non newtonniens"
    ],
    [
        "id" => 3,
        "titre" => "Equations différentielles"
    ]
];

?>

<!doctype HTML>
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
        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

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
                                $id = $cr["id"];
                                $titre = $cr["titre"];
                                echo "<div id='$id' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$titre</h2></div> </div>";
                            }
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
