var input = document.getElementById("texte")
var div_result = document.getElementById("result");
var converter = new showdown.Converter();

function compile() {
    // Nettoyage
    for (c of div_result.children) {
        div_result.removeChild(c);
    }
    // Update
    div_result.innerHTML = converter.makeHtml(input.value);
    // Compilation
    MathJax.typesetPromise();
}

function retour() {
    // En vrai, on fera une sauvegarde en envoyant une requete a la page brouillon, qui va ensuite rediriger vers brouillons.php
    window.location.href = "brouillons.php";
}