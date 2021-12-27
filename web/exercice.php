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

            <div class="container col" style="margin:5vh;">

                <button class="bt1" style="display:block; margin-bottom:2vh;" onclick="window.location.href='exercices.php';">Retour</button>

                <h1><?php echo $titre; ?></h1>

                <div class="col" style="margin-bottom:20vh;">


                    <?php 

                        foreach($contenu as $el){

                            $id = $el["id"];

                            echo "<div style='margin-top:5vh;'>";

                            if($el["type"] == "texte"){
                                $txt = $el["texte"];
                                echo "<p>$txt</p>";
                            }
                            elseif($el["type"] == "question"){
                                $txt = $el["texte"];
                                $aff_bt_repondre = "display: block;";
                                $aff_bt_modif = "display: none;";
                                $txt_reponse = $reponses[$id];
                                if($txt_reponse != ""){ $aff_bt_repondre = "display:none;"; $aff_bt_modif = "display:block;"; }
                                echo "<h2>$txt</h2>";
                                echo "<div class=\"row\">";
                                echo "  <p id=\"reponse_q_$id\">$txt_reponse</p>";
                                echo "  <textarea id=\"input_reponse_q_$id\" style=\"display:none; margin-left:2vh; margin-top:auto; margin-bottom:auto;\">$txt_reponse</textarea>";
                                echo "  <div id=\"bt_repondre_q_$id\" style='margin-left:2vh; margin-top:auto; margin-bottom:auto; $aff_bt_repondre'> <button onclick='modif_reponse($id);' class=\"bt1\">Répondre</button> </div>";
                                echo "  <div id=\"bt_modif_q_$id\" style='margin-left:2vh; margin-top:auto; margin-bottom:auto; $aff_bt_modif'> <button onclick='modif_reponse($id);' class=\"bt1\">Modifier</button> </div>";
                                echo "  <div id=\"bt_save_q_$id\" style='display:none; margin-left:2vh; margin-top:auto; margin-bottom:auto; '> <button class=\"bt1\">Sauvegarder</button> </div>";
                                echo "  <div id=\"bt_annule_q_$id\" style='display:none; margin-left:2vh; margin-top:auto; margin-bottom:auto; '> <button onclick='annule_reponse($id);' class=\"bt1\">Annuler</button> </div>";
                                echo "</div>";
                            }
                            echo "</div>";

                        }

                    ?>

                    <div style="margin-top:10vh;">
                        <?php
                            
                            if(false){
                                echo `<button id="bt_aff_reponses" class="bt1" style="display:block; margin-bottom:2vh;" onclick="toggle_reponses();">Afficher les réponses</button>`;
                            }
                            else{
                                echo "<i>Cet exercice n'a pas de corrigé</i>";
                            }
                        
                        ?>
                    </div>

                </div>
                

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/menus.js"></script>
    <script src="../js/MATHJAX_CONFIG.js"></script>
    <script src="../js/tex-mml-chtml.js"></script>
    <script>

function modif_reponse(idq){
    var p = document.getElementById("reponse_q_"+idq);
    var input = document.getElementById("input_reponse_q_"+idq);
    // input.value = p.innerHTML;
    var bt_repondre = document.getElementById("bt_repondre_q_"+idq);
    var bt_modif = document.getElementById("bt_modif_q_"+idq);
    var bt_save = document.getElementById("bt_save_q_"+idq);
    var bt_annule = document.getElementById("bt_annule_q_"+idq);
    //
    p.style.display = "none";
    input.style.display = "block";
    bt_repondre.style.display = "none";
    bt_modif.style.display = "none";
    bt_save.style.display = "block";
    bt_annule.style.display = "block";
}

function annule_reponse(idq){
    var p = document.getElementById("reponse_q_"+idq);
    var input = document.getElementById("input_reponse_q_"+idq);
    // p.innerHTML = input.value;
    var bt_repondre = document.getElementById("bt_repondre_q_"+idq);
    var bt_modif = document.getElementById("bt_modif_q_"+idq);
    var bt_save = document.getElementById("bt_save_q_"+idq);
    var bt_annule = document.getElementById("bt_annule_q_"+idq);
    //
    p.style.display = "block";
    input.style.display = "none";
    if(input.value.length == 0){
        bt_repondre.style.display = "block";
        bt_modif.style.display = "none";
    }
    else{
        bt_repondre.style.display = "none";
        bt_modif.style.display = "block";
    }
    bt_save.style.display = "none";
    bt_annule.style.display = "none";
}


    </script>
</html>
