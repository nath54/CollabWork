<!doctype HTML>
<html>
    <head>
        <meta charset="utf-8" />
        <title>CollabWork - Inscription</title>
        <!-- STYLES ... -->
    </head>
    <body>
        <div class="col">
            <h2>Inscription à un compte CollabWork</h2>
            <form method="POST" action="connection.php" class="col">
                <div class="row">
                    <label>Pseudo</label>
                    <input name="pseudo" id="input_pseudo" placeholder="pseudo" maxlenght=16/>
                </div>
                <div class="row">
                    <label>Password</label>
                    <input name="password" type="password" id="input_password" placeholder="password" maxlength=32/>
                </div>
                <input name="password2" type="password" id="input_password" placeholder="retype password" maxlength=32/>
                <input type="submit"/>
            </form>
            <p>Vous n'avez pas de comptes ? <a href="inscription.php">Se créer un compte</a></p>
        </div>
    </body>
</html>