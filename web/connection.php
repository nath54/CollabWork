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
                        <input name="pseudo" id="input_pseudo" placeholder="Pseudo" maxlength=32/>
                    </div>
                    <!-- INPUT PASSWORD -->
                    <div class="row" style="margin:2vh; margin-top:0;">
                        <div style="padding: 1vh; background-color:rgb(15, 114, 172);" class="grossi">
                            <img src="../res/locker.svg" class="img_car" />
                        </div>
                        <input name="password" type="password" id="input_password" placeholder="Mot de passe" maxlength=32/>
                    </div>
                    <!-- BUTTON SUBMIT -->
                    <div>
                        <input class="bta" type="submit" value="Se connecter"/>
                    </div>
                </form>
                <p>Vous n'avez pas de comptes ? <a href="inscription.php">S'inscrire</a></p>
            </div>
        </div>
    </div>

</html>