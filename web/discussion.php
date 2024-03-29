<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";

$id = null;

if(isset($_POST["type"]) && isset($_POST["id_groupe"]) && $_POST["type"]=="request" && test_token($_POST)){
    $idg = $_POST["id_groupe"];
    // On teste s'il y a déjà une discussion avec ce groupe
    $req = "SELECT id FROM discussions WHERE _type = 0 AND id_groupe = :idg";
    $data = requete_prep($db, $req, [":idg"=>$idg]);
    // S'il n'y en a pas, on en crée une
    if(count($data)==0){
        $req = "INSERT INTO discussions (_type, id_groupe) VALUES (0, :idg);";
        action_prep($db, $req, [":idg"=>$idg]);
        $id = $db->lastInsertId();
    }
    else{
        $id = $data[0][0];
    }
}
else if(isset($_POST["type"]) && isset($_POST["id_compte2"]) && $_POST["type"]=="request" && $est_connecte && test_token($_POST)){
    $idc = $_POST["id_compte2"];
    // On teste s'il y a déjà une discussion avec ce compte
    if($_SESSION["id_compte"] > $idc){
        $idc1 = $idc;
        $idc2 = $_SESSION["id_compte"];
    }
    else{
        $idc1 = $_SESSION["id_compte"];
        $idc2 = $idc;
    }
    $req = "SELECT id FROM discussions WHERE _type = 1 AND id_compte1 = :idc1 AND id_compte2 = :idc2;";
    $data = requete_prep($db, $req, [":idc1"=>$idc1, ":idc2"=>$idc2]);
    // S'il n'y en a pas, on en crée une
    if(count($data)==0){
        $req = "INSERT INTO discussions (_type, id_compte1, id_compte2) VALUES (1, :idc1, :idc2);";
        action_prep($db, $req, [":idc1"=>$idc1, ":idc2"=>$idc2]);
        $id = $db->lastInsertId();
    }
    else{
        $id = $data[0][0];
    }
}
else if(isset($_POST["type"]) && isset($_POST["id_discussion"]) && isset($_POST["message"]) && $_POST["type"] == "send_message" && $est_connecte && test_token($_POST)){
    $id = $_POST["id_discussion"];
    $mes = $_POST["message"];
    $req = "INSERT INTO messages (id_compte, _message, _date) VALUES (:idc, :mes, NOW());";
    action_prep($db, $req, [":idc"=>$_SESSION["id_compte"], ":mes"=>$mes]);
    $req = "INSERT INTO discussions_messages (id_message, id_discussion) VALUES (:idm, :idd);";
    action_prep($db, $req, [":idm"=>$db->lastInsertId(), ":idd"=>$id]);
}

raise_error($id == null, "id null");


$req = "SELECT * FROM discussions WHERE id=:id;";
$data = requete_prep($db, $req, [":id"=>$id]);

raise_error($data == [], "probleme loading data");

$type = $data[0]["_type"];

$titre = " - Discussion - ";
$pseudos_comptes = [];

if($type == 0){
    $idg = $data[0]["id_groupe"];
    $req = "SELECT nom FROM groupes WHERE id=:idg";
    $dg = requete_prep($db, $req, [":idg"=>$idg]);
    raise_error($dg == null, "loading data grp");
    $titre = "Discussion du groupe " . $dg[0]["nom"];
}
else{
    $idc1 = $data[0]["id_compte1"];
    $idc2 = $data[1]["id_compte2"];
    if($idc1 == $_SESSION["id_compte"]){
        $idc = $idc2;
    }else{
        $idc = $idc1;
    }
    $req = "SELECT pseudo FROM comptes WHERE id=:idc;";
    $dc = requete_prep($db, $req, [":idc"=>$idc]);
    raise_error($dc == null, "error loading data comptes");
    $titre = "Discussion avec " . $dc[0]["pseudo"];
    $pseudos_comptes[$idc] = $dc[0]["pseudo"];
}

$req = "SELECT id_compte, _message, _date FROM messages INNER JOIN discussions_messages ON messages.id = discussions_messages.id_message WHERE id_discussion = :idd;";
$data = requete_prep($db, $req, [":idd"=>$id]);

$messages = [];


foreach($data as $d){
    if(key_exists($d["id_compte"], $pseudos_comptes)){
        $pseudo = $pseudos_comptes[$d["id_compte"]];
    }else{
        $req = "SELECT pseudo FROM comptes WHERE id=:idc;";
        $dc = requete_prep($db, $req, [":idc"=>$d["id_compte"]]);
        raise_error($dc == null, "error loading data comptes");
        $pseudo = $dc[0]["pseudo"];
        $pseudos_comptes[$d["id_compte"]] = $pseudo;
    }
    array_push($messages,[
        "id_compte" => $d["id_compte"],
        "pseudo_compte" => $pseudo,
        "message" => $d["_message"],
        "date" => $d["_date"]
    ]);
}


script("window.id_discussion = $id;");
$id_compte = $_SESSION["id_compte"]; // L'id du compte qui est connecté


$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante


$_SESSION["last_page"] = "discussion.php";
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Discussion</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body onload="init();">
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div id="main_body" style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="margin: 2vh; height:90%;">

                <div class="row">
                    <div>
                        <button class="bt1" onclick="window.location.href='groupes.php';">Retour</button>
                    </div>
                    <h1 style='margin:auto; margin-left: 2vh;'><?php echo $titre; ?></h1>
                </div>

                <div class="col" style="height:85%; width: 95%;">

                    <!-- CONTAINER DES MESSAGES -->
                    <div id="mes_div" style="overflow-y: auto; height:80%; width:100%; border:1px solid rgb(200,200,200); border-radius: 1vh; margin-top:2vh; margin-bottom:2vh; padding:1vh;">

                        <?php
                        
                        foreach($messages as $msg){
                            $txt = $msg["message"];
                            $txt = str_replace("<br />", "\n",html_entity_decode($txt));
                            $date = $msg["date"];
                            $s = "style='font-size:0.80em;'";
                            $sd = "style='font-size:0.75em;'";
                            if($id_compte == $msg["id_compte"]){
                                echo "<div><div class='col msg2'> <span $s>$txt</span> <i $sd>$date</i> </div></div>";
                            }
                            else{
                                $pseudo_compte = $msg["pseudo_compte"];
                                echo "<div><div class='col msg1'> <strong $s>$pseudo_compte</strong> <span $s>$txt</span> <i $sd>$date</i> </div></div>";
                            }
                        }
                        

                        ?>

                    </div>

                    <!-- INPUT ENVOYER MESSAGE -->
                    <div class="col" style="width:90%; margin-left:auto; margin-right:auto;" >
                        <div style="width:100%;">
                            <textarea id="input_message"  style="width:100%;" placeholder="Message..."></textarea>
                        </div>
                        <div style="margin-top: 1vh; margin-left:auto;">
                            <button onclick="send_message();" class="bt1">Envoyer</button>
                        </div>
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

function init(){
    MathJax.typesetPromise();
    var objDiv = document.getElementById("mes_div");
    objDiv.scrollTop = objDiv.scrollHeight;
}


function HTMLencode(text) {
    text = text.replaceAll("\n", "<br />");
    var encodedStr = text.replace(/[\u00A0-\u9999<>\&]/g, function(i) {
        return '&#' + i.charCodeAt(0) + ';';
    });
    return encodedStr;
}

function send_message(){
    var mes = document.getElementById("input_message").value;
    var texte = HTMLencode(mes);
    if(texte != ""){
        send_form("discussion.php",
            [
                ["type", "send_message"],
                ["id_discussion", window.id_discussion],
                ["id_compte", window.id_compte],
                ["message", texte]
            ]
        );
    }
    else{
        alert("Vous essayez d'envoyer un message vide !");
    }
}

    </script>
</html>
