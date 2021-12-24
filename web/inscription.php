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
    <title>CollabWork - Inscription</title>
    <!-- STYLES ... -->
    <link href="../style/style.css" rel="stylesheet" />
</head>

<body>


    <div class="centerFlex" style="height:60%;">
        <div class="col" style="height:60%;">
            <div class="col" style="margin:auto;">
                <h1 style="margin:auto;">Inscription</h1>
                <hr style="width:100%; color:rgb(230,230,230);" />
                <form method="POST" action="connection.php">
                    <div class="col">
                        <label>Pseudo</label>
                        <input name="pseudo" id="input_pseudo" placeholder="pseudo" maxlenght=16/>
                    </div>
                    <div class="col">
                        <label>Email</label>
                        <input name="email" id="input_email" placeholder="addresse@example.com" type="email"/>
                    </div>
                    <div class="col">
                        <label>Mot de passe</label>
                        <input name="password" type="password" id="input_password" placeholder="password" maxlength=32/>
                    </div>
                    <div>
                        <input class="bta" type="submit" value="inscription" />
                    </div>
                </form>
                <p>Vous avez déjà un compte ? <a href="inscription.php">Se connecter</a></p>
            </div>
        </div>
    </div>

</html>