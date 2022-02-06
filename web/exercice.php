<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$id = null;
$id_brouillon = null;
$titre = null;

if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && $_POST["type"] == "request"){
    $id = $_POST["id_exercice"];
}
if(isset($_POST["id_brouillon"])){
    $id_brouillon = $_POST["id_brouillon"];
}

if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && isset($_POST["id_brouillon"]) && $_POST["type"] == "delete_brouillon_exercice" && test_token($_POST)){
    $id = $_POST["id_exercice"];
    $id_brouillon = $_POST["id_brouillon"];
    $req = "DELETE FROM brouillon_exercice WHERE id_compte=:id_c AND id_exercice=:id_e AND id=:id_brouillon;";
    action_prep($db, $req, [":id_c"=>$_SESSION["id_compte"], ":id_e"=>$id, ":id_brouillon"=>$id_brouillon]);
    header("Location: ../web/brouillons.php");
    die();
}

if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && $_POST["type"] == "new_brouillon" && test_token($_POST)){
    $id = $_POST["id_exercice"];
    $req = "SELECT id FROM brouillon_exercice WHERE id_compte=:id_c AND id_exercice=:id_e;";
    $data = requete_prep($db, $req, [":id_c"=>$_SESSION["id_compte"], ":id_e"=>$id]);
    $num = count($data) + 1;
    $req = "SELECT titre FROM exercices WHERE id=:id;";
    $data = requete_prep($db, $req, [":id"=>$id]);
    if(count($data)==1){
        $titre = $data[0]["titre"] . ", brouillon n°$num";
        $req = "INSERT INTO brouillon_exercice (id_exercice, id_compte, titre, last_modif) VALUES (:id_e, :id_c, :titre, NOW());";
        action_prep($db, $req, [":id_e"=>$id, ":id_c"=>$_SESSION["id_compte"], ":titre"=>$titre]);
        $id_brouillon = $db->lastInsertId();
    }
    else{
        header("Location: ../web/index.php");
    }
}


if(isset($_POST["type"]) && isset($_POST["id_exercice"]) && isset($_POST["id_brouillon"]) && isset($_POST["id_question"]) && isset($_POST["texte"]) && $_POST["type"] == "save_question" && test_token($_POST)){
    $id = $_POST["id_exercice"];
    $idq = $_POST["id_question"];
    $id_brouillon = $_POST["id_brouillon"];
    $texte = $_POST["texte"];
    // TODO SECURITY UPDATE VERIFY BON COMPTE AUSSI
    $req = "SELECT id FROM reponses_questions_exercices WHERE id_question=:id_question AND id_brouillon_exercice=:id_b";
    $data = requete_prep($db, $req, [":id_question"=>$idq, ":id_b"=>$id_brouillon]);
    if(count($data)==0){
        $req = "INSERT INTO reponses_questions_exercices (texte, id_question, id_brouillon_exercice, id_exercice) VALUES (:txt, :id_question, :id_b, :id_exercice);";
        action_prep($db, $req, [":txt"=>$texte, ":id_question"=>$idq, ":id_b"=>$id_brouillon, ":id_exercice"=>$id]);
    }
    else{
        $req = "UPDATE reponses_questions_exercices SET texte=:txt WHERE id_question=:id_question AND id_brouillon_exercice=:id_b;";
        action_prep($db, $req, [":txt"=>$texte, ":id_question"=>$idq, ":id_b"=>$id_brouillon]);
    }
}

if($id==null){
    header("Location: ../web/index.php");
    die();
}

if($titre == null){
    $req = "SELECT titre FROM exercices WHERE id=:id;";
    $data = requete_prep($db, $req, [":id"=>$id]);//, ":id_compte"=>$_SESSION["id_compte"]]);       
    if(count($data) != 1){
        header("Location: ../web/index.php");
    }
    $titre = $data[0]["titre"];
}

$req = "SELECT id, _type, texte FROM questions_exercices WHERE id_exercice=:id_e;";
$contenu = requete_prep($db, $req, [":id_e"=>$id]);

$reponses = [];
if($id_brouillon != null){
    $req = "SELECT id_question, texte FROM reponses_questions_exercices WHERE id_exercice=:id_e AND id_brouillon_exercice=:id_b;";
    $data = requete_prep($db, $req, [":id_e"=>$id, ":id_b"=>$id_brouillon]);
    foreach($data as $el){
        $reponses[$el["id_question"]] = $el["texte"];
    }
}

$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante

$_SESSION["last_page"] = "exercice.php";

script("window.id_exercice = $id;");
if($id_brouillon != null){
    script("window.id_brouillon = $id_brouillon;");
}
?>

<!DOCTYPE html>
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

                <button class="bt1" style="display:block; margin-bottom:2vh;" onclick="window.location.href='<?php if(isset($_SESSION['last_page']) && false){ echo $_SESSION['last_page']; }else{ echo 'exercices.php'; } ?>';">Retour</button>

                <div style="margin-top: 2vh; margin-bottom:3vh;">
                    <button class="bt1" onclick="send_form('exercice.php', [['type','new_brouillon'], ['id_exercice', <?php echo $id; ?>]]);"><?php if($id_brouillon==null){ echo "Répondre à cet exercice"; }else{ echo "Créer un nouveau brouillon sur cet exercice"; }?></button>
                </div>

                <h1><?php echo $titre; ?></h1>

                <div class="col" style="margin-bottom:20vh;">

                    <?php 
                        foreach($contenu as $el){
                            $id_el = $el["id"];

                            echo "<div style='margin-top:5vh;'>";

                            if($el["_type"] == "texte"){
                                $txt = $el["texte"];
                                echo "<p>$txt</p>";
                            }
                            elseif($el["_type"] == "question"){
                                $txt = $el["texte"];
                                $aff_bt_repondre = "display: block;";
                                $aff_bt_modif = "display: none;";
                                echo "<h2>$txt</h2>";
                                if($id_brouillon != null){
                                    if(isset($reponses[$id_el])){
                                        $txt_reponse = $reponses[$id_el];
                                    }
                                    else{
                                        $txt_reponse = "";
                                    }
                                    if($txt_reponse != ""){ $aff_bt_repondre = "display:none;"; $aff_bt_modif = "display:block;"; }
                                    echo "<div class=\"row\">";
                                    echo "  <p id=\"reponse_q_$id_el\">$txt_reponse</p>";
                                    echo "  <textarea id=\"input_reponse_q_$id_el\" style=\"display:none; margin-left:2vh; margin-top:auto; margin-bottom:auto;\">$txt_reponse</textarea>";
                                    echo "  <div id=\"bt_repondre_q_$id_el\" style='margin-left:2vh; margin-top:auto; margin-bottom:auto; $aff_bt_repondre'> <button onclick='modif_reponse($id_el);' class=\"bt1\">Répondre</button> </div>";
                                    echo "  <div id=\"bt_modif_q_$id_el\" style='margin-left:2vh; margin-top:auto; margin-bottom:auto; $aff_bt_modif'> <button onclick='modif_reponse($id_el);' class=\"bt1\">Modifier</button> </div>";
                                    echo "  <div id=\"bt_save_q_$id_el\" style='display:none; margin-left:2vh; margin-top:auto; margin-bottom:auto; '> <button class=\"bt1\" onclick='save_reponse($id_el);'>Sauvegarder</button> </div>";
                                    echo "  <div id=\"bt_annule_q_$id_el\" style='display:none; margin-left:2vh; margin-top:auto; margin-bottom:auto; '> <button onclick='annule_reponse($id_el);' class=\"bt1\">Annuler</button> </div>";
                                    echo "</div>";
                                }
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
        <?php include "../include/form.php" ?>

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

function save_reponse(idq){
    var txt = document.getElementById("input_reponse_q_"+idq).value;
    send_form(
        "exercice.php",
        [["type", "save_question"],["id_exercice", window.id_exercice], ["id_question", idq], ["texte", txt], ["id_brouillon", window.id_brouillon]],
    );
}

    </script>
</html>
