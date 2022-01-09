<?php

$pseudo = "";
$email = "";
$password = "";
$error = "";

if(array_key_exists("request",$_POST)){
    // On vérifie que la requete contient bien toutes les bonnes valeurs
    if(!array_key_exists("pseudo", $_POST) || !array_key_exists("email", $_POST) || !array_key_exists("password", $_POST)){
        
    }
    // On a une requete d'inscription correcte
    $pseudo = $_POST["pseudo"];
    $email = $_POST["email"];
    $password = $_POS["password"];
    // On vérifie les conditions
    if(strlen($pseudo) < 4){
        $error = "Le pseudo doit faire au moins 4 caractères !";
    }
    else if(strlen($pseudo) > 16){
        $error = "Le pseudo ne doit pas faire plus de 16 caractères !";
    }
    else if(strlen($password) < 8){
        $error = "Le mot de passe doit faire au moins 8 caractères !";
    }
    else if(strlen($password) > 32){
        $error = "Le mot de passe ne doit pas faire plus de 32 caractères !";
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
                <form method="POST" action="connection.php">
                    <!-- INPUT PSEUDO -->
                    <div class="row" style="margin:2vh;"> 
                        <div style="padding: 1vh; background-color:rgb(15, 114, 172);" class="grossi">
                            <img src="../res/person.svg" class="img_car" />
                        </div>
                        <input name="pseudo" id="input_pseudo" placeholder="Pseudo" maxlenght=16/>
                    </div>
                    <!-- INPUT EMAIL -->
                    <div class="row" style="margin:2vh; margin-top:0;" >
                        <div style="padding: 1vh; background-color:rgb(15, 114, 172);" class="grossi">
                            <img src="../res/email.svg" class="img_car" />
                        </div>
                        <input name="email" id="input_email" placeholder="addresse.email@domain" type="email"/>
                    </div>
                    <!-- INPUT PASSWORD -->
                    <div class="row" style="margin:2vh; margin-top:0;">
                        <div style="padding: 1vh; background-color:rgb(15, 114, 172);" class="grossi">
                            <img src="../res/locker.svg" class="img_car" />
                        </div>
                        <input name="password" type="password" id="input_password" placeholder="Mot de passe" maxlength=32/>
                    </div>
                    <input style="display:none;" name="type" value="request"/>
                    <!-- BUTTON SUBMIT -->
                    <div>
                        <input class="bta" type="submit" value="S'inscrire" />
                    </div>
                </form>
                <p style="margin-top:6vh;">Vous avez déjà un compte ? <a href="connection.php">Se connecter</a></p>
            </div>
        </div>
    </div>

</html>