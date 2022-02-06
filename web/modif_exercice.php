<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

if(!$est_connecte){
    header("Location: ../web/index.php");
}

if(!test_token($_POST)){
    header("Location: index.php");
}

$id = null;

if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && $_POST["type"] == "request"){
    $id = $_POST["id_exercice"];
}

if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && $_POST["type"] == "supprime_exercice"){
    $id = $_POST["id_exercice"];
    $req = "DELETE FROM questions_exercices WHERE id_exercice=:id_e;";
    action_prep($db, $req, [":id_e"=>$id]);
    $req = "DELETE FROM exercices WHERE id=:id_e;";
    action_prep($db, $req, [":id_e"=>$id]);
    sleep(0.01);
    header("Location: ../web/exercices.php");
    die();
}

if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && isset($_POST["titre"]) == "save_titre"){
    $titre = $_POST["titre"];
    $id = $_POST["id_exercice"];
    $req = "UPDATE exercices SET titre=:titre WHERE id=:id AND id_compte=:id_compte;";
    action_prep($db, $req, [":titre"=>$titre, ":id"=>$id, ":id_compte"=>$_SESSION["id_compte"]]);
}

if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && isset($_POST["est_public"]) == "save_est_public"){
    $est_public = $_POST["est_public"];
    $id = $_POST["id_exercice"];
    $req = "UPDATE exercices SET est_public=:est_public WHERE id=:id AND id_compte=:id_compte;";
    action_prep($db, $req, [":est_public"=>$est_public, ":id"=>$id, ":id_compte"=>$_SESSION["id_compte"]]);
}

if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && isset($_POST["texte"]) && isset($_POST["_type"]) && $_POST["type"]=="add_element"){
    $id = $_POST["id_exercice"];
    $texte = $_POST["texte"];
    $_type = $_POST["_type"];
    $req = "INSERT INTO questions_exercices (id_exercice, _type, texte) VALUES (:id_e, :_type, :texte);";
    action_prep($db, $req, [":id_e"=>$id, ":_type"=>$_type, ":texte"=>$texte]);
}

if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && isset($_POST["id_question"]) && isset($_POST["texte"]) && $_POST["type"]=="save_element"){
    $id = $_POST["id_exercice"];
    $texte = $_POST["texte"];
    $id_question = $_POST["id_question"];
    $req = "UPDATE questions_exercices SET texte=:texte WHERE id_exercice=:id_e AND id=:id_q;";
    action_prep($db, $req, [":id_e"=>$id, ":texte"=>$texte, ":id_q"=>$id_question]);
}

if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && isset($_POST["id_question"]) && $_POST["type"]=="delete_element"){
    $id = $_POST["id_exercice"];
    $id_q = $_POST["id_question"];
    $req = "DELETE FROM questions_exercices WHERE id=:id_q AND id_exercice=:id_e;";
    action_prep($db, $req, [":id_q"=>$id_q, ":id_e"=>$id]);
}

if($id == null){
    header("Location: ../web/index.php");
}

$req = "SELECT titre, est_public FROM exercices WHERE id=:id AND id_compte=:id_compte;";
$data = requete_prep($db, $req, [":id"=>$id, ":id_compte"=>$_SESSION["id_compte"]]);

if(count($data) != 1){
    header("Location: ../web/index.php");
}

$est_auteur = true;

$titre = $data[0]["titre"];
$est_public = $data[0]["est_public"];

$req = "SELECT groupe.nom FROM groupes
                          INNER JOIN groupes_comptes ON groupes_comptes.id_groupe = cours_groupes.id_groupe
        WHERE groupes_comptes.id_compte = :id_compte OR groupes.est_public;";
$groupes = requete_prep($db, $req);

$req = "SELECT id_groupe FROM groupes_comptes WHERE id_compte=:id_c;";
$mes_groupes = requete_prep($db, $req, [":id_c"=>$_SESSION["id_compte"]]);

$req = "SELECT titre FROM chapitres WHERE id_compte=:id_c";
$mes_chapitres = requete_prep($db, $req, [":id_c"=>$_SESSION["id_compte"]]);

$req = "SELECT chapitres.titre FROM chapitres
                               INNER JOIN cours_chapitres ON chapitres.id = cours_chapitres.id_chapitre
                               INNER JOIN cours_groupes ON cours_groupes.id_cours = cours_chapitres.id_cours
                               INNER JOIN groupes_comptes ON groupes_comptes.id_groupe = cours_groupes.id_groupe
        WHERE groupes_comptes.id_compte = :id_compte;";
$chapitres = requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"]]);

$req = "SELECT id, _type, texte FROM questions_exercices WHERE id_exercice=:id_e;";
$contenu = requete_prep($db, $req, [":id_e"=>$id]);


$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante

$_SESSION["last_page"] = "modif_exercice.php";
script("window.id_exercice = $id;");
?>

<!DOCTYPE HTML>
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
                        <button id="bt_save_titre" class="bt1" style="margin:2vh; display:none;" onclick="save_titre();">Sauvegarder</button>
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
                                $type = $c["_type"];
                                $balise_texte = "h2";
                                if($type == "texte"){
                                    $balise_texte = "p";
                                }
                                echo "<div class='row' style='flex-wrap:wrap;'>";
                                echo "<$balise_texte id='texte_contenu_$id'>$texte</$balise_texte>";
                                echo "<textarea id='input_contenu_$id' style='display:none;'>$texte</textarea>";
                                echo "<div style='margin-left:2vh; margin-top:auto; margin-bottom:auto;'><button id='bt_modif_contenu_$id' class='bt1' onclick='modif_contenu($id);'>Modifier</button></div>";
                                echo "<div style='margin-left:2vh; margin-top:auto; margin-bottom:auto;'><button id='bt_supprime_contenu_$id' class='bt3' onclick='supprime_contenu($id);'>Supprimer</button></div>";
                                echo "<div style='margin-left:2vh; margin-top:auto; margin-bottom:auto;'><button id='bt_save_contenu_$id' class='bt1' style='display:none;' onclick='sauvegarde_contenu($id);'>Sauvegarder</button></div>";
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
                        <button class="bt1" style="margin:1vh;" onclick="send_nouveau();">Ajouter</button>
                        <button class="bt1" onclick="annule_nouveau();" style="margin:1vh;">Annuler</button>
                    </div>
                </div>

                <div style="margin-top:4vh;">
                    <input style="margin-left:2vh; margin-bottom:2vh; " type="checkbox" id="input_est_public" onclick="save_est_public();" <?php if($est_public){ echo "checked"; } ?>/>
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
                    <button class="bt3" style="margin:2vh;" onclick="supprime_exercice();">Supprimer l'exercice</button>
                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php"; ?>
        <?php include "../include/form.php"; ?>

    </body>
    <script src="../js/modif_exercice.js"></script>
    <script src="../js/menus.js"></script>
    <script src="../js/MATHJAX_CONFIG.js"></script>
    <script src="../js/tex-mml-chtml.js"></script>
</html>
