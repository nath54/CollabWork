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

// clog("POST : " . array_to_str($_POST));

if(isset($_POST["type"]) && $_POST["type"] == "request"){
    // On vérifie que la page provient bien de ce site
    if(!isset($_SESSION["token"]) || !isset($_SESSION["num_tok"])){
        // $_SESSION["error"] = "";
        header("Location: index.php");
    }
    // On vérifie que la requete contient bien toutes les bonnes valeurs
    if(!isset($_POST["pseudo"]) || !isset($_POST["email"]) || !isset($_POST["password"])){
        $_SESSION["error"] = "Il y a eu un problème lors de la requête d'inscription";
        header("Location: index.php");
    }
    // On a une requete d'inscription correcte
    $pseudo = $_POST["pseudo"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    // On vérifie les conditions
    if(strlen($pseudo) < 4){
        $error = "Le pseudo doit faire au moins 4 caractères !";
    }
    else if(strlen($pseudo) > 32){
        $error = "Le pseudo ne doit pas faire plus de 32 caractères !";
    }
    else if(strlen($password) < 8){
        $error = "Le mot de passe doit faire au moins 8 caractères !";
    }
    else if(strlen($password) > 32){
        $error = "Le mot de passe ne doit pas faire plus de 32 caractères !";
    }
    //TODO finir tous les tests, parce que flemme


    // Je vais quand même faire les tests des pseudos/emails
    $req = "SELECT pseudo, email FROM comptes WHERE comptes.pseudo=:pseudo OR comptes.email=:email;";
    $lst_comptes = requete_prep($db, $req, [":email"=>$email, ":pseudo"=>$pseudo]);
    // clog("DEBUG 1 : " . array_to_str($lst_comptes));
    $e=false;
    $p=false;
    foreach($lst_comptes as $data){
        if($data[0]==$pseudo){
            $p=true;
        }
        if($data[1]==$email){
            $e=true;
        }
    }
    if(count($lst_comptes)>0){
        if($p && !$e){
            $error = "Ce pseudo est déjà pris !";
        }
        else if($e && !$p){
            $error = "Cet email est déjà prise !";
        }
        else if($e && $p){
            $error = "Ce pseudo et cet email sont déjà pris !";
        }
        else{
            $error = "Erreur ! Vous ne pouvez pas vous inscrire avec ce pseudo ou cet email !";
        }
    }

    if($error == ""){
        // Normalement, tout c'est bien passé ici
        // On peut donc lui créer son compte
        // Et le connecter
        
        $_SESSION["est_connecte"] = true;
        $_SESSION["pseudo"] = $pseudo;
        $_SESSION["token_connection"] = random_str(32);

        $req = "INSERT INTO comptes (pseudo, email, _password, token) VALUES (:pseudo, :email, MD5(:pass), :token)";
        action_prep($db, $req, [":pseudo"=>$pseudo, ":email"=>$email, ":pass"=>$password, ":token"=>$_SESSION["token_connection"]]);

        $req = "SELECT id FROM comptes WHERE pseudo=:pseudo;";
        $data = requete_prep($db, $req, [":pseudo"=>$pseudo]);

        // clog("DEBUG 2 : " . array_to_str($data));

        if(count($data)>0){
            $_SESSION["id_compte"] = $data[0][0];
            header("Location: main.php");
        }
        else{
            //ERROR
            $error = "Il y a eu une erreur lors de la création du compte";
        }
    }
}

$_SESSION["last_page"] = "inscription.php";
?>

<!DOCTYPE html>
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
    <title>CollabWork - Inscription</title>
    <!-- STYLES ... -->
    <link href="../style/style.css" rel="stylesheet" />
</head>

<body>


    <div class="centerFlex" style="height:60%;">
        <div class="col" style="height:60%;">
            <div class="col" style="margin:auto;">
                <h1 onclick="window.location.href='index.php';" style="margin:auto; cursor:pointer;">CollabWork</h1>
                <hr style="width:60px; color:rgb(0,0,0);" />
                <h2 style="margin:auto;">Inscription</h2>
                <hr style="width:100%; color:rgb(230,230,230);" />
                <form method="POST" action="inscription.php">
                    <!-- INPUT PSEUDO -->
                    <div class="row" style="margin:2vh;"> 
                        <div style="padding: 1vh; background-color:rgb(15, 114, 172);" class="grossi">
                            <img src="../res/person.svg" class="img_car" />
                        </div>
                        <input name="pseudo" id="input_pseudo" placeholder="Pseudo" maxlength=32 value="<?php echo $pseudo; ?>"/>
                    </div>
                    <!-- INPUT EMAIL -->
                    <div class="row" style="margin:2vh; margin-top:0;" >
                        <div style="padding: 1vh; background-color:rgb(15, 114, 172);" class="grossi">
                            <img src="../res/email.svg" class="img_car" />
                        </div>
                        <input name="email" id="input_email" placeholder="addresse.email@domain" type="email" value="<?php echo $email; ?>"/>
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
                        <input class="bta" type="submit" value="S'inscrire" />
                    </div>
                </form>
                <p style="color:red;"><?php echo $error; ?></p>
                <p style="margin-top:6vh;">Vous avez déjà un compte ? <a href="connection.php">Se connecter</a></p>
            </div>
        </div>
    </div>

</html>