<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

if(!$est_connecte){
    header("Location: ../web/index.php");
}

$questions = [];
$toutes_questions = true;
$nb_questions = 20;

if(isset($_POST["type"]) && isset($_POST["chapfiches"]) && isset($_POST["toutes_questions"]) && isset($_POST["nb_questions"]) && $_POST["type"] == "request" && test_token($_POST)){
    $toutes_questions = $_POST["toutes_questions"];
    $nb_questions = $_POST["nb_questions"];
    $chap_fiches = json_decode($_POST["chapfiches"]);
    clog("POST : " . array_to_str($_POST));
    die();
    foreach($chap_fiches as $elt){
        if($elt["type"] == "chapitre"){
            $req = "SELECT element.id, titre, texte, _type FROM element INNER JOIN chapitres_elements ON chapitres_elements.id_element = element.id WHERE chapitres_elements.id_chapitre = :elt_id;";
        } else if($elt["type"] == "fiche"){
            $req = "SELECT element.id, titre, texte, _type FROM element INNER JOIN fiches_elements ON fiches_elements.id_element = element.id WHERE fiches_elements.id_fiche = :elt_id;";
        }
        $data = requete_prep($db, $req, [":elt_id"=>$elt["id"]]);
        foreach($data as $q){
            array_push($questions, 
            [
                "titre"=>$q["titre"],
                "texte"=>$q["texte"],
                "_type"=>$q["_type"]
            ]);
        }
    }
}


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

                    <h1 id="titre"></h1>

                    <div class="row" style="height:85%; margin-bottom:2vh;">
                        <div id="div_result">

                            <div id="result"></div>

                        </div>
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