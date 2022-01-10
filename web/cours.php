<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";


$cours = [
    [
        "id" => 0,
        "titre" => "Cour n°1"
    ],
    [
        "id" => 1,
        "titre" => "Cour n°2"
    ]
];

$cours_vosgroupes = [];
$cours_publics = [
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
        <title>CollabWork - Cours</title>
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
                                        echo "<div id='$id' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$titre</h2></div> </div>";
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
                                        echo "<div id='$id' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$titre</h2></div> </div>";
                                    }
                                }

                            ?>

                    </div>

                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/cours.js"></script>
    <script src="../js/menus.js"></script>
</html>
