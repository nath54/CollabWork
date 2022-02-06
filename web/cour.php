<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$id = null;


if(isset($_POST["type"]) && isset($_POST["id_cour"]) && $_POST["type"]=="request" && test_token($_POST)){
    $id = $_POST["id_cour"];
}
else if(isset($_POST["type"]) && isset($_POST["id_cour"]) && isset($_POST["est_public"]) && $_POST["type"]=="save_est_public" && test_token($_POST)){
    $id = $_POST["id_cour"];
    $est_public = $_POST["est_public"];
    $req = "UPDATE cours SET est_public=:ep WHERE id=:id_c AND id_createur=:id_compte;";
    action_prep($db, $req, [":id_c"=>$id, ":id_compte"=>$_SESSION["id_compte"], ":ep"=>$est_public]);
}
else if(isset($_POST["type"]) && isset($_POST["id_cour"]) && isset($_POST["titre"]) && $_POST["type"]=="save_titre" && test_token($_POST)){
    $id = $_POST["id_cour"];
    $titre = $_POST["titre"];
    $req = "UPDATE cours SET titre=:titre WHERE id=:id_c AND id_createur=:id_compte;";
    action_prep($db, $req, [":id_c"=>$id, ":id_compte"=>$_SESSION["id_compte"], ":titre"=>$titre]);
}
else if(isset($_POST["type"]) && isset($_POST["id_cour"]) && isset($_POST["description"]) && $_POST["type"]=="save_description" && test_token($_POST)){
    $id = $_POST["id_cour"];
    $_description = $_POST["description"];
    $req = "UPDATE cours SET _description=:_description WHERE id=:id_c AND id_createur=:id_compte;";
    action_prep($db, $req, [":id_c"=>$id, ":id_compte"=>$_SESSION["id_compte"], ":_description"=>$_description]);
}
else if(isset($_POST["type"]) && isset($_POST["id_cour"]) && $_POST["type"]=="nouveau_chapitre" && test_token($_POST)){
    $id = $_POST["id_cour"];
    $req = "SELECT chapitres.id FROM chapitres INNER JOIN cours_chapitres ON cours_chapitres.id_chapitre = chapitres.id WHERE id_compte = :id_compte AND cours_chapitres.id_cour = :idc;";
    $nb_titre = count(requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"], ":idc"=>$id])) + 1;
    $titre = "Chapitre n°$nb_titre";
    $req = "INSERT INTO chapitres (titre, id_compte) VALUES (:titre, :id_compte);";
    action_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"], ":titre"=>$titre]);
    $id_chapitre = $db->lastInsertId();
    $req = "INSERT INTO cours_chapitres (id_cour, id_chapitre) VALUES (:id_cour, :id_chapitre);";
    action_prep($db, $req, [":id_cour"=>$id, ":id_chapitre"=>$id_chapitre]);
    $req = "INSERT INTO position_chapitres (id_cour, id_chapitre, position) VALUES (:id_cour, :id_chapitre, (SELECT COUNT(id_chapitre) FROM cours_chapitres WHERE id_cour=:id_cour)+1);";
    action_prep($db, $req, [":id_cour"=>$id, ":id_chapitre"=>$id_chapitre]);
}
else if(isset($_POST["type"]) && isset($_POST["id_cour"]) && isset($_POST["id_chapitre"]) && $_POST["type"]=="position_up" && test_token($_POST)){
    $id = $_POST["id_cour"];
    $id_chapitre = $_POST["id_chapitre"];
    // On récupère la position de l'élément actuel
    $req = "SELECT position FROM position_chapitres WHERE id_cour = :id_cour AND id_chapitre = :id_chapitre;";
    $data = requete_prep($db, $req, [":id_cour"=>$id, ":id_chapitre"=>$id_chapitre]);
    if(count($data) == 0){
        header("Location: index.php");
        die();
    }
    $position_chapitre = $data[0]["position"];
    // On récupère la liste des éléments qui sont avant
    $req = "SELECT id_chapitre, position FROM position_chapitres WHERE id_cour = :id_cour AND position < :pos ORDER BY position DESC;";
    $data2 = requete_prep($db, $req, [":id_cour"=>$id, ":pos"=>$position_chapitre]);
    // S'il existe on récupère la position du précédent et on l'échange avec celle du chapitre que l'on veut
    if(count($data2) >= 1){
        $id_chapitre2 = $data2[0]["id_chapitre"];
        $position_chapitre2 = $data2[1]["position"];
        alert("Position initiale : $position_chapitre, id_chapitre : $id_chapitre => Position finale : $position_chapitre2, chapitre à échanger : $id_chapitre2");
        // Echange
        $req = "UPDATE position_chapitres SET position=:pos WHERE id_cour=:id_cour AND id_chapitre=:id_chapitre;";
        action_prep($db, $req, [":pos"=>$position_chapitre, ":id_chapitre"=>$id_chapitre2, ":id_cour"=>$id]);
        action_prep($db, $req, [":pos"=>$position_chapitre2, ":id_chapitre"=>$id_chapitre, ":id_cour"=>$id]);
    }
}
else if(isset($_POST["type"]) && isset($_POST["id_cour"]) && isset($_POST["id_chapitre"]) && $_POST["type"]=="position_down" && test_token($_POST)){
    $id = $_POST["id_cour"];
    $id_chapitre = $_POST["id_chapitre"];
    // On récupère la position de l'élément actuel
    $req = "SELECT position FROM position_chapitres WHERE id_cour = :id_cour AND id_chapitre = :id_chapitre;";
    $data = requete_prep($db, $req, [":id_cour"=>$id, ":id_chapitre"=>$id_chapitre]);
    if(count($data) == 0){
        header("Location: index.php");
        die();
    }
    $position_chapitre = $data[0]["position"];
    // On récupère la liste des éléments qui sont après
    $req = "SELECT id_chapitre, position FROM position_chapitres WHERE id_cour = :id_cour AND position > :pos ORDER BY position;";
    $data2 = requete_prep($db, $req, [":id_cour"=>$id, ":pos"=>$position_chapitre]);
    // S'il existe on récupère la position du précédent et on l'échange avec celle du chapitre que l'on veut
    if(count($data2) >= 1){
        $id_chapitre2 = $data2[0]["id_chapitre"];
        $position_chapitre2 = $data2[1]["position"];
        alert("Position initiale : $position_chapitre, id_chapitre : $id_chapitre => Position finale : $position_chapitre2, chapitre à échanger : $id_chapitre2");
        // Echange
        $req = "UPDATE position_chapitres SET position=:pos WHERE id_cour=:id_cour AND id_chapitre=:id_chapitre;";
        action_prep($db, $req, [":pos"=>$position_chapitre, ":id_chapitre"=>$id_chapitre2, ":id_cour"=>$id]);
        action_prep($db, $req, [":pos"=>$position_chapitre2, ":id_chapitre"=>$id_chapitre, ":id_cour"=>$id]);
    }
}
else if(isset($_POST["type"]) && isset($_POST["id_cour"]) && $_POST["type"] == "delete_cour" && test_token($_POST)){
    $id = $_POST["id_cour"];
    // IL faudra regarder ceux qui ne sont pas déjà dans un chapitre !
    // $req = "DELETE c FROM chapitres c INNER JOIN cours_chapitres d ON chapitres.id = cours_chapitres.id_chapitre WHERE id_cours = :idc;";
    // action_prep($db, $req, [":idc"=>$id]);
    $req = "DELETE FROM cours_chapitres d WHERE id_cour = :idc;";
    action_prep($db, $req, [":idc"=>$id]);
    $req = "DELETE FROM cours WHERE id_createur=:id_c AND id=:id;";
    action_prep($db, $req, [":id_c"=>$_SESSION["id_compte"], ":id"=>$id]);
    header("Location: ../web/cours.php");
    die();
}


else if(isset($_SESSION["id_cour"])){
    clog("SESSION ; " . array_to_str($_SESSION));
    $id = $_SESSION["id_cour"];
}

if($id == null){
    header("Location: index.php");
    die();
}

$req = "SELECT titre, _description, id_createur, est_public FROM cours WHERE id=:id;";
$data = requete_prep($db, $req, [":id"=>$id]);

if(count($data) != 1){
    header("Location: index.php");
    die();
}

$est_auteur = $data[0]["id_createur"] == $_SESSION["id_compte"];
$titre = $data[0]["titre"];
$est_public = $data[0]["est_public"];
$description = $data[0]["_description"];

$groupes = [];
$mes_groupes = [];

$req = "SELECT chapitres.id, chapitres.titre FROM chapitres INNER JOIN cours_chapitres ON chapitres.id = cours_chapitres.id_chapitre INNER JOIN position_chapitres ON chapitres.id = position_chapitres.id_chapitre WHERE cours_chapitres.id_cour = :id_c ORDER BY position_chapitres.position;";
$chapitres = requete_prep($db, $req, [":id_c"=>$id]);

$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante
$_SESSION["id_cour"] = $id;

$_SESSION["last_page"] = "cour.php";
script("window.id_cour = $id;");
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
    <body onload="MathJax.typesetPromise();">
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="margin:3vh;">

                <div>
                    <button class="bt1" onclick="window.location.href='cours.php';">Retour</button>
                </div>

                <div style="flex-wrap:wrap;" class="row">
                    <h2 id="titre" style="margin-top:auto; margin-bottom:auto;"><?php echo $titre; ?></h2>
                    <div class="row" style="flex-wrap:wrap; <?php if(!$est_auteur){ echo 'display:none;'; } ?>">
                        <input id="input_titre" value="<?php echo $titre; ?>" style="display:none;"/>
                        <button id="bt_modif_titre" onclick="modif_titre();" class="bt1" style="margin:2vh;">Modifier</button>
                        <button id="bt_save_titre" onclick="save_titre();" class="bt1" style="margin:2vh; display:none;">Sauvegarder</button>
                        <button id="bt_annule_titre" onclick="annule_titre();" class="bt1" style="margin:2vh; display:none;">Annuler</button>
                    </div>
                </div>
                
                <div class="row" style="flex-wrap:wrap;">
                    <p id="description" style="display:block;"><?php echo $description; ?></p>
                    <div class="row" style="flex-wrap:wrap; <?php if(!$est_auteur){ echo 'display:none;'; } ?>">
                        <textarea id="input_description" style="width: 100%; display:none;"><?php echo $description; ?></textarea>
                        <button id="bt_modif_description" onclick="modif_description();" class="bt1" style="margin:2vh; display:block;">Modifier</button>
                        <button id="bt_save_description" onclick="save_description();" class="bt1" style="margin:2vh; display:none;">Sauvegarder</button>
                        <button id="bt_annule_description" onclick="annule_description();"class="bt1" style="margin:2vh; margin-left:0; display:none;">Annuler</button>
                    </div>
                </div>

                <h1>Chapitres :</h1>

                <div class="col">

                    <?php

                        if(count($chapitres)==0){
                            echo "<p>Il n'y a pas de chapitres dans ce cours</p>";
                        }
                        else{
                            foreach($chapitres as $c){
                                $id_chap = $c["id"];
                                $titre = $c["titre"];
                                echo "  <div id='$id' class='bt_item row'>
                                            <div class='col' style='width:100%; padding:5px; margin:auto;' onclick='send_form(\"chapitre.php\", [[\"type\", \"request\"], [\"id_chapitre\", $id_chap]]);' >
                                                <h2>$titre</h2>
                                            </div>
                                            <div style='margin-left:auto; margin-right: 1em;' class='col'>
                                                <img class='bt_svg_wm' style='margin-bottom:-3px; 0px; margin-top:auto;' src='../res/up_arrow.svg' onclick=\"send_form('../web/cour.php', [['type', 'position_up'], ['id_chapitre', $id_chap], ['id_cour', $id]]);\"  />
                                                <img class='bt_svg_wm' style='margin-top:-3px; margin-bottom:auto' src='../res/down_arrow.svg' onclick=\"send_form('../web/cour.php', [['type', 'position_down'], ['id_chapitre', $id_chap], ['id_cour', $id]]);\"  />
                                            </div>
                                        </div>";
                            }
                        }

                    ?>

                </div>

                <div <?php if(!$est_auteur){ echo 'style="display:none;">'; } ?>>
                    <button class="bt1" style="margin:2vh;" onclick="send_form('cour.php', [['type', 'nouveau_chapitre'], ['id_cour', window.id_cour]]);">+ Nouveau chapitre</button>
                </div>

                <div style="margin-top:2vh; <?php if(!$est_auteur){ echo "display:none;"; } ?>">
                    <input style="margin-left:2vh; margin-bottom:2vh; " type="checkbox" id="input_est_public" onclick="save_est_public();" <?php if($est_public){ echo "checked"; } ?>/>
                    <label>Public</label>
                </div>

                <div class="row" style="flex-wrap:wrap;<?php if(!$est_auteur){ echo 'display:none;'; } ?>">
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
                    <p <?php if(count($mes_groupes)!=0){ echo "style='display:none;'"; } ?>>Vous n'appartenez à aucun groupe</p>
                    <div class="row">
                        <button class="bt1" style="margin:2vh; margin-left:0; margin-top:0; <?php if(count($mes_groupes)==0){ echo "display:none;"; } ?>">Rajouter</button>
                        <button onclick="annule_ajout_groupe();" class="bt1" style="margin:2vh; margin-top:0; margin-left:0;">Annuler</button>
                    </div>
                </div>

                <div <?php if(!$est_auteur){ echo 'style="display:none;">'; } ?>>
                    <button class="bt3" style="margin:2vh;" onclick="send_form('cour.php', [['type', 'delete_cour'], ['id_cour', window.id_cour]]);">Supprimer le cour</button>
                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>
        <?php include "../include/form.php" ?>

        <script src="../js/cour.js"></script>
        <script src="../js/menus.js"></script>
        <script src="../js/MATHJAX_CONFIG.js"></script>
        <script src="../js/tex-mml-chtml.js"></script>
    </body>
</html>
