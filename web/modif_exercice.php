<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$est_auteur = true;

$titre = "Titre de l'exercice";

$est_prive = true;
$groupes = ["MP2I LLG"];
$mes_groupes = ["MP2I LLG", "Poink"];

$mes_chapitres = [];
$chapitres = [];
$titres_chapitres = [];

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


$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante


$_SESSION["last_page"] = "modif_exercice.php";
?>

<!doctype HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Modification d'exercice</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body onload="MathJax.typesetPromise();">
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="margin:3vh;">

                <div>
                    <button class="bt1" onclick="window.location.href='exercices.php';">Retour</button>
                </div>

                <div style="flex-wrap:wrap;" class="row">
                    <h1 id="titre" style="margin-top:auto; margin-bottom:auto;"><?php echo $titre; ?></h1>
                    <div class="row" style="flex-wrap:wrap; <?php if(!$est_auteur){ echo 'display:none;'; } ?>">
                        <input id="input_titre" value="<?php echo $titre; ?>" style="display:none;"/>
                        <button id="bt_modif_titre" onclick="modif_titre();" class="bt1" style="margin:2vh;">Modifier</button>
                        <button id="bt_save_titre" class="bt1" style="margin:2vh; display:none;">Sauvegarder</button>
                        <button id="bt_annule_titre" onclick="annule_titre();" class="bt1" style="margin:2vh; display:none;">Annuler</button>
                    </div>
                </div>

                

                <div class="col">

                    <?php

                        if(count($contenu)==0){
                            // echo "<p>Il n'y a pas de chapitres dans ce cours</p>";
                        }
                        else{
                            foreach($contenu as $c){
                                $id = $c["id"];
                                $texte = $c["texte"];
                                $type = $c["type"];
                                $balise_texte = "h2";
                                if($type == "texte"){
                                    $balise_texte = "p";
                                }
                                echo "<div class='row' style='flex-wrap:wrap;'>";
                                echo "<$balise_texte id='texte_contenu_$id'>$texte</$balise_texte>";
                                echo "<textarea id='input_contenu_$id' style='display:none;'>$texte</textarea>";
                                echo "<div style='margin-left:2vh; margin-top:auto; margin-bottom:auto;'><button id='bt_modif_contenu_$id' class='bt1' onclick='modif_contenu($id);'>Modifier</button></div>";
                                echo "<div style='margin-left:2vh; margin-top:auto; margin-bottom:auto;'><button id='bt_supprime_contenu_$id' class='bt3' onclick='supprime_contenu($id);'>Supprimer</button></div>";
                                echo "<div style='margin-left:2vh; margin-top:auto; margin-bottom:auto;'><button id='bt_save_contenu_$id' class='bt1' style='display:none;'>Sauvegarder</button></div>";
                                echo "<div style='margin-left:2vh; margin-top:auto; margin-bottom:auto;'><button id='bt_annule_contenu_$id' class='bt1' style='display:none;' onclick='annule_modif_contenu($id);'>Annuler</button></div>";
                                echo "</div>";
                            }
                        }

                    ?>

                </div>

                <div class="row">
                    <button class="bt1" style="margin:2vh;" onclick="nouvelle_question();" >+ Nouvelle question</button>
                    <button class="bt1" style="margin:2vh;" onclick="nouveau_texte();" >+ Nouveau texte</button>
                </div>

                <div id="div_nouveau" style="display:none; margin-left:6vh;">
                    <h2 id="titre_nouveau"></h2>
                    <textarea id="input_nouveau" placeholder=""></textarea>
                    <div class="row">
                        <button class="bt1" style="margin:1vh;">Ajouter</button>
                        <button class="bt1" onclick="annule_nouveau();" style="margin:1vh;">Annuler</button>
                    </div>
                </div>

                <div style="margin-top:4vh;">
                    <input style="margin-left:2vh; margin-bottom:2vh; " type="checkbox" id="input_est_prive" />
                    <label>Public</label>
                </div>
                

                <!-- GROUPES QUI Y ONT ACCÈS -->
                <div class="row" style="flex-wrap:wrap;">
                    <h2 style="margin-top:auto; margin-bottom:auto; margin-left:2vh;" >Groupes qui y ont accès : </h2>
                    <?php
                        if(count($groupes)==0){
                            echo "<p style='margin:1vh; margin-top:auto; margin-bottom:auto;'>Aucuns</p>";
                        }
                        else{
                            foreach($groupes as $grp){
                                echo "<div class='row' style='margin:1vh; padding:0.5vh; background-color:rgb(16, 106, 158);'><p style='margin:auto;'>$grp</p> <button class='bt2'>-</button></div>";
                            }
                        }
                    ?>
                    <button onclick="ajout_groupe();" class="bt1" style="margin:1vh;">+</button>
                </div>
                
                <div id="div_ajout_groupe" style="margin: 2vh; margin-left:6vh; display:none;">
                    <h3>Rajouter l'accès à un groupe</h3>
                    <select  style="margin:2vh; margin-top:0; <?php if(count($mes_groupes)==0){ echo "display:none;"; } ?>">
                        <?php
                            foreach($mes_groupes as $grp){
                                echo "<option>$grp</option>";
                            }
                        ?>
                    </select>
                    <p style="<?php if(count($mes_groupes)!=0){echo 'display:none';} ?>">Vous n'appartenez à aucun groupe</p>
                    <div class="row">
                        <button class="bt1" style="margin:2vh; margin-left:0; margin-top:0; <?php if(count($mes_groupes)==0){ echo "display:none;"; } ?>">Rajouter</button>
                        <button onclick="annule_ajout_groupe();" class="bt1" style="margin:2vh; margin-top:0; margin-left:0;">Annuler</button>
                    </div>
                </div>

                <!-- COURS EN LIEN AVEC L'EXERCICE -->
                <div class="row" style="flex-wrap:wrap;">
                    <h2 style="margin-top:auto; margin-bottom:auto; margin-left:2vh;" >Chapitres en lien avec l'exercice : </h2>
                    <?php
                        if(count($chapitres)==0){
                            echo "<p style='margin:1vh; margin-top:auto; margin-bottom:auto;'>Aucuns</p>";
                        }
                        else{
                            foreach($chapitre as $ch){
                                $titre_chapitre = $titres_chapitre[$ch];
                                echo "<div class='row' style='margin:1vh; padding:0.5vh; background-color:rgb(16, 106, 158);'><p style='margin:auto;'>$titre_chapitre</p> <button class='bt2'>-</button></div>";
                            }
                        }
                    ?>
                    <button onclick="ajout_chapitre();" class="bt1" style="margin:1vh;">+</button>
                </div>
                
                <div id="div_ajout_chapitre" style="margin: 2vh; margin-left:6vh; display:none;">
                    <h3>Rajouter un chapitre</h3>
                    <select  style="margin:2vh; margin-top:0; <?php if(count($chapitres)==0){ echo "display:none;"; } ?>">
                        <?php
                            foreach($chapitres as $ch){
                                $titre_chapitre = $titres_chapitres[$ch];
                                echo "<option>$titre_chapitre</option>";
                            }
                        ?>
                    </select>
                    <p>Vous n'avez accès à aucuns chapitres !</p>
                    <div class="row">
                        <button class="bt1" style="margin:2vh; margin-left:0; margin-top:0; <?php if(count($chapitres)==0){ echo "display:none;"; } ?>">Rajouter</button>
                        <button onclick="annule_ajout_chapitre();" class="bt1" style="margin:2vh; margin-top:0; margin-left:0;">Annuler</button>
                    </div>
                </div>

                <div>
                    <button class="bt3" style="margin:2vh;">Supprimer l'exercice</button>
                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/modif_exercice.js"></script>
    <script src="../js/menus.js"></script>
    <script src="../js/MATHJAX_CONFIG.js"></script>
    <script src="../js/tex-mml-chtml.js"></script>
</html>
