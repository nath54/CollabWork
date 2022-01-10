<?php

include_once "../include/init.php";
include_once "../include/bdd.php";

$db = load_db();

include "../include/test_connecte.php";



if($est_connecte){
    $req = "UPDATE comptes SET token='' WHERE id=:id_compte";
    action_prep($db, $req, [":id_compte"=>$_SESSION["id_compte"]]);
}


unset($_SESSION["est_connecte"]    );
unset($_SESSION["pseudo"]          );
unset($_SESSION["token_connection"]);
unset($_SESSION["id_compte"]       );

header("Location: ../web/index.php");


$_SESSION["last_page"] = "disconnect.php";
?>