<!doctype HTML>
<html>
    <head>
        <meta charset="utf-8" />
        <title>CollabWork - Connection</title>
        <!-- STYLES ... -->
    </head>
    <body>
        <div class="col">
            <h2>Connection à un compte CollabWork</h2>
            <form method="POST" action="connection.php">
                <input name="pseudo" id="input_pseudo" placeholder="pseudo" maxlenght=16/>
                <input name="password" type="password" id="input_password" placeholder="password" maxlength=32/>
                <input type="submit"/>
            </form>
            <p>Vous n'avez pas de comptes ? <a href="inscription.php">Se créer un compte</a></p>
        </div>
    </body>
</html>