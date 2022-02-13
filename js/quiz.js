var div_result = document.getElementById("result");
var converter = new showdown.Converter();
window.questions_faites = 0;
window.score = 0;
window.questions_reussies = [];
window.questions_rates = [];


function key_compile() {
    var live_compile = (document.getElementById("div_checkbox").style.display == "block") && (document.getElementById("checkbox_live_compil").checked)
        // console.log("live_compile = ", live_compile);
    if (live_compile) {
        compile();
    }
}

function update_md() {
    div_result.innerHTML = converter.makeHtml(div_result.innerHTML);
}

function compile() {
    // Nettoyage
    for (c of div_result.children) {
        div_result.removeChild(c);
    }

    div_result.innerHTML = div_result.innerHTML;

    // Compilation latex
    MathJax.typesetPromise();

    // Compilation markdown
    setTimeout(update_md(), 1000);
}


function retour() {
    // En vrai, on fera une sauvegarde en envoyant une requete a la page brouillon, qui va ensuite rediriger vers brouillons.php
    window.location.href = "quizs.php";
}

function init() {
    var titre = document.getElementById("titre");

}