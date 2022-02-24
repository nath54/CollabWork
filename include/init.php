<?php

//  -------------------------------------  INIT  ------------------------------------- 

$debug = true;
session_start();

if($debug){
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
}

if(isset($_SESSION["error"])){
    alert("Error : <br />" . $_SESSION["error"]);
    unset($_SESSION["error"]);
}

// ------------------------------------- FONCTIONS ------------------------------------- 


/**
 * Crée une boîte de dialogue contenant `$texte`
 *
 * @param string $texte
 *      Texte devant être écrit dans la boîte de dialogue
 *
 * @return void
 *
 * @author Nathan
**/
function alert($texte){
    $texte = htmlspecialchars($texte);
    script("alert(\"$texte\");");
}

/**
 * Écrit `$texte` dans la console du navigateur
 *
 * @param string $texte
 *      Texte à écrire pour le debug
 *
 * @return void
 *
 * @author Nathan
**/
function clog($texte){
    $texte = htmlspecialchars($texte);
    script("console.log(\"$texte\");");
}


/**
 * Crée une balise script dans le code, contenant `$texte`.
 *
 * @param string $texte
 *      Instructions à exécuter.
 *
 * @return void
 *
 * @author Nathan
**/
function script($texte){
    echo "<script>$texte</script>";
}



function array_to_str($array){
    $txt = "{";
    $virg = false;
    foreach($array as $k=>$v){
        if(is_array($v)){
            $txt_v = array_to_str($v);
        }
        else{
            $txt_v = $v;
        }
        if($virg){
            $txt .= ", ";
        }
        else{
            $virg = true;
        }
        $txt .= "$k : $txt_v";
    }
    $txt .= "}";
    return $txt;
}


/**
 * Generate a random string, using a cryptographically secure 
 * pseudorandom number generator (random_int)
 * 
 * For PHP 7, random_int is a PHP core function
 * For PHP 5.x, depends on https://github.com/paragonie/random_compat
 * 
 * @param int $length      How many characters do we want?
 * @param string $keyspace A string of all possible characters
 *                         to select from
 * @return string
 */
function random_str(
    $length,
    $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
) {
    $str = '';
    $max = strlen($keyspace) - 1;
    if ($max < 1) {
        throw new Exception('$keyspace must be at least two characters long');
    }
    for ($i = 0; $i < $length; ++$i) {
        $str .= $keyspace[random_int(0, $max)];
    }
    return $str;
}


function test_token($arr){
    return isset($_SESSION["num_tok"]) && isset($_SESSION["token"]) && $arr["tok".$_SESSION["num_tok"]]==$_SESSION["token"];
}

function raise_error($bool, $error="", $error_debug=""){
    if($bool){
        if(isset($debug) && $debug){
            $_SESSION["error"] = $error_debug;
        }
        else{
            $_SESSION["error"] = $error;
        }
        header("Location: index.php");
        die();
    }
}

?>