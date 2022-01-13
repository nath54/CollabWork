<?php


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";


$type = "groupe";
$nom = "MP2I-LLG";

$messages = [
    [
        "id_compte"=>5,
        "pseudo_compte"=>"david",
        "message"=>"Salut les amis, comment allez vous ?",
        "date"=>"05/10/2021"
    ],
    [
        "id_compte"=>0,
        "pseudo_compte"=>"jean",
        "message"=>"Ca va super et toi ?",
        "date"=>"05/10/2021"
    ],
    [
        "id_compte"=>5,
        "pseudo_compte"=>"david",
        "message"=>"J'ai une question sur le dm de maths. Comment est-ce qu'on simplifie l'expression $\\sum_{k=0}^{+\infty} \\frac{k!}{(1+i)^k}$",
        "date"=>"05/10/2021"
    ],
];

$id_compte = 0; // L'id du compte qui est connecté


$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante


$_SESSION["last_page"] = "discussion.php";
?>

<!doctype HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CollabWork - Discussion</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" media="screen" rel="stylesheet" />
    </head>
    <body onload="MathJax.typesetPromise();">
        <!-- HEADER -->
        <?php include "../include/header.php"; ?>
        <?php include "../include/sidemenu.php" ?>

        <div style="position: absolute; top:8%; bottom: 0; left: 0; right: 0; overflow:auto;">

            <div class="container" style="margin: 2vh; height:90%;">

                <div class="row">
                    <div>
                        <button class="bt1" onclick="window.location.href='groupes.php';">Retour</button>
                    </div>
                    <h1 style='margin:auto; margin-left: 2vh;'>Discussion du groupe MP2I-LLG</h1>
                </div>

                <div class="col" style="height:85%; width: 95%;">

                    <!-- CONTAINER DES MESSAGES -->
                    <div style="overflow-y: auto; height:80%; width:100%; border:1px solid rgb(200,200,200); border-radius: 1vh; margin-top:2vh; margin-bottom:2vh; padding:1vh;">

                        <?php
                        
                        foreach($messages as $msg){
                            $txt = $msg["message"];
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
                            <button class="bt1">Envoyer</button>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <?php include "../include/accountmenu.php" ?>

    </body>
    <script src="../js/menus.js"></script>
    <script src="../js/MATHJAX_CONFIG.js"></script>
    <script src="../js/tex-mml-chtml.js"></script>
</html>