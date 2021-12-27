<?php

$est_connecte = true;
$est_auteur = true;

$titre = "Titre du cour";

$est_prive = true;
$groupes = ["MP2I LLG", "Poink"];
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
                                echo "<$balise_texte>$texte</$balise_texte>";

                            }
                        }

                    ?>

                </div>

                <div <?php if(!$est_auteur){ echo 'style="display:none;">'; } ?>>
                    <button class="bt1" style="margin:2vh;" >+ Nouvelle question</button>
                </div>

                <div style="margin-top:2vh;">
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
                    <p>Vous n'appartenez à aucun groupe</p>
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
</html>
