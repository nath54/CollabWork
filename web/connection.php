<?php 


include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

$pseudo = "";
$email = "";
$password = "";
$error = "";

$taille_toks = 32;
$nb_toks = random_int(10, 30);
$_SESSION["token"] = random_str($taille_toks);
$_SESSION["num_tok"] = random_int(0, $nb_toks); // Pour la sécurité, on va générer pleins de faux tokens, que l'on va tous passer à la page suivante


if(isset($_POST["type"]) && $_POST["type"] == "request"){
    // On vérifie que la page provient bien de ce site
    if(!isset($_SESSION["token"]) || !isset($_SESSION["num_tok"])){
        // $_SESSION["error"] = "";
        header("Location: index.php");
    }
    // On vérifie que la requete contient bien toutes les bonnes valeurs
    if(!isset($_POST["identifiant"]) || !isset($_POST["password"])){
        $_SESSION["error"] = "Il y a eu un problème lors de la requête de connection";
        header("Location: index.php");
    }
    // On a une requete d'inscription correcte
    $identifiant = $_POST["identifiant"];
    $password = $_POST["password"];

    // Je vais quand même faire les tests des pseudos/emails
    $req = "SELECT id FROM comptes WHERE (comptes.pseudo=:identifiant OR comptes.email=:identifiant) AND _password=MD5(:pass);";
    $data = requete_prep($db, $req, [":identifiant"=>$identifiant, ":pass"=>$password]);
    
    if(count($data) == 1){
        // Normalement, tout c'est bien passé ici
        // On peut donc le connecter
        
        $_SESSION["est_connecte"]     = true;
        $_SESSION["pseudo"]           = $pseudo;
        $_SESSION["token_connection"] = random_str(32);
        $_SESSION["id_compte"]        = $data[0][0];

        $req = "UPDATE comptes SET token=:token WHERE id=:id_compte";
        action_prep($db, $req, [":token"=>$_SESSION["token_connection"], ":id_compte"=>$_SESSION["id_compte"]]);

        header("Location: main.php");
    }
    else if(count($data) == 0){
        $error = "L'identifiant ou le mot de passe est erroné";
    }
    else{
        $error = "Il y a eu un problème lors de la connection";
    }
}

?>

<!doctype HTML>
<html lang="fr">


<style>
    html,
    body {
        height: 90%;
    }
</style>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CollabWork - Connection</title>
    <!-- STYLES ... -->
    <link href="../style/style.css" rel="stylesheet" />
</head>

<body>

    <div class="centerFlex" style="height:60%;">
        <div class="col" style="height:60%;">
            <div class="col" style="margin:auto;">
                <h1 onclick="window.location.href='index.php';" style="margin:auto; cursor:pointer;">CollabWork</h1>
                <hr style="width:60px; color:rgb(0,0,0);" />
                <h2 style="margin:auto;">Connection</h2>
                <hr style="width:90%; color:rgb(230,230,230);" />
                <form method="POST" action="connection.php">
                    <!-- INPUT PSEUDO -->
                    <div class="row" style="margin:2vh;"> 
                        <div style="padding: 1vh; background-color:rgb(15, 114, 172);" class="grossi">
                            <img src="../res/person.svg" class="img_car" />
                        </div>
                        <input name="identifiant" id="input_pseudo" placeholder="Pseudo ou Email" maxlength=32/>
                    </div>
                    <!-- INPUT PASSWORD -->
                    <div class="row" style="margin:2vh; margin-top:0;">
                        <div style="padding: 1vh; background-color:rgb(15, 114, 172);" class="grossi">
                            <img src="../res/locker.svg" class="img_car" />
                        </div>
                        <input name="password" type="password" id="input_password" placeholder="Mot de passe" maxlength=32/>
                    </div>
                    <input style="display:none;" name="type" value="request"/>
                    <!-- TOKENS -->
                    <?php
                        for($x=0; $x<=$nb_toks; $x++){
                            if($x == $_SESSION["num_tok"]){
                                $val = $_SESSION["token"];
                            }
                            else{
                                $val = random_str($taille_toks);
                            }
                            echo "<input style='display:none;' name='tok$x' value='$val' />";
                        }
                    ?>
                    <!-- BUTTON SUBMIT -->
                    <div>
                        <input class="bta" type="submit" value="Se connecter"/>
                    </div>
                </form>
                <p style="color:red;"><?php echo $error; ?></p>
                <p>Vous n'avez pas de comptes ? <a href="inscription.php">S'inscrire</a></p>
            </div>
        </div>
    </div>

</html>