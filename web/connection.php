<!doctype HTML>
<html>
    <head>
        <meta charset="utf-8" />
        <title>CollabWork - Connection</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" rel="stylesheet" />
    </head>
    <body>
        <div class="col">
            <h2>Connection à un compte CollabWork</h2>
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
                    <input type="submit"/>
                </div>
            </form>
            <p>Vous n'avez pas de comptes ? <a href="inscription.php">Se créer un compte</a></p>
        </div>
    </body>
</html>