<?php

include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$id = null;

if(isset($_POST["type"]) && isset($_POST["id_chapitre"]) && $_POST["type"]=="request" && test_token($_POST)){
    $id = $_POST["id_chapitre"];
}

if(isset($_POST["type"]) && isset($_POST["id_chapitre"]) && isset($_POST["titre"]) && $_POST["type"]=="save_titre" && test_token($_POST)){
    $id = $_POST["id_chapitre"];
    $titre = $_POST["titre"];
    $req = "UPDATE chapitres SET titre=:titre WHERE id=:id_c AND id_compte=:id_compte;";
    action_prep($db, $req, [":id_c"=>$id, ":id_compte"=>$_SESSION["id_compte"], ":titre"=>$titre]);
}


if(isset($_POST["type"]) && isset($_POST["id_chapitre"]) && isset($_POST["description"]) && $_POST["type"]=="save_description" && test_token($_POST)){
    $id = $_POST["id_chapitre"];
    $_description = $_POST["description"];
    $req = "UPDATE chapitres SET _description=:_description WHERE id=:id_c AND id_compte=:id_compte;";
    action_prep($db, $req, [":id_c"=>$id, ":id_compte"=>$_SESSION["id_compte"], ":_description"=>$_description]);
}


if(isset($_POST["type"]) && isset($_POST["id_chapitre"]) && $_POST["type"]=="nouveau_element" && test_token($_POST)){
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



if(isset($_POST["type"]) && isset($_POST["id_chapitre"]) && $_POST["type"]=="supprime_chapitre" && test_token($_POST)){
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

if(isset($_SESSION["id_chapitre"])){
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

<!doctype HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Chapitre</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body onload="compile();">
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="margin:3vh;">

                <button class="bt1" style="margin:2vh;" onclick="window.location.href='cour.php'">Retour</button>

                <div class="row">
                    <button id="bt_view_list" class="bt4" style="margin: 1em;" onclick="change_view_list();">Liste</button>
                    <button id="bt_view_rendu" class="bt4_fill" style="margin: 1em;" onclick="change_view_rendu();">Rendu</button>
                </div>

                <div class="row">
                    <h2 id="titre" style="margin-top:auto; margin-bottom:auto;"><?php echo $titre; ?></h2>
                </div>
                
                <div class="row">
                    <p id="description" style="display:block;"><?php echo $description; ?></p>
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
                                $titre = urldecode($el["titre"]);
                                $texte = urldecode($el["texte"]);
                                $nom_type = $tp_elts[$el["_type"]]["nom"];
                                $forme = $tp_elts[$el["_type"]]["forme"];
                                $couleur =  $tp_elts[$el["_type"]]["couleur"];
                                $displaynone = "";
                                echo "  <div style=\"margin: 1em; padding:1em; padding-top: 0.1em; border:$forme $couleur;\">
                                            <div>
                                                <p style=\"text-align: right; color:$couleur\">$nom_type</p>
                                            </div>
                                            <div>
                                                <h1>$titre</h1>
                                            </div>
                                            <hr />
                                            <div>
                                                <p class=\"comp\">$texte</p>
                                            </div>
                                        </div>";
                            }
                        }

                    ?>

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

var converter = new showdown.Converter();

function update_md() {
    for(div of document.getElementsByClassName("comp") ){    
        div.innerHTML = converter.makeHtml(div.innerHTML);
    }
}

function compile() {
    // Compilation latex
    MathJax.typesetPromise();

    // Compilation markdown
    setTimeout(update_md(), 1000);
}

    </script>
</html>
