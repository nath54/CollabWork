<!doctype HTML>
<html>


<style>
    html,
    body {
        height: 90%;
    }
</style>

<head>
    <meta charset="utf-8" />
    <title>CollabWork - Connection</title>
    <!-- STYLES ... -->
    <link href="../style/style.css" rel="stylesheet" />
</head>

<body>


    <div class="centerFlex" style="height:60%;">
        <div class="col" style="height:60%;">
            <div class="col" style="margin:auto;">
                <h1 style="margin:auto;">Connection</h1>
                <hr style="width:100%; color:rgb(230,230,230);" />
                <form method="POST" action="connection.php">
                    <div class="col">
                        <label>Pseudo</label>
                        <input name="pseudo" id="input_pseudo" placeholder="pseudo" maxlenght=16/>
                    </div>
                    <div class="col">
                        <label>Mot de passe</label>
                        <input name="password" type="password" id="input_password" placeholder="password" maxlength=32/>
                    </div>
                    <div>
                        <input class="bta" type="submit" />
                    </div>
                </form>
                <p>Vous n'avez pas de comptes ? <a href="inscription.php">Se créer un compte</a></p>
            </div>
        </div>
    </div>

</html>