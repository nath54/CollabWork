<?php

$est_connecte = false;

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
    <title>CollabWork - Index</title>
    <!-- STYLES ... -->
    <link href="../style/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.typekit.net/mdy3rha.css">
</head>

<body>
    <div class="centerFlex" style="height:60%;">
        <div class="col" style="height:60%;">
            <div class="col" style="margin:auto;">
                <h1 style="margin:auto;">Bienvenue sur CollabWork</h1>
                <hr style="width:100%; color:rgb(230,230,230);"/>
                <?php
                    if($est_connecte){
                        include "../include/index/connecte.php";
                    }
                    else{
                        include "../include/index/non_connecte.php";
                    }
                ?>
            </div>
        </div>
    </div>
</body>

</html>