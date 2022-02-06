<?php

include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$id = null;

if(isset($_POST["type"]) && isset($_POST["id_chapitre"]) && $_POST["type"]=="request" && test_token($_POST)){
    $id = $_POST["id_chapitre"];
}
else if(isset($_POST["type"]) && isset($_POST["id_chapitre"]) && isset($_POST["titre"]) && $_POST["type"]=="save_titre" && test_token($_POST)){
    $id = $_POST["id_chapitre"];
    $titre = $_POST["titre"];
    $req = "UPDATE chapitres SET titre=:titre WHERE id=:id_c AND id_compte=:id_compte;";
    action_prep($db, $req, [":id_c"=>$id, ":id_compte"=>$_SESSION["id_compte"], ":titre"=>$titre]);
}
else if(isset($_POST["type"]) && isset($_POST["id_chapitre"]) && isset($_POST["description"]) && $_POST["type"]=="save_description" && test_token($_POST)){
    $id = $_POST["id_chapitre"];
    $_description = $_POST["description"];
    $req = "UPDATE chapitres SET _description=:_description WHERE id=:id_c AND id_compte=:id_compte;";
    action_prep($db, $req, [":id_c"=>$id, ":id_compte"=>$_SESSION["id_compte"], ":_description"=>$_description]);
}
else if(isset($_POST["type"]) && isset($_POST["id_chapitre"]) && $_POST["type"]=="nouveau_element" && test_token($_POST)){
    $id = $_POST["id_chapitre"];
    $req = "SELECT element.id FROM element INNER JOIN chapitres_elements ON chapitres_elements.id_element = element.id WHERE id_compte = :id_compte AND chapitres_elements.id_chapitre = :idc;";
    $nb_titre = count(requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"], ":idc"=>$id])) + 1;
    $titre = "Element n°$nb_titre";
    $req = "INSERT INTO element (titre, id_compte, _type) VALUES (:titre, :id_compte, 1);";
    action_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"], ":titre"=>$titre]);
    $id_elt = $db->lastInsertId();
    $req = "INSERT INTO chapitres_elements (id_chapitre, id_element) VALUES (:id_chapitre, :id_elt);";
    action_prep($db, $req, [":id_chapitre"=>$id, ":id_elt"=>$id_elt]);
    $req = "INSERT INTO position_elements (id_chapitre, id_element, position) VALUES (:id_chapitre, :id_elt, (SELECT COUNT(id_element) FROM chapitres_elements WHERE id_chapitre=:id_chapitre)+1);";
    action_prep($db, $req, [":id_chapitre"=>$id, ":id_elt"=>$id_elt]);
}
else if(isset($_POST["type"]) && isset($_POST["id_chapitre"]) && $_POST["type"]=="supprime_chapitre" && test_token($_POST)){
    $id = $_POST["id_chapitre"];
    $req = "DELETE t1 FROM element t1 INNER JOIN chapitres_elements t2 ON t2.id_element = t1.id WHERE t2.id_chapitre = :idc; ";
    action_prep($db, $req, [":idc"=>$id]);
    $req = "DELETE FROM chapitres_elements WHERE id_chapitre = :idc;";
    action_prep($db, $req, [":idc"=>$id]);
    $req = "DELETE FROM chapitres WHERE id_compte=:id_c AND id=:id;";
    action_prep($db, $req, [":id_c"=>$_SESSION["id_compte"], ":id"=>$id]);
    $req = "DELETE FROM chapitres WHERE id_compte=:id_c AND id=:id;";
    action_prep($db, $req, [":id_c"=>$_SESSION["id_compte"], ":id"=>$id]);
    header("Location: ../web/cour.php");
}
else if(isset($_SESSION["id_chapitre"])){
    $id = $_SESSION["id_chapitre"];
}


if($id == null){
    header("Location: index.php");
    die();
}

$req = "SELECT titre, _description, id_compte FROM chapitres WHERE id=:id;";
$data = requete_prep($db, $req, [":id"=>$id]);

if(count($data) != 1){
    clog("post : " . array_to_str($_POST));
    clog("session : " . array_to_str($_SESSION));
    clog("data : " . array_to_str($data));
    die();
    header("Location: index.php");
    die();
}

$titre = $data[0]["titre"];
$description = $data[0]["_description"];
$est_auteur = $data[0]["id_compte"] == $_SESSION["id_compte"];

$req = "SELECT * FROM element INNER JOIN chapitres_elements ON element.id = chapitres_elements.id_element INNER JOIN position_elements ON element.id = position_elements.id_element WHERE chapitres_elements.id_chapitre = :id ORDER BY position_elements.position;";
$elements = requete_prep($db, $req, [":id"=>$id]);

$req = "SELECT * FROM `types elements`";
$tmp = requete_prep($db, $req);
$tp_elts = [];
foreach($tmp as $t){
    $tp_elts[$t["id"]] = $t;
}

$quiz_mot = "Ajouter";

$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante

script("window.id_chapitre = $id;");
$_SESSION["id_chapitre"] = $id;
$_SESSION["last_page"] = "chapitre.php";
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Chapitre</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body onload="init();">
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="margin:3vh;">

                <button class="bt1" style="margin:2vh;" onclick="window.location.href='cour.php'">Retour</button>

                <div class="row">
                    <p style="margin-top: auto; margin-bottom: auto;">Style : </p>
                    <button id="bt_view_list" class="bt4_fill" style="margin: 1em;" onclick="change_view_list();">Liste</button>
                    <button id="bt_view_rendu" class="bt4" style="margin: 1em; margin-left:0;" onclick="change_view_rendu();">Rendu</button>
                </div>

                <div class="row">
                    <h2 id="titre" style="margin-top:auto; margin-bottom:auto;"><?php echo $titre; ?></h2>
                    <div class="row" <?php if(!$est_auteur){ echo 'style="display:none;">'; } ?>>
                        <input id="input_titre" value="<?php echo $titre; ?>" style="display:none;"/>
                        <button id="bt_modif_titre" onclick="modif_titre();" class="bt1" style="margin:2vh;">Modifier</button>
                        <button id="bt_save_titre" class="bt1" onclick="save_titre();" style="margin:2vh; display:none;">Sauvegarder</button>
                        <button id="bt_annule_titre" onclick="annule_titre();" class="bt1" style="margin:2vh; display:none;">Annuler</button>
                    </div>
                </div>
                
                <div class="row">
                    <p id="description" style="display:block;"><?php echo $description; ?></p>
                    <div class="row" <?php if(!$est_auteur){ echo 'style="display:none;">'; } ?>>
                        <textarea id="input_description" style="width: 100%; display:none;"><?php echo $description; ?></textarea>
                        <button id="bt_modif_description" onclick="modif_description();" class="bt1" style="margin:2vh; display:block;">Modifier</button>
                        <button id="bt_save_description" onclick="save_description();" class="bt1" style="margin:2vh; display:none;">Sauvegarder</button>
                        <button id="bt_annule_description" onclick="annule_description();"class="bt1" style="margin:2vh; margin-left:0; display:none;">Annuler</button>
                    </div>
                </div>

                <div>
                    <button class="bt1" style="margin: 1vh;" >Lancer un quiz sur ce chapitre</button>
                </div>

                <div>
                    <button class="bt1" style="margin: 1vh;" ><?php echo $quiz_mot; ?> le quiz à la liste des chapitres pour quiz</button>
                </div>

                <h1>Élements :</h1>

                <div class="col">

                    <?php

                        if(count($elements)==0){
                            echo "<p>Il n'y a pas de chapitres dans ce cours</p>";
                        }
                        else{
                            foreach($elements as $el){
                                $ide = $el["id"];
                                $titre = $el["titre"];
                                $type = $tp_elts[$el["_type"]]["nom"];
                                $displaynone = "";
                                if(!$est_auteur){ $displaynone = 'style="display:none;">'; }
                                echo "  <div id='$ide' class='bt_item row' >
                                            <div class='col' style='width:100%; padding:5px; margin:auto; ' onclick='send_form(\"../web/element.php\", [[\"type\", \"request\"], [\"id_element\", $ide]])'>
                                                <h2>$titre</h2>
                                            </div>
                                            <div style='margin:2vh; margin-left:auto;'>
                                                <img class='bt_svg' src='../res/pencil.svg' onclick=\"send_form('../web/edit_element.php', [['type', 'request'], ['id_element', $ide]]);\"  />
                                            </div>
                                            <div style='margin:2vh; margin-left:auto;'>
                                                <img class='bt_svg' src='../res/trash.svg' onclick=\"send_form('../web/edit_element.php', [['type', 'delete'], ['id_element', $ide]]);\"  />
                                            </div>
                                        </div>";
                                        # echo "<div id='$id' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$titre</h2><i style='font-size:0.9em;'>$type</i></div> <div class='row' $displaynone><img class='bt_svg' src='../res/pencil.svg' /> <img class='bt_svg' src='../res/trash.svg' /></div></div>";
                            }
                        }

                    ?>

                </div>

                <div <?php if(!$est_auteur){ echo 'style="display:none;">'; } ?>>
                    <button class="bt1" style="margin:2vh;" onclick="send_form('chapitre.php', [['type', 'nouveau_element'], ['id_chapitre', window.id_chapitre]]);">+ Nouvel élément</button>
                </div>

                <div <?php if(!$est_auteur){ echo 'style="display:none;">'; } ?>>
                    <button class="bt3" style="margin:2vh; margin-top:0;" onclick="send_form('chapitre.php', [['type', 'supprime_chapitre'], ['id_chapitre', window.id_chapitre]]);">Supprimer le chapitre</button>
                </div>

            </div>

        </div>

        <?php include "../include/form.php" ?>
        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/chapitre.js"></script>
    <script src="../js/menus.js"></script>
    <script src="../js/MATHJAX_CONFIG.js"></script>
    <script src="../js/tex-mml-chtml.js"></script>
    <script>

function init(){
    MathJax.typesetPromise();
}

    </script>
</html>
