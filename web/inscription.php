<!doctype HTML>
<html>
    <head>
        <meta charset="utf-8" />
        <title>CollabWork - Inscription</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" rel="stylesheet" />
    </head>
    <body>
        <div class="col">
            <h2>Inscription à un compte CollabWork</h2>
            <form method="POST" action="inscription.php" class="col">
                <div class="col">
                    <label>Pseudo</label>
                    <input name="pseudo" id="input_pseudo" placeholder="pseudo" maxlenght=16/>
                </div>
                <div class="col">
                    <label>Mot de passe</label>
                    <input name="password" type="password" id="input_password" placeholder="password" maxlength=32/>
                </div>
                <div>
                    <label>Confirmer le mot de passe</label>
                    <input name="password2" type="password" id="input_password" placeholder="retype password" maxlength=32/>
                </div>
                <div>
                    <input type="submit"/>
                </div>
            </form>
            <p>Vous avez déjà un compte ? <a href="connection.php">Se connecter</a></p>
        </div>
    </body>
</html>