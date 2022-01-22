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
    // $req = "SELECT chapitres.id FROM chapitres INNER JOIN cours_chapitres ON cours_chapitres.id_chapitre = chapitres.id WHERE id_compte = :id_compte AND cours_chapitres.id_cour = :idc;";
    // $nb_titre = count(requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"], ":idc"=>$id])) + 1;
    // $titre = "Chapitre n°$nb_titre";
    // $req = "INSERT INTO chapitres (titre, id_compte) VALUES (:titre, :id_compte);";
    // action_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"], ":titre"=>$titre]);
    // $id_chapitre = $db->lastInsertId();
    // $req = "INSERT INTO cours_chapitres (id_chapitre, id_chapitre) VALUES (:id_chapitre, :id_chapitre);";
    // action_prep($db, $req, [":id_cour"=>$id, ":id_chapitre"=>$id_chapitre]);
}


if($id == null){
    header("Location: index.php");
    die();
}

$req = "SELECT titre, _description, id_compte FROM chapitres WHERE id=:id;";
$data = requete_prep($db, $req, [":id"=>$id]);

if(count($data) != 1){
    header("Location: index.php");
    die();
}


$titre = $data[0]["titre"];
$description = $data[0]["_description"];
$est_auteur = $data[0]["id_compte"] == $_SESSION["id_compte"];

$elements = [
];

$quiz_mot = "Ajouter";


$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante

script("window.id_chapitre = $id;");
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
    <body onload="init();">
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="margin:3vh;">

                <button class="bt1" style="margin:2vh;" onclick="window.location.href='cour.php'">Retour</button>

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
                                $id = $el["id"];
                                $titre = $el["titre"];
                                $type = $el["type"];
                                $displaynone = "";
                                if(!$est_auteur){ $displaynone = 'style="display:none;">'; } 
                                echo "<div id='$id' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$titre</h2><i style='font-size:0.9em;'>$Type</i></div> <div class='row' $displaynone><img class='bt_svg' src='../res/pencil.svg' /> <img class='bt_svg' src='../res/trash.svg' /></div></div>";
                            }
                        }

                    ?>

                </div>

                <div <?php if(!$est_auteur){ echo 'style="display:none;">'; } ?>>
                    <button class="bt1" style="margin:2vh;">+ Nouvel élément</button>
                </div>

                <div <?php if(!$est_auteur){ echo 'style="display:none;">'; } ?>>
                    <button class="bt3" style="margin:2vh; margin-top:0;">Supprimer le chapitre</button>
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
