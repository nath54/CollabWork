var input = document.getElementById("texte")
var div_result = document.getElementById("result");
var converter = new showdown.Converter();

var live_compile = false;

function key_compile() {
    if (live_compile) {
        compile();
    }
}

function compile() {
    // Nettoyage
    for (c of div_result.children) {
        div_result.removeChild(c);
    }
    // Update
    div_result.innerHTML = converter.makeHtml(input.value);
    // Compilation latex
    MathJax.typesetPromise();
    // Compilation markdown
    // div_result.innerHTML = div_result.innerHTML);
}

function retour() {
    // En vrai, on fera une sauvegarde en envoyant une requete a la page brouillon, qui va ensuite rediriger vers brouillons.php
    window.location.href = "brouillons.php";
}

function edit() {
    // Boutons
    var bt1 = document.getElementById("bt_edit");
    var bt2 = document.getElementById("bt_view");
    if (bt1.classList.contains("bt_tab")) {
        bt1.classList.replace("bt_tab", "bt_tab_active");
    }
    if (bt2.classList.contains("bt_tab_active")) {
        bt1.classList.replace("bt_tab_active", "bt_tab");
    }
    //
    document.getElementById("div_textarea").style.display = "initial";
    document.getElementById("div_result").style.display = "none";
}

function view() {
    // Boutons
    var bt2 = document.getElementById("bt_edit");
    var bt1 = document.getElementById("bt_view");
    if (bt1.classList.contains("bt_tab")) {
        bt1.classList.replace("bt_tab", "bt_tab_active");
    }
    if (bt2.classList.contains("bt_tab_active")) {
        bt1.classList.replace("bt_tab_active", "bt_tab");
    }
    //
    document.getElementById("div_textarea").style.display = "none";
    document.getElementById("div_result").style.display = "initial";
    compile();
}