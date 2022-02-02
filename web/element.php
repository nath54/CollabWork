<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$id = null;


if(isset($_POST["type"]) && $_POST["type"]=="request" && isset($_POST["id_element"]) && test_token($_POST)){
    $id = $_POST["id_element"];
}


else if(isset($_SESSION["request"]) && isset($_SESSION["id_element"]) && $_SESSION["request"]=="element"){
    $id = $_SESSION["id_element"];  
    unset($_SESSION["request"]);
    unset($_SESSION["id_element"]);
}




if($id == null){
    header("Location: index.php");
    die();
}

$req = "SELECT titre, texte, _type FROM element WHERE id=:id_b AND id_compte=:id_c";
$data = requete_prep($db, $req, [":id_b"=>$id, "id_c"=>$_SESSION["id_compte"]]);

if(count($data) != 1){
    header("Location: ../web/index.php");
}

$titre = $data[0]["titre"];
$texte = $data[0]["texte"];
$type_elt = $data[0]["_type"];

script("window.id_element = $id;");

$req = "SELECT * FROM types_elements;";
$types_elements = requete_prep($db, $req);

$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante

$_SESSION["last_page"] = "element.php";

?>

<!doctype HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Element</title>
        
        <script src="../js/MATHJAX_CONFIG.js"></script>
        <script src="../js/tex-mml-chtml.js"></script>
        <script src="../js/showdown.min.js"></script>

        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body onload="compile();">
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <button class="bt1" style="margin:2vh;" onclick="window.location.href='chapitre.php'">Retour</button>

            <div style="margin: 5em;">

                <div>
                    <h1 class="comp"><?php  echo  urldecode($titre); ?></h1>
                </div>
                
                <hr />

                <div>

                    <p class="comp"><?php  echo  urldecode($texte); ?></p>

                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/menus.js"></script>
    <script>

var converter = new showdown.Converter();


function update_md() {
    for(document.getElementsByClassName("comp") of div){    
        div.innerHTML = converter.makeHtml(div.innerHTML);
    }
}

function compile() {
    // Nettoyage
    for (c of div_result.children) {
        div_result.removeChild(c);
    }
    // Compilation latex
    MathJax.typesetPromise();

    // Compilation markdown
    setTimeout(update_md(), 1000);
}

    </script>
</html>

