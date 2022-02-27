<?php

if(isset($_POST["elts"]) && $est_connecte && test_token($_POST)){
    alert("Ca marche !");
    $elts = json_decode($_POST["elts"], true);
    foreach($elts as $elt_id){
        // On va désactiver cet élément
        $req = "INSERT INTO elements_connus (id_compte, id_element) VALUES (:id_compte, :id_element);";
        action_prep($db, $req, [":id_compte"=>$_SESSION["id"], ":id_element"=>$elt_id]);
    }
}

?>