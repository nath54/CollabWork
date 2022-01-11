<?php

// IL FAUT BIEN AVOIR IMPORTE "bdd.php" ET AVOIR INITIALISE $db

$est_connecte = false;

// clog("SESSION : " . array_to_str($_SESSION));

if( isset($_SESSION["est_connecte"]) &&
    isset($_SESSION["pseudo"]) &&
    isset($_SESSION["token_connection"]) &&
    isset($_SESSION["id_compte"]) ){
    

    // clog("ID : " . $_SESSION["id_compte"]);

    $req = "SELECT token FROM comptes WHERE id=:id_compte";
    $token = requete_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"]]);

    // clog("TOKENS : " . array_to_str($token));

    if(count($token)==1 && $token[0][0]==$_SESSION["token_connection"]){
        $est_connecte = true;
    }
    else{
        unset($_SESSION["est_connecte"]    );
        unset($_SESSION["pseudo"]          );
        unset($_SESSION["token_connection"]);
        unset($_SESSION["id_compte"]       );
    }
}

?>