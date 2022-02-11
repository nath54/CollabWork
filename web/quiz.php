<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

if(!$est_connecte){
    header("Location: ../web/index.php");
}

$questions= []);


if(count($questions) == 0){
    header("Location: ../web/quizs.php");
}

$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante

$_SESSION["last_page"] = "quiz.php";

?>
<!DOCTYPE html>
<html lang="fr">


    <script src="../js/MATHJAX_CONFIG.js"></script>
    <script src="../js/tex-mml-chtml.js"></script>
    <script src="../js/showdown.min.js"></script>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <title>CollabWork - Quiz</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" rel="stylesheet" />
    </head>
    <body onload="compile();">
        <div class="col" style="position: absolute; top:0; bottom:0; right:0; left:0;">
            <!-- Header -->
            <div class="row">

                <button onclick="retour();" id="retour_bt">Retour</button>

            </div>
            <!-- Conteneur -->
            <div class="container" style="height:85%; margin:6vh;">

                <div class="col" style="height:90%;">

                    <div class="row">
                        <button id="bt_edit" onclick="edit();" class="bt_tab_active">Editer</button>
                        <button id="bt_view" onclick="view();" class="bt_tab">Voir</button>
                    </div>
                    <div class="row" style="height:85%; margin-bottom:2vh;">
                        <div id="div_textarea" style="max-width:100%; height:100%;">
                            <textarea id="texte" style="width:100%; height:100%; border: 1px solid grey;" placeholder="Ecrire son texte ici" onkeyup="key_compile();"><?php echo  str_replace("<br />", "\n",html_entity_decode( $texte)); ?></textarea>
                        </div>
                        <div id="div_result">

                            <div id="result"></div>

                        </div>
                    </div>
                    <div style="margin:3px; display: block;" id="div_checkbox">
                        <button onclick="compile();" class="bt1" >Compile</button>
                        <input type="checkbox" class="visible_only_on_large_screen" value=false id="checkbox_live_compil" />
                        <label class="visible_only_on_large_screen">Compiler à chaque changements</label>
                    </div>

                </div>

            </div>

        </div>

        <?php include "../include/form.php"; ?>

    </body>

    <script src="../js/brouillon.js"></script>
</html>


<!-- 



        <div style="border: 1px solid black; width:max; height: max;">
            <textarea id="texte" placeholder="Ecrire son texte ici" onchange="compile();" onkeypress="compile();" onkeyup="compile();" ></textarea>    
        </div>

        <div style="border: 1px solid black; width: max; height: max;">
            <div id="result">

            </div>
        </div>

        <button onclick="compile();">Compile</button>

 -->