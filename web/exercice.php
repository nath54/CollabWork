<?php

$est_connecte = true;


$titre = "Titre de l'exercice";

$contenu = [
    [
        "id" => 0,
        "type" => "texte",
        "texte" => "On va ici démontrer le théorème de Truc Bidule.<br/> On pose \$f(x) = 5x^2+3\cos(x)$ "
    ],
    [
        "id" => 1,
        "type" => "question",
        "texte" => "Question 1 : Donner le domaine de définition de la fonction $ f $."
    ],
    [
        "id" => 2,
        "type" => "question",
        "texte" => "Question 2 : Etudier les variations de la fonction $ f $"
    ],
    [
        "id" => 3,
        "type" => "question",
        "texte" => "Question 3 : Etudier la convexité de la fonction $ f $"
    ],
    [
        "id" => 4,
        "type" => "texte",
        "texte" => "Le théorème de Truc Bidule montre que toute fonction de la forme $ ax^2 + b\cos(x) $ est convexe sur un sous-ensemble non vide de $ \R $"
    ],
    [
        "id" => 5,
        "type" => "question",
        "texte" => "Question 4 : Démontrer le théorème de Truc Bidule"
    ]
];


$reponses = [
    1 => "\$f$ est définie sur $\R$",
    2 => "",
    3 => "",
    5 => ""
];


?>

<!doctype HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Exercice</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body onload="MathJax.typesetPromise();">
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container col" style="margin:3vh;">

                <button class="bt1" style="display:block; margin-bottom:2vh;" onclick="window.location.href='exercices.php';">Retour</button>

                <h1><?php echo $titre; ?></h1>

                <div class="col">


                    <?php 

                        foreach($contenu as $el){

                            $id = $el["id"];

                            echo "<div>";

                            if($el["type"] == "texte"){
                                $txt = $el["texte"];
                                echo "<p>$txt</p>";
                            }
                            elseif($el["type"] == "question"){
                                $txt = $el["texte"];
                                $aff_bt_repondre = "display: block;";
                                $txt_reponse = $reponses[$id];
                                if($txt_reponse != ""){ $aff_bt_repondre = "display:none;"; }
                                echo "<h2>$txt</h2>";
                                echo "<p id=\"reponse_q_$id\">$txt_reponse</p>";
                                // echo "<div class=\"row\">";
                                echo "  <button class=\"bt1\"  style=\"$aff_bt_repondre\">Répondre</button>";
                                // echo "</div>";
                            }

                            echo "</div>";

                        }

                    ?>

                </div>


            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/menus.js"></script>
    <script src="../js/MATHJAX_CONFIG.js"></script>
    <script src="../js/tex-mml-chtml.js"></script>
</html>
